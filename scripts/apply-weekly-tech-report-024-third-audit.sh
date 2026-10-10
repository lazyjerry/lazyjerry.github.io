#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-024.sh"
VALIDATE="$ROOT/scripts/validate-weekly-tech-report-024.sh"

python3 - "$BUILD" "$VALIDATE" <<'PY'
from pathlib import Path
import sys

build_path = Path(sys.argv[1])
validate_path = Path(sys.argv[2])
build = build_path.read_text(encoding="utf-8")
validate = validate_path.read_text(encoding="utf-8")

def replace_once(text: str, old: str, new: str, label: str) -> str:
    count = text.count(old)
    if count == 0 and new in text:
        return text
    if count != 1:
        raise SystemExit(f"{label}: expected one match, found {count}")
    return text.replace(old, new, 1)

build = build.replace(
    "作者：Claude Code　報告日期：2026-10-10",
    "作者：Claude Code、Codex　報告日期：2026-10-10",
)

build = replace_once(
    build,
    "| 11 | 第二輪查核：開原始網址逐筆核對元資料與內文、跨分類補搜 | 完成（51 筆網址全部 200、標題／日期／媒體名稱全部一致，10 筆內文修正；補搜補入 ref-52 至 ref-57，4 筆候選淘汰） |",
    "| 11 | 第二輪查核：開原始網址逐筆核對元資料與內文、跨分類補搜 | 完成（51 筆網址全部 200、標題／日期／媒體名稱全部一致，10 筆內文修正；補搜補入 ref-52 至 ref-57，4 筆候選淘汰） |\n| 12 | 第三輪查核：重抓 57 筆原頁、人工複核元資料差異、重新補搜 | 完成（57 筆網址全部 200；5 筆自動差異皆為聚合頁、編碼、更新日或 H1／title 分工，無需修改新聞內容；補搜無新增） |",
    "task plan third audit row",
)

build = replace_once(
    build,
    "- [x] 資料來源正確性：網址、來源網站名稱、發布日期逐筆回原頁核對；撰稿後再由稽核代理逐句對照本機原頁，40 筆的狀態、歸因、定性與語意修正見 `notes.md`；第二輪查核開原始網址，51 筆的網址、標題、日期與媒體名稱全部一致，另修 10 處內文",
    "- [x] 資料來源正確性：網址、來源網站名稱、發布日期逐筆回原頁核對；撰稿後再由稽核代理逐句對照本機原頁，40 筆的狀態、歸因、定性與語意修正見 `notes.md`；第二輪查核開原始網址，51 筆的網址、標題、日期與媒體名稱全部一致，另修 10 處內文；第三輪重抓 57 筆皆為 HTTP 200，5 筆自動差異人工複核後不構成內容錯誤",
    "task plan source verification",
)

build = replace_once(
    build,
    "| 補搜代理存檔編號 | 回報的 gap-9 實為 SynthID 頁、堆疊 PR 在 gap-8 | 主編以 `<title>` 重新對應後才核對 |",
    "| 補搜代理存檔編號 | 回報的 gap-9 實為 SynthID 頁、堆疊 PR 在 gap-8 | 主編以 `<title>` 重新對應後才核對 |\n| 第三輪元資料差異 | ref-22 為聚合式 Release Notes、ref-37／38／40 為 Shift_JIS 解碼雜訊、ref-55 的 H1 與 `<title>` 用途不同；ref-11 只抓到最後修改日 | 回原頁人工核對；報告採 ref-55 `<title>`，ref-11 依時間軸公開聲明日 2026-09-29，不修改內容 |",
    "task plan error log",
)

tools_suffix = "再以稽核代理逐筆對照本機原頁"
tools_line = next(
    (line for line in build.splitlines() if line.startswith("- 使用工具：Claude Code（Opus 5.5）；") and line.endswith(tools_suffix)),
    None,
)
if tools_line:
    build = build.replace(tools_line, tools_line + "；Codex 執行第三輪原頁與缺漏複核", 1)
elif "；Codex 執行第三輪原頁與缺漏複核" not in build:
    raise SystemExit("notes tools: source line not found")

build = replace_once(
    build,
    "- **驗證**：`scripts/validate-weekly-tech-report-024.sh` 常數改為正式 57、淘汰 134、ref-1..57，通過；`validate_report.py`（含 `--references`）通過；總結 298 字；排版校對剩 11 項不修（日文原標題）。\nEOF",
    "- **驗證**：`scripts/validate-weekly-tech-report-024.sh` 常數改為正式 57、淘汰 134、ref-1..57，通過；`validate_report.py`（含 `--references`）通過；總結 298 字；排版校對剩 11 項不修（日文原標題）。\n\n## 第三輪查核（Codex；`audit-tech-weekly-report` skill）\n\n- **原頁重抓**：57 筆正式來源全部 HTTP 200。自動標題比對標出 ref-22、37、38、40、55；人工複核後，ref-22 是聚合式 Release Notes 頁、ref-37／38／40 是 Shift_JIS 解碼造成的雜訊、ref-55 的 `<title>` 仍為報告採用的原始標題，較長文字是頁面 H1，皆不構成標題錯誤。\n- **日期複核**：ref-11 的頁面 meta 只呈現 2026-10-09 最後修改日，事件時間軸仍列 2026-09-29 對外公開聲明，報告保留 2026-09-29；ref-29 的 2026-10-01 仍與 `article:published_time` 一致。\n- **缺漏補搜**：重新掃描 12 個必要分類。候選多為現有事件的二手轉述、低權重產業文或同系列更新，無來源權重或重要性明顯高於現有 57 筆者，因此不新增。\n- **修正範圍**：新聞主張、日期、網址、引用編號不變；作者 Meta 加入 `Codex`，並補齊本輪查核紀錄。\nEOF",
    "notes third audit section",
)

validate = validate.replace(
    "^\\*\\*作者：Claude Code　報告日期：2026-10-10\\*\\*$",
    "^\\*\\*作者：Claude Code、Codex　報告日期：2026-10-10\\*\\*$",
)

# 前置文字仍會存在於更新後的完整文字中；寫入前明確收旂重複片段。
third_row = "| 12 | 第三輪查核：重抓 57 筆原頁、人工複核元資料差異、重新補搜 | 完成（57 筆網址全部 200；5 筆自動差異皆為聚合頁、編碼、更新日或 H1／title 分工，無需修改新聞內容；補搜無新增） |"
third_clause = "；第三輪重抓 57 筆皆為 HTTP 200，5 筆自動差異人工複核後不構成內容錯誤"
third_error = "| 第三輪元資料差異 | ref-22 為聚合式 Release Notes、ref-37／38／40 為 Shift_JIS 解碼雜訊、ref-55 的 H1 與 `<title>` 用途不同；ref-11 只抓到最後修改日 | 回原頁人工核對；報告採 ref-55 `<title>`，ref-11 依時間軸公開聲明日 2026-09-29，不修改內容 |"
for fragment in (third_row, third_clause, third_error):
    while f"{fragment}\n{fragment}" in build:
        build = build.replace(f"{fragment}\n{fragment}", fragment)
while third_clause + third_clause in build:
    build = build.replace(third_clause + third_clause, third_clause)

build_path.write_text(build, encoding="utf-8")
validate_path.write_text(validate, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-024.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-024 2026-10-10
sh "$ROOT/scripts/validate-weekly-tech-report-024.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-024 2026-10-10
sh "$ROOT/scripts/validate-weekly-tech-report-024.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-024 2026-10-10

echo "weekly-tech-report-024 第三輪稽核紀錄已套用、重建與同步"
