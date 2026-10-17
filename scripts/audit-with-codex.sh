#!/bin/sh
# 以 Codex（非 Claude 模型）對科技週記做一輪唯讀逐筆稽核，結果寫成文字檔。
# 用法: sh scripts/audit-with-codex.sh <任務資料夾名稱> <報告日期 YYYY-MM-DD> [輸出檔] [本機原頁副本目錄]
# 範例: sh scripts/audit-with-codex.sh weekly-tech-report-025 2026-10-17
# 環境變數: CODEX_AUDIT_SANDBOX（預設 read-only）、CODEX_AUDIT_TIMEOUT 秒（預設 1800）

set -eu

TASK_NAME="${1:-}"
REPORT_DATE="${2:-}"
OUT="${3:-}"
PAGES_DIR="${4:-}"

if [ -z "$TASK_NAME" ] || [ -z "$REPORT_DATE" ]; then
    echo "用法: sh scripts/audit-with-codex.sh <任務資料夾名稱> <報告日期 YYYY-MM-DD> [輸出檔] [本機原頁副本目錄]" >&2
    exit 1
fi

case "$REPORT_DATE" in
    [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]) ;;
    *) echo "錯誤：日期格式須為 YYYY-MM-DD，收到 $REPORT_DATE" >&2; exit 1 ;;
esac

ROOT=$(cd "$(dirname "$0")/.." && pwd)
TASK_DIR="docs/tech-report-research/$TASK_NAME"

if [ ! -f "$ROOT/$TASK_DIR/report.md" ] || [ ! -f "$ROOT/$TASK_DIR/source.md" ]; then
    echo "錯誤：找不到 $TASK_DIR/report.md 或 source.md" >&2
    exit 1
fi

if ! command -v codex >/dev/null 2>&1; then
    echo "錯誤：找不到 codex 指令" >&2
    exit 1
fi

[ -n "$OUT" ] || OUT="$TASK_DIR/codex-audit-$REPORT_DATE.md"

# 時間窗起點：報告日期往前 14 天（含首尾共 15 天）。macOS 與 GNU date 擇一。
START_DATE=$(date -j -v-14d -f "%Y-%m-%d" "$REPORT_DATE" "+%Y-%m-%d" 2>/dev/null \
    || date -d "$REPORT_DATE -14 days" "+%Y-%m-%d")

PAGES_HINT="原頁一律開原始網址核對。"
if [ -n "$PAGES_DIR" ]; then
    PAGES_HINT="原頁優先讀本機副本目錄 $PAGES_DIR（檔名含 ref 編號或網域），副本缺失時才開原始網址。"
fi

PROMPT="你是科技服務資訊週記的第二家稽核者，只讀不改，不執行任何會修改檔案的指令。
依 audit-tech-weekly-report skill 的「逐筆查核」規則，稽核 $TASK_DIR/report.md 參考資料表的每一筆（不抽查）。
時間窗 $START_DATE 至 $REPORT_DATE，含首尾。
$PAGES_HINT
每筆對照：參考表列（標題、發布日期、媒體名稱、網址）、$TASK_DIR/source.md 的條目與備註、report.md 所有引用該 ref 的段落（含資料限制段）。
固定檢查四類：狀態與時態、原頁沒有的定性、歸因、語意精度；另查數字與「原頁未提供」這類否定式主張是否真的在原頁找不到。判準見 docs/tech-report-research/knowledge/parallel-collection.md「撰稿後的逐筆稽核」。
回報格式，每處問題一列：ref 編號｜位置（參考表／source 摘要／source 備註／報告第幾段）｜現文｜類別｜原頁原文（引號）｜建議改法。
最後附：總筆數、有問題筆數、無法開啟原頁的清單。整份結果放在最後一則訊息。"

SANDBOX="${CODEX_AUDIT_SANDBOX:-read-only}"
TIMEOUT="${CODEX_AUDIT_TIMEOUT:-1800}"

mkdir -p "$(dirname "$ROOT/$OUT")"

# codex exec 在非 TTY 下會等 stdin，必須接 </dev/null；perl alarm 當 timeout。
perl -e 'alarm shift @ARGV; exec @ARGV' "$TIMEOUT" \
    codex exec --sandbox "$SANDBOX" -C "$ROOT" --color never \
    -o "$ROOT/$OUT" "$PROMPT" </dev/null

echo "Codex 稽核結果：$OUT"
