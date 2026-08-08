#!/bin/sh
# 將科技週報研究任務資料夾的成果同步到 tech/{日期}/
# 用法: sh scripts/deliver-weekly-tech-report.sh <任務資料夾名稱> <指定日期 YYYY-MM-DD>
# 範例: sh scripts/deliver-weekly-tech-report.sh weekly-tech-report-015 2026-08-08

set -eu

TASK_NAME="${1:-}"
REPORT_DATE="${2:-}"

if [ -z "$TASK_NAME" ] || [ -z "$REPORT_DATE" ]; then
    echo "用法: sh scripts/deliver-weekly-tech-report.sh <任務資料夾名稱> <指定日期 YYYY-MM-DD>" >&2
    exit 1
fi

case "$REPORT_DATE" in
    [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]) ;;
    *) echo "錯誤：日期格式須為 YYYY-MM-DD，收到 $REPORT_DATE" >&2; exit 1 ;;
esac

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TASK="$ROOT/docs/tech-report-research/$TASK_NAME"
DELIVERY="$ROOT/tech/$REPORT_DATE"

for f in report.md source.md task_plan.md notes.md; do
    if [ ! -f "$TASK/$f" ]; then
        echo "錯誤：找不到 $TASK/$f" >&2
        exit 1
    fi
done

mkdir -p "$DELIVERY"

cp "$TASK/report.md" "$DELIVERY/$REPORT_DATE 科技服務資訊週記.md"
cp "$TASK/source.md" "$DELIVERY/source.md"
cp "$TASK/task_plan.md" "$DELIVERY/task_plan.md"
cp "$TASK/notes.md" "$DELIVERY/note.md"

# 由 report.md 的參考資料段落抽出 references.md，避免兩份清單各自漂移
sed -n '/<a id="references"><\/a>/,/<a id="notes"><\/a>/p' "$TASK/report.md" |
  sed '$d' |
  awk 'BEGIN { blank = 0 } /^[[:space:]]*$/ { blank = 1; next } { if (blank) { print ""; blank = 0 } print }' > "$DELIVERY/references.md"

if [ ! -s "$DELIVERY/references.md" ]; then
    echo "錯誤：references.md 為空，請確認 report.md 的參考資料錨點" >&2
    exit 1
fi

echo "已同步 $TASK_NAME 至 tech/$REPORT_DATE"
ls -1 "$DELIVERY"
