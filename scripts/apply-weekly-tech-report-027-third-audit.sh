#!/bin/sh
# weekly-tech-report-027 第三輪查核（audit-tech-weekly-report）：
# 以斷言式替換修改 canonical build script，再 build → deliver → validate。可重複執行。

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-027.sh"
VALIDATE="$ROOT/scripts/validate-weekly-tech-report-027.sh"

python3 - "$BUILD" "$VALIDATE" <<'PY'
import sys
from pathlib import Path

build_path = Path(sys.argv[1])
validate_path = Path(sys.argv[2])
build = build_path.read_text(encoding="utf-8")
validate = validate_path.read_text(encoding="utf-8")


def replace(text: str, old: str, new: str, label: str, count: int = 1) -> str:
    """新字串已在則視為已套用；新字串不含舊字串卻兩者並存時報錯（避免刪除型替換被誤判已套用）。"""
    if new in text:
        if old in new or old not in text:
            return text
        raise SystemExit(f"{label}: new and old anchors both present")
    n_old = text.count(old)
    if n_old == count:
        return text.replace(old, new)
    raise SystemExit(f"{label}: expected {count} old anchor(s), found {n_old}")


# ---------- 四組逐句稽核修正 ----------
fixes = [
    # ref-1 初期定價
    ("定價沿用 Argon：每百萬輸入", "定價沿用 Argon 的初期定價：每百萬輸入", "ref-1 source", 1),
    ("定價沿用 Argon，每百萬輸入", "定價沿用 Argon 的初期定價，每百萬輸入", "ref-1 report", 1),
    # ref-3 第三方基準由 Mistral 轉述
    ("GPT-6.1 Terra 的測試為 OpenAI 公布 [[2. iThome]](#ref-2)；Mistral Large 4 的基準 [[3. Mistral AI]](#ref-3)、Copilot Fusion",
     "GPT-6.1 Terra 的測試為 OpenAI 公布 [[2. iThome]](#ref-2)；Mistral Large 4 引用的 Artificial Analysis 與 Cognition 分數屬第三方基準、由 Mistral 轉述 [[3. Mistral AI]](#ref-3)；Copilot Fusion",
     "ref-3 limitations", 1),
    # ref-4 sometimes、條件、60% 不寫成因果
    ("真實的代理本來就會有傾向", "真實的代理有時也會有傾向", "ref-4 sometimes", 2),
    ("代理未被要求表達偏好時，影響可能較小", "代理未被給予明確偏好與表達指示時，影響可能較小", "ref-4 condition", 2),
    ("事前已有偏好時，代理不同意會讓 60% 改變立場，代理同意時只有 6%（僅 38 例",
     "事前已有偏好時，代理不同意時有 60% 改變立場，代理同意時只有 6%（僅 38 例",
     "ref-4 report 60%", 1),
    # ref-5 預計
    ("TAIDE 年底前公布含語言模型、行為模型的新模型並開放民間使用",
     "TAIDE 預計年底前公布含語言模型、行為模型的新模型並開放民間使用", "ref-5 source title", 2),
    ("TAIDE 年底前公布含語言模型與行為模型的新模型並開放民間使用",
     "TAIDE 預計年底前公布含語言模型與行為模型的新模型並開放民間使用", "ref-5 reference row", 1),
    # ref-7 GitHub Enterprise 與 Copilot 方案
    ("Max。Enterprise 客戶可不另購", "Max。GitHub Enterprise 客戶可不另購", "ref-7 GitHub Enterprise", 2),
    ("現有 Business 與 Enterprise 客戶可維持既有方案", "現有 Copilot Business 與 Copilot Enterprise 客戶可維持既有方案", "ref-7 Copilot plans", 2),
    # ref-10 多餘空格
    ("例如 特定寫法下 PowerShell hook", "例如特定寫法下 PowerShell hook", "ref-10 source space", 1),
    ("另修正 特定寫法下 PowerShell hook", "另修正特定寫法下 PowerShell hook", "ref-10 report space", 1),
    # ref-11 將改用
    ("JetBrains 旗下 IDE 自 2026.3 版起，在重新設計的終端機中改用",
     "JetBrains 旗下 IDE 自 2026.3 版起將在重新設計的終端機中改用", "ref-11 source", 1),
    ("JetBrains IDE 自 2026.3 版起，在重新設計的終端機中改用",
     "JetBrains IDE 自 2026.3 版起將在重新設計的終端機中改用", "ref-11 report", 1),
    # ref-16 聲明內容是 iThome 引述的段落
    ("聲明本身的描述為「部分宅配訂單顧客」", "iThome 引述的聲明段落只寫「部分宅配訂單顧客」，未提人數", "ref-16 note", 1),
    ("2 萬人是媒體報導的數字，公司聲明沒有寫人數。", "2 萬人是媒體報導的數字，iThome 引述的聲明段落沒有寫人數。", "ref-16 report", 1),
    ("公司聲明只寫「部分宅配訂單顧客」", "iThome 引述的聲明內容只寫「部分宅配訂單顧客」", "ref-16 limitations", 1),
    # ref-17 many、enable
    ("多數既有 App 可直接使用", "許多既有 App 可直接使用", "ref-17 many", 2),
    ("；想做專為觸控設計的體驗，要用更新後的手勢 API。", "；更新後的手勢 API 讓開發者能打造專為觸控設計的體驗。", "ref-17 trend", 1),
    # ref-19 lead customer；趨勢段的 AMD 子句移到新的 Meta 條目
    ("第 6 代 EPYC 的主要客戶", "第 6 代 EPYC 的首批主要客戶（lead customer）", "ref-19 lead customer", 1),
    ("進駐 OCI [[26. iThome]](#ref-26)；AMD 則把 Helios 機櫃裝進 Meta [[19. AMD]](#ref-19)。",
     "進駐 OCI [[26. iThome]](#ref-26)。", "ref-19 trend", 1),
    # ref-20 expected；ref-20、ref-21 備註
    ("涵蓋現有與未來 Xeon 平臺", "預期涵蓋現有與未來 Xeon 平臺", "ref-20 expected", 1),
    ("稽核時以瀏覽器 UA 重抓回 403，以蒐集時的副本為準。",
     "稽核時以瀏覽器 UA 重抓回 403；第二輪起改用 curl 預設 UA 重抓為 HTTP 200，正文與 newsroom_date 與蒐集時副本一致。",
     "ref-20/21 note", 2),
    # ref-28 秘書長身分
    ("頁面註明為個人立場，不必然代表 FSB 或其成員", "頁面註明為講者以秘書長身分的看法，不必然代表 FSB 或其成員", "ref-28 role", 2),
    ("內容為個人演講，頁面聲明不必然代表 FSB。", "頁面聲明演講內容為講者以秘書長身分的看法，不必然代表 FSB 或其成員。", "ref-28 note", 1),
    # ref-31 CE 承認範圍
    ("已有 CE 標示的醫材（含作為醫材的軟體），可以繼續用它進入大不列顛市場",
     "已有 CE 標示的醫材與 IVD，可以繼續用它進入大不列顛市場", "ref-31 report", 1),
    # ref-33 sought to、would likely
    ("川普政府已著手減輕健康 AI 開發商的法規負擔", "川普政府尋求減輕健康 AI 開發商的法規負擔", "ref-33 sought to", 2),
    ("各州管理醫療執業與醫師執照，若 AI 在無人監督下執行這類工作，可能會讓產品落入",
     "各州管理醫療執業，並核發醫師與其他臨床人員的執照，若 AI 在無人監督下執行這類工作，很可能會讓產品落入",
     "ref-33 source licenses", 1),
    ("但各州管理醫療執業與醫師執照，若 AI 在無人監督下執行開立處方這類臨床工作，產品可能落入",
     "但各州管理醫療執業，並核發醫師與其他臨床人員的執照，若 AI 在無人監督下執行開立處方這類臨床工作，產品很可能落入",
     "ref-33 report licenses", 1),
    # ref-42 公司新聞稿說法
    ("；2025 年以來客戶量成長超過一倍，客戶包含 Sundt Construction 與 Zachry Construction，且機器已在進行中的工地執行付費工作",
     "；公司並稱 2025 年以來客戶量成長超過一倍，客戶包含 Sundt Construction 與 Zachry Construction，並強調機器已在進行中的工地執行付費工作",
     "ref-42 source attribution", 1),
    # ref-43 MIT News 的敘述、could
    ("研究者認為此法適合可平板運送、快速架設的災後避難所，也可用於",
     "MIT News 指此法可能特別適合可平板運送、快速架設的災後避難所，也可用於", "ref-43 source", 1),
    ("研究者認為此法適合可平板運送、快速架設的災後避難所，下一步希望",
     "MIT News 指此法可能特別適合可平板運送、快速架設的災後避難所，研究者下一步希望", "ref-43 report", 1),
    # ref-48 開展日、修飾關係
    ("**北美館坂本龍一回顧展開幕，裝置作品把電磁波與降雨資料轉成聲音和影像。**",
     "**北美館坂本龍一回顧展 10 月 31 日開展，裝置作品把電磁波與降雨資料轉成聲音和影像。**", "ref-48 heading", 1),
    ("「水的樣態 1」擷取包含台北的氣象衛星降雨量資訊；", "「水的樣態 1」擷取包含台北氣象衛星在內的降雨量資訊；", "ref-48 word order", 1),
    # ref-49 動土典禮將排定
    ("預期近期舉行動土", "動土典禮將於近期排定", "ref-49 groundbreaking", 2),
    # ref-52 throughout much of 2026
    ("雙方說法是 2026 年來一直在談證人與文件提供", "依雙方說法，2026 年大部分時間都在來回協商證人與文件提供", "ref-52 source", 1),
    # ref-55 we owe it to、likely
    ("Isaacman 表示，若有創新且符合成本效益的方式可延長在軌資產壽命，值得探索",
     "Isaacman 表示，若有創新且符合成本效益的方式可延長在軌資產壽命，NASA 有責任為美國納稅人與科學界探索", "ref-55 source quote", 1),
    ("Isaacman 表示，若有創新且符合成本效益的方式延長在軌資產壽命，值得探索",
     "Isaacman 表示，若有創新且符合成本效益的方式延長在軌資產壽命，NASA 有責任為納稅人與科學界探索", "ref-55 report quote", 1),
    ("分析預測約在 2033 至 2034 年間再入大氣層", "分析預測哈伯可能在 2033 至 2034 年間再入大氣層", "ref-55 likely", 2),
]

for old, new, label, count in fixes:
    build = replace(build, old, new, label, count)

# ---------- 字數精簡（補限定詞後超過 500 字，只刪不補） ----------
build = replace(
    build,
    "端到端的軟體交付系統。產品面包括 GitHub Copilot app；Copilot Fusion",
    "端到端的軟體交付系統。Copilot Fusion",
    "ref-7 source length", 1,
)

# ---------- 補搜新增：ref-58 至 ref-61 ----------
new_sources = """
### 58. Google DeepMind 發表世界模型 Genie 4，可即時互動模擬並產生原生音訊，先開放受信任測試者
- 原始標題：We’re announcing Genie 4, our new world model for real-time interactive simulation.
- 標題：Google DeepMind 發表世界模型 Genie 4，可即時互動模擬並產生原生音訊，先開放受信任測試者
- URL：https://blog.google/innovation-and-ai/models-and-research/google-deepmind/introducing-genie-4/
- 摘要：Google 於 10 月 27 日公布世界模型 Genie 4 的研究成果，稱它為即時互動模擬帶來前所未有的擬真度與原生音訊。Genie 4 承接 Gemini 系列的能力：Gemini Omni 讓模擬貼近真實世界的外觀與行為，其他 Gemini 模型提供維持模擬連貫性與連續性所需的推理。使用者可設定事件並以自然語言即時操控場景，例如移動鏡頭、改變天氣或加入新角色；每個世界也會即時產生原生音訊，包括環境音、音樂與可互動的對話。Google 表示，模擬世界是通往 AGI 的關鍵一步，可為機器人與代理提供安全的訓練環境，並擴充影視、新聞、遊戲與製造等產業的創作工具。Genie 4 已開始向一小群受信任測試者推出，即將透過 Project Genie 提供給 Google AI Ultra 訂閱者，並讓早期合作夥伴透過 Gemini API 與 AI Studio 使用。
- 權重：9/10
- 發布日期：2026-10-27
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：第三輪補搜新增。curl HTTP 200，存檔 pages/ref-58.html；日期依 JSON-LD datePublished「2026-10-27T16:00:00+00:00」與頁面日期列「Oct 27, 2026」。grep 核對：Genie 4、Gemini Omni、trusted testers、Project Genie、Google AI Ultra、AI Studio、AGI、native audio。原頁沒有定價、基準測試與確切開放日期（grep pricing、benchmark 皆無）；deepmind.google 同事件頁未採其文字，二手媒體的「首個」說法不採。

### 59. CISA 將 PHP2Shell 兩個漏洞列入已知遭利用漏洞目錄，聯邦民間機關須依 BOD 26-04 優先修補
- 原始標題：CISA Adds Two Known Exploited Vulnerabilities to Catalog
- 標題：CISA 將 PHP2Shell 兩個漏洞列入已知遭利用漏洞目錄，聯邦民間機關須依 BOD 26-04 優先修補
- URL：https://www.cisa.gov/news-events/alerts/2026/10/26/cisa-adds-two-known-exploited-vulnerabilities-catalog
- 摘要：CISA 於 10 月 26 日公告，把 PHP 記憶體損毀漏洞 CVE-2026-109618 與 PHP 過期內部請求狀態漏洞 CVE-2026-109619 加入已知遭利用漏洞（KEV）目錄，並同步更新 PHP 警示。公告引用約束性營運指令 BOD 26-04，說明聯邦民間行政機關須優先快速修補 KEV 目錄中、位於公開暴露資產且遭利用後可完全控制資產的高風險漏洞，並訂出機關何時須檢查系統在修補前是否已被入侵；BOD 26-04 只適用聯邦民間行政機關，但 CISA 鼓勵所有組織採用風險導向的漏洞管理。更新後的警示寫明，這兩個俗稱 php2shell 的漏洞可讓未經驗證者遠端執行程式碼，影響所有處理網頁請求的 PHP，包括 Apache mod_php、PHP-FPM、php-cgi、FrankenPHP 與 LiteSpeed，應立即升級到 PHP 8.5.12、8.4.27、8.3.36 或 8.2.35；無法立即更新或仍用 PHP 8.1 以前不受支援版本者，應先讓相關系統離線。
- 權重：9/10
- 發布日期：2026-10-26
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：第三輪補搜新增。curl HTTP 200，存檔 pages/ref-59.html；日期依頁面「Release Date October 26, 2026」與 `<time datetime="2026-10-26T12:00:00Z">`。grep 核對：CVE-2026-109618、CVE-2026-109619、BOD 26-04、Known Exploited Vulnerabilities、FCEB、risk-based。PHP 警示頁（https://www.cisa.gov/news-events/alerts/2026/10/21/critical-vulnerabilities-php-require-immediate-patching ，Last Revised October 26, 2026）另核 php2shell、mod_php、FrankenPHP、8.5.12、8.2.35、offline。屬 PHP2Shell 事件（2026-10-24 期 ref-12、ref-13）的官方新進展；鉅亨網稱「緊急指令」不準，原頁是 KEV 納入與 BOD 26-04。兩頁都沒有寫聯邦修補期限，KEV 目錄與媒體的 10 月 29 日不採。

### 60. NVIDIA 與 Meta 擴大 Muse 合作，Meta 打算擴大部署 Vera Rubin 與 Vera CPU，NVIDIA 將投資 30 億美元於 Meta 股票發行
- 原始標題：NVIDIA and Meta to Expand Collaboration on Muse and Muse Family of Models Amid Robust Growth
- 標題：NVIDIA 與 Meta 擴大 Muse 合作，Meta 打算擴大部署 Vera Rubin 與 Vera CPU，NVIDIA 將投資 30 億美元於 Meta 股票發行
- URL：https://nvidianews.nvidia.com/news/nvidia-and-meta-to-expand-collaboration-on-muse-and-muse-family-of-models-amid-robust-growth
- 摘要：NVIDIA 於 10 月 26 日宣布與 Meta 擴大 Muse 與 Muse 系列模型的合作，新聞稿稱這反映市場對 AI 代理的需求。雙方打算在整個工作流程上合作最佳化，以發揮最大效能並改善總持有成本，也會考慮在 NVIDIA OpenShell 參考架構上進一步合作，包括用於安全部署的 OpenShell 與監控代理行為的 NVIDIA Sentry。基礎設施方面，Meta 打算擴大部署 NVIDIA Vera Rubin 與 Vera CPU，作為新一代 AI 代理的運算平臺，追求最佳每瓦效能，並將部署 Spectrum-X Ethernet 網路與 BlueField-4 以支援網路效率與吞吐量。此外，NVIDIA 將投資 30 億美元於 Meta 的股票發行。新聞稿把這筆擬議投資的預期完成與適用的成交條件列為前瞻性陳述；正文沒有提供部署規模與時程。
- 權重：8/10
- 發布日期：2026-10-26
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：第三輪補搜新增。curl HTTP 200，存檔 pages/ref-60.html；日期依頁面日期列「October 26, 2026」與頁內 PublishDate 事件。grep 核對：Vera Rubin、Vera CPU、Spectrum-X、BlueField-4、OpenShell、Sentry、$3 billion、total cost of ownership、October 26, 2026。二手媒體寫的 Meta 股票發行規模與 Muse 下載量原頁沒有，不採。與 ref-19 AMD–Meta 為同一客戶與不同供應商的合作。

### 61. 鴻海科技日發表 3 款參考設計電動車，電動移動布局延伸到日本 K-Car 輕型貨車級距
- 原始標題：鴻海科技日登場　秀3款電動車設計布局輕型車級距
- 標題：鴻海科技日發表 3 款參考設計電動車，電動移動布局延伸到日本 K-Car 輕型貨車級距
- URL：https://www.cna.com.tw/news/afe/202610300113.aspx
- 摘要：中央社報導，鴻海 10 月 30 日舉行年度科技日（HHTD 26）開幕式，現場發表 3 款全新參考設計電動車，包括休旅車設計概念的 Model A+ 與 Model K+，以及小型貨卡 Model K，也展示右駕版 Model B。鴻海集團電動車事業策略長關潤表示，鴻海的電動移動布局延伸至日本 K-Car 輕型貨車級距，集團從 6 年前推出首款參考車型以來，參考設計電動車陣容累計 12 款。現場展示從材料、電芯、電池模組到電池管理系統（BMS）的研發成果，以及電子電氣架構（E/E 架構）與電動二輪車、電動三輪車動力系統。鴻海說明，Model A+ 為布局高附加價值電動車市場的企業提供差異化商品開發方案；Model K+ 鎖定年輕族群、兼具個性與親民價格，目標客戶包括想開發自有品牌電動休旅車的 B2B 業者；Model K 則因應配送、行動商業與防災等商用需求。
- 權重：8/10
- 發布日期：2026-10-30
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：第三輪補搜新增。curl HTTP 200，存檔 pages/ref-61.html；日期依 JSON-LD datePublished「2026-10-30T12:49:00+08:00」。grep 核對：HHTD 26、Model A+、Model K+、右駕版Model B、關潤、K-Car、累計12款、電池管理系統、電動三輪車。報導沒有自駕功能與量產時程；Honda 合作 L4 自駕只見科技新報單一媒體，PR Newswire 官方稿也沒有，不採。
"""
build = replace(build, "\n\n## 淘汰來源", "\n" + new_sources + "\n## 淘汰來源", "source new formal entries", 1)

bb_anchor = "- 淘汰原因：本次最終命令把皮膚病灶輔助第二判讀裝置編入 Class II 特別管制；原裝置的 De Novo 分類已於 2024-01-12 完成，本期屬法規編纂，不是新產品核准或新臨床結果。\n"
new_rejects = """
### BC. Anthropic 推出主動式代理 app Claude Duet 研究預覽
- URL：https://claude.com/resources/articles/claude-duet
- 發布日期：2026-10-21
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：2026-10-24 期已以 iThome 179897 淘汰（F，名額已滿），本篇是同一事件的官方頁，發布日仍在上期窗內，沒有新進展，維持淘汰。

### BD. PyTorch Conference North America 2026 回顧
- URL：https://pytorch.org/blog/pytorch-conference-north-america-2026-accelerating-open-intelligence-together/
- 發布日期：2026-10-22
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：回顧的主軸 TorchTPU 已於 2026-10-24 期 ref-57 收錄，該期備註也已把同場的 TorchNeuron 列為同類事件未另收；本篇為彙整，沒有明顯新增的事件。

### BE. 近千個 Magento 電商網站遭植入後門
- URL：https://www.ithome.com.tw/news/180031
- 發布日期：2026-10-28
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：iThome 轉述 Sansec 10-24 的揭露，屬二手報導；資安分類已補入 CISA 一手來源，本篇不明顯高於現有選材。

### BF. Amadeus 帳號憑證外流，大韓航空與韓亞航空客戶資訊外洩
- URL：https://www.ithome.com.tw/news/179947
- 發布日期：2026-10-26
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：iThome 轉述兩家航空公司的公告，找不到 Amadeus 官方或通訊社來源；報導也寫外洩範圍仍在調查。

### BG. Google Cloud 與 NASA 測試用於深空任務的機器人系統
- URL：https://cloud.google.com/blog/topics/public-sector/google-cloud-and-nasa-testing-robotic-systems-for-deep-space-missions
- 發布日期：2026-10-27
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：原頁為概念驗證機器人，成功率等細節來自 Nextgov 引述；成熟度與重要性不明顯高於現有選材。
"""
build = replace(build, bb_anchor, bb_anchor + new_rejects, "source new rejects", 1)

hl_inserts = [
    ("hl-software", "- **Google DeepMind 發表世界模型 Genie 4，可用自然語言即時操控場景並產生原生音訊，先開放受信任測試者。** Google 10 月 27 日公布 Genie 4 的研究成果，稱它為即時互動模擬帶來前所未有的擬真度與原生音訊；Gemini Omni 讓模擬貼近真實世界的外觀與行為，其他 Gemini 模型負責維持模擬的連貫性。使用者可用自然語言移動鏡頭、改變天氣或加入新角色，每個世界也會即時產生環境音、音樂與可互動的對話。Genie 4 已開始向一小群受信任測試者推出，即將透過 Project Genie 提供給 Google AI Ultra 訂閱者，並讓早期合作夥伴透過 Gemini API 與 AI Studio 使用 [[58. Google Blog]](#ref-58)。原頁沒有定價、基準測試與確切開放日期。"),
    ("hl-hardware", "- **CISA 把 PHP2Shell 兩個漏洞列入已知遭利用漏洞目錄，聯邦民間機關須依 BOD 26-04 優先修補。** CISA 10 月 26 日把 CVE-2026-109618 與 CVE-2026-109619 加入 KEV 目錄並更新 PHP 警示；BOD 26-04 要求聯邦民間行政機關優先快速修補 KEV 目錄中位於公開暴露資產、遭利用後可完全控制資產的漏洞，並訂出機關何時須檢查系統在修補前是否已被入侵，CISA 也鼓勵所有組織採用風險導向的漏洞管理。更新後的警示指出，這兩個俗稱 php2shell 的漏洞可讓未經驗證者遠端執行程式碼，影響所有處理網頁請求的 PHP，包括 Apache mod_php、PHP-FPM、php-cgi、FrankenPHP 與 LiteSpeed；應立即升級到 PHP 8.5.12、8.4.27、8.3.36 或 8.2.35，無法立即更新或仍用 PHP 8.1 以前不受支援版本者，應先讓相關系統離線 [[59. CISA]](#ref-59)。兩個 CISA 頁面都沒有寫聯邦機關的修補期限。"),
    ("hl-infrastructure", "- **NVIDIA 與 Meta 擴大 Muse 合作，Meta 打算擴大部署 Vera Rubin 與 Vera CPU，NVIDIA 將投資 30 億美元於 Meta 的股票發行。** NVIDIA 10 月 26 日宣布，雙方擴大 Muse 與 Muse 系列模型的合作，打算在整個工作流程上最佳化效能並改善總持有成本；Meta 打算擴大部署 Vera Rubin 與 Vera CPU 作為新一代 AI 代理的運算平臺，並部署 Spectrum-X Ethernet 網路與 BlueField-4，雙方也會考慮在 NVIDIA OpenShell 參考架構上合作，包括用於安全部署的 OpenShell 與監控代理行為的 NVIDIA Sentry [[60. NVIDIA Newsroom]](#ref-60)。新聞稿把這筆擬議投資的完成與成交條件列為前瞻性陳述，正文也沒有部署規模與時程。"),
    ("hl-proptech", "- **鴻海科技日發表 3 款參考設計電動車，電動移動布局延伸到日本 K-Car 輕型貨車級距。** 中央社報導，鴻海 10 月 30 日舉行年度科技日（HHTD 26），發表休旅車設計概念的 Model A+、Model K+ 與小型貨卡 Model K，並展示右駕版 Model B；電動車事業策略長關潤表示，集團 6 年前推出首款參考車型以來，參考設計電動車陣容累計 12 款。鴻海說明 Model K+ 的目標客戶包括想開發自有品牌電動休旅車的 B2B 業者，Model K 則因應配送、行動商業與防災等商用需求；現場也展示從材料、電芯、電池模組到電池管理系統（BMS）的研發成果與 E/E 架構 [[61. 中央社]](#ref-61)。報導沒有提到自駕功能與量產時程。"),
]
for next_anchor, bullet in hl_inserts:
    anchor = f'\n\n<a id="{next_anchor}"></a>'
    build = replace(build, anchor, "\n" + bullet + anchor, f"highlight before {next_anchor}", 1)

tr_inserts = [
    ("tr-software", "- **世界模型開始走向開發者端。** Genie 4 先給一小群受信任測試者，之後讓早期合作夥伴透過 Gemini API 與 AI Studio 使用 [[58. Google Blog]](#ref-58)；Google 把模擬世界定位為機器人與代理的安全訓練環境，這類模型未來可能成為代理訓練資料的來源之一。"),
    ("tr-hardware", "- **PHP2Shell 進入聯邦強制修補的範圍。** CISA 把兩個漏洞列入 KEV，BOD 26-04 同時要求機關檢查修補前是否已被入侵 [[59. CISA]](#ref-59)；對已公開遭利用的漏洞，升級版本之後還要回頭查入侵跡證。"),
    ("tr-infrastructure", "- **Meta 同週擴大與兩家 GPU 廠的合作。** AMD 的初期 Helios 機櫃已在 Meta 安裝測試 [[19. AMD]](#ref-19)，NVIDIA 則宣布 Meta 打算擴大部署 Vera Rubin 與 Vera CPU，並將投資 30 億美元於 Meta 的股票發行 [[60. NVIDIA Newsroom]](#ref-60)；同一家模型公司的基礎設施同時建立在不只一家加速器上。"),
    ("tr-proptech", "- **台灣製造業以參考設計切入電動車。** 鴻海的參考設計電動車累計 12 款，布局延伸到日本 K-Car 輕型貨車級距，目標客戶包括想做自有品牌車款的 B2B 業者 [[61. 中央社]](#ref-61)；車輛平臺、E/E 架構與電池系統由同一家供應商提供，品牌方可以在上面開發自己的車款。"),
]
for next_anchor, bullet in tr_inserts:
    anchor = f'\n\n<a id="{next_anchor}"></a>'
    build = replace(build, anchor, "\n" + bullet + anchor, f"trend before {next_anchor}", 1)

new_rows = """| <a id="ref-58"></a>58 | [We’re announcing Genie 4, our new world model for real-time interactive simulation.](https://www.google.com/search?q=Google+Genie+4+world+model) | Genie 4 可用自然語言即時操控模擬世界並產生原生音訊，先開放受信任測試者。 | 2026-10-27 | [Google Blog](https://blog.google/innovation-and-ai/models-and-research/google-deepmind/introducing-genie-4/) | AI 科技 |
| <a id="ref-59"></a>59 | [CISA Adds Two Known Exploited Vulnerabilities to Catalog](https://www.google.com/search?q=CISA+Adds+Two+Known+Exploited+Vulnerabilities+PHP2Shell) | CISA 把 PHP2Shell 兩個漏洞列入 KEV，聯邦民間機關須依 BOD 26-04 優先修補。 | 2026-10-26 | [CISA](https://www.cisa.gov/news-events/alerts/2026/10/26/cisa-adds-two-known-exploited-vulnerabilities-catalog) | 軟硬體資訊安全 |
| <a id="ref-60"></a>60 | [NVIDIA and Meta to Expand Collaboration on Muse and Muse Family of Models Amid Robust Growth](https://www.google.com/search?q=NVIDIA+Meta+Expand+Collaboration+Muse) | Meta 打算擴大部署 Vera Rubin 與 Vera CPU，NVIDIA 將投資 30 億美元於 Meta 股票發行。 | 2026-10-26 | [NVIDIA Newsroom](https://nvidianews.nvidia.com/news/nvidia-and-meta-to-expand-collaboration-on-muse-and-muse-family-of-models-amid-robust-growth) | 硬體或軟硬整合 |
| <a id="ref-61"></a>61 | [鴻海科技日登場　秀3款電動車設計布局輕型車級距](https://www.google.com/search?q=%E9%B4%BB%E6%B5%B7%E7%A7%91%E6%8A%80%E6%97%A5+HHTD+26+3%E6%AC%BE%E9%9B%BB%E5%8B%95%E8%BB%8A+%E4%B8%AD%E5%A4%AE%E7%A4%BE) | 鴻海發表 3 款參考設計電動車，布局延伸到日本 K-Car 輕型貨車級距。 | 2026-10-30 | [中央社](https://www.cna.com.tw/news/afe/202610300113.aspx) | 運輸物流 |
"""
build = replace(build, '\n<a id="notes"></a>', new_rows + '\n<a id="notes"></a>', "reference rows", 1)

# ---------- 報告說明、notes、task_plan ----------
build = replace(
    build,
    "本期共蒐集候選來源 111 筆，採用 57 筆為正式參考資料、淘汰 54 筆",
    "本期共蒐集候選來源 120 筆，採用 61 筆為正式參考資料、淘汰 59 筆",
    "report note counts", 1,
)
build = replace(
    build,
    "重新補搜 12 類；正式來源不變。",
    "重新補搜 12 類；正式來源不變。第三輪查核再重抓 57 筆原頁，四組逐句稽核修正 35 處歸因、時態與語意精度，補搜新增 ref-58 至 ref-61 四筆正式來源與五筆淘汰。",
    "report note third audit", 1,
)
build = replace(
    build,
    "；Codex 執行第二輪原頁、來源詞與缺漏複核",
    "；Codex 執行第二輪原頁、來源詞與缺漏複核；第三輪由 Claude Code（Opus 5.5）裁決，四組 `tech-auditor`（fable）逐句稽核、一組 `tech-collector`（sonnet）補搜",
    "notes tools", 1,
)
third_audit = """
## 第三輪查核（Claude Code；`audit-tech-weekly-report` skill）

- **原頁重抓**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 57 筆，55 筆以瀏覽器 UA 回 HTTP 200；Intel ref-20、ref-21 改用 curl 預設 UA 後為 200；ITmedia BUILT 兩筆以 cp932 解碼。`scripts/validate-weekly-tech-report-source-terms.sh` 對 580 個詞全部命中，再以 `scripts/build-weekly-tech-report-audit-packets.sh` 產生稽核包。
- **四組逐句稽核**：四組 `tech-auditor` 對照稽核包與本機原頁回報 35 處，主編逐條回原頁 grep 後全部採納。歸因：ref-16 聲明內容是 iThome 引述的段落、ref-28 是講者以秘書長身分的看法、ref-42 客戶量與付費工作是公司新聞稿的說法、ref-43 平板避難所的用途是 MIT News 的敘述；狀態與時態：ref-5 預計、ref-11 將改用、ref-19 初期 Helios 機櫃安裝測試中（趨勢段）、ref-20 預期涵蓋、ref-48 10 月 31 日開展、ref-49 動土典禮將排定；語意精度：ref-1 初期定價、ref-4 sometimes 與「未給予明確偏好與表達指示」兩個條件、60% 不寫成因果、ref-7 GitHub Enterprise 與 Copilot 方案分開、ref-17 many 與 enable、ref-19 lead customer、ref-31 CE 承認範圍為醫材與 IVD、ref-33 sought to 與 would likely、ref-48 修飾關係、ref-52 throughout much of 2026、ref-55 we owe it to 與 likely；資料限制段 ref-3 的第三方基準由 Mistral 轉述；ref-10 多餘空格；ref-20、ref-21 備註的 403 紀錄更新。
- **補搜**：一組 `tech-collector` 依 Google News 自動盤點的線索與各分類重掃。新增正式來源 4 筆：Google DeepMind Genie 4（ref-58）、CISA 將 PHP2Shell 列入 KEV 並依 BOD 26-04 要求聯邦民間機關優先修補（ref-59，PHP2Shell 事件的官方新進展；鉅亨網稱「緊急指令」不準，原頁是 KEV 納入與 BOD）、NVIDIA 與 Meta 擴大 Muse 合作並投資 30 億美元（ref-60）、鴻海科技日 3 款參考設計電動車（ref-61，中央社）。主編回原頁逐句核對四筆摘要與報告句。新增淘汰 5 筆（BC 至 BG）：Claude Duet（上期已淘汰且發布日在上期窗內）、PyTorch Conference 回顧（TorchTPU 上期已收）、Magento 近千站後門（iThome 轉述 Sansec）、Amadeus 帳號憑證外流（無官方或通訊社來源，範圍仍在調查）、Google Cloud 與 NASA 深空機器人（概念驗證）。
- **盤點未成條目**：TTXC 台灣文化科技大會只找到 10-13 至 10-16 的展前與開幕稿，桃園科技藝術節開幕稿找不到；是方虎尾 AI 資料中心動土（中央社 10-20）未開原頁、重要性不足；AWS 德國投資只找到 2024 年公告；日本雲端安全認證沒有 10 月的新制度公告；PwC 第三方廠商事件只有媒體與駭客組織的說法；鉅亨網的 CISA 報導改以 cisa.gov 原頁取代。
- **新來源的否定式主張**：CISA 兩頁都沒有寫聯邦修補期限，KEV 目錄與媒體的 10 月 29 日不採；NVIDIA 正文沒有部署規模與時程，二手媒體的股票發行規模與 Muse 下載量不採；中央社鴻海報導沒有自駕與量產時程，Honda L4 合作只見科技新報，不採；Genie 4 原頁沒有定價、基準與確切開放日期。總結維持原樣，未加入新來源。
- **結果**：正式來源 61 筆、淘汰 59 筆、12 分類、ref-1 至 ref-61 一致。
"""
notes_anchor = "- **結果**：正式來源 57 筆、淘汰 54 筆、ref-1 至 ref-57 與 12 分類不變；作者 Meta 加入 Codex。\n"
build = replace(build, notes_anchor, notes_anchor + third_audit, "notes third audit section", 1)

plan_anchor = "| 11 | Codex 第二輪查核：重抓 57 筆原頁、驗證 580 個來源詞、複核 12 類缺漏 | 完成（55 筆直接 HTTP 200；Intel 兩筆依站別改用預設 UA 後為 200；新增 2 筆淘汰候選，正式來源不變） |"
build = replace(
    build,
    plan_anchor,
    plan_anchor + "\n| 12 | 第三輪查核：重抓 57 筆原頁、四組 `tech-auditor` 逐句稽核、一組 `tech-collector` 補搜 | 完成（修正 35 處；新增 ref-58 至 ref-61 與 5 筆淘汰；`scripts/apply-weekly-tech-report-027-third-audit.sh`） |",
    "task plan third audit", 1,
)
err_anchor = "| 第二輪補搜候選 | GPT-6 Rosalind Research、皮膚病灶輔助診斷軟體分類皆為官方來源 | 前者為受限預覽且與既有醫療 AI 題材重疊；後者是 2024 年分類的法規編纂，均列淘汰 |"
build = replace(
    build,
    err_anchor,
    err_anchor
    + "\n| 第三輪歸因與語意 | 新聞稿、MIT News 或 iThome 的敘述寫成受訪者說法；many、sought to、could 等限定詞被加強 | 補上說話者，改回原頁限定詞 |"
    + "\n| 第三輪補搜重複 | Claude Duet 上期已淘汰、PyTorch 年會的 TorchTPU 上期已收 | 維持淘汰，列入淘汰來源 |"
    + "\n| 補搜代理存檔落點 | 存檔目錄未先建立，curl 存檔落到專案根 | 代理移回暫存區，`git status` 確認專案根無殘留 |",
    "task plan third audit errors", 1,
)

build_path.write_text(build, encoding="utf-8")

for old, new, label in [
    ('assert_count 57 "$formal_sources" "正式來源數"', 'assert_count 61 "$formal_sources" "正式來源數"', "validator formal"),
    ('assert_count 54 "$reject_sources" "淘汰來源數"', 'assert_count 59 "$reject_sources" "淘汰來源數"', "validator rejects"),
    ('assert_count 57 "$ref_count" "參考資料筆數"', 'assert_count 61 "$ref_count" "參考資料筆數"', "validator refs"),
    ('while [ "$n" -le 57 ]; do', 'while [ "$n" -le 61 ]; do', "validator loop"),
    ("正式來源 57、淘汰 54、分類 12、引用 ref-1..57 一致", "正式來源 61、淘汰 59、分類 12、引用 ref-1..61 一致", "validator message"),
]:
    validate = replace(validate, old, new, label, 1)
validate_path.write_text(validate, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-027.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-027 2026-10-31
sh "$ROOT/scripts/validate-weekly-tech-report-027.sh"
git -C "$ROOT" diff --check

echo "weekly-tech-report-027 第三輪查核已套用、重建、同步與驗證"
