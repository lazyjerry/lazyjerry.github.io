#!/bin/sh

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-027.sh"
VALIDATE="$ROOT/scripts/validate-weekly-tech-report-027.sh"

python3 - "$BUILD" "$VALIDATE" <<'PY'
from pathlib import Path
import sys

build_path = Path(sys.argv[1])
validate_path = Path(sys.argv[2])
build = build_path.read_text(encoding="utf-8")
validate = validate_path.read_text(encoding="utf-8")

# 第三輪（apply-weekly-tech-report-027-third-audit.sh）改寫過的句子：命中也算已套用
SUPERSEDED = {
    "report audit note": "重新補搜 12 類；正式來源不變。第三輪查核再重抓 57 筆原頁",
    "validator rejected count": "assert_count 59 \"$reject_sources\" \"淘汰來源數\"",
    "validator message": "正式來源 61、淘汰 59、分類 12、引用 ref-1..61 一致",
}


def replace_once(text: str, old: str, new: str, label: str) -> str:
    if new in text or SUPERSEDED.get(label, "\0") in text:
        return text
    count = text.count(old)
    if count != 1:
        raise SystemExit(f"{label}: expected one old anchor, found {count}")
    return text.replace(old, new, 1)


build = replace_once(
    build,
    "- Meta：`作者：Claude Code　報告日期：2026-10-31`",
    "- Meta：`作者：Claude Code、Codex　報告日期：2026-10-31`",
    "prompt meta",
)
build = replace_once(
    build,
    "| 10 | 撰稿後逐筆稽核（稽核包＋四組 `tech-auditor` 對照本機原頁） | 完成（主編逐條 grep 核對後採納；`scripts/apply-weekly-tech-report-027-audit.sh`） |",
    "| 10 | 撰稿後逐筆稽核（稽核包＋四組 `tech-auditor` 對照本機原頁） | 完成（主編逐條 grep 核對後採納；`scripts/apply-weekly-tech-report-027-audit.sh`） |\n| 11 | Codex 第二輪查核：重抓 57 筆原頁、驗證 580 個來源詞、複核 12 類缺漏 | 完成（55 筆直接 HTTP 200；Intel 兩筆依站別改用預設 UA 後為 200；新增 2 筆淘汰候選，正式來源不變） |",
    "task plan second audit",
)
build = replace_once(
    build,
    "| 標題取 `<title>` | ref-17、33、45、52 的 `<title>` 與 H1 不同 | 改用 H1 |",
    "| 標題取 `<title>` | ref-17、33、45、52 的 `<title>` 與 H1 不同 | 改用 H1 |\n| 第二輪 Intel 抓取 | ref-20、ref-21 以瀏覽器 UA 回 403 | 依站別規則改用 curl 預設 UA，兩筆皆回 200 |\n| 第二輪補搜候選 | GPT-6 Rosalind Research、皮膚病灶輔助診斷軟體分類皆為官方來源 | 前者為受限預覽且與既有醫療 AI 題材重疊；後者是 2024 年分類的法規編纂，均列淘汰 |",
    "task plan second audit errors",
)
build = replace_once(
    build,
    "- 使用工具：Claude Code（Opus 5.5）擔任主編，負責收斂、補查、撰稿與裁決；四組 `tech-collector` 代理（sonnet）平行蒐集；四組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核",
    "- 使用工具：Claude Code（Opus 5.5）擔任主編，負責收斂、補查、撰稿與裁決；四組 `tech-collector` 代理（sonnet）平行蒐集；四組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核；Codex 執行第二輪原頁、來源詞與缺漏複核",
    "notes tools",
)

second_audit = """## 第二輪查核（Codex；`audit-tech-weekly-report` skill）

- **原頁與元資料**：依參考表重抓 ref-1 至 ref-57，55 筆以瀏覽器 UA 取得 HTTP 200；ref-20、ref-21 Intel 依站別規則改用 curl 預設 UA 後皆為 200。自動標題差異只有 Mistral／IBM 分隔符、Intel 擋頁與兩筆 ITmedia Shift_JIS 解碼雜訊；人工複核後不構成標題、日期、來源或網址錯誤。
- **逐筆內文複核**：以 `scripts/validate-weekly-tech-report-source-terms.sh` 對 57 筆正式來源檢查 580 個 `grep 核對` 詞，全部命中。再對照第一輪已修正的狀態、歸因、數字分母、供應商自評與資料限制段，未發現新的新聞主張錯誤。
- **12 類缺漏補搜**：重新掃描 AI、軟體工程、資安、硬體、基礎設施、金融、醫療、運輸、房地產、表演藝術、影視音樂與其他應用。新增兩筆淘汰候選：OpenAI 10 月 30 日 GPT-6 Rosalind Research 為限核准客戶的受限預覽，且本期已有 Anthropic 藥物開發；FDA 10 月 30 日皮膚病灶輔助診斷軟體 Class II 最終命令，是將 2024 年 De Novo 分類編入法規。兩者的重要性未明顯高於現有正式選材，不為增加筆數而納入。
- **結果**：正式來源 57 筆、淘汰 54 筆、ref-1 至 ref-57 與 12 分類不變；作者 Meta 加入 Codex。
"""
notes_anchor = "- **結果**：正式 57、淘汰 52、12 分類、ref-1 至 ref-57 一致。\n"
build = replace_once(
    build,
    notes_anchor,
    notes_anchor + "\n" + second_audit,
    "notes second audit section",
)

new_rejects = """

### BA. OpenAI 推出 GPT-6 Rosalind Research
- URL：https://help.openai.com/en/articles/9624314-model-release-notes
- 發布日期：2026-10-30
- 分類：AI 科技／醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：OpenAI Model Release Notes 顯示模型只向核准的 Research 客戶在 Work、Codex 與 API 受限推出，Chat 不提供，Enterprise 預設關閉並先進行兩週 Admin Preview；本期已有 Anthropic 藥物開發的一手來源，重要性未明顯更高。

### BB. FDA 將皮膚病灶軟體輔助診斷裝置列為 Class II
- URL：https://www.federalregister.gov/documents/2026/10/30/2026-22179/medical-devices-general-and-plastic-surgery-devices-classification-of-the-software-aided-adjunctive
- 發布日期：2026-10-30
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：本次最終命令把皮膚病灶輔助第二判讀裝置編入 Class II 特別管制；原裝置的 De Novo 分類已於 2024-01-12 完成，本期屬法規編纂，不是新產品核准或新臨床結果。
"""
reject_anchor = "- 淘汰原因：PHP 官方自述此 RCE 只在少見的組態與程式碼組合下發生（執行期以 ini_set() 切換 session.serialize_handler），將於下一個例行版本處理並公布 CVE-2026-115560；屬上一期 PHP 重大漏洞（2026-10-24 期 ref-12）的補充建議，影響範圍小，資安名額已滿。\n"
build = replace_once(
    build,
    reject_anchor,
    reject_anchor + new_rejects,
    "source rejected candidates",
)

build = replace_once(
    build,
    "**作者：Claude Code　報告日期：2026-10-31**",
    "**作者：Claude Code、Codex　報告日期：2026-10-31**",
    "report meta",
)
report_note = "本期報告的時間範圍為 2026-10-17 至 2026-10-31（今天起往前 15 天，含首尾）。來源優先序為官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載；中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。本期共蒐集候選來源 109 筆，採用 57 筆為正式參考資料、淘汰 52 筆，筆數以 `source.md` 的條目數為準。正式來源逐筆以原頁核對標題、發布日期、來源網站名稱與報告引用的數字；原頁無法取得或日期無法確認者淘汰。"
report_note_new = "本期報告的時間範圍為 2026-10-17 至 2026-10-31（今天起往前 15 天，含首尾）。來源優先序為官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載；中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。本期共蒐集候選來源 111 筆，採用 57 筆為正式參考資料、淘汰 54 筆，筆數以 `source.md` 的條目數為準。正式來源逐筆以原頁核對標題、發布日期、來源網站名稱與報告引用的數字；原頁無法取得或日期無法確認者淘汰。Codex 第二輪查核重抓 57 筆原頁、驗證 580 個來源詞並重新補搜 12 類；正式來源不變。"
build = replace_once(build, report_note, report_note_new, "report audit note")

build_path.write_text(build, encoding="utf-8")

validate = replace_once(
    validate,
    "assert_count 52 \"$reject_sources\" \"淘汰來源數\"",
    "assert_count 54 \"$reject_sources\" \"淘汰來源數\"",
    "validator rejected count",
)
validate = replace_once(
    validate,
    "grep -q '^\\*\\*作者：Claude Code　報告日期：2026-10-31\\*\\*$' \"$REPORT\" || fail \"報告 Meta 不符\"",
    "grep -q '^\\*\\*作者：Claude Code、Codex　報告日期：2026-10-31\\*\\*$' \"$REPORT\" || fail \"報告 Meta 不符\"",
    "validator meta",
)
validate = replace_once(
    validate,
    "echo \"✅ weekly-tech-report-027 驗證通過（正式來源 57、淘汰 52、分類 12、引用 ref-1..57 一致）\"",
    "echo \"✅ weekly-tech-report-027 驗證通過（正式來源 57、淘汰 54、分類 12、引用 ref-1..57 一致）\"",
    "validator message",
)
validate_path.write_text(validate, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-027.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-027 2026-10-31
sh "$ROOT/scripts/validate-weekly-tech-report-027.sh"
git -C "$ROOT" diff --check

echo "weekly-tech-report-027 第二輪查核紀錄已套用、重建、同步與驗證"
