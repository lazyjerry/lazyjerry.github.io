#!/bin/sh

set -eu

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 REPORT_MD OUTPUT_DIR" >&2
  exit 2
fi

REPORT=$1
OUTPUT_DIR=$2

if [ ! -f "$REPORT" ]; then
  echo "Report not found: $REPORT" >&2
  exit 2
fi

mkdir -p "$OUTPUT_DIR/pages"

REFS_TSV="$OUTPUT_DIR/references.tsv"
RESULTS_TSV="$OUTPUT_DIR/metadata.tsv"
GAPS_TSV="$OUTPUT_DIR/gap-candidates.tsv"

perl -CSDA -ne '
  next unless /^\| <a id="ref-(\d+)"><\/a>\d+ \| \[([^]]+)\]\([^)]*\) \|.*\| (\d{4}-\d{2}-\d{2}) \| \[([^]]+)\]\((https?:\/\/[^)]+)\) \|/;
  print join("\t", $1, $2, $3, $4, $5), "\n";
' "$REPORT" > "$REFS_TSV"

if [ ! -s "$REFS_TSV" ]; then
  echo "No reference rows found in $REPORT" >&2
  exit 1
fi

printf 'ref\thttp_status\tfinal_url\treport_date\tsource\treport_title\tpage_title\th1\tdate_candidates\n' > "$RESULTS_TSV"

while IFS="	" read -r ref report_title report_date source url; do
  html="$OUTPUT_DIR/pages/ref-$ref.html"
  headers="$OUTPUT_DIR/pages/ref-$ref.headers"
  meta="$OUTPUT_DIR/pages/ref-$ref.meta"

  curl --location --silent --show-error \
    --connect-timeout 15 --max-time 45 \
    --retry 2 --retry-delay 1 \
    --user-agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 Chrome/140 Safari/537.36' \
    --dump-header "$headers" \
    --output "$html" \
    --write-out '%{http_code}\t%{url_effective}\n' \
    "$url" > "$meta" || printf '000\t%s\n' "$url" > "$meta"

  status=$(cut -f1 "$meta")
  final_url=$(cut -f2- "$meta")

  python3 - "$html" "$ref" "$status" "$final_url" "$report_date" "$source" "$report_title" >> "$RESULTS_TSV" <<'PY'
import html
import json
import re
import sys
from html.parser import HTMLParser
from pathlib import Path

path, ref, status, final_url, report_date, source, report_title = sys.argv[1:]
raw = Path(path).read_text(encoding="utf-8", errors="replace")

class TextExtractor(HTMLParser):
    def __init__(self):
        super().__init__()
        self.parts = []
        self.hidden_depth = 0

    def handle_starttag(self, tag, attrs):
        if tag in {"script", "style", "noscript", "svg"}:
            self.hidden_depth += 1

    def handle_endtag(self, tag):
        if tag in {"script", "style", "noscript", "svg"} and self.hidden_depth:
            self.hidden_depth -= 1

    def handle_data(self, data):
        if not self.hidden_depth:
            value = re.sub(r"\s+", " ", html.unescape(data)).strip()
            if value:
                self.parts.append(value)

extractor = TextExtractor()
extractor.feed(raw)
Path(path).with_suffix(".txt").write_text("\n".join(extractor.parts) + "\n", encoding="utf-8")

def clean(value: str) -> str:
    value = re.sub(r"<[^>]+>", " ", value)
    value = html.unescape(value)
    value = re.sub(r"\s+", " ", value).strip()
    return value.replace("\t", " ").replace("\n", " ")

def first(patterns):
    for pattern in patterns:
        match = re.search(pattern, raw, flags=re.I | re.S)
        if match:
            return clean(match.group(1))
    return ""

page_title = first([
    r'<meta[^>]+property=["\']og:title["\'][^>]+content=["\']([^"\']+)',
    r'<meta[^>]+content=["\']([^"\']+)["\'][^>]+property=["\']og:title["\']',
    r'<title[^>]*>(.*?)</title>',
])
h1 = first([r'<h1[^>]*>(.*?)</h1>'])

dates = []
for pattern in [
    r'"datePublished"\s*:\s*"([^"]+)"',
    r'"dateModified"\s*:\s*"([^"]+)"',
    r'<meta[^>]+(?:property|name)=["\'](?:article:published_time|date|publish-date|pubdate)["\'][^>]+content=["\']([^"\']+)',
    r'<meta[^>]+content=["\']([^"\']+)["\'][^>]+(?:property|name)=["\'](?:article:published_time|date|publish-date|pubdate)["\']',
]:
    for value in re.findall(pattern, raw, flags=re.I | re.S):
        value = clean(value)
        if value and value not in dates:
            dates.append(value)

row = [ref, status, final_url, report_date, source, report_title, page_title, h1, "; ".join(dates)]
print("\t".join(clean(item) for item in row))
PY
done < "$REFS_TSV"

count=$(wc -l < "$REFS_TSV" | tr -d ' ')
echo "Fetched $count references"
echo "Metadata: $RESULTS_TSV"

date_range=$(perl -Mutf8 -CSDA -ne '
  if (/時間範圍為 (\d{4}-\d{2}-\d{2}) 至 (\d{4}-\d{2}-\d{2})/) {
    print "$1\t$2\n";
    exit;
  }
' "$REPORT")

if [ -n "$date_range" ]; then
  start_date=$(printf '%s\n' "$date_range" | cut -f1)
  end_date=$(printf '%s\n' "$date_range" | cut -f2)
  before_date=$(python3 - "$end_date" <<'PY'
from datetime import date, timedelta
import sys

print((date.fromisoformat(sys.argv[1]) + timedelta(days=1)).isoformat())
PY
)

  printf 'category\ttitle\tsource\tpublication_date\turl\n' > "$GAPS_TSV"
  while IFS="	" read -r category query; do
    encoded_query=$(python3 - "$query after:$start_date before:$before_date" <<'PY'
from urllib.parse import quote_plus
import sys

print(quote_plus(sys.argv[1]))
PY
)
    rss="$OUTPUT_DIR/gap-$category.xml"
    curl --location --silent --show-error \
      --connect-timeout 15 --max-time 45 \
      --retry 2 --retry-delay 1 \
      --user-agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 Chrome/140 Safari/537.36' \
      "https://news.google.com/rss/search?q=$encoded_query&hl=zh-TW&gl=TW&ceid=TW:zh-Hant" \
      > "$rss" || continue

    python3 - "$rss" "$category" >> "$GAPS_TSV" <<'PY'
import sys
import xml.etree.ElementTree as ET

path, category = sys.argv[1:]
try:
    root = ET.parse(path).getroot()
except ET.ParseError:
    raise SystemExit(0)

for item in root.findall("./channel/item")[:20]:
    title = (item.findtext("title") or "").replace("\t", " ").replace("\n", " ").strip()
    link = (item.findtext("link") or "").strip()
    publication_date = (item.findtext("pubDate") or "").strip()
    source_node = item.find("source")
    source = "" if source_node is None or source_node.text is None else source_node.text.strip()
    print("\t".join([category, title, source, publication_date, link]))
PY
  done <<'QUERIES'
AI科技	AI 人工智慧 模型 代理
軟體工程	軟體 開發 GitHub DevOps
軟硬體資訊安全	資安 漏洞 網路攻擊
硬體或軟硬整合	晶片 硬體 半導體
網路伺服器基礎	資料中心 雲端 網路 伺服器
金融科技	金融科技 支付 區塊鏈
醫療科技	醫療科技 AI 數位醫療
運輸物流	自駕 電動車 物流 科技
房地產與室內外裝潢	智慧建築 營建科技 室內設計
現場表演藝術	表演藝術 AI 無人機 舞台科技
影視音樂	影視 音樂 AI 虛擬製作
其他領域科技應用突破	NASA 機器人 科技突破
QUERIES

  echo "Gap candidates: $GAPS_TSV"
fi
