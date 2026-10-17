#!/bin/sh

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-025.sh"
VALIDATE="$ROOT/scripts/validate-weekly-tech-report-025.sh"

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
        raise SystemExit(f"{label}: expected one match, found {count}")
    return text.replace(old, new, 1)

build = build.replace(
    "作者：Claude Code　報告日期：2026-10-17",
    "作者：Claude Code、Codex　報告日期：2026-10-17",
)

build = replace_once(
    build,
    "| 10 | 撰稿後逐筆稽核（對照本機原頁） | 完成（四組稽核代理逐句對照，修正 94 處，已全部改在建置腳本並重建） |",
    "| 10 | 撰稿後逐筆稽核（對照本機原頁） | 完成（四組稽核代理逐句對照，修正 94 處，已全部改在建置腳本並重建） |\n| 11 | 第二輪查核：重抓 52 筆原頁、驗證關鍵詞與重新補搜 | 完成（50 筆直接 HTTP 200；Intel、FTC 依站點例外重抓後為 200；549 個原頁關鍵詞全數命中；補搜無新增） |",
    "task plan second audit row",
)

build = replace_once(
    build,
    "- [x] 資料來源正確性：網址、來源網站名稱、發布日期逐筆回原頁核對；撰稿後再由稽核代理逐句對照本機原頁，狀態、歸因、定性與語意的修正見 `notes.md`",
    "- [x] 資料來源正確性：網址、來源網站名稱、發布日期逐筆回原頁核對；撰稿後再由稽核代理逐句對照本機原頁，狀態、歸因、定性與語意的修正見 `notes.md`；第二輪重抓並核對 52 筆原頁，549 個關鍵詞全數命中，標題、日期、來源與正文主張無新差異",
    "task plan source verification",
)

build = replace_once(
    build,
    "| 修正腳本字串 | 一條 fixup 的舊字串多寫「虛擬」兩字，與摘要原文不符 | 套用前以 grep 核對原句後改正 |",
    "| 修正腳本字串 | 一條 fixup 的舊字串多寫「虛擬」兩字，與摘要原文不符 | 套用前以 grep 核對原句後改正 |\n| 第二輪原頁狀態 | ref-18 用瀏覽器 UA 回 403；ref-42 回 404；ref-39 至 41 為 CP932 | Intel 改用 curl 預設 UA、FTC 改用宣告式 UA 後均回 200；ITmedia 以 CP932 解碼，標題與日期皆一致 |",
    "task plan second audit exceptions",
)

tools_suffix = "再以稽核代理逐筆對照本機原頁"
tools_line = next(
    (
        line
        for line in build.splitlines()
        if line.startswith("- 使用工具：Claude Code（Opus 5.5）；")
        and line.endswith(tools_suffix)
    ),
    None,
)
if tools_line:
    build = build.replace(
        tools_line,
        tools_line + "；Codex 執行第二輪原頁、內文與缺漏複核",
        1,
    )
elif "；Codex 執行第二輪原頁、內文與缺漏複核" not in build:
    raise SystemExit("notes tools: source line not found")

second_audit = """## 第二輪查核（Codex；`audit-tech-weekly-report` skill）

- **原頁重抓與元資料**：52 筆正式來源中 50 筆用瀏覽器 UA 直接回 HTTP 200；ref-18 Intel 改用 curl 預設 UA、ref-42 FTC 改用宣告式 UA 後均為 200。ref-39 至 ref-41 以 CP932 解碼。人工複核原頁 H1／`<title>`、發布日、來源名稱與轉址結果，無需修正報告資料。
- **正文主張**：以 `source.md` 每筆的原頁關鍵詞清單重跑驗證，52 筆共 549 個日期、數字、產品名與關鍵敘述全數在重新下載的原頁命中。再對照稽核包中的摘要、參考表列、亮點、趨勢與資料限制，未發現新的狀態、歸因、數字或語意錯誤。
- **缺漏補搜**：重新搜尋 12 個必要分類，檢視 137 筆 RSS 候選。高權重結果多為已收事件的二手轉述、前期已引用事件或資安週報；其餘多為低權重投資稿。沒有比現有 52 筆選材明顯更重要或來源權重更高的缺漏，不新增。
- **修正範圍**：新聞主張、日期、網址、參考編號與來源數量不變；作者 Meta 加入 `Codex`，並補齊本輪查核紀錄。

"""
if second_audit not in build:
    build = replace_once(
        build,
        "## 知識庫更新",
        second_audit + "## 知識庫更新",
        "notes second audit section",
    )

audit_row = "| 11 | 第二輪查核：重抓 52 筆原頁、驗證關鍵詞與重新補搜 | 完成（50 筆直接 HTTP 200；Intel、FTC 依站點例外重抓後為 200；549 個原頁關鍵詞全數命中；補搜無新增） |"
audit_clause = "；第二輪重抓並核對 52 筆原頁，549 個關鍵詞全數命中，標題、日期、來源與正文主張無新差異"
audit_error = "| 第二輪原頁狀態 | ref-18 用瀏覽器 UA 回 403；ref-42 回 404；ref-39 至 41 為 CP932 | Intel 改用 curl 預設 UA、FTC 改用宣告式 UA 後均回 200；ITmedia 以 CP932 解碼，標題與日期皆一致 |"
for fragment in (audit_row, audit_error):
    while f"{fragment}\n{fragment}" in build:
        build = build.replace(f"{fragment}\n{fragment}", fragment)
while audit_clause + audit_clause in build:
    build = build.replace(audit_clause + audit_clause, audit_clause)
while second_audit + second_audit in build:
    build = build.replace(second_audit + second_audit, second_audit)

validate = validate.replace(
    "^\\*\\*作者：Claude Code　報告日期：2026-10-17\\*\\*$",
    "^\\*\\*作者：Claude Code、Codex　報告日期：2026-10-17\\*\\*$",
)

build_path.write_text(build, encoding="utf-8")
validate_path.write_text(validate, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-025.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-025 2026-10-17
sh "$ROOT/scripts/validate-weekly-tech-report-025.sh"

echo "weekly-tech-report-025 第二輪稽核紀錄已套用、重建、同步與驗證"
