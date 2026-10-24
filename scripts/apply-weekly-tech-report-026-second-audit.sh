#!/bin/sh

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-026.sh"
VALIDATE="$ROOT/scripts/validate-weekly-tech-report-026.sh"

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
    "- Meta：`作者：Claude Code　報告日期：2026-10-24`",
    "- Meta：`作者：Claude Code、Codex　報告日期：2026-10-24`",
    "prompt meta",
)
build = replace_once(
    build,
    "| 10 | 撰稿後逐筆稽核（稽核包＋四組 `tech-auditor` 對照本機原頁） | 完成（四組回報約 65 處，全數採納，紀錄於 `notes.md`） |",
    "| 10 | 撰稿後逐筆稽核（稽核包＋四組 `tech-auditor` 對照本機原頁） | 完成（四組回報約 65 處，全數採納，紀錄於 `notes.md`） |\n| 11 | Codex 第二輪查核：重抓 55 筆原頁、複核內文與 12 類缺漏 | 完成（54 筆以 curl 取得 HTTP 200；SEC 以瀏覽器擷取核對；修正 ref-16 過時備註，沒有新增正式來源） |",
    "task plan second audit",
)
build = replace_once(
    build,
    "| 國衛院機器學習 | 把機器學習套到三項研究 | 限縮在腎病變研究 |",
    "| 國衛院機器學習 | 把機器學習套到三項研究 | 限縮在腎病變研究 |\n| ref-16 備註過時 | 備註仍稱工研院稀土廠「未採用」，但本期 ref-55 已正式納入 | 改為關聯後續並指向 ref-55 |\n| 稽核包雜訊 | 每個 ref 都重複收入參考表與報告說明，ref-55 還夾入淘汰區標題 | 稽核包限於參考資料前的正文，並在淘汰區標題前停止擷取 |",
    "task plan errors",
)
build = replace_once(
    build,
    "- 使用工具：Claude Code（Opus 5.5）擔任主編，負責收斂、補查、撰稿與裁決；四組 `tech-collector` 代理（sonnet）平行蒐集；四組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核",
    "- 使用工具：Claude Code（Opus 5.5）擔任主編，負責收斂、補查、撰稿與裁決；四組 `tech-collector` 代理（sonnet）平行蒐集；四組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核；Codex 執行第二輪原頁、內文與缺漏複核",
    "notes tools",
)
build = replace_once(
    build,
    "工研院稀土廠（中央社 202610240025，10-24）為相關後續，未採用。",
    "工研院稀土廠（中央社 202610240025，10-24）為相關後續，已納入 ref-55。",
    "ref-16 stale note",
)

second_audit = """## 第二輪查核（Codex；`audit-tech-weekly-report` skill）

- **原頁與元資料**：依參考表重抓 ref-1 至 ref-55，54 筆以 curl 取得 HTTP 200。ref-28 SEC 對本輪 curl 回 403，改以瀏覽器擷取官方頁，H1、2026-10-23 日期與 34,000 家受檢單位、營運韌性、資安、super intelligence、美國公債清算與 tokenization 重點均吻合。ITmedia BUILT 兩筆為 Shift_JIS 顯示雜訊；其餘 H1／headline、來源名稱與可取得的發布日未見新差異。
- **逐筆內文複核**：對照現行原頁、`source.md` 摘要、參考表與報告中的引用段落。正文數字、狀態、歸因與供應商自評的限制均已在第一輪收旂；本輪未發現需改的新聞主張。唯一內容矛盾是 ref-16 備註仍寫「工研院稀土廠未採用」，但它已為 ref-55，已更正。
- **12 類缺漏補搜**：重新掃描 AI、軟體工程、資安、硬體、基礎設施、金融、醫療、運輸、房地產、表演藝術、影視音樂與其他應用。金管會 10 月 13 日代理 AI 諮詢文件已在上一期 ref-25，依跨期去重不重收；是方虎尾 AI 資料中心與 AWS 產能報導有資訊價值，但來源權重或重要性未明顯高於本期已收的五筆基礎設施來源，不為湊數新增。
- **工具收旂**：`build-weekly-tech-report-audit-packets.sh` 改為只擷取參考資料章節前的正文，並在 `## 淘汰來源` 前停止 source 條目擷取，避免每包重複報告說明與 ref-55 夾入淘汰區標題。
- **結果**：正式來源 55 筆、淘汰 62 筆、ref-1 至 ref-55 與 12 分類不變。
"""
notes_anchor = "- 錯字：「接獲時商」改為「接獲比利時商」（ref-40）\n"
build = replace_once(
    build,
    notes_anchor,
    notes_anchor + "\n" + second_audit,
    "notes second audit section",
)

build = replace_once(
    build,
    "**作者：Claude Code　報告日期：2026-10-24**",
    "**作者：Claude Code、Codex　報告日期：2026-10-24**",
    "report meta",
)
report_note = "本期報告的時間範圍為 2026-10-10 至 2026-10-24（今天起往前 15 天，含首尾）。來源優先序為官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載；中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。本期共蒐集候選來源 117 筆，採用 55 筆為正式參考資料、淘汰 62 筆，筆數以 `source.md` 的條目數為準。正式來源逐筆以原頁核對標題、發布日期、來源網站名稱與報告引用的數字；原頁無法取得或日期無法確認者淘汰。"
codex_note = " Codex 第二輪查核重抓 55 筆原頁、逐筆複核內文並重新補搜 12 類；沒有新增正式來源。"
# 第三輪（apply-weekly-tech-report-026-third-audit.sh）會改前面的筆數，已套用與否只看這一句
if codex_note not in build:
    build = replace_once(
        build,
        report_note,
        report_note + codex_note,
        "report audit note",
    )

build_path.write_text(build, encoding="utf-8")

validate = replace_once(
    validate,
    "grep -q '^\\*\\*作者：Claude Code　報告日期：2026-10-24\\*\\*$' \"$REPORT\" || fail \"報告 Meta 不符\"",
    "grep -q '^\\*\\*作者：Claude Code、Codex　報告日期：2026-10-24\\*\\*$' \"$REPORT\" || fail \"報告 Meta 不符\"",
    "validator meta",
)
validate_path.write_text(validate, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-026.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-026 2026-10-24
sh "$ROOT/scripts/validate-weekly-tech-report-026.sh"
git -C "$ROOT" diff --check

echo "weekly-tech-report-026 第二輪查核修正已套用、重建、同步與驗證"
