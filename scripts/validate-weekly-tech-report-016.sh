#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TASK="$ROOT/docs/tech-report-research/weekly-tech-report-016"
DELIVERY="$ROOT/tech/2026-08-15"
REPORT="$TASK/report.md"
SOURCE="$TASK/source.md"

fail() {
  echo "驗證失敗：$1" >&2
  exit 1
}

assert_count() {
  expected=$1
  actual=$2
  label=$3
  [ "$actual" -eq "$expected" ] || fail "$label 應為 $expected，實際為 $actual"
}

sh /Users/lazyjerry/.ai-global/skills/tech-report-research/scripts/validate-task-files.sh "$TASK"
sh /Users/lazyjerry/.ai-global/skills/tech-report-research/scripts/validate-task-completion.sh "$ROOT" weekly-tech-report-016

[ -s "$DELIVERY/2026-08-15 科技服務資訊週記.md" ] || fail "缺少交付報告"
[ -s "$DELIVERY/source.md" ] || fail "缺少交付 source.md"
[ -s "$DELIVERY/task_plan.md" ] || fail "缺少交付 task_plan.md"
[ -s "$DELIVERY/note.md" ] || fail "缺少交付 note.md"
[ -s "$DELIVERY/references.md" ] || fail "缺少交付 references.md"

formal_block=$(sed -n '/## 正式納入來源/,/## 淘汰來源/p' "$SOURCE")
formal_sources=$(printf '%s\n' "$formal_block" | grep -c '是否納入正式參考資料：是')
assert_count 12 "$formal_sources" "正式來源數"

formal_summaries=$(printf '%s\n' "$formal_block" | sed -n 's/^- 摘要：//p')
old_ifs=$IFS
IFS='
'
for source_summary in $formal_summaries; do
  source_summary_chars=$(printf '%s' "$source_summary" | wc -m | tr -d ' ')
  [ "$source_summary_chars" -ge 100 ] && [ "$source_summary_chars" -le 500 ] || fail "source.md 摘要字數應為 100 至 500，實際為 $source_summary_chars"
done
IFS=$old_ifs

all_summaries=$(sed -n 's/^- 摘要：//p' "$SOURCE")
all_summary_count=$(printf '%s\n' "$all_summaries" | sed '/^$/d' | wc -l | tr -d ' ')
assert_count 18 "$all_summary_count" "候選來源摘要數"
IFS='
'
for source_summary in $all_summaries; do
  source_summary_chars=$(printf '%s' "$source_summary" | wc -m | tr -d ' ')
  [ "$source_summary_chars" -ge 100 ] && [ "$source_summary_chars" -le 500 ] || fail "候選來源摘要字數應為 100 至 500，實際為 $source_summary_chars"
done
IFS=$old_ifs

formal_dates=$(printf '%s\n' "$formal_block" | sed -n 's/^- 發布日期：//p')
for source_date in $formal_dates; do
  case "$source_date" in
    2026-07-31|2026-08-01|2026-08-02|2026-08-03|2026-08-04|2026-08-05|2026-08-06|2026-08-07|2026-08-08|2026-08-09|2026-08-10|2026-08-11|2026-08-12|2026-08-13|2026-08-14|2026-08-15) ;;
    *) fail "正式來源日期超出範圍：$source_date" ;;
  esac
done

categories='AI 科技
軟體工程
軟硬體資訊安全
硬體或軟硬整合
網路/伺服器等基礎
金融科技
醫療科技
運輸物流
房地產與室內外裝潢
現場表演藝術
影視音樂
其他領域科技應用突破'
IFS='
'
for category in $categories; do
  printf '%s\n' "$formal_block" | grep -Fq -- "- 分類：$category" || fail "正式來源缺少分類：$category"
done
IFS=$old_ifs

for anchor in summary highlights hl-ai hl-software hl-security hl-hardware hl-infrastructure hl-fintech hl-healthtech hl-logistics hl-proptech hl-arts hl-entertainment hl-others trends tr-ai tr-software tr-security tr-hardware tr-infrastructure tr-fintech tr-healthtech tr-logistics tr-proptech tr-arts tr-entertainment tr-others references notes disclaimer; do
  grep -Fq "<a id=\"$anchor\"></a>" "$REPORT" || fail "缺少錨點：$anchor"
done

ref_anchors=$(grep -o 'id="ref-[0-9][0-9]*"' "$REPORT" | sort -u | wc -l | tr -d ' ')
assert_count 12 "$ref_anchors" "參考資料錨點數"

citation_targets=$(grep -o '#ref-[0-9][0-9]*' "$REPORT" | sed 's/#ref-//' | sort -n -u)
expected_refs=$(jot 12 1)
[ "$citation_targets" = "$expected_refs" ] || fail "內文引用編號不是完整的 1 至 12"

highlight_count=$(sed -n '/<a id="highlights"><\/a>/,/<a id="trends"><\/a>/p' "$REPORT" | grep -c '^- \*\*')
assert_count 12 "$highlight_count" "亮點分類條目數"

trend_heading_count=$(sed -n '/<a id="trends"><\/a>/,/<a id="references"><\/a>/p' "$REPORT" | grep -c '^### ')
assert_count 12 "$trend_heading_count" "趨勢分類數"

summary_chars=$(sed -n '/<a id="summary"><\/a>/,/<a id="highlights"><\/a>/p' "$REPORT" | sed '1,2d;$d' | sed -E 's/\[\[[^]]+\]\]\([^)]*\)//g; s/[#*_ -]//g' | tr -d '\n' | wc -m | tr -d ' ')
[ "$summary_chars" -ge 100 ] && [ "$summary_chars" -le 300 ] || fail "總結字數應為 100 至 300，實際為 $summary_chars"

while IFS=: read -r highlight_anchor next_anchor; do
  highlight_chars=$(sed -n "/<a id=\"$highlight_anchor\"><\\/a>/,/<a id=\"$next_anchor\"><\\/a>/p" "$REPORT" | sed '1,2d;$d' | sed -E 's/\[\[[^]]+\]\]\([^)]*\)//g; s/[#*_ -]//g' | tr -d '\n' | wc -m | tr -d ' ')
  [ "$highlight_chars" -ge 100 ] && [ "$highlight_chars" -le 300 ] || fail "$highlight_anchor 亮點字數應為 100 至 300，實際為 $highlight_chars"
done <<'EOF'
hl-ai:hl-software
hl-software:hl-security
hl-security:hl-hardware
hl-hardware:hl-infrastructure
hl-infrastructure:hl-fintech
hl-fintech:hl-healthtech
hl-healthtech:hl-logistics
hl-logistics:hl-proptech
hl-proptech:hl-arts
hl-arts:hl-entertainment
hl-entertainment:hl-others
hl-others:trends
EOF

if rg -n '\{\{|<!--|YYYY-MM-DD|^- \[ \]' "$TASK" "$DELIVERY"; then
  fail "交付檔案仍有模板 placeholder 或未完成核取方塊"
fi

diff -q "$REPORT" "$DELIVERY/2026-08-15 科技服務資訊週記.md" >/dev/null || fail "report research/delivery 不一致"
diff -q "$SOURCE" "$DELIVERY/source.md" >/dev/null || fail "source research/delivery 不一致"
diff -q "$TASK/task_plan.md" "$DELIVERY/task_plan.md" >/dev/null || fail "task_plan research/delivery 不一致"
diff -q "$TASK/notes.md" "$DELIVERY/note.md" >/dev/null || fail "notes/note research/delivery 不一致"

expected_references=$(mktemp)
trap 'rm -f "$expected_references"' EXIT HUP INT TERM
sed -n '/<a id="references"><\/a>/,/<a id="notes"><\/a>/p' "$REPORT" |
  sed '$d' |
  awk 'BEGIN { blank = 0 } /^[[:space:]]*$/ { blank = 1; next } { if (blank) { print ""; blank = 0 } print }' > "$expected_references"
diff -q "$expected_references" "$DELIVERY/references.md" >/dev/null || fail "references.md 與 report.md 參考資料段落不一致"

sh -n "$ROOT/scripts/build-weekly-tech-report-016.sh"
sh -n "$ROOT/scripts/validate-weekly-tech-report-016.sh"
sh -n "$ROOT/scripts/deliver-weekly-tech-report.sh"
git -C "$ROOT" diff --check

for new_file in "$ROOT/scripts/build-weekly-tech-report-016.sh" "$ROOT/scripts/validate-weekly-tech-report-016.sh" "$TASK/prompt.md" "$TASK/task_plan.md" "$TASK/notes.md" "$TASK/source.md" "$TASK/report.md" "$DELIVERY/2026-08-15 科技服務資訊週記.md" "$DELIVERY/source.md" "$DELIVERY/task_plan.md" "$DELIVERY/note.md" "$DELIVERY/references.md"; do
  whitespace_output=$(git diff --no-index --check /dev/null "$new_file" 2>&1 || true)
  [ -z "$whitespace_output" ] || fail "新檔案有空白錯誤：$new_file"
done

echo "驗證通過：12 筆正式來源、12 類亮點、12 類趨勢、引用與交付副本一致"
