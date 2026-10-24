#!/bin/sh

set -eu

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 REPORT_MD SOURCE_MD OUTPUT_DIR" >&2
  exit 2
fi

REPORT=$1
SOURCE=$2
OUTPUT_DIR=$3

for input in "$REPORT" "$SOURCE"; do
  if [ ! -f "$input" ]; then
    echo "File not found: $input" >&2
    exit 2
  fi
done

mkdir -p "$OUTPUT_DIR"

python3 - "$REPORT" "$SOURCE" "$OUTPUT_DIR" <<'PY'
import re
import sys
from pathlib import Path

report_path, source_path, output_dir = map(Path, sys.argv[1:])
report = report_path.read_text(encoding="utf-8")
source = source_path.read_text(encoding="utf-8")

body = report.split('<a id="references"></a>', 1)[0]
# 資料限制段在參考資料表之後，仍是逐筆引用的正文，一併納入
limitations = report.split('<a id="limitations"></a>', 1)
if len(limitations) == 2:
    body += "\n\n" + limitations[1].split('<a id="disclaimer"></a>', 1)[0]

source_entries = {}
for match in re.finditer(
    r"(?ms)^### (\d+)\. .*?(?=^## \u6dd8\u6c70\u4f86\u6e90|^### (?:\d+|[A-Z]+)\.|\Z)", source
):
    source_entries[int(match.group(1))] = match.group(0).rstrip()

reference_rows = {}
for line in report.splitlines():
    match = re.match(r'^\| <a id="ref-(\d+)"></a>\d+ \|', line)
    if match:
        reference_rows[int(match.group(1))] = line

paragraphs = [
    part.strip()
    for part in re.split(r"\n(?=- \*\*)|\n\s*\n", body)
    if part.strip()
]
references = sorted(reference_rows)
if references != list(range(1, len(references) + 1)):
    raise SystemExit(f"Reference sequence is not contiguous: {references}")

missing_sources = [ref for ref in references if ref not in source_entries]
if missing_sources:
    raise SystemExit(f"Missing source entries: {missing_sources}")

for ref in references:
    citations = [
        paragraph
        for paragraph in paragraphs
        if re.search(rf"\(#ref-{ref}\)(?!\d)", paragraph)
    ]
    packet = [
        f"# ref-{ref}",
        "",
        "## source.md",
        "",
        source_entries[ref],
        "",
        "## reference row",
        "",
        reference_rows[ref],
        "",
        "## cited report paragraphs",
        "",
        "\n\n".join(citations) if citations else "(none)",
        "",
    ]
    (output_dir / f"ref-{ref:02d}.md").write_text("\n".join(packet), encoding="utf-8")

print(f"Built {len(references)} audit packets in {output_dir}")
PY
