#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TASK="$ROOT/docs/tech-report-research/weekly-tech-report-019"
DELIVERY="$ROOT/tech/2026-09-05"
REPORT="$TASK/report.md"
SOURCE="$TASK/source.md"

# skill 目錄在不同機器上以 symlink 或實體路徑存在，依序探測
for candidate in \
  "/Users/lazyjerry/.claude/skills/tech-report-research/scripts" \
  "/Users/lazyjerry/.ai-global/skills/tech-report-research/scripts" \
  "/Users/lazyjerry/.ai-global/v-skills/lazyjerry/tech-report-research/tech-report-research/scripts"
do
  if [ -d "$candidate" ]; then
    SKILL_SCRIPTS="$candidate"
    break
  fi
done
[ -n "${SKILL_SCRIPTS:-}" ] || { echo "驗證失敗：找不到 tech-report-research skill 的 scripts 目錄" >&2; exit 1; }

fail() {
  echo "驗證失敗：$1" >&2
  exit 1
}

assert_count() {
  expected=$1
  actual=$2
  label=$3
  [ "$actual" -eq "$expected" ] || fail "$label 應為 ${expected}，實際為 $actual"
}

sh "$SKILL_SCRIPTS/validate-task-files.sh" "$TASK"
sh "$SKILL_SCRIPTS/validate-task-completion.sh" "$ROOT" weekly-tech-report-019

# 交付物完整性
[ -s "$DELIVERY/2026-09-05 科技服務資訊週記.md" ] || fail "缺少交付報告"
for f in source.md task_plan.md note.md references.md; do
  [ -s "$DELIVERY/$f" ] || fail "缺少交付 $f"
done

# 交付副本與任務資料夾一致
cmp -s "$TASK/report.md" "$DELIVERY/2026-09-05 科技服務資訊週記.md" || fail "report.md 與交付副本不一致"
cmp -s "$TASK/source.md" "$DELIVERY/source.md" || fail "source.md 與交付副本不一致"
cmp -s "$TASK/notes.md" "$DELIVERY/note.md" || fail "notes.md 與交付副本不一致"

# 正式來源筆數
formal_block=$(sed -n '/^## 正式納入來源/,/^## 淘汰來源/p' "$SOURCE")
formal_sources=$(printf '%s\n' "$formal_block" | grep -c '是否納入正式參考資料：是')
assert_count 29 "$formal_sources" "正式來源數"

reject_block=$(sed -n '/^## 淘汰來源/,$p' "$SOURCE")
reject_sources=$(printf '%s\n' "$reject_block" | grep -c '是否納入正式參考資料：否')
assert_count 23 "$reject_sources" "淘汰來源數"

# 正式來源摘要長度需落在 100 至 500 字
formal_summaries=$(printf '%s\n' "$formal_block" | sed -n 's/^- 摘要：//p')
old_ifs=$IFS
IFS='
'
for summary in $formal_summaries; do
  chars=$(printf '%s' "$summary" | wc -m | tr -d ' ')
  [ "$chars" -ge 100 ] || fail "來源摘要少於 100 字（實際 ${chars}）"
  [ "$chars" -le 500 ] || fail "來源摘要超過 500 字（實際 ${chars}）"
done
IFS=$old_ifs

# 時間窗：所有正式來源發布日期需落在 2026-08-21 至 2026-09-05
formal_dates=$(printf '%s\n' "$formal_block" | sed -n 's/^- 發布日期：//p')
IFS='
'
for d in $formal_dates; do
  case "$d" in
    2026-08-2[1-9]|2026-08-3[01]|2026-09-0[1-5]) ;;
    *) fail "正式來源日期落在時間窗外：$d" ;;
  esac
done
IFS=$old_ifs

# 報告結構
grep -q '^# 2026-09-05 科技服務資訊週記$' "$REPORT" || fail "報告標題不符"
grep -q '^\*\*作者：Claude Code、Codex　報告日期：2026-09-05\*\*$' "$REPORT" || fail "報告 Meta 不符"
for anchor in summary highlights trends references notes limitations disclaimer; do
  grep -q "<a id=\"$anchor\"></a>" "$REPORT" || fail "缺少錨點 $anchor"
done

hl_count=$(grep -c '<a id="hl-' "$REPORT")
assert_count 12 "$hl_count" "亮點分類數"
tr_count=$(grep -c '<a id="tr-' "$REPORT")
assert_count 12 "$tr_count" "趨勢分類數"

# 參考資料錨點數需等於正式來源數
ref_count=$(grep -c '<a id="ref-' "$REPORT")
assert_count 29 "$ref_count" "參考資料筆數"

# 內文引用編號需與參考資料錨點一一對應
cited=$(grep -o '(#ref-[0-9]\{1,2\})' "$REPORT" | sed 's/(#ref-\([0-9]*\))/\1/' | sort -n -u)
defined=$(grep -o '<a id="ref-[0-9]\{1,2\}">' "$REPORT" | sed 's/<a id="ref-\([0-9]*\)">/\1/' | sort -n -u)
[ "$cited" = "$defined" ] || fail "內文引用編號與參考資料編號不一致"

# 每個參考資料編號都要被內文引用至少一次
n=1
while [ "$n" -le 29 ]; do
  printf '%s\n' "$cited" | grep -qx "$n" || fail "ref-$n 未被內文引用"
  n=$((n + 1))
done

# 報告不得殘留模板佔位符
grep -q '{{' "$REPORT" && fail "報告仍有未替換的模板佔位符"
grep -q '<!--' "$REPORT" && fail "報告仍有模板註解"

python3 "$ROOT/.ai-global/skills/audit-tech-weekly-report/scripts/validate_report.py" \
  --report "$REPORT" \
  --source "$SOURCE" \
  --delivery-report "$DELIVERY/2026-09-05 科技服務資訊週記.md" \
  --delivery-source "$DELIVERY/source.md" \
  --start-date 2026-08-21 \
  --end-date 2026-09-05

echo "✅ weekly-tech-report-019 驗證通過（正式來源 29、淘汰 23、分類 12、引用 ref-1..29 一致）"
