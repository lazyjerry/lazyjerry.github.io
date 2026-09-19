#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-021.sh"
VALIDATE="$ROOT/scripts/validate-weekly-tech-report-021.sh"

python3 - "$BUILD" "$VALIDATE" <<'PY'
from pathlib import Path
import re
import sys

build_path = Path(sys.argv[1])
validator_path = Path(sys.argv[2])
text = build_path.read_text()


def replace_once(old: str, new: str) -> None:
    global text
    if new in text:
        return
    count = text.count(old)
    if count != 1:
        raise SystemExit(f"expected one exact match, found {count}: {old[:90]!r}")
    text = text.replace(old, new, 1)


def replace_section(start: str, end: str, replacement: str) -> None:
    global text
    if replacement in text:
        return
    pattern = re.escape(start) + r".*?(?=" + re.escape(end) + r")"
    text, count = re.subn(pattern, replacement.rstrip() + "\n\n", text, count=1, flags=re.S)
    if count != 1:
        raise SystemExit(f"expected one section: {start!r}")


replace_once(
    "- Meta：`作者：Claude Code　報告日期：2026-09-19`",
    "- Meta：`作者：Claude Code、Codex　報告日期：2026-09-19`",
)
replace_once("初查時仅見", "初查時僅見")
replace_once(
    "| 2 | 蒐集來源並整理 source.md | 完成（候選 91 筆：正式 42 筆、淘汰 49 筆） |",
    "| 2 | 蒐集來源並整理 source.md | 完成（候選 93 筆：正式 42 筆、淘汰 51 筆） |",
)
replace_once(
    "| 9 | 複製交付物到 tech/2026-09-19/ | 完成 |",
    "| 9 | 複製交付物到 tech/2026-09-19/ | 完成 |\n| 10 | 第二輪逐筆來源查核與 12 分類補搜 | 完成（42 筆正式來源皆取得 HTTP 200；補搜 153 筆候選，替換 2 筆低權重來源） |",
)
replace_once(
    "- [x] 資訊權重：正式來源以官方公告（GitHub、Cloudflare、CISA、GitLab、NVIDIA、Anthropic、Google、Waymo、NASA、MIT News）與台灣權威媒體（中央社、科技新報、經濟日報）為主；ref-5、ref-22、ref-34、ref-35、ref-36、ref-38 權重壓低並在報告說明註明限制",
    "- [x] 資訊權重：正式來源以官方公告（GitHub、Cloudflare、CISA、GitLab、AEPD、NVIDIA、Anthropic、Google、Waymo、NASA、MIT News）與台灣權威媒體（中央社、iThome、科技新報、經濟日報）為主；ref-34、ref-35、ref-36、ref-38 權重壓低並在報告說明註明限制",
)
replace_once(
    "- [x] 錯誤修正狀態：OpenAI 案例細節出處、GitLab 受影響版本、Cisco ISE CVSS、台澎與澎金海纜時程四處非原頁內容已自摘要移除；American Banker 摘要超過 500 字已縮減；潮臺北展覽依系列活動規則改列淘汰",
    "- [x] 錯誤修正狀態：OpenAI 案例細節出處、Cisco ISE CVSS、台澎與澎金海纜時程三處非原頁內容已自摘要移除；GitLab 現行官方頁已可直接查得受影響版本與未驗證讀檔；微軟 7 月數字前後矛盾已移除比較；Suno 以現行頁面更新標題與時間",
)
replace_once(
    "| GitLab 受影響版本 | 出自 Rapid7 搜尋摘要，官方頁未載 | 自摘要移除 |",
    "| GitLab 受影響版本 | 初次查核時誤以為官方頁未載 | 第二輪重查已確認官方頁直接列出 |",
)

replace_once(
    "- 使用工具：Claude Code（Opus 5，1M context）",
    "- 使用工具：Claude Code（Opus 5，1M context）、Codex（第二輪稽核）",
)
replace_once(
    "本期全程由 Claude Code 執行，報告 Meta 寫 `作者：Claude Code`。前兩期的 `Claude Code、Codex` 是交付後由 Codex 稽核加入的第二作者，本期沒有這一步。",
    "初稿由 Claude Code 建置；Codex 於 2026-09-19 完成第二輪逐筆來源稽核、分類補搜、內文修正與交付驗證，報告 Meta 改為 `作者：Claude Code、Codex`。",
)
replace_once(
    "合計候選 91 筆，彙整後正式 42 筆、淘汰 49 筆（D 組的「潮臺北 × 潮首爾」由正式改為淘汰，理由見下）。",
    "初次蒐集候選 91 筆；第二輪補搜 12 分類共審視 153 筆 RSS 候選，新增 AEPD 與 iThome 兩筆後，合計候選 93 筆、正式 42 筆、淘汰 51 筆。原 ref-5 Google Cloud 與 ref-22 NVIDIA CUDA-Q 改列淘汰。",
)
replace_once(
    "- **WebFetch 的摘要模型會改寫時間詞與補出不存在的日期。** 中央社原文的「今天」被寫成「昨日」；Digital Music News 的「last year」被補成「November 2025」。日期與數字改以 curl 取原頁 HTML 的 JSON-LD（`datePublished`、`articleBody`）或 `article:published_time` 核對。",
    "- **WebFetch 摘要可能改寫時間詞，網頁內容也可能更新。** 中央社原文的「今天」曾被寫成「昨日」。Digital Music News 初查時僅見「last year」，第二輪現行頁面已明列「November 2025」並擴充標題，因此以最新原頁為準，並在筆記保留變動記錄。",
)
replace_once(
    "- ref-12 GitLab：受影響版本區間與「未經驗證即可讀檔」出自 Rapid7 的搜尋摘要，官方頁未載明，已自摘要移除；報告只寫官方頁上的 18 個問題、兩個 Critical 與 KEV 註記。",
    "- ref-12 GitLab：第二輪重查現行官方頁，確認頁面直接列出 CVE-2026-85706 可未經驗證讀取任意檔案、CVSS 10.0、各版本受影響區間與 KEV 狀態；原先將這些屬性寫成 Rapid7 搜尋摘要為初查錯誤，已更正。",
)
replace_once(
    "- ref-11 微軟：Office 漏洞數兩家媒體寫法不同（科技新報 111、SecurityWeek 222 含 Office 2016 的 111），摘要與報告都不寫 Office 數字。原標題「新紀綠」為原頁錯字，參考資料照錄。",
    "- ref-11 微軟：同一頁先寫 7 月為 569 個、後又寫 663 個，因此移除「多 71%」與舊紀錄比較。Office 漏洞數與 SecurityWeek 寫法也不同，摘要與報告均不寫 Office 數字。原標題「新紀綠」為原頁錯字，參考資料照錄。",
)
replace_once(
    "- ref-38 Suno：外洩時間原文只寫「last year」，不寫具體月份；起訴日原文只寫「closer to September's beginning」。",
    "- ref-38 Suno：第二輪查核時，現行 H1 與首段已明列「November 2025」外洩，標題也加入另一起 ADA 投訴；已更新原始標題與摘要。外洩與未告知仍是原告主張，尚未經法院認定。",
)
replace_once(
    "## 權重壓低而非排除\n\n- ref-5（Google Cloud 資料架構）權重 5：廠商論壇發言，69% 研究出處未載明；保留以維持 AI 分類的台灣媒體比例。\n- ref-22（CUDA-Q Logical）權重 5：成效數字為合作夥伴成果由 NVIDIA 轉述。",
    "## 權重壓低而非排除\n\n- ref-5（AEPD AI 代理攻擊個資外洩）權重 9：為西班牙資料保護機關的第一手公告，但事件資訊來自受影響組織的通報，仍待後續分析。\n- ref-22（晶創臺灣方案）權重 8：iThome 依行政院與國科會資料報導，計畫時程為 2024 至 2028 年，不把規畫寫成已建成。",
)
replace_once(
    "- 運輸物流：Waymo 同週有新加坡、東京、歐洲保險三則公告，採前兩則（官方與中央社各一），Allianz 保險合作列備援淘汰。",
    "- 運輸物流：Waymo 同週有新加坡、東京、歐洲保險三則公告，採前兩則（官方與中央社各一），Allianz 保險合作列備援淘汰。\n- 第二輪補搜：以 Google News RSS 依 12 分類取得 153 筆候選，逐筆排除跨期重複、活動預告、編輯評論與低技術密度內容。最後以 AEPD 官方個資外洩通報取代 Google Cloud 廠商論壇發言，並以 iThome 晶創臺灣硬體與 EDA 雙軌布局取代 NVIDIA CUDA-Q 廠商案例。\n\n## 第二輪逐筆查核（Codex，2026-09-19）\n\n- 42 筆正式來源皆以 curl 實際取得 HTTP 200，同時擷取最終 URL、H1、頁面標題與日期候選。\n- 修正 ref-11 頁內數字矛盾、ref-12 官方頁可查屬性、ref-38 現行頁面標題與時間，並縮限 GitHub、npm、龍科三期、Waymo 與高雄電影節的外推語氣。\n- 稽核用腳本 `scripts/audit-weekly-tech-report-sources.sh` 保留為下期可重複使用的逐筆 HTTP 與分類補搜工具。",
)

replace_section(
    "### 5. Google Cloud 籲企業重建資料架構，因應 AI 代理需求",
    "### 6. GitHub Actions",
    """### 5. AEPD 接獲首起由 AI 代理執行的個資外洩通報
- 原始標題：Primera notificación de una brecha de datos personales causada por un ataque ejecutado mediante un agente de IA
- 標題：AEPD 接獲首起由 AI 代理執行的個資外洩通報
- URL：https://www.aepd.es/prensa-y-comunicacion/blog/primera-notiviacion-brecha-datos-personales-causada-por-ataque-ejecutado-mediante-agente-ia
- 摘要：西班牙資料保護機關（AEPD）接獲首起個人資料外洩通報，通報指攻擊者使用一個搭載知名語言模型的 AI 代理。代理先在一般檔案中搜尋漏洞、正常登入系統，再自主尋找應用程式弱點，得以修改個資與存取發票。AEPD 強調，資訊來自受影響組織的通報，尚待分析；使用某模型也不代表模型或供應商基礎設施遭入侵。單一通報不能證明統計趨勢，但顯示 AI 代理已可將搜尋、登入、驗證與資料存取串成攻擊流程。
- 權重：9/10
- 發布日期：2026-09-14
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：AEPD 官方部落格原頁，日期標示 2026-09-14。事件細節是受影響組織的通報內容，官方明確說明尚待分析，報告不寫出未公開的模型或組織名稱。""",
)

replace_section(
    "### 22. NVIDIA 擴充開源 CUDA-Q 平台，推出 CUDA-Q Logical 支援容錯量子運算",
    "### 23. 央行：",
    """### 22. 晶創臺灣啟動半導體硬體與 EDA 軟體雙軌布局
- 原始標題：國科會晶創臺灣啟動半導體硬體、EDA軟體布局，將建置七大核心設施、打造自主設計平臺
- 標題：晶創臺灣啟動半導體硬體與 EDA 軟體雙軌布局
- URL：https://www.ithome.com.tw/news/178850
- 摘要：國科會與經濟部於 2024 至 2028 年推動「晶創臺灣方案」兩項布局。硬體面補助全臺 7 所半導體學院建置研發設備，由國研院半導體中心整合單一入口，並規畫原子級製程驗證線與先進半導體試量產線。軟體面聚焦異質整合、先進封裝與系統層級 EDA 工具，由學界研發關鍵工具、工研院建構智慧化雲端平臺，以混合雲提供 EDA as a Service，降低新創與中小型 IC 設計業者的工具門檻。
- 權重：8/10
- 發布日期：2026-09-10
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：iThome 原頁，作者蘇文彬，頁面標示 2026-09-10，圖片來源為行政院。內文描述的是 2024 至 2028 年建設與研發計畫，報告使用「將建置」與「規畫」，不寫成已完成。""",
)

replace_once(
    "微軟 9 月 Patch Tuesday 一次修補 974 個漏洞，比 7 月創下的 569 個舊紀錄多出 71%。其中 Windows 占",
    "微軟 9 月 Patch Tuesday 一次修補 974 個漏洞。其中 Windows 占",
)
replace_once(
    "Office 數字兩家寫法不一致（technews 寫 Office/Office 2016 共 111；SecurityWeek 寫 Office 222 個、其中 Office 2016 111 個），摘要刻意不寫 Office 數字。原標題「紀綠」為原頁錯字，照錄。",
    "原頁對 7 月漏洞數先寫 569、後又寫 663，「多 71%」無法與內文一致，因此不採用該比較。Office 數字兩家寫法不一致（technews 寫 Office/Office 2016 共 111；SecurityWeek 寫 Office 222 個、其中 Office 2016 111 個），摘要不寫 Office 數字。原標題「紀綠」為原頁錯字，照錄。",
)
replace_once(
    "官方頁 WebFetch 取得 18 個 CVE 清單與日期。「未經驗證讀取任意檔案」與受影響版本區間出自 Rapid7 部落格（搜尋摘要），官方頁只寫版本自 12.3 起依漏洞而異；如果正文只想引用官方，就刪掉最後一句。iThome 有中文報導（https://www.ithome.com.tw/news/178892），但 WebFetch 回 403 未能核對全文。dedup 中的 CISA 2026-09-10 KEV 是 MikroTik，不是這件事。",
    "官方頁取得 18 個 CVE 清單與日期。第二輪以 curl 重查現行官方頁，頁面已直接列出 CVE-2026-85706 可未經驗證讀取任意檔案、CVSS 10.0，以及 18.7 至 19.1.8 前、18.8 至 19.2.6 前、18.9 至 19.3.2 前的受影響區間。iThome 中文報導僅作交叉檢查。dedup 中的 CISA 2026-09-10 KEV 是 MikroTik，不是這件事。",
)

replace_once(
    "- 原始標題：Suno Faces Yet Another Data Breach Class Action Lawsuit",
    "- 原始標題：Suno Faces Yet Another Class Action Lawsuit Over Alleged November 2025 Data Breach — Plus a Separate Complaint for Allegedly Violating the Americans with Disabilities Act",
)
replace_once(
    "指控有攻擊者去年取得約 5500 萬個 Suno 帳號的個人資料",
    "指控有攻擊者在 2025 年 11 月取得約 5500 萬個 Suno 帳號的個人資料",
)
replace_once(
    "curl 取原頁 meta（article:published_time 2026-09-17T21:45:50Z），外洩時間原文只寫「last year」。WebFetch 摘要自行寫成「November 2025」，但原文沒有，不採用。起訴日原文只寫「closer to September's beginning」，可能落在窗外，窗內的是本篇報導。",
    "curl 取原頁 meta（article:published_time 2026-09-17T21:45:50Z）。第二輪查核時，現行 H1 與首段已直接寫出「November 2025」，並新增 ADA 投訴的標題後半；以現行原頁為準更新。起訴日只寫「closer to September's beginning」，可能落在窗外，窗內的是本篇報導。",
)

discarded = """

### AX. Google Cloud 籲企業重建資料架構，因應 AI 代理需求
- URL：https://www.cna.com.tw/news/ait/202609170251.aspx
- 發布日期：2026-09-17
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：廠商論壇發言，文中 69% 研究未標示出處；第二輪補搜後，改用 AEPD 官方公告的實際 AI 代理資安事件。

### AY. NVIDIA Expands Open Source CUDA-Q Platform for Fault-Tolerant Quantum Computing
- URL：https://nvidianews.nvidia.com/news/nvidia-expands-open-source-cuda-q-platform-for-fault-tolerant-quantum-computing
- 發布日期：2026-09-14
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：成效數字為 NVIDIA 轉述合作夥伴成果；第二輪補搜後，改用 iThome 對臺灣半導體硬體與 EDA 建設的報導。
"""
if "### AX. Google Cloud" not in text:
    marker = "- 淘汰原因：依 `window-overlap-dedup.md`，2026-09-05 期已引用同一音樂節「潮台北」底下的科技音樂互動展（中央社 8/27），大型系列活動不再引用同系列其他場次；且主辦單位含 TVBS，屬媒體報導自家活動。\nEOF"
    replacement = marker[:-4] + discarded + "EOF"
    replace_once(marker, replacement)

replace_once(
    "**作者：Claude Code　報告日期：2026-09-19**",
    "**作者：Claude Code、Codex　報告日期：2026-09-19**",
)
replace_once(
    "工程端的預設值跟著收緊：GitHub 將對公開儲存庫停用 pull_request_target [[6. GitHub]](#ref-6)，npm 讓自動化只能暫存發布、交人工 2FA 放行 [[7. GitHub]](#ref-7)。",
    "工程端的預設值跟著收緊：GitHub 將對未設定相符事件政策的公開儲存庫預設停用 pull_request_target [[6. GitHub]](#ref-6)，npm 新增 stage-only 權杖，讓團隊可選擇把公開發布交給人工 2FA 核准 [[7. GitHub]](#ref-7)。",
)
replace_once(
    "- **Google Cloud 主張代理不該硬塞進舊資料平台。** Google Cloud 資料庫客戶工程總監 Anna Coniglio 以「在手排車駕駛座硬塞一個機器人」比喻現況，提出知識層、代理優先體驗與 AI 原生無邊界資料湖倉三個架構方向 [[5. 中央社]](#ref-5)。這是廠商論壇發言，文中「69% 企業計劃 2 年內廣泛部署代理」的研究出處原頁未載明。可以帶走的是「知識層」這個需求：代理要查得準，得先有業務語意與權限模型，這件事在資料工程端要提早排進規格，不能等代理上線後才補。",
    "- **AEPD 接獲首起由 AI 代理執行的個資外洩通報。** 通報指攻擊者使用搭載知名語言模型的代理，先搜尋一般檔案中的漏洞並正常登入，再自主尋找應用程式弱點，最後修改個資與存取發票 [[5. AEPD]](#ref-5)。AEPD 明確說明，資訊來自受影響組織通報，尚待分析；使用某模型也不代表模型或供應商基礎設施遭入侵。單一事件不能證明趨勢，卻已顯示代理可把搜尋、登入、驗證與資料存取串成攻擊流程。",
)
replace_once(
    "- **npm 讓 CI 只能交件，真正發布要維護者按 2FA。**",
    "- **npm 新增只能暫存發布的 CI 權杖，真正公開要維護者按 2FA。**",
)
replace_once(
    "- **公開儲存庫的 pull_request_target 將預設停用，11 月 2 日起強制。**",
    "- **未設定相符事件政策的公開儲存庫，pull_request_target 將預設停用。**",
)
replace_once(
    "- **微軟單月修補 974 個漏洞，比 7 月的紀錄多出 71%。** 9 月 Patch Tuesday 中 Windows 占",
    "- **微軟 9 月例行更新修補 974 個漏洞。** 9 月 Patch Tuesday 中 Windows 占",
)
replace_once(
    "路徑穿越讀得到的是設定檔與金鑰，所以升版只是第一步，可能已被讀走的 secrets 與 runner token 都要輪替。",
    "這類任意檔案讀取可能暴露設定檔、金鑰或其他機敏檔案，所以升版只是第一步，可能已外洩的 secrets 與 runner token 也要輪替。",
)
replace_once(
    "對軟體端的意義是，新的先進製程產能要到 2030 年前後才落地，未來幾年的算力供給仍受既有產能限制。",
    "這座園區的新增產能要到 2030 年前後才可能落地，無法立即改變先進製程供給。",
)
replace_once(
    "- **量子應用開發走上 GPU 那條「開源 SDK 加模擬器」的路。** NVIDIA 推出 CUDA-Q Logical，以程式化、可驗證的方式設計與測試容錯量子電腦上的應用，已在 GitHub 釋出 [[22. NVIDIA]](#ref-22)。NVIDIA 轉述的合作夥伴成果包括：Fermilab 把容錯架構開發時間從五個月縮短到三週；Iceberg Quantum 與 Diraq 展示以 15 萬個實體量子位元做出 1,000 個邏輯量子位元。Sandia National Laboratories 另建立不綁定硬體的基準測試 QUOPS。這些數字由廠商轉述，但工具鏈已經開源，想碰量子演算法的工程師可以先在 GPU 模擬器上動手。",
    "- **晶創臺灣同時補半導體試量產與 EDA 工具兩個斷點。** 政府規畫補助全臺 7 所半導體學院建置研發設備，由國研院整合單一入口，並建構原子級製程驗證線與先進半導體試量產線 [[22. iThome]](#ref-22)。軟體面則聚焦異質整合、先進封裝與系統層級 EDA，由學界研發關鍵工具、工研院建構混合雲 EDA as a Service。這是 2024 至 2028 年的建設計畫，重點是讓新創與中小型 IC 設計業者可用共用設施與雲端工具驗證產品。",
)
replace_once(
    "**選模型的問題正在變成選執行環境的問題。** 支出與採用率兩套指標給出不同的領先者 [[4. 科技新報]](#ref-4)，Gemini 3.8 Live 把背景任務做進語音模型 [[3. Google]](#ref-3)，Google Cloud 則把重點放在給代理用的知識層 [[5. 中央社]](#ref-5)。這幾則放在一起看，差異化正在從模型分數往外移，移到代理能接到什麼資料、在什麼權限下執行、每完成一件事要花多少錢。",
    "**代理能力的差異，逐漸從模型分數移到執行環境。** 支出與採用率兩套指標給出不同的領先者 [[4. 科技新報]](#ref-4)，Gemini 3.8 Live 把背景任務做進語音模型 [[3. Google]](#ref-3)，AEPD 的通報則顯示代理已能自主串接多步攻擊 [[5. AEPD]](#ref-5)。評估焦點因此不只是模型分數，還包括代理能接到什麼資料、可以使用哪些工具、在什麼權限下執行，以及每完成一件事的成本。",
)
replace_once(
    "**CI/CD 的預設值在收緊，而且每一項都附上強制日期。** 公開儲存庫的 pull_request_target 於 11 月 2 日起預設停用",
    "**CI/CD 的預設值在收緊，而且每一項都附上強制日期。** 未設定相符事件政策的公開儲存庫，pull_request_target 於 11 月 2 日起預設停用",
)
replace_once(
    "**算力的進步有一大塊來自軟體，產能則要等到 2030 年前後。** MLPerf 上同代硬體靠軟體最佳化就快了 1.6 倍 [[19. NVIDIA]](#ref-19)，量子運算也走向開源 SDK 加 GPU 模擬器的開發模式 [[22. NVIDIA]](#ref-22)；另一方面，龍科三期的埃米廠第一座約在 2030 年前後完工 [[21. 科技新報]](#ref-21)。短期內要多榨出效能，推論堆疊的版本管理和換硬體一樣值得投資。",
    "**半導體效能、驗證與設計工具同時往前推。** MLPerf 上同代硬體靠軟體最佳化就快了 1.6 倍 [[19. NVIDIA]](#ref-19)；晶創臺灣則把原子級製程驗證線、試量產與雲端 EDA 工具鏈放在同一個計畫 [[22. iThome]](#ref-22)。龍科三期新增產能最快也要到 2030 年前後 [[21. 科技新報]](#ref-21)。短期內的工程焦點是用軟體榨出現有硬體效能，並降低新製程的設計與驗證門檻。",
)
replace_once(
    "**自駕出海的模式是分層合作加上兩年左右的在地化期。** Waymo 在新加坡的時程是先來車隊、2027 年在地適配、2028 年商轉 [[29. Waymo]](#ref-29)，在東京則交由日本交通維運、透過 GO 派車 [[30. 中央社]](#ref-30)。核心駕駛系統自己掌握，其餘交給在地夥伴，結構很像 SaaS 透過經銷與整合商進入新市場。",
    "**Waymo 的新加坡計畫採分層合作，並預留約兩年在地化期。** 計畫是先導入車隊、2027 年在地適配、2028 年商轉 [[29. Waymo]](#ref-29)；東京案則交由日本交通維運、透過 GO 派車 [[30. 中央社]](#ref-30)。兩案都把核心駕駛系統留在 Waymo，再交由在地夥伴負責車隊、派車與法規適配；但兩個市場的時程與分工不應外推為所有自駕出海案的固定模式。",
)
replace_once(
    "**影視製作工具已經常態化，AI 平台的營運風險則開始浮上檯面。** 高雄電影節同時開設 LED 虛擬棚與 AI 影像單元 [[37. 中央社]](#ref-37)，代表這兩種製作方式都已累積足夠作品撐起一個單元。",
    "**LED 虛擬棚與 AI 影像已累積一批實際作品，AI 平台的營運風險也浮上檯面。** 高雄電影節公布 7 部 LED 虛擬棚作品與 7 部 AI 影片 [[37. 中央社]](#ref-37)，證明兩種工具均已有足以組成影展單元的案例，但單一影展片單不足以證明業界已全面常態化。",
)
replace_once(
    "原告指攻擊者去年取得約 5500 萬個帳號的個人資料",
    "原告指攻擊者在 2025 年 11 月取得約 5,500 萬個帳號的個人資料",
)

replace_once(
    "| <a id=\"ref-5\"></a>5 | [Google Cloud 籲企業重建資料架構　因應 AI 代理需求](https://www.google.com/search?q=Google+Cloud+柯尼格利歐+知識層+AI代理+資料架構+中央社) | 主張以知識層、代理優先體驗與無邊界資料湖倉重建資料平台。 | 2026-09-17 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609170251.aspx) | AI 科技 |",
    "| <a id=\"ref-5\"></a>5 | [Primera notificación de una brecha de datos personales causada por un ataque ejecutado mediante un agente de IA](https://www.google.com/search?q=AEPD+primera+notificaci%C3%B3n+brecha+datos+agente+IA) | AEPD 接獲首起由 AI 代理執行的個資外洩通報，事件尚待後續分析。 | 2026-09-14 | [AEPD](https://www.aepd.es/prensa-y-comunicacion/blog/primera-notiviacion-brecha-datos-personales-causada-por-ataque-ejecutado-mediante-agente-ia) | AI 科技 |",
)
replace_once(
    "| <a id=\"ref-6\"></a>6 | [Workflow execution protections in GitHub Actions generally available](https://www.google.com/search?q=GitHub+Actions+workflow+execution+protections+pull_request_target+default) | 公開儲存庫預設停用 pull_request_target，2026 年 11 月 2 日起強制。 |",
    "| <a id=\"ref-6\"></a>6 | [Workflow execution protections in GitHub Actions generally available](https://www.google.com/search?q=GitHub+Actions+workflow+execution+protections+pull_request_target+default) | 未設定相符事件政策的公開儲存庫預設停用 pull_request_target，2026 年 11 月 2 日起強制。 |",
)
replace_once(
    "| <a id=\"ref-7\"></a>7 | [Stage-only npm tokens for safer automation](https://www.google.com/search?q=npm+stage-only+tokens+stage+publish+2FA) | 自動化只能暫存發布，交由維護者以 2FA 審核後公開。 |",
    "| <a id=\"ref-7\"></a>7 | [Stage-only npm tokens for safer automation](https://www.google.com/search?q=npm+stage-only+tokens+stage+publish+2FA) | 新增選用的 stage-only 權杖，可讓自動化只暫存版本、交由維護者以 2FA 公開。 |",
)
replace_once(
    "| <a id=\"ref-22\"></a>22 | [NVIDIA Expands Open Source CUDA-Q Platform for Fault-Tolerant Quantum Computing](https://www.google.com/search?q=NVIDIA+CUDA-Q+Logical+fault-tolerant+quantum) | CUDA-Q Logical 開源釋出，支援設計與測試容錯量子應用。 | 2026-09-14 | [NVIDIA Newsroom](https://nvidianews.nvidia.com/news/nvidia-expands-open-source-cuda-q-platform-for-fault-tolerant-quantum-computing) | 硬體或軟硬整合 |",
    "| <a id=\"ref-22\"></a>22 | [國科會晶創臺灣啟動半導體硬體、EDA軟體布局，將建置七大核心設施、打造自主設計平臺](https://www.google.com/search?q=晶創臺灣+半導體+七大核心設施+EDA軟體+iThome) | 將建置研發、製程驗證與試量產設施，並發展自主 EDA 工具鏈與雲端服務。 | 2026-09-10 | [iThome](https://www.ithome.com.tw/news/178850) | 硬體或軟硬整合 |",
)
replace_once(
    "| <a id=\"ref-38\"></a>38 | [Suno Faces Yet Another Data Breach Class Action Lawsuit](https://www.google.com/search?q=Suno+data+breach+class+action+55+million+accounts) | 原告指約 5500 萬帳號個資外洩，事件由 Have I Been Pwned 發現。 |",
    "| <a id=\"ref-38\"></a>38 | [Suno Faces Yet Another Class Action Lawsuit Over Alleged November 2025 Data Breach — Plus a Separate Complaint for Allegedly Violating the Americans with Disabilities Act](https://www.google.com/search?q=Suno+November+2025+data+breach+class+action+55+million+accounts) | 原告指 2025 年 11 月約 5,500 萬帳號個資外洩，事件由 Have I Been Pwned 發現。 |",
)
replace_once(
    "本期共蒐集候選來源 91 筆，採用 42 筆為正式參考資料、淘汰 49 筆",
    "本期共蒐集候選來源 93 筆，採用 42 筆為正式參考資料、淘汰 51 筆",
)
replace_once(
    "Cloudflare 的前端惡意腳本偵測成效 [[14. Cloudflare]](#ref-14)、NVIDIA 的 MLPerf 倍數與 CUDA-Q 合作夥伴成果 [[19. NVIDIA]](#ref-19) [[22. NVIDIA]](#ref-22)、Waymo",
    "Cloudflare 的前端惡意腳本偵測成效 [[14. Cloudflare]](#ref-14)、NVIDIA 的 MLPerf 倍數 [[19. NVIDIA]](#ref-19)、Waymo",
)
replace_once(
    "；工總白皮書為政策倡議 [[34. 科技新報]](#ref-34)；Google Cloud 引述的 69% 研究原頁未載明出處 [[5. 中央社]](#ref-5)。",
    "；工總白皮書為政策倡議 [[34. 科技新報]](#ref-34)。",
)
replace_once(
    "- **原頁未提供的數據一律不補。** 微軟 Office 產品的漏洞數在不同媒體寫法不一，本報告不引用 [[11. 科技新報]](#ref-11)；",
    "- **原頁內部矛盾或未提供的數據一律不補。** 微軟報導對 7 月漏洞數前後寫成 569 與 663，Office 數字在不同媒體也不一致，本報告均不引用 [[11. 科技新報]](#ref-11)；",
)

build_path.write_text(text)

validator = validator_path.read_text()
validator = validator.replace('assert_count 49 "$reject_sources" "淘汰來源數"', 'assert_count 51 "$reject_sources" "淘汰來源數"')
validator = validator.replace("grep -q '^\\*\\*作者：Claude Code　報告日期：2026-09-19\\*\\*$'", "grep -q '^\\*\\*作者：Claude Code、Codex　報告日期：2026-09-19\\*\\*$'")
validator = validator.replace("驗證通過（正式來源 42、淘汰 49、", "驗證通過（正式來源 42、淘汰 51、")
validator_path.write_text(validator)
PY

sh "$BUILD"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-021 2026-09-19
sh "$VALIDATE"
