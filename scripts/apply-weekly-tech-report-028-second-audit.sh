#!/bin/sh

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-028.sh"
VALIDATE="$ROOT/scripts/validate-weekly-tech-report-028.sh"

python3 - "$BUILD" "$VALIDATE" <<'PY'
from pathlib import Path
import sys

build_path = Path(sys.argv[1])
validate_path = Path(sys.argv[2])
build = build_path.read_text(encoding="utf-8")
validate = validate_path.read_text(encoding="utf-8")


def replace_once(text: str, old: str, new: str, label: str) -> str:
    if new in text:
        return text
    count = text.count(old)
    if count != 1:
        raise SystemExit(f"{label}: expected one old anchor, found {count}")
    return text.replace(old, new, 1)


build = replace_once(
    build,
    "- Meta：`作者：Claude Code　報告日期：2026-11-07`",
    "- Meta：`作者：Claude Code、Codex　報告日期：2026-11-07`",
    "prompt meta",
)
build = replace_once(
    build,
    "| 10 | 撰稿後逐筆稽核（稽核包＋三組 `tech-auditor` 對照本機原頁） | 完成（主編逐條 grep 核對後採納；`scripts/apply-weekly-tech-report-028-audit.sh`） |",
    "| 10 | 撰稿後逐筆稽核（稽核包＋三組 `tech-auditor` 對照本機原頁） | 完成（主編逐條 grep 核對後採納；`scripts/apply-weekly-tech-report-028-audit.sh`） |\n| 11 | Codex 第二輪查核：重抓 57 筆原頁、驗證 559 個來源詞、複核 12 類缺漏 | 完成（57 筆均 HTTP 200；140 筆補搜候選無權重更高事件，正式與淘汰來源不變） |",
    "task plan second audit",
)
build = replace_once(
    build,
    "| 非 canonical 網址 | ref-2 的 deepmind.google 網址轉址到 blog.google | 改列 canonical 網址與來源名 |",
    "| 非 canonical 網址 | ref-2 的 deepmind.google 網址轉址到 blog.google | 改列 canonical 網址與來源名 |\n| 第二輪 metadata 差異 | Go Blog、金管會、衛福部、FAA 的網站包裝讓自動標題比對失敗；VS Code JSON-LD 殘留 2021 模板日期；ITmedia 需 cp932 | 人工對照頁面標題、Release date、官方 feed 與 cp932 解碼，無新錯誤 |",
    "task plan second audit metadata",
)
build = replace_once(
    build,
    "- 使用工具：Claude Code（Opus 5.5）擔任主編，負責收斂、補查、撰稿與裁決；四組 `tech-collector` 代理（sonnet）平行蒐集；三組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核",
    "- 使用工具：Claude Code（Opus 5.5）擔任主編，負責收斂、補查、撰稿與裁決；四組 `tech-collector` 代理（sonnet）平行蒐集；三組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核；Codex 執行第二輪原頁、來源詞、metadata 與缺漏複核",
    "notes tools",
)

second_audit = """## 第二輪查核（Codex；`audit-tech-weekly-report` skill）

- **原頁與元資料**：依參考表重抓 ref-1 至 ref-57，57 筆均取得 HTTP 200。自動標題或日期差異來自 Go Blog H1 抓到站名、金管會／衛福部／FAA 的網站包裝、FDA 日期格式、VS Code JSON-LD 殘留 2021 模板日期與 ITmedia Shift_JIS 解碼；人工複核後不構成標題、發布日、來源名或網址錯誤。
- **逐筆內文複核**：以 `scripts/validate-weekly-tech-report-source-terms.sh` 對 57 筆正式來源檢查 559 個 `grep 核對` 詞，全部命中。再掃描歸因、時態、數字強度、供應商自評與資料限制段，未發現新的新聞主張錯誤。
- **12 類缺漏補搜**：補搜腳本產生 140 筆候選；多為彙整頁、財經市場評論、廠商稿、低權重轉載或已由正式來源涵蓋的同一事件。沒有重要性或來源權重明顯高於現有選材的項目，不為增加筆數納入。
- **結果**：正式來源 57 筆、淘汰 46 筆、ref-1 至 ref-57 與 12 分類不變；作者 Meta 加入 Codex。
"""
notes_anchor = "- **結果**：正式 57、淘汰 46、12 分類、ref-1 至 ref-57 一致。\n"
build = replace_once(
    build,
    notes_anchor,
    notes_anchor + "\n" + second_audit,
    "notes second audit section",
)

build = replace_once(
    build,
    "**作者：Claude Code　報告日期：2026-11-07**",
    "**作者：Claude Code、Codex　報告日期：2026-11-07**",
    "report meta",
)
report_note = "本期報告的時間範圍為 2026-10-24 至 2026-11-07（今天起往前 15 天，含首尾）。來源優先序為官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載；中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。本期共蒐集候選來源 103 筆，採用 57 筆為正式參考資料、淘汰 46 筆，筆數以 `source.md` 的條目數為準。正式來源逐筆以原頁核對標題、發布日期、來源網站名稱與報告引用的數字；原頁無法取得或日期無法確認者淘汰。"
report_note_new = report_note + "Codex 第二輪查核重抓 57 筆原頁、驗證 559 個來源詞並重新補搜 12 類；正式與淘汰來源不變。"
build = replace_once(build, report_note, report_note_new, "report audit note")

build_path.write_text(build, encoding="utf-8")

validate = replace_once(
    validate,
    "grep -q '^\\*\\*作者：Claude Code　報告日期：2026-11-07\\*\\*$' \"$REPORT\" || fail \"報告 Meta 不符\"",
    "grep -q '^\\*\\*作者：Claude Code、Codex　報告日期：2026-11-07\\*\\*$' \"$REPORT\" || fail \"報告 Meta 不符\"",
    "validator meta",
)
validate = replace_once(
    validate,
    'cmp -s "$TASK/notes.md" "$DELIVERY/note.md" || fail "notes.md 與交付副本不一致"',
    'cmp -s "$TASK/notes.md" "$DELIVERY/note.md" || fail "notes.md 與交付副本不一致"\ncmp -s "$TASK/task_plan.md" "$DELIVERY/task_plan.md" || fail "task_plan.md 與交付副本不一致"',
    "validator task plan parity",
)
validate = replace_once(
    validate,
    '  --source "$SOURCE" \\\n  --delivery-report "$DELIVERY/2026-11-07 科技服務資訊週記.md" \\',
    '  --source "$SOURCE" \\\n  --references "$DELIVERY/references.md" \\\n  --delivery-report "$DELIVERY/2026-11-07 科技服務資訊週記.md" \\',
    "validator references",
)
validate_path.write_text(validate, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-028.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-028 2026-11-07
sh "$ROOT/scripts/validate-weekly-tech-report-028.sh"
git -C "$ROOT" diff --check

echo "weekly-tech-report-028 第二輪查核記錄已套用、重建、同步與驗證"
