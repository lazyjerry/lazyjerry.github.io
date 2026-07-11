#!/bin/sh
set -eu

workspace=${1:-.}
task_dir="$workspace/docs/tech-report-research/weekly-tech-report-011"
delivery_dir="$workspace/tech/2026-07-11"

python3 - "$task_dir" "$delivery_dir" <<'PY'
from pathlib import Path
import re
import subprocess
import sys

task_dir = Path(sys.argv[1])
delivery_dir = Path(sys.argv[2])
report_path = task_dir / "report.md"
source_path = task_dir / "source.md"
notes_path = task_dir / "notes.md"
plan_path = task_dir / "task_plan.md"

workspace = task_dir.parents[2]

def head_text(relative_path):
    return subprocess.check_output(
        ["git", "-C", str(workspace), "show", f"HEAD:{relative_path}"],
        text=True,
    )

report = head_text("docs/tech-report-research/weekly-tech-report-011/report.md")
source = head_text("docs/tech-report-research/weekly-tech-report-011/source.md")

source = re.sub(
    r"### 來源 6｜.*?(?=\n### 來源 7｜)",
    """### 來源 6｜南韓三星與 SK 海力士投資 800 兆韓元擴建 AI 晶片聚落
- 網址：https://apnews.com/article/22352d95c7a821c5f4548b2d1a4ebde8
- 發布日期：2026-06-29
- 分類：硬體或軟硬整合
- 權重：9/10
- 是否納入：是
- 摘要：南韓政府、三星電子與 SK 海力士宣布在南韓西南部建立大型晶片製造聚落，兩家公司規劃合計投資 800 兆韓元（約 5,180 億美元），以回應 AI 帶動的記憶體需求。計畫涵蓋四座記憶體晶圓廠及相關先進封裝與供應鏈設施，也反映 AI 硬體競爭已從單一晶片效能擴大到產能、區域配置與供應鏈韌性。採用 AP 於 6 月 29 日發布的報導，日期與主張均可直接核對，取代超出時間窗且摘要失實的豐雲學堂舊文。
""",
    source,
    flags=re.S,
)
source = re.sub(
    r"### 來源 8｜.*?(?=\n### 來源 9｜)",
    """### 來源 8｜Bank of England 金融政策委員會檢視系統性穩定幣監管進度
- 網址：https://www.bankofengland.co.uk/financial-policy-committee-record/2026/july-2026
- 發布日期：2026-07-07
- 分類：金融科技
- 權重：10/10
- 是否納入：是
- 摘要：Bank of England 於 7 月 7 日發布 Financial Policy Committee Record。委員會歡迎英鎊計價系統性穩定幣政策聲明與規則草案，並持續從金融穩定角度檢視可能廣泛用於支付的穩定幣。此官方紀錄顯示，穩定幣正從產品與市場實驗走向支付基礎設施監理，重點轉為儲備資產、流動性、營運韌性與跨機關監管。採用中央銀行官方來源，取代未能支持原報告交易量與 CBDC 數字的產業彙整頁。
""",
    source,
    flags=re.S,
)
source = re.sub(r"- 發布日期：\*未知時間（展期 2026-06-25.*?）", "- 發布日期：2026-07-08", source)
source = re.sub(r"- 發布日期：\*未知時間（事件為 7/10.*?）", "- 發布日期：2026-07-07", source)
source = source.replace("美國政府在 7 月 9 日解除對 GPT-5.6 的公眾存取限制後", "美國政府解除對 GPT-5.6 的公眾存取限制後")
source = source.replace("## 納入正式參考資料", "## 正式納入來源")
source = source.replace("## 淘汰／未納入來源（附原因）", "## 淘汰來源")
source = re.sub(r"^### 來源 (\d+)｜", r"### \1. ", source, flags=re.MULTILINE)

report = report.replace("美國政府 7 月 9 日解除公眾存取限制後", "美國政府解除公眾存取限制後")
report = report.replace("**作者：Claude Code (Opus 4.8)　報告日期：2026-07-11**", "**作者：Claude Code、Codex　報告日期：2026-07-11**")
report = report.replace("OpenAI 在美國政府 7 月 9 日解禁後公開 GPT-5.6", "OpenAI 在美國政府解除限制後公開 GPT-5.6")
report = report.replace("本報告由 Claude Code (Opus 4.8) 於 2026-07-11 彙整", "本報告由 Claude Code、Codex 於 2026-07-11 彙整與查核")
report = re.sub(
    r"(?<=## 總結\n).*?(?=\n\n<a id=\"highlights\")",
    """本期（2026-06-26 至 07-11）主軸是 **AI 從模型競賽轉入 Agent 與產品落地**。OpenAI 公開 GPT-5.6 並推出 ChatGPT Work、GPT-Live [[1. CNBC]](#ref-1)，Anthropic 以較低成本的 Claude Sonnet 5 應戰 [[2. TechCrunch]](#ref-2)，Z.ai 則推出 ZCode 搶攻 AI Coding IDE [[3. TechOrange]](#ref-3)。硬體端，人形機器人轉向規模部署 [[5. TechNews]](#ref-5)，南韓三星與 SK 海力士規劃投資 800 兆韓元擴建 AI 晶片聚落 [[6. AP]](#ref-6)。資安面，Pi 拍錢包傳出 350 萬名用戶個資外洩 [[4. iThome]](#ref-4)；金融科技則進入穩定幣系統性監管階段 [[8. Bank of England]](#ref-8)。""",
    report,
    flags=re.S,
)
report = re.sub(
    r"(?<=<a id=\"hl-hardware\"></a>\n### 硬體或軟硬整合\n).*?(?=\n\n<a id=\"hl-infrastructure\")",
    """- **人形機器人商業化與記憶體產能擴張，是本期軟硬整合的兩條主線。** Counterpoint 指出，人形機器人競爭正從動作展示轉向規模部署與生態建構，中國並提出萬台級部署目標 [[5. TechNews]](#ref-5)。另一邊，南韓政府、三星與 SK 海力士宣布在西南部建立大型晶片聚落，兩家公司規劃合計投資 800 兆韓元（約 5,180 億美元），涵蓋四座記憶體晶圓廠與相關供應鏈設施 [[6. AP]](#ref-6)。AI 硬體競爭已不只比單顆晶片，而是同時比量產速度、先進封裝與區域供應鏈能否承接需求。""",
    report,
    flags=re.S,
)
report = re.sub(
    r"(?<=<a id=\"hl-fintech\"></a>\n### 金融科技\n).*?(?=\n\n<a id=\"hl-healthtech\")",
    """- **穩定幣開始被當成系統性支付基礎設施監管。** Bank of England 於 7 月 7 日發布的金融政策委員會紀錄，明確歡迎英鎊計價系統性穩定幣政策聲明與規則草案 [[8. Bank of England]](#ref-8)。焦點已從「能否發行」轉為儲備資產、流動性、營運韌性與跨機關監管；當穩定幣進入大眾支付，發行人面對的要求會更接近金融市場基礎設施，而非一般加密資產專案。""",
    report,
    flags=re.S,
)
report = re.sub(
    r"(?<=<a id=\"tr-hardware\"></a>\n### 硬體或軟硬整合\n).*?(?=\n\n<a id=\"tr-infrastructure\")",
    """硬體競爭聚焦 **「具身智能落地」與「記憶體產能版圖」**。人形機器人從展示轉向規模部署與場景驗證 [[5. TechNews]](#ref-5)；南韓則以 800 兆韓元投資案擴建記憶體晶圓廠與供應鏈聚落 [[6. AP]](#ref-6)。兩者共同顯示，演算法能力必須靠量產、封裝、能源與供應商協作才能變成可交付產品。未來競爭不只看規格，也要看資本支出能否準時轉化為穩定產能。""",
    report,
    flags=re.S,
)
report = re.sub(
    r"(?<=<a id=\"tr-fintech\"></a>\n### 金融科技\n).*?(?=\n\n<a id=\"tr-healthtech\")",
    """金融科技進入 **「穩定幣制度化」** 階段。Bank of England 已把廣泛用於支付、可能影響金融穩定的穩定幣納入專門規則草案 [[8. Bank of England]](#ref-8)。產品團隊不能只處理鏈上轉帳，還要把儲備管理、贖回、流動性、營運持續性與監理報告納入系統設計。這也代表競爭門檻由發幣速度轉向能否在金融穩定要求下長期營運。""",
    report,
    flags=re.S,
)

report = re.sub(
    r'\| <a id="ref-6"></a>6 \|.*?\n',
    '| <a id="ref-6"></a>6 | [南韓三星與 SK 海力士投資 800 兆韓元擴建 AI 晶片聚落](https://www.google.com/search?q=South+Korea+Samsung+SK+Hynix+800+trillion+won+chip+hub) | AI 硬體競爭擴大到記憶體產能、區域配置與供應鏈韌性 | 2026-06-29 | [AP](https://apnews.com/article/22352d95c7a821c5f4548b2d1a4ebde8) | 硬體或軟硬整合 |\n',
    report,
)
report = re.sub(
    r'\| <a id="ref-8"></a>8 \|.*?\n',
    '| <a id="ref-8"></a>8 | [Bank of England 金融政策委員會檢視系統性穩定幣監管進度](https://www.google.com/search?q=Bank+of+England+Financial+Policy+Committee+Record+July+2026+stablecoins) | 穩定幣監管由市場實驗走向支付基礎設施與金融穩定框架 | 2026-07-07 | [Bank of England](https://www.bankofengland.co.uk/financial-policy-committee-record/2026/july-2026) | 金融科技 |\n',
    report,
)
report = re.sub(r"\| \*未知時間（展期 2026-06-25.*?） \| \[香港01\]", "| 2026-07-08 | [香港01]", report)
report = re.sub(r"\| \*未知時間（事件 2026-07-10.*?） \| \[NOWnews 今日新聞\]", "| 2026-07-07 | [NOWnews 今日新聞]", report)
report = report.replace("[[6. 豐雲學堂]](#ref-6)", "[[6. AP]](#ref-6)")
report = report.replace("[[8. hipther]](#ref-8)", "[[8. Bank of England]](#ref-8)")

report_path.write_text(report)
source_path.write_text(source)

notes = head_text("docs/tech-report-research/weekly-tech-report-011/notes.md").rstrip() + """

--- 2026-07-11 Codex 來源查核與修正 ---

## 查核結果
- 來源 6：原豐雲學堂頁面實際更新於 2025-12-30，超出 15 天時間窗，且頁面不支持「SK 海力士 7/10 赴美上市募資 290 億美元」等摘要；改採 2026-06-29 AP 報導的南韓 800 兆韓元晶片聚落投資案。
- 來源 8：原 Hipther 頁面無法支持報告中的 8.9 兆美元交易量與 130 國 CBDC 數字；改採 2026-07-07 Bank of England Financial Policy Committee Record。
- 來源 13：香港01頁面可確認發布日期為 2026-07-08，移除 `*未知時間`。
- 來源 14：NOWnews 頁面可確認發布日期為 2026-07-07，移除 `*未知時間`。
- 來源 1：移除「7 月 9 日解除」的精確日期敘述，保留 CNBC 可支持的限制解除後公開發布脈絡。
- 亮點與趨勢分析：重寫硬體與金融科技段落，刪除無來源支撐的市場數字與因果推論。

## 交叉查核
- 來源 6 以 AP 報導核對投資總額、企業與四座記憶體晶圓廠範圍。
- 來源 8 以 Bank of England 官方委員會紀錄核對發布日及監管範圍。
- 來源 16 另以 City Labs 2026-07-07 官方新聞稿確認 BOHR 衛星、Transporter-17 與商用核動力衛星宣稱；報告沿用 TechNews 2026-07-10 報導日期。

## 最終驗證
- [x] 逐筆檢查 16 筆參考資料的網址、標題、日期與主要主張。
- [x] 替換 2 筆不合格來源，修正 2 筆可確認的發布日期。
- [x] 同步 research 與 `tech/2026-07-11/` 交付副本。
- [x] 執行引用、錨點、日期窗與交付同步驗證。
"""
notes = notes.rstrip() + "\n"
notes = notes.replace("作者欄位：Claude Code (Opus 4.8)", "作者欄位：Claude Code、Codex")
notes_path.write_text(notes)

plan = head_text("docs/tech-report-research/weekly-tech-report-011/task_plan.md")
plan = re.sub(r"- \[ \]", "- [x]", plan)
plan = plan.replace(
    "- 錯誤修正：中國官媒與社群來源依 source-priority 替換／刪除。",
    "- 錯誤修正：中國官媒與社群來源依 source-priority 替換／刪除；來源 6 窗外舊文與來源 8 未受支持數字已由 AP、Bank of England 來源替換，來源 13、14 發布日期已補正。",
)
plan = plan.replace("- 作者欄位：Claude Code (Opus 4.8)", "- 作者欄位：Claude Code、Codex")
plan_path.write_text(plan)

delivery_dir.mkdir(parents=True, exist_ok=True)
(delivery_dir / "2026-07-11 科技服務資訊週記.md").write_text(report)
(delivery_dir / "source.md").write_text(source)
(delivery_dir / "note.md").write_text(notes)
(delivery_dir / "task_plan.md").write_text(plan)

start = report.index("## 參考資料")
end = report.index("\n<a id=\"notes\"></a>", start)
(delivery_dir / "references.md").write_text(report[start:end].rstrip() + "\n")
PY

printf 'weekly-tech-report-011 audit updates applied\n'
