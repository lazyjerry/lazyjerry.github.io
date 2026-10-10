# 候選來源整理

- 報告日期：2026-10-10
- 時間範圍：2026-09-25 至 2026-10-10（含首尾）
- 判定原則：以原始頁面標示的發布日為準；無法確認落在時間窗內者直接排除。
- 來源優先序：官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載。中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。
- 跨期去重：本期窗期與 2026-10-03 期（2026-09-18 至 2026-10-03）重疊九天、與 2026-09-26 期（2026-09-11 至 2026-09-26）重疊兩天，篩選前已比對兩期 `references.md`，重複事件即使落在窗內也淘汰。
- 蒐集方式：四組研究代理依分類平行蒐集，主編收斂、複審並逐筆回原頁核對；摘要只寫該來源原頁可查證的內容，其他媒體的細節記在備註。

## 正式納入來源

### 1. Mistral 預覽兆參數開放權重模型 Mistral Large 4，權重預計 10 月底釋出
- 原始標題：Introducing Mistral Large 4
- 標題：Mistral 預覽兆參數開放權重模型 Mistral Large 4，權重預計 10 月底釋出
- URL：https://mistral.ai/news/mistral-large-4/
- 摘要：Mistral 公開 Mistral Large 4（ML4）預覽版，官方稱這是其規模最大、能力最強的模型，總參數 1 兆、啟用 520 億參數，原生多模態，訓練資料涵蓋逾 160 種語言。預覽 API 即日可用，權重預計本月底釋出；釋出前，Mistral 正與資安業者、審核過的合作夥伴及政府單位進行實地紅隊測試。ML4 以 3,800 張 NVIDIA Grace Blackwell GPU 在 Mistral 自有的歐洲資料中心從零訓練。官方引述 Artificial Analysis Cyber Index，ML4 名列全球前五，其中重現並修補真實開源漏洞的測試拿下 82%；Cybench 解出 93% 的題目。程式開發方面，DeepSWE v1.1 為 61.7%、Terminal-Bench 4 為 28.3%。Mistral 表示模型將可部署在私有雲或地端，並將提供由 Mistral 端到端營運、受歐洲法律管轄的歐洲部署。
- 權重：9/10
- 發布日期：2026-10-06
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200（pages/A-06.html）。日期依 JSON-LD datePublished「2026-10-06T12:00:27.000Z」。grep 核對：1 trillion、52 billion、160 languages、3,800、82%、93%、61.7%、28.3%、end of the month、on-premise 皆在原頁。注意：iThome 10-07 轉述寫「1.05兆個參數，每次推理啟用490億個參數」、API 價格每百萬輸入 1.36 美元／輸出 4.18 美元，參數數字與官方頁不一致，未寫入摘要；價格官方頁模型卡另列每百萬輸入 1.36 美元、輸出 4.18 美元（稽核補正，原備註誤稱不在官方頁）。

### 2. Anthropic 推出 Claude Haiku 5.5，成本較 Haiku 4.5 平均降約 75%，首度支援推理強度調整
- 原始標題：Introducing Claude Haiku 5.5
- 標題：Anthropic 推出 Claude Haiku 5.5，成本較 Haiku 4.5 平均降約 75%，首度支援推理強度調整
- URL：https://www.anthropic.com/claude-haiku-5-5
- 摘要：Anthropic 發表 Claude Haiku 5.5（模型 ID claude-haiku-5-5），定位為高流量、成本敏感的工作，例如摘要、壓縮（compaction）、資料庫查詢與分類，也適合在程式開發時擔任 Opus 5.5、Sonnet 5.5 的子代理。官方稱平均執行成本比 Haiku 4.5 低約 75%；提示在 10 萬 Token 以內時，每百萬 Token 輸入 0.10 美元、輸出 0.50 美元，超過 10 萬則為 0.50 與 2.50 美元。這是第一個可調整 effort 的 Haiku 級模型。評測方面，Terminal-Bench 4.0 為 39.2%（Haiku 4.5 為 0.0%），OSWorld 2.1 離線子集為 72.4%。Anthropic 同時把 Sonnet 5.5 的快取讀取價格減半為每百萬 Token 0.10 美元，並將於本週為 Max 與 Team 訂閱者推出每月 API 額度。Haiku 5.5 已在 AWS、Google Cloud 與 Microsoft Azure 上架。
- 權重：10/10
- 發布日期：2026-10-07
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200（pages/A-01.html）。頁面無日期 meta，日期取頁面正文日期列「October 7, 2026」，與 anthropic.com/news 列表「Oct 7, 2026」一致。grep 核對：claude-haiku-5-5、75% less、$0.10 / $0.50、$0.50 / $2.50、39.2%、72.4%、adjustable effort、$0.10 per million 皆在原頁。1M context 只見於 Claude Code v2.1.293 release note（Added Claude Haiku 5.5 … now the default Haiku model），不在官方頁，未寫入摘要；撰稿若要提可另引 https://github.com/anthropics/claude-code/releases/tag/v2.1.293（2026-10-07）。GitHub Changelog 同日〈Claude Haiku 5.5 in GitHub Copilot〉屬同事件。

### 3. Google Cloud 於 Gemini at Work 2026 發表通用工作代理 Gemini agent，可建立擁有獨立帳號的同事代理
- 原始標題：Welcome to Gemini at Work 2026: Introducing the Gemini agent
- 標題：Google Cloud 於 Gemini at Work 2026 發表通用工作代理 Gemini agent，可建立擁有獨立帳號的同事代理
- URL：https://cloud.google.com/blog/products/ai-machine-learning/welcome-to-gemini-at-work-2026
- 摘要：Google Cloud 執行長 Thomas Kurian 在 Gemini at Work 2026 主題演講宣布 Gemini agent，定位為單一、通用的工作代理，以同一個介面與單一 API 處理問答、知識工作、影像媒體生成，以及撰寫並執行程式碼。它在雲端執行，可從網頁、iOS、Android、Windows 與 Mac 桌面、命令列、Google Workspace、Microsoft 365 與 Slack 存取，闔上筆電後仍能持續處理耗時數小時或數天的工作，並可動態建立各自擁有身分的子代理，協調平行或依序的流程。同事代理（coworker agent）擁有專屬電子郵件、行事曆、雲端硬碟與企業通訊錄身分，只能存取被分享的內容。模型層可在 Gemini 系列與 Claude 之間調度，並能連接任何 MCP 伺服器，以及 Git、Jira、BigQuery、Postgres、Snowflake 等系統；技能可發布到公司共用的登錄庫。
- 權重：9/10
- 發布日期：2026-10-08
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200（pages/A-07.html）。日期依 JSON-LD datePublished「2026-10-08」。grep 核對：Thomas Kurian、single API、Model Context Protocol、Postgres、Snowflake、coworker agent、Claude、sub-agents 皆在原頁。iThome 10-09〈Google Gemini Agent可建立企業AI同事〉為同事件轉述（淘汰候選 D）。Gemini at Work 為窗內大型企業發表會，本則可兼作該活動的開發者端彙整。

### 4. ChatGPT 加入智慧介面，GPT-6 可依問題動態組合圖表、按鈕與表單
- 原始標題：ChatGPT回答不只文字，GPT-6開始動態組合互動介面
- 標題：ChatGPT 加入智慧介面，GPT-6 可依問題動態組合圖表、按鈕與表單
- URL：https://www.ithome.com.tw/news/179503
- 摘要：據 iThome 報導，OpenAI 在 ChatGPT 加入智慧介面（Intelligent UI），GPT-6 可依問題把文字、圖片、圖表、按鈕與表單組成可直接操作的回應，例如並排比較選項、可點選的結構圖解，或可調整數值的試算；文字足以回答時仍維持一般回覆。做法是預先建立可重複使用的介面元件，由 GPT-6 決定使用哪些元件、如何排列，另有編譯器在模型產生回答時同步處理介面，讓內容逐步出現。OpenAI 也調整 GPT-6 的訓練方式，讓模型學習安排文字、視覺與互動內容；GPT-6 還能在持續思考或使用工具時先開始回答。GPT-6 與智慧介面自 10 月 7 日起陸續提供 Plus、Pro、Business、Enterprise，10 月 8 日擴及 Free 與 Go；使用 GPT-6 Astra 的 Pro 層級暫不支援，GPT-6.1 Sol 仍只在 ChatGPT Work 與 Codex 提供。
- 權重：8/10
- 發布日期：2026-10-08
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl（瀏覽器 UA）200（pages/A-11.html）。日期依 class="created" 2026-10-08。openai.com 全 UA 403，無法核對官方原頁，本則為轉述來源。grep 核對：Intelligent UI、10月7日、10月8日、GPT-6 Astra、GPT-6.1 Sol、編譯器皆在原頁。與上期 DevDay 2026（GPT-6.1 Sol 發表）不同事件：本則是 GPT-6 進入一般 ChatGPT 聊天介面。

### 5. 行政院通過中小微企業轉型升級條例草案，AI、資安與數位投資納入抵減，門檻降至 25 萬元
- 原始標題：行政院通過中小微企業轉型升級條例修法，數位、AI、資安與淨零投資納入抵減，門檻降至25萬元
- 標題：行政院通過中小微企業轉型升級條例草案，AI、資安與數位投資納入抵減，門檻降至 25 萬元
- URL：https://www.ithome.com.tw/news/179523
- 摘要：行政院會 10 月 8 日通過經濟部提出的《中小企業發展條例》部分條文修正草案，條例名稱改為《中小微企業轉型升級發展條例》，後續送立法院審議。草案新增「轉型設備投資抵減」，智慧機械、人工智慧應用，以及 5G、資通安全產品或服務、數位管理與節能減碳等投資都可適用；投資形式不限硬體，也包含軟體、技術與技術服務。適用支出門檻由《產業創新條例》相關措施的 100 萬元降到 25 萬元。研發方面擴大委外研發支出的適用範圍，中小微企業當年度研發投資抵減率由 15% 提高至 20%。經濟部規畫未來 8 年投入 1,000 億元推動轉型。草案另新增第 8 條資料取得規定，讓主管機關推動政策時可請求相關機關（構）、法人或團體提供必要資料。草案仍須經立法院通過，相關租稅優惠才會施行。
- 權重：7/10
- 發布日期：2026-10-08
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl（瀏覽器 UA）200（pages/A-12.html）。日期依 class="created" 2026-10-08，正文「今天(10/8)」。grep 核對：25萬元、100萬元、15%、20%、1,000億元、8年、第8條皆在原頁。原頁「1,000億元等資來」疑為錯字，摘要只寫金額。屬草案，摘要已保留「須經立法院通過」條件。本期台灣在地 AI 政策只找到這則窗內事件（數發部新聞稿列表 404、國科會無窗內 AI 新聞），主編若嫌技術面不足可改用淘汰候選 E（Windows 混合智慧）。

### 6. GitHub App 安裝權杖全面改為無狀態格式，長度由 40 增至約 520 字元
- 原始標題：Stateless GitHub App installation tokens rolled out
- 標題：GitHub App 安裝權杖全面改為無狀態格式，長度由 40 增至約 520 字元
- URL：https://github.blog/changelog/2026-10-02-stateless-github-app-installation-tokens-rolled-out
- 摘要：GitHub 宣布，自 2026 年 4 月 27 日開始分階段推出的無狀態（stateless）GitHub App 安裝權杖格式已全面完成，新簽發的安裝權杖預設採新格式，讓權杖的簽發與驗證更快，也提升 GitHub API 的可靠性。新權杖仍以 ghs_ 為前綴，但長度約 520 個字元，舊格式為 40 個字元；權限、儲存庫範圍、一小時效期與安裝權杖 REST API 端點不變，改版前簽發的權杖在到期前仍可使用。先前讓開發者按需驗證新格式的暫時性請求標頭 X-GitHub-Stateless-S2S-Token 將於 2026 年 11 月 30 日棄用，之後所有符合資格的 App 一律收到無狀態權杖。GitHub 建議確認所有處理安裝權杖的系統都把權杖當成不透明字串，包括要求長度剛好 40 字元的驗證、長度上限過小的資料庫欄位、密鑰儲存或環境變數，以及會截斷或拒絕長標頭的代理、閘道與中介軟體。
- 權重：9/10
- 發布日期：2026-10-02
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200（pages/A-13.html）。日期依 JSON-LD datePublished「2026-10-02T15:18:23-07:00」。grep 核對：April 27, 2026、ghs_、520 characters、instead of 40、X-GitHub-Stateless-S2S-Token、November 30, 2026 皆在原頁。

### 7. Rust 1.100 起 32 位元 Windows 目標不再提供主機工具，需改用交叉編譯
- 原始標題：Demoting i686 Windows targets to std-only
- 標題：Rust 1.100 起 32 位元 Windows 目標不再提供主機工具，需改用交叉編譯
- URL：https://blog.rust-lang.org/2026/10/02/demoting-i686-windows-targets-to-std-only/
- 摘要：Rust 團隊宣布，自 Rust 1.100.0 起調整 32 位元 Windows 目標：i686-pc-windows-msvc 由附主機工具的 Tier 1 降為不含主機工具的 Tier 1，i686-pc-windows-gnu 由附主機工具的 Tier 2 降為不含主機工具的 Tier 2。標準函式庫建置仍會發布，但編譯器等主機工具不再提供；i686-pc-windows-msvc 作為 Tier 1 仍會進行 CI 測試。官方說明，僅支援 32 位元的桌機與伺服器 x86 CPU 已停售超過 15 年，一般 32 位元 Windows 支援也在 2025 年 10 月結束；即使在現代 x86_64 硬體上，建置 i686 Windows 工具鏈也問題不斷，曾出現以 i686 MSVC 目標建置的編譯器當機，以及 GNU C++ 工具鏈建置 LLVM 時記憶體不足。Rust 1.100 之後將無法在 32 位元 Windows 主機安裝工具鏈，需改由 64 位元 Windows 等仍受支援的主機交叉編譯；其他 32 位元平台不受影響。
- 權重：8/10
- 發布日期：2026-10-02
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200（pages/A-08.html）。日期取頁面日期列「Oct. 2, 2026」與網址路徑 2026/10/02。grep 核對：Rust 1.100.0、i686-pc-windows-msvc、i686-pc-windows-gnu、Tier 1、Tier 2、15 years、October 2025 皆在原頁。與上期 Rust 1.99.0 不同事件（本則是 1.100 的平台支援調整）。iThome 10-05〈Rust預告停止32位元Windows主機工具〉為同事件轉述。若主編認為連兩期 Rust 太密，可用淘汰候選 A 或 B 替補。

### 8. 微軟 Microsoft Execution Containers 正式推出，以政策驅動隔離 AI 代理的檔案與網路存取
- 原始標題：Microsoft Execution Containers: Policy-driven containment for AI agents
- 標題：微軟 Microsoft Execution Containers 正式推出，以政策驅動隔離 AI 代理的檔案與網路存取
- URL：https://blogs.windows.com/windowsdeveloper/2026/10/07/microsoft-execution-containers-policy-driven-containment-for-ai-agents/
- 摘要：微軟宣布 Microsoft Execution Containers（MXC）正式推出，作為 AI 代理的政策驅動隔離層。開發者或 IT 以統一的 JSON 設定 schema 宣告工作負載可用的檔案與網路目的地等資源，MXC 在執行期以對應的容器強制執行，政策不受代理本身控制。MXC 提供多語言 SDK，並把控制項對應到 Windows、macOS、Linux 的後端，例如 Windows 的 AppContainer、macOS 的 Seatbelt、Linux 的 Bubblewrap 處理序沙箱，另有 Windows 獨有的工作階段容器、透過 WSL 的 Linux 環境，以及硬體虛擬化隔離。MXC 支援 Enforcement、Learning、Permissive 三種模式，在 Windows 上，Learning 模式可把被擋下的操作記錄成 JSON 活動報告，協助撰寫最小權限政策。Windows 365 對 MXC 的支援同步正式推出；Intune 管理政策，以及用 Microsoft Entra 區分代理與使用者活動，則標示為即將推出。
- 權重：9/10
- 發布日期：2026-10-07
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200（pages/A-04.html）。日期依 article:published_time「2026-10-07T18:00:28+00:00」。grep 核對：generally available、AppContainer、Seatbelt、Bubblewrap、Enforcement／Learning／Permissive、JSON、Windows 365、Intune、Entra 皆在原頁。本則為微軟 10-07 Windows 與 Surface 發表會的開發者端彙整（活動資訊見 Axios 等報導，未寫入摘要）。同日姊妹文〈Building Windows for hybrid intelligence〉（pages/A-05.html）列出已支援 MXC 的代理：OpenAI Codex、GitHub Copilot、OpenClaw、Replit、LM Studio、NVIDIA OpenShell、Unsloth AI，並稱 Claude Code 等將跟進，撰稿可補一句並引用該頁。可能與 C 組（軟硬體資訊安全）重疊。

### 9. Python 3.15.0 正式版發布：UTF-8 成預設編碼、lazy import、frozendict，JIT 再提速
- 原始標題：Python 3.15.0 (final) is here!
- 標題：Python 3.15.0 正式版發布：UTF-8 成預設編碼、lazy import、frozendict，JIT 再提速
- URL：https://blog.python.org/2026/10/python-3150-final-is-here
- 摘要：Python 3.15.0 正式版發布，包含 1,012 位貢獻者的 5,643 個 commit。直譯器層面，PEP 686 讓 UTF-8 成為預設編碼、PEP 810 提供明確的 lazy import 以縮短啟動時間、PEP 814 新增內建 frozendict。實驗性 JIT 在 x86-64 Linux 相較標準直譯器幾何平均快 7–8%，在 AArch64 macOS 相較 tail-calling 直譯器快 11–12%。標準函式庫新增 PEP 799 的專用 profiling 套件與高頻取樣分析器 Tachyon。C API 方面，PEP 803、820、793 為 free-threaded 建置提供穩定 ABI。PEP 831 預設啟用 frame pointer；官方 Windows 64 位元版改用 tail-calling 直譯器，macOS 安裝檔預設安裝 free-threading 支援。官方提醒 macOS 27.0 上的 IDLE 與 tkinter 開啟對話框時可能卡住。
- 權重：10/10
- 發布日期：2026-10-09
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200（pages/A-02.html）。日期取頁面日期列「October 9, 2026」（blog.python.org 列表同）。grep 核對：5,643、1,012、PEP 686／810／814／661／798／831／803、7-8%、11-12%、Tachyon、macOS 27.0 皆在原頁；PEP 661 sentinel、PEP 798、型別相關 PEP 728／747／800 亦在原頁，因字數未寫入摘要。上期淘汰的 3.15.0 rc3（10-02）由本則取代；上期已收 3.10 EOL 為不同事件。

### 10. Deno 團隊加入 Cloudflare：runtime 再維護一年後停止開發，Deno Deploy 六個月後關閉
- 原始標題：Deno is joining Cloudflare
- 標題：Deno 團隊加入 Cloudflare：runtime 再維護一年後停止開發，Deno Deploy 六個月後關閉
- URL：https://deno.com/blog/cloudflare
- 摘要：Deno 創辦人 Ryan Dahl 宣布，Deno 整個團隊加入 Cloudflare，將與 Workers 與 Durable Objects 團隊合作，把未來的開發重心放在共同平台，不再繼續發展獨立的 runtime 與託管服務。具體安排：Deno runtime 再支援一年，期間每月發布錯誤修正與安全更新，之後停止開發但維持開源，歡迎其他人接手；Deno Deploy 繼續營運六個月後關閉，並為付費客戶提供遷移到 Cloudflare Workers 的協助；JSR 繼續運作，基礎設施移到 Cloudflare；rusty_v8 持續支援，並朝整合進 workerd 的方向進行。Dahl 表示，以 Workers 程式模型為基礎的 celld 聚焦 Durable Objects，目標是讓擴展能力內建在程式模型中，不論在 Cloudflare 網路或自有基礎設施上執行；他也指出 Durable Objects 的特性特別適合 AI 代理的執行框架。
- 權重：10/10
- 發布日期：2026-10-09
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200（pages/A-03.html）。頁面無 datePublished meta，日期取正文日期列「October 9, 2026」，作者 Ryan Dahl。原頁提到 Cloudflare 部落格另有 Dahl 與 Kenton Varda 的聯名文章，未抓取，摘要未引用其內容。可能與 D 組（網路/伺服器等基礎）重疊。

### 11. 荷蘭漏洞揭露協會 DIVD 遭 AI 代理入侵：攻擊者以兩個 Zammad 零時差漏洞取得 root
- 原始標題：DIVD-2026-00014 - When, not if…
- 標題：荷蘭漏洞揭露協會 DIVD 遭 AI 代理入侵：攻擊者以兩個 Zammad 零時差漏洞取得 root
- URL：https://csirt.divd.nl/cases/DIVD-2026-00014/
- 摘要：荷蘭漏洞揭露協會 DIVD 公布自身遭入侵的事件檔案。攻擊者於 2026 年 9 月 21 日利用客服工單系統 Zammad 的兩個零時差漏洞 CVE-2026-102489 與 CVE-2026-102490，入侵 DIVD 用來處理 csirt@divd.nl 等信箱往來的 Zammad 主機，提權至 root 後改以 AI 代理進行後續攻擊。DIVD 判定使用 AI 代理的理由包括：短時間內產生的攻擊量與產物數量龐大，以及攻擊腳本附有註解與說明、代理之間似乎在腳本註解中彼此對話。DIVD 公布的指標為偵測時間 19 分鐘、首次回應 19 小時、圍堵 9 小時；9 月 22 日封鎖資料中心所有系統存取並與 Merlon Security 展開鑑識，9 月 24 日向 Zammad 通報漏洞，另開案 DIVD-2026-00015 掃描網路上仍曝險的 Zammad 實例，並已通報荷蘭資料保護局與 NCSC、向警方報案。調查仍在進行中。
- 權重：9/10
- 發布日期：2026-09-29
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 200（B-divd.html）；原頁無 datePublished meta，日期依頁面 Timeline「29 Sep 2026 Publication of casefile」，頁面最後修改 2026-10-09 20:01 CEST。grep 核對：CVE-2026-102489、CVE-2026-102490、19 minutes、19 hours、9 hours、Merlon Security。原頁寫 Zammad 已於 7.2 與 7.2.2 修補，但同頁又稱 7.x 分支不受影響，敘述矛盾，摘要不寫版號。「CISA 10-02 將兩漏洞列入 KEV」出自 CISA KEV 公告（B-kev-10-02.html），未寫入摘要；iThome 10-06（179447）有中文轉述可備查。

### 12. Rapid7 揭露 Linux 後門 AVERAT 鎖定臺灣網路邊緣設備，以 SMTP 流量掩護 C2 並借遭入侵的 NAS 與錄影設備中繼
- 原始標題：SMTP is the key: BPFDoor and AVERAT hitting the network edge
- 標題：Rapid7 揭露 Linux 後門 AVERAT 鎖定臺灣網路邊緣設備，以 SMTP 流量掩護 C2 並借遭入侵的 NAS 與錄影設備中繼
- URL：https://www.rapid7.com/blog/post/tr-smtp-is-the-key-bpfdoor-averat-hitting-the-network-edge/
- 摘要：Rapid7 追蹤一組會配合目標電信環境軟體慣例偽裝的 Linux 惡意程式，包括新的 BPFDoor 變種、鎖定南韓目標的 BPF Rekoobe、一支安裝程式，以及部署在臺灣設備上的 Linux 後門 AVERAT 共六個版本。安裝程式以「ShareTech」字串衍生加密金鑰並放在設備的附加套件目錄，把自己與 AVERAT 以 ntpdate、udevds 名稱暫存到 /sbin 後執行，十秒後刪檔但程序仍留在記憶體。南韓樣本則冒充當地反垃圾郵件產品 SpamSniper 的 PID 檔。這批程式共同特徵是利用 TCP 25 埠的 SMTP 流量掩護，AVERAT 先送出 EHLO 並要求 STARTTLS 再建立自己的加密 C2 通道。Rapid7 也從 AVERAT 組態追到位於中華電信 AS3462 網路、臺南與桃園等地的遭入侵設備（含 Synology NAS 與 Dahua 錄影設備）被當成中繼節點，符合隱蔽中繼網路（ORB）常用的設備類型，但尚無法歸因於已知 ORB 網路。
- 權重：9/10
- 發布日期：2026-09-29
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 200（B-r7-averat.html）；日期依 JSON-LD datePublished 2026-09-29T20:03:21Z（dateModified 2026-10-02）。iThome 10-06（179425，B-ith-179425.html）寫「Rapid7 於 10 月 2 日揭露」，應是依修改日，兩者皆在窗內，以原頁 datePublished 為準。grep 核對：six builds、ShareTech、ten seconds、SpamSniper、STARTTLS、AS3462、Synology、Dahua、ORB、Tainan、Taoyuan 皆在原頁。「眾至資訊」中文名與眾至回應出自 iThome，摘要標題採 iThome 對 ShareTech 的譯名；眾至回應內容未寫入摘要。

### 13. 微軟 2026 數位防禦報告：臺灣國家級駭客活動事件 193 起，躍居全球第三
- 原始標題：微軟揭2026國家級駭客活動，臺灣、日本遭遇事件躍居全球第三、第四，威脅情勢較兩年前更嚴峻
- 標題：微軟 2026 數位防禦報告：臺灣國家級駭客活動事件 193 起，躍居全球第三
- URL：https://www.ithome.com.tw/news/179391
- 摘要：微軟 10 月初發布 2026 年數位防禦報告（MDDR）。報告指出，2025 年 7 月至 2026 年 6 月間臺灣被觀察到 193 起國家級駭客活動事件，高於 2024 年報告的 143 起，排名全球第三、持續居亞太首位；美國以 531 起居首，以色列 210 起次之，日本 172 起排第四。兩年前排亞太第二的韓國跌出亞太前十，日本則大增。報告分析中國、伊朗、俄羅斯與北韓四大國家級威脅來源，其中中國國家級駭客鎖定的國家與地區以美國 27% 最多、臺灣 24% 次之、日本 20% 第三；鎖定產業以 IT 15%、政府機關 14%、研究與學術 8% 居前。微軟觀察到中國國家級駭客除持續利用公開服務漏洞、網頁後門與遠端存取工具，也愈來愈多轉向身分攻擊、雲端環境持久化與資料外洩，部分已開始利用 AI 工具尋找漏洞。
- 權重：8/10
- 發布日期：2026-10-05
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 200（帶瀏覽器 UA，B-ith-179391.html）；日期依 `class="created"` 2026-10-05。微軟原始 PDF（cdn-dynmedia-1.microsoft.com 的 2026-Microsoft-Digital-Defense-Report.pdf）未抓取核對，報告正式發布日未確認，故採 iThome。grep 核對：193、143、531、210、172、27%、24%、20%、15%、14%、8%。同報告另一面向見 iThome 179405（臺灣上半年受威脅影響排名升至全球第 4，占比 3.9%），可由主編合併成一句。與 A 組可能重疊（報告談 AI 加速攻擊）。

### 14. 資安院公布「國家資安防護 2.0」：AI 檢測原始碼、明年 4 月起以 AI 紅隊演練攻擊政府機關
- 原始標題：龔化中上任兩個月揭「國家資安防護2.0」，明年4月AI紅隊先攻政府機關
- 標題：資安院公布「國家資安防護 2.0」：AI 檢測原始碼、明年 4 月起以 AI 紅隊演練攻擊政府機關
- URL：https://www.ithome.com.tw/news/179495
- 摘要：國家資通安全研究院院長龔化中 8 月 1 日上任，10 月 5 日首度對外說明「國家資安防護 2.0」藍圖，主張以 AI 對抗 AI，並列出四項技術工作：一是 AI 自動化程式碼檢測與修補，資安院已向多家 AI 業者取得資安用途的先進 AI 系統，下一階段結合自建的地端資安模型，優先檢測政府機關與關鍵基礎設施使用的核心軟體原始碼；二是 AI 滲透測試與紅藍隊演練，由 AI 代理執行自行設計的攻擊技能，預計明年 4 月至 10 月針對政府部門展開；三是以大型語言模型自動分析全球威脅情資，轉成邊界設備可直接使用的阻擋規則；四是建立國家級 AI 資安攻防沙箱，開放政府、產業與資安廠商驗證 AI SOC、AI SOAR 等技術。前瞻研究中心採「第一年建立、後四年擴大」推進。另第二屆產品資安漏洞獵捕活動於 10 月至 11 月實測，總獎金 429 萬元、176 位研究員、16 家廠商、22 項受測產品。
- 權重：8/10
- 發布日期：2026-10-07
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 200（帶瀏覽器 UA，B-ith-179495.html）；日期依 `class="created"` 2026-10-07，說明會為 10 月 5 日。grep 核對：8月1日、10月5日、明年4月至10月、第一年建立、429萬元、176位、16家、22項。「預計」「規畫」等語氣保留：AI 紅隊為預計時程、情資分析系統為規畫中。iThome 10-08 資安日報（179522）為同一則摘要轉載。

### 15. 美英日澳等多國聯合警示：中國政府關聯業者 Integrity Tech 結合自動化掃描與人工入侵竊取資料
- 原始標題：Chinese Government-linked Cyber Threat Actors Combine Automated and Hands-on Hacking Tools to Steal Sensitive Data
- 標題：美英日澳等多國聯合警示：中國政府關聯業者 Integrity Tech 結合自動化掃描與人工入侵竊取資料
- URL：https://www.cisa.gov/news-events/cybersecurity-advisories/aa26-281a
- 摘要：CISA 於 10 月 8 日發布聯合資安警示 AA26-281A，由 FBI、CISA、NSA 與英國、澳洲、加拿大、日本、紐西蘭、西班牙等國機關共同具名。警示指出，與中國政府有關聯的營利公司 Integrity Technology Group 支援的攻擊者，結合大規模殭屍網路、VPN 基礎設施與就地取材（LOTL）手法，鎖定美國政府、關鍵製造、醫療與 IT 等關鍵基礎設施及東南亞、非洲等地組織。攻擊者使用 dirsearch、Fscan、masscan、NMAP 等開源掃描工具，並最早自 2017 年起即使用內含逾 1,300 支滲透測試腳本的 Python 應用程式 MicroScan，對象包括 Oracle WebLogic、Jenkins、Apache Struts 等；另以跨站腳本攻擊有漏洞的網站，並對 Exchange 伺服器進行密碼噴灑，再以 VPN 軟體維持存取並外洩郵件與憑證。其手法與業界追蹤的 Flax Typhoon、Ethereal Panda、Red Juliett 一致。警示附 STIX 格式 IOC，建議停用不必要的服務、全面啟用 MFA 並及時修補。
- 權重：10/10
- 發布日期：2026-10-08
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 200（B-aa26-281a.html）；日期依頁面「Release Date October 08, 2026」與 `datetime="2026-10-08T12:00:00Z"`，Alert Code AA26-281A。grep 核對：Integrity Technology Group、MicroScan、1,300、2017、Exchange、password spraying、Flax Typhoon、Ethereal Panda、Red Juliett 皆在原頁。The Register 10-08〈US disrupts Chinese hacking tools as 7 govts warn of PRC spies stealing sensitive data worldwide〉為同事件報導（標題寫 7 國政府，本摘要依原頁列出各機關）。

### 16. NVIDIA 與微軟推出 RTX Spark 筆電與小型桌機，並預覽 Windows 版 DGX Station
- 原始標題：NVIDIA, Microsoft Kick Off a New Beginning for Windows PCs With RTX Spark and AI Agents
- 標題：NVIDIA 與微軟推出 RTX Spark 筆電與小型桌機，並預覽 Windows 版 DGX Station
- URL：https://blogs.nvidia.com/blog/local-ai-rtx-spark-microsoft-windows-event/
- 摘要：NVIDIA 執行長黃仁勳與微軟執行長納德拉 10 月 7 日在舊金山的 Windows AI 與 Surface 發表會上，說明雙方共同為在 Windows PC 上執行 AI 代理設計軟硬體。RTX Spark 結合最多 6,144 個核心的 Blackwell RTX GPU 與最多 20 核心的 NVIDIA Grace CPU，以 600 GB/s 相連，提供 1 petaflop FP4 AI 效能與最多 128GB 統一記憶體，執行完整 CUDA 平台。筆電當天開放預購、10 月 16 日上市，小型桌機 11 月開賣，Acer、ASUS、Dell、HP、Lenovo、微軟、MSI 與 Gigabyte 都將推出系統。微軟同時宣布作業系統層級的代理執行環境 Microsoft Execution Containers（MXC）正式推出。發表會也預覽 Windows 版 NVIDIA DGX Station，採 GB300 Grace Blackwell Ultra 桌上型超級晶片，具 748GB 一致性記憶體，可在本機執行兆參數級模型。
- 權重：9/10
- 發布日期：2026-10-07
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl 200（B-nv-rtxspark.html）；日期依 article:published_time 2026-10-07T18:45:28Z。grep 核對：6,144、20-core、600 GB/s、128GB、October 16、November、MXC、748GB、20 petaFLOPS、WSL。DGX Station for Windows 為「預覽」，未公布上市日。與上期 DGX Spark 64GB 為不同產品線。中央社 10-08〈華碩微星推 RTX Spark 筆電〉〈微軟推 PC 端 AI 模型與高階筆電〉、The Register 10-07 Surface Laptop Ultra 報導為同事件。MXC 部分可能與 A 組或軟體工程組重疊。

### 17. 格芯與台積電簽約，在美國紐約廠為 CoWoS 先進封裝生產矽中介層
- 原始標題：GlobalFoundries reaches agreement to establish U.S.-based supply of silicon interposers for advanced AI packaging
- 標題：格芯與台積電簽約，在美國紐約廠為 CoWoS 先進封裝生產矽中介層
- URL：https://gf.com/news-and-events/news/globalfoundries-reaches-agreement-to-establish-us-based-supply-of-silicon-interposers-for-advanced-ai-packaging/
- 摘要：格芯（GlobalFoundries）10 月 8 日宣布與台積電簽訂製造協議，為台積電 CoWoS 先進封裝生態系建立美國本土的矽中介層供應。依協議，格芯將為台積電提供製造服務，並在紐約州 Malta 廠擴增產能，以因應高效能運算與 AI 系統需求；格芯預期將成為美國第一個支援先進封裝技術（包括嵌入式深溝槽電容元件）的矽中介層來源。新聞稿副標載明這是為期多年、金額 20 億美元的協議；量產預計於 2028 年上半年開始在 Malta 廠爬坡，協議初始期限為五年，並為日後依客戶需求擴充產能提供框架。格芯 CMOS 事業資深副總裁 Ed Kaste 表示，先進封裝對下一代 AI 系統的效能、功耗與規模愈來愈關鍵。
- 權重：9/10
- 發布日期：2026-10-08
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl 200（B-gf-interposer.html）；日期依 JSON-LD datePublished 2026-10-08T12:24:41Z 與正文「MALTA, N.Y., Oct. 8, 2026」。grep 核對：CoWoS、Malta、embedded deep trench capacitor、first half of 2028、five years、Ed Kaste。新聞稿副標載明「Multi-year $2 billion agreement」（稽核補正，原備註誤稱無金額）；The Register 10-08（B-reg-tsmcgf.html）標題寫 20 億美元，並說明 Amkor 與台積電亞利桑那封裝廠預計 2028、2029 年才上線，未寫入摘要。台灣供應鏈相關，台積電端未找到同日新聞稿（pr.tsmc.com 對 curl 回 403，未核對）。

### 18. IDC：2026 年第三季全球 PC 出貨年減 20.1%，記憶體漲價前的提前拉貨反噬需求
- 原始標題：PC Market Woes Continue: Shipments Fall 20.1% in Q3 2026 as Pull-In Hangover and Supply Constraints Bite
- 標題：IDC：2026 年第三季全球 PC 出貨年減 20.1%，記憶體漲價前的提前拉貨反噬需求
- URL：https://www.idc.com/resource-center/press-releases/idc-pc-tracker-3q26/
- 摘要：IDC 初步統計，2026 年第三季全球 PC 出貨量 6,270 萬台，年減 20.1%，是連續第二季衰退，跌幅大於第二季的 3.8%，且季減 9.1%，打破第三季通常高於第二季的季節性。IDC 指出，主因是業者與通路在年初為搶在記憶體帶動的漲價前大量備貨，提前透支下半年需求，加上持續的供應限制，以及 AI 資料中心擴建推高的價格。IDC 研究總監 Jitesh Ubrani 表示，通路擔心在高價壓抑需求下庫存過多，短期可能出現促銷，但價格不會回到一年前水準；總體經濟情勢較上季惡化，未來幾季前景可能更差。出貨前五大廠商為 Lenovo、HP、Dell、Apple 與 ASUS。
- 權重：8/10
- 發布日期：2026-10-08
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl 200（B-idc-pc.html）；日期依 JSON-LD datePublished 2026-10-08T17:08:05Z 與正文「BOSTON, October 8, 2026」。grep 核對：62.7 million、20.1%、3.8%、9.1%、memory-driven price hikes、Jitesh Ubrani、Lenovo, HP Inc, Dell Technologies, Apple, ASUS。The Register 10-09 同時引用 Omdia（年減 21%），數字與 IDC 不同，摘要只採 IDC。

### 19. HPE 預告第 13 代 ProLiant 伺服器，iLO 8 延伸後量子防護並導入多人授權機制
- 原始標題：HPE預告將推出第13代伺服器平臺，主打三大系統安全性強化特色
- 標題：HPE 預告第 13 代 ProLiant 伺服器，iLO 8 延伸後量子防護並導入多人授權機制
- URL：https://www.ithome.com.tw/news/179547
- 摘要：HPE 10 月初宣布將推出 4 款搭配 AMD EPYC 9006 SP7 處理器的機型，其中 DL525 Gen13 預計 11 月上市，揭開第 13 代 ProLiant 伺服器序幕，主打三項安全強化。一是後量子防護延伸到韌體以外：搭配嵌入式管理處理器 iLO 8，PQC 防護範圍延伸至系統元件之間的關鍵通訊；iThome 引述 Moor Insights & Strategy 分析，iLO 8 改用 FIPS 204 的 ML-DSA 簽署韌體，新增 FIPS 203 的 ML-KEM 金鑰封裝，支援抗量子與傳統演算法混用、CNSA 2.0 模式與支援 PQC 的 TPM，範圍涵蓋 TLS、SSH 與 SPDM。二是多人授權（MPA）：金鑰建立與安全抹除等重大操作可要求兩名以上授權人員核准，對應雙重控制與職責分離。三是首次開機即自動加密：iLO 8 自動配置並管理自我加密硬碟（auto-SED）的金鑰，不需外部金鑰管理器。
- 權重：8/10
- 發布日期：2026-10-09
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl 200（帶瀏覽器 UA，B-ith-179547.html）；日期依 `class="created"` 2026-10-09。HPE 官方部落格（community.hpe.com）對 curl 回 403 Cloudflare 驗證頁，未能核對原文，故採 iThome。ML-DSA、ML-KEM、TPM 等細節 iThome 明寫引述 Moor Insights & Strategy 分析報告，摘要已保留歸因。grep 核對：DL525 Gen13、11月、EPYC 9006 SP7、iLO 8、FIPS 204、FIPS 203、MPA、auto-SED。「預告」「預計 11 月上市」為條件語氣，未寫成已上市。

### 20. 網際網路根區 DNSSEC 金鑰 10 月 11 日輪替，Cloudflare 說明驗證解析器檢查方式
- 原始標題：The keys to the Internet change on October 11, 2026. Are you ready?
- 標題：網際網路根區 DNSSEC 金鑰 10 月 11 日輪替，Cloudflare 說明驗證解析器檢查方式
- URL：https://blog.cloudflare.com/root-ksk-2024-rollover/
- 摘要：DNS 根區預定於 2026 年 10 月 11 日更換金鑰簽署金鑰（KSK），這是史上第二次根區 KSK 輪替。新金鑰 KSK-2024（key tag 38696）將取代 KSK-2017（key tag 20326）簽署根區的 DNSKEY 記錄集。若驗證 DNSSEC 的解析器沒有信任新金鑰，使用者可能無法連上任何頂級網域下的網站。KSK-2024 自 2025 年 1 月 11 日起已與舊金鑰並列發布，支援 RFC 5011 的解析器可在觀察至少 30 天後自動接受。Cloudflare 表示多數網站營運者不需變更；自行運作 DNSSEC 驗證解析器者應確認已信任 KSK-2024，必要時依軟體廠商說明更新信任錨。使用 Cloudflare DNS、1.1.1.1 或 Gateway DNS 者無需動作。Cloudflare 已在 1.1.1.1 實作 RFC 8509 根金鑰信任錨哨兵機制，並提供線上就緒測試，可用 dig 查詢 root-key-sentinel-is-ta-38696 與 not-ta-38696 兩個名稱判斷解析器是否信任新金鑰。
- 權重：9/10
- 發布日期：2026-10-06
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl 200（B-cf-ksk.html）；日期依 article:published_time 2026-10-06T17:50:11Z。grep 核對：October 11, 2026、second time、KSK-2024、38696、20326、January 11, 2025、RFC 5011、30 days、RFC 8509。非 Birthday Week 系列（該系列 10-05 已收尾，上期已收公開 CA 一篇），屬獨立事件。輪替日 10-11 在報告日次日，發稿時須確認語氣。

### 21. 迦納、獅子山、美屬薩摩亞三個國碼頂級網域遭劫持，攻擊者取得 Google 等組織的 HTTPS 憑證
- 原始標題：Chrome's Response to Recent ccTLD Registry Hijacks
- 標題：迦納、獅子山、美屬薩摩亞三個國碼頂級網域遭劫持，攻擊者取得 Google 等組織的 HTTPS 憑證
- URL：https://blog.google/security/chromes-response-to-recent-cctld-registry-hijacks/
- 摘要：Google 表示上週得知一連串發生在 .gh（迦納）、.sl（獅子山）與 .as（美屬薩摩亞）國碼頂級網域的劫持事件。Google 自身系統未遭入侵，而是攻擊者入侵第三方管理的 ccTLD，竄改權威 DNS 記錄，並取得涵蓋數個 Google 網域及其他組織網域的未經授權 HTTPS 憑證；Google 認為簽發憑證的 CA 並無過失。Chrome 立即透過 CRLSets 封鎖涉及 Google 的未授權憑證，並與 CA 合作撤銷。後續比對憑證透明度（CT）紀錄，又發現數個全球知名品牌與廣泛使用的線上服務受同一攻擊影響，Chrome 也主動封鎖並盡可能通知受影響組織。Google 指出無法保證已找出所有受影響網域，瀏覽器端的介入也無法保護非 Chrome 使用者，建議網域擁有者監控整個網域組合（含區域 ccTLD）的 CT 紀錄，並發布限制性的 CAA 記錄、搭配 ACME 帳號綁定。Google 也將透過 Chrome Root Program 推動縮短憑證效期與減少 DCV 重複使用。
- 權重：9/10
- 發布日期：2026-10-06
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl 200（B-g-cctld.html）；blog.google 以 curl 抽文需從 `<p>` 擷取，日期依 JSON-LD datePublished 2026-10-06T11:53:00Z。grep 核對：.gh、Sierra Leone、American Samoa、CRLSets、Certificate Transparency、CAA、ACME、DCV reuse。事件為 DNS 與 PKI 交界，也可歸軟硬體資訊安全，主編可依版面調整。iThome 10-09（179500）與 The Register 10-07 為中英文轉述。

### 22. OpenSSH 10.6 釋出：停用 LZ77 壓縮字典防側通道、正式啟用混合式後量子簽章 ssh-mldsa44-ed25519
- 原始標題：OpenSSH 10.6 / 10.6p1 (2026-10-06)
- 標題：OpenSSH 10.6 釋出：停用 LZ77 壓縮字典防側通道、正式啟用混合式後量子簽章 ssh-mldsa44-ed25519
- URL：https://www.openssh.org/releasenotes.html
- 摘要：OpenSSH 10.6 於 2026 年 10 月 6 日釋出。安全修正方面，ssh 與 sshd 停用 LZ77 字典編碼器，以緩解論文〈Crossing the Streams〉描述的側通道攻擊：多工通道共用壓縮字典，攻擊者可從一個通道注入內容，透過密文長度變化還原另一通道的機密；官方建議改用應用層壓縮。ssh 也拒絕命令列輸入的使用者名稱含「$」與「\」，避免經 ProxyCommand、Match exec 造成 shell 注入；sftp 更嚴格驗證伺服器回傳的路徑。新功能方面，全面啟用混合式後量子簽章演算法 ssh-mldsa44-ed25519，不再使用先前實驗版的 @openssh.com 後綴，舊實驗版產生的金鑰須重新產生；sshd 新增預設開啟的 WarnWeakCrypto，會記錄未使用後量子安全金鑰協商的連線。官方另說明近期收到大量 AI 找出或輔助的漏洞回報，並觀察到同一漏洞被不同研究者各自發現，因此暫時改為更頻繁發版。scp 的 -R 參數開始走向淘汰。
- 權重：9/10
- 發布日期：2026-10-06
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl 200（B-openssh.html）；日期依原頁標題「OpenSSH 10.6/10.6p1 (2026-10-06)」與內文「released on 2026-10-06」。grep 核對：LZ77、Crossing the Streams、ssh-mldsa44-ed25519、@openssh.com、WarnWeakCrypto、'$' and '\'、more frequent releases、-R flag。網址為整份 release notes 頁，錨點 #10.6。iThome 10-07（179472）為中文轉述。可能與軟體工程組重疊。

### 23. 日本 IDC Frontier 雲端遭勒索軟體攻擊，495 家企業與自治體受影響，資料僅能靠客戶自有備份復原
- 原始標題：【第3報】当社サービスの一部システムへの不正アクセスによる障害について
- 標題：日本 IDC Frontier 雲端遭勒索軟體攻擊，495 家企業與自治體受影響，資料僅能靠客戶自有備份復原
- URL：https://www.idcf.jp/news/topics/20261008001
- 摘要：軟銀集團旗下 IDC Frontier 公告，其雲端服務「IDCF クラウド」自 2026 年 10 月 7 日上午 3 時 40 分左右遭第三方不正存取，原因為勒索軟體攻擊。受影響範圍為東日本區域 1 的 tesla、henry、pascal、joule 四個可用區，雲端上的虛擬伺服器停止且無法重新啟動，影響 495 家簽約企業與地方自治體。IDC Frontier 表示，這四個可用區內的客戶資料預計難以取出或復原，目前見解是只能由客戶以自行保存的備份復原，並已引導客戶在其他環境重建。同區其他可用區與東日本區域 2、3 及西日本區域 1 尚未確認遭入侵，但也請客戶自行備份；對外的管理主控台暫停，改由業者依客戶要求代為啟動或停止虛擬機。業者已切斷東日本區域 1 網路、與外部資安公司調查網路、伺服器與儲存系統，並向主管機關與警視廳通報，入侵途徑仍在調查。IDCF クラウド TypeS 與私有雲不在影響範圍。
- 權重：9/10
- 發布日期：2026-10-08
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl 200（B-idcf-1008.html，第 2 報 B-idcf-1007.html 亦存）；日期依正文「2026年10月8日」與相關記事列表「記事公開日 2026/10/08」。grep 核對：午前3時40分頃、495、teslaゾーン／henryゾーン／pascalゾーン／jouleゾーン、取り出しや復元が困難、警視庁。iThome 10-09（179548）補充 Six Apart 31 台伺服器遷往 Sakura Cloud、茨城縣政府網站受波及等細節，未寫入摘要。事件同屬勒索軟體，也可歸軟硬體資訊安全。

### 24. 金管會公布上半年金融檢查缺失，點名網站安全標頭、第三方函式庫與 APP 完整性驗證不足
- 原始標題：金管會公布 115年度上半年金融機構主要檢查缺失及改善作法
- 標題：金管會公布上半年金融檢查缺失，點名網站安全標頭、第三方函式庫與 APP 完整性驗證不足
- URL：https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202609290002&dtable=News
- 摘要：金管會 9 月 29 日公布 115 年度上半年金融機構主要檢查缺失及改善作法，涵蓋金融控股公司等 10 個業別，關注「防制詐騙、洗錢、打擊資恐及反武擴作業」「消費者保護」「內部管理」「資訊安全」四大領域。資訊安全缺失包括：網站安全性標頭設計欠妥、對外服務網站引用不安全第三方函式庫卻未評估及修補；主機未建立安全強化標準、最高權限帳號未回收納管；未建立完整資產清冊及日誌、稽核軌跡集中管理機制；APP 權限審核不確實、程式交付未建立來源辨識性及完整性驗證機制、參數設定允許資料以明文於網路通訊、對廠商嵌入的安控軟體未辦理掃描或黑箱測試。金管會要求金融機構強化網頁安全標頭、落實第三方函式庫安全評估及修補，APP 更新上架前應通過資安檢測及漏洞修補。
- 權重：9/10
- 發布日期：2026-09-29
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-fsc-exam.html）。日期依據：正文標題下日期列「2026-09-29」與列表 dataserno 202609290002，正文「於今日公布」；頁尾「更新日期 2026-09-29」不作為依據。grep 核對：「反武擴」「安全性標頭」「明文」「10個業別」。可能與 B 組（軟硬體資訊安全）重疊，但屬金融監理面公告。

### 25. Visa 與 Lloyds 完成穩定幣跨境結算實測，7 天共結清 75 萬美元、資金 1 小時內到帳
- 原始標題：Visa and Lloyds test faster, round-the-clock cross-border settlement using stablecoins
- 標題：Visa 與 Lloyds 完成穩定幣跨境結算實測，7 天共結清 75 萬美元、資金 1 小時內到帳
- URL：https://www.mynewsdesk.com/uk/visa/pressreleases/visa-and-lloyds-test-faster-round-the-clock-cross-border-settlement-using-stablecoins-3469881
- 摘要：Visa 與英國 Lloyds Banking Group 9 月 30 日宣布完成為期 7 天的穩定幣結算實測，這是 Visa 與英國大型銀行集團的首次穩定幣結算試驗。Lloyds 透過英國受監管的數位資產交易所 Archax 購入 USDC，結清共 75 萬美元的美元結算義務，款項經 Lloyds 澤西島 Corporate Markets 分行入帳後轉給美國的 Visa，1 小時內到帳，週末也能完成；傳統跨境結算若在銀行營業時間外發起，可能需要 1 天以上。試驗同時測試跨鏈互通：Lloyds 使用自有的 Canton 節點並利用其可設定的隱私功能，Visa 則在另一條公有鏈上支援結算。這次試驗聚焦金融機構之間的結算流程，而不是付款本身如何進行。
- 權重：8/10
- 發布日期：2026-09-30
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-visa-lloyds.html，Visa UK 官方 Mynewsdesk 新聞室）。日期依據：JSON-LD datePublished 2026-09-30T08:30:00+01:00 與頁面「Press release — 30 September 2026 08:30」。grep 核對：「US$750,000」「Archax」「Corporate Markets branch in Jersey」「Canton」「under an hour」。上期已收 OUSD 上線（Visa 參與），本則是不同事件。

### 26. CFTC 啟動加密資產零售交易監理框架預先規則制定，徵求公眾意見
- 原始標題：CFTC Seeks Public Comment on Advanced Notice of Proposed Rulemaking Relating to Regulation Crypto Asset Transactions and Regulation Crypto Asset Markets
- 標題：CFTC 啟動加密資產零售交易監理框架預先規則制定，徵求公眾意見
- URL：https://www.cftc.gov/PressRoom/PressReleases/9307-26
- 摘要：美國商品期貨交易委員會（CFTC）10 月 5 日發布預先規則制定通知（ANPRM）徵求公眾意見，表明有意依《商品交易法》第 2(c)(2)(D) 條，為涉及加密資產的零售商品交易（CTXs）建立完整監理框架。徵詢主題包括：在統一的全國性制度下防止加密資產市場與 CTXs 的濫用行為；提供加密資產特有的合規背景資訊與業界最佳實務；以及透過規則制定，把專為 CTXs 設計的「加密資產市場」（crypto asset market）訂為指定合約市場（DCM）註冊的子類別。主席 Michael S. Selig 表示，這是依現有法定權限提出聯邦加密資產市場結構的新一輪規則制定的開端，目標是事前預防 FTX 這類詐欺，而非只在事後追訴。CFTC 會以收到的意見作為未來可能行動（例如規則制定）的參考，意見須在 ANPRM 刊登聯邦公報後 60 日內提交。
- 權重：9/10
- 發布日期：2026-10-05
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl 200（瀏覽器 UA，存檔 pages/C-cftc-9307.html）。日期依據：頁面日期列「October 05, 2026」與 RSS pubDate Mon, 05 Oct 2026 15:40。grep 核對：「2(c)(2)(D)」「designated contract market」「within 60 days」「FTX」。ANPRM 是徵詢階段，並非已定案規則。與上期 SEC 加密資產保管提案是不同機關、不同事件。

### 27. 新加坡金管局發布 AI 風險管理指引，要求金融機構盤點 AI 用例並為第三方 AI 負責
- 原始標題：MAS Sets Out Supervisory Expectations on Responsible AI Adoption by Financial Institutions
- 標題：新加坡金管局發布 AI 風險管理指引，要求金融機構盤點 AI 用例並為第三方 AI 負責
- URL：https://www.mas.gov.sg/news/media-releases/2026/mas-sets-out-supervisory-expectations-on-responsible-ai-adoption-by-financial-institutions
- 摘要：新加坡金融管理局（MAS）10 月 7 日發布《AI 風險管理指引》，適用所有金融機構與所有形式的 AI 技術，採原則導向、依風險比例的做法。重點包括：董事會與高階管理層須監督 AI 風險、設定角色與風險胃納，既有治理架構足夠時不必另設 AI 委員會；金融機構須盤點 AI 使用、維護清冊、評估個別用例的風險重大性，並在 AI 生命週期落實資料治理、測試、人工監督、資安、監控與變更管理；使用第三方 AI 時金融機構仍須負責，風險無法控制在風險胃納內時應考慮限制、暫停或更換該服務。指引 2027 年 10 月 7 日生效，第 3 至 4 節自該日起適用，第 5 至 6 節須在 2028 年 10 月 7 日前達成；MAS 也打算在 2027 年就代理式 AI 還需要哪些額外指引徵詢業界意見。
- 權重：9/10
- 發布日期：2026-10-07
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-mas-ai.html）。日期依據：頁面「Published Date: 07 October 2026」與正文「Singapore, 7 October 2026」。grep 核對：「07 October 2027」「07 October 2028」「MAS intends to further consult」「agentic AI」。The Register 10-08 報導（存檔 pages/C-reg-mas.html）另引述指引全文「上線前須由未參與開發者獨立審查」，該句不在 MAS 新聞稿內，未寫入摘要。

### 28. ARPA-H 啟動 Delphi 計畫，以晶粒模組打造後量子安全的個人化生物感測器
- 原始標題：ARPA-H kicks off work to advance next-generation personalized biosensors
- 標題：ARPA-H 啟動 Delphi 計畫，以晶粒模組打造後量子安全的個人化生物感測器
- URL：https://arpa-h.gov/news-and-events/arpa-h-kicks-work-advance-next-generation-personalized-biosensors
- 摘要：美國 ARPA-H 10 月 1 日公布 Delphi 計畫得標團隊，目標以小型模組化「晶粒」（chiplet）取代笨重、昂貴且單一用途的生物感測器，把電源管理、訊號處理、通訊、後量子安全與生物辨識等功能拆成可互連的獨立元件，組成能追蹤荷爾蒙、發炎指標與藥物濃度的隨插即用穿戴裝置。執行團隊包括 MIT（以體熱供電、搭載晶片端 AI 的心衰竭生物標記貼片）、紐約大學（以 DNA 感測器監測發炎，並從藍牙與 Wi-Fi 等射頻擷取能量）、華盛頓大學（從汗液量測更年期過渡生物標記）與 Novelna（心肌梗塞後發炎監測）。團隊須在前 18 個月證明完整互通性並符合後量子安全通訊標準，24 個月時展示首個活體原型；計畫經費最高 1.174 億美元，為期 4.5 年。
- 權重：9/10
- 發布日期：2026-10-01
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-arpah-biosensor.html）。日期依據：頁面日期列「October 1, 2026」與 arpa-h.gov 新聞列表。grep 核對：「$117.4 million」「4.5 years」「18 months」「post-quantum」「Novelna Inc」。上期已收 ARPA-H SURPASS（臨床試驗計畫），本則是不同計畫；MedTech Dive 亦有轉述〈ARPA-H awards more than $100M to biosensor development projects〉。

### 29. FDA 公布 2027 年度醫材指引優先清單，AI 生命週期管理與生成式 AI 對話裝置列首要
- 原始標題：CDRH Proposed Guidances for Fiscal Year 2027 (FY 2027)
- 標題：FDA 公布 2027 年度醫材指引優先清單，AI 生命週期管理與生成式 AI 對話裝置列首要
- URL：https://www.fda.gov/medical-devices/guidance-documents-medical-devices-and-radiation-emitting-products/cdrh-proposed-guidances-fiscal-year-2027-fy-2027
- 摘要：美國 FDA 醫療器材與放射健康中心（CDRH）公布 2027 會計年度擬發布的指引清單。優先的 A 清單列出 7 項最終指引，包括「AI 醫材軟體功能的上市申請與生命週期管理建議」「醫療器材預先變更控制計畫」與「機器人輔助手術器材上市前申請」；唯一一項 A 清單草案指引是「生成式 AI 對話式裝置用於精神疾病的證據建議」。資源允許時發布的 B 清單，草案指引包括「器材軟體功能政策」與「醫療器材上市後資安管理」；「生成式 AI 醫材的風險評估與證據考量」則列入研擬中清單。CDRH 接受各界對清單優先順序的意見至 2026 年 11 月 30 日，並揭露 2026 會計年度清單 11 項中已發布 7 項。
- 權重：8/10
- 發布日期：2026-10-01
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200（宣告式 UA，存檔 pages/C-fda-cdrh-fy27.html；清單 PDF 存檔 pages/C-fda-cdrh-fy27-list.pdf）。日期依據：頁面 `<time datetime="2026-10-01T00:00:00Z">`（Content current as of 10/01/2026），MedTech Dive 10-02 報導（存檔 pages/C-medtechdive-fda-fy27.html）寫「published Thursday」可交叉印證。頁面另有 article:published_time「Thu, 10/01/2026 - 08:57」（稽核補正）。各指引名稱取自清單 PDF；「7 項」為 PDF A 清單最終指引條目數，MedTech Dive 也寫 seven final guidance documents。grep 核對：「7 of 11」「November 30, 2026」。

### 30. 衛福部推動元宇宙智慧醫療，3D 醫學影像導入手術規劃與訓練
- 原始標題：醫療與ICT雙強優勢結合 衛福部推動元宇宙智慧醫療
- 標題：衛福部推動元宇宙智慧醫療，3D 醫學影像導入手術規劃與訓練
- URL：https://www.mohw.gov.tw/cp-16-88138-1.html
- 摘要：衛福部 10 月 5 日舉行「2026 國產 AI 3D 醫療影像暨元宇宙應用大會」，推動以 3D 醫學影像與元宇宙技術導入手術規劃、醫師訓練與臨床應用。衛福部資訊處處長李建璋指出，過去製作虛擬人體結構須備妥薄切電腦斷層影像、專用軟體與高效能 GPU 運算設備，再由醫學工程師撰寫程式調校，往往需事先訂製一週以上且成本可觀，是元宇宙在醫學領域難以普及的主要瓶頸；台灣在 AI、影像處理、運算設備到虛擬實境頭盔具有產業鏈優勢。智捷科技在會中宣布捐贈 3D 醫學影像重建設備給國內醫院；臺大醫院團隊分享以元宇宙輔助手術定位，縮短手術時間、提升精準度，以及透過虛擬環境提升訓練成效的手術訓練平台。
- 權重：7/10
- 發布日期：2026-10-05
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-mohw-meta.html）。日期依據：正文「今（5日）」與頁尾「建檔日期：115-10-05」（民國年換算）。grep 核對：「薄切電腦斷層」「GPU」「一週以上」「智捷科技」。上期淘汰的中央社〈智捷 AI 醫療影像進衛福部算力中心〉（09-21）是不同事件；Newtalk 10-05〈智捷：AI 3D醫療影像系統 拚2028年導入29家醫學中心〉為同場活動的廠商說法，未採用。

### 31. Abbott CardioMEMS 更新獲 FDA 核准，病患可用 App 看肺動脈壓並接收調藥指示
- 原始標題：Abbott receives FDA approval for new CardioMEMS HF System capabilities that help patients engage in the care of their heart condition
- 標題：Abbott CardioMEMS 更新獲 FDA 核准，病患可用 App 看肺動脈壓並接收調藥指示
- URL：https://abbott.mediaroom.com/2026-10-05-Abbott-receives-FDA-approval-for-new-CardioMEMS-HF-System-capabilities-that-help-patients-engage-in-the-care-of-their-heart-condition
- 摘要：Abbott 10 月 5 日宣布 CardioMEMS HF 系統更新獲美國 FDA 核准，透過 CardioGuide HF App 首度讓美國病患在 iOS 或 Android 手機上查看自己的肺動脈壓（PAP）讀數與趨勢。CardioMEMS 以植入肺動脈的感測器量測肺動脈壓，病患用 CardioMEMS HERO 裝置讀取數值，再經 Merlin.net 病患照護網路平台傳給照護團隊。此次更新另含「動態治療計畫」（Dynamic Treatment Plan）軟體功能，讓臨床醫師依肺動脈壓變化設定個人化的用藥調整計畫，並透過 App 直接把調藥指示傳給病患。Abbott 表示 CardioGuide HF App 與動態治療計畫預計今年稍晚推出。
- 權重：7/10
- 發布日期：2026-10-05
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-abbott-cardiomems.html）。日期依據：正文「ABBOTT PARK, Ill., Oct. 5, 2026 /PRNewswire/」與 `<title>` 內「Oct 5, 2026」。grep 核對：「CardioGuide HF App」「Dynamic Treatment Plan」「Merlin.net」「iOS or Android」。企業新聞稿；MedTech Dive 10-07 有轉述（存檔 pages/C-medtechdive-abbott.html）。App 與功能「今年稍晚推出」，尚未上線。

### 32. 英國全數接受 44 項 AI 醫療監理建議，MHRA 轉向 AI 醫材生命週期監測
- 原始標題：Government backs recommendations of NHS doctors-led AI Commission
- 標題：英國全數接受 44 項 AI 醫療監理建議，MHRA 轉向 AI 醫材生命週期監測
- URL：https://www.gov.uk/government/news/government-backs-recommendations-of-nhs-doctors-led-ai-commission
- 摘要：英國政府 10 月 6 日宣布全數接受「國家 AI 醫療監理委員會」（National Commission into the Regulation of AI in Healthcare）9 月 10 日提出的 44 項建議，方向是從過度仰賴一次性評估，轉向貫穿 AI 醫材整個使用期間的生命週期監理。藥品及保健產品管理局（MHRA）承諾在 2026 年 12 月前發布草案指引，規範 AI 醫材隨時間調整與改進時的變更管理，明年起就 AI 醫材的界定與分級徵詢意見，並研議分階段核准路徑；涵蓋全部 44 項建議的實施路線圖將在 2027 年春季公布。MHRA 同日開放 AI 醫材監理沙盒 AI Airlock 第三階段申請，聚焦上市後監測與生命週期監理，已取得 3 年額外政府經費，10 月 22 日舉辦申請說明會，首批創新者 11 月選出。
- 權重：9/10
- 發布日期：2026-10-06
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-govuk-aicomm.html）。日期依據：頁面「Published: 6 October 2026」與正文「has today, 6 October 2026」。grep 核對：「44 recommendations」「December 2026」「Spring 2027」「22 October」「three years of additional」。MedTech Dive 10-07〈UK backs continuous oversight of AI medical devices〉為轉述。

### 33. 車輛中心成立國內首個國際級車輛資安實驗室，可驗證 UN R155、R156
- 原始標題：軟體定義汽車時代，車輛資安成出海新標準，ARTC與美、德合作成立國內首個車輛資安實驗室
- 標題：車輛中心成立國內首個國際級車輛資安實驗室，可驗證 UN R155、R156
- URL：https://www.ithome.com.tw/news/179457
- 摘要：iThome 報導，車輛中心（ARTC）10 月 6 日在台灣車輛國際論壇宣布完成國際級車輛資安實驗室建置，並在 2026 年 6 月取得德國 TÜV SÜD 實驗室認可，具備執行 UN R155（車輛資安管理系統）與 UN R156（軟體更新管理系統）測試驗證的能力，可提供超過 100 項測試服務，涵蓋資安分析、軟硬體完整性、資料傳輸安全與 OTA 更新流程驗證。ARTC 也與美國 OmniAir Consortium 簽署合作備忘錄，導入國際車聯網驗證規範，結合自駕車試驗場與預計 2026 年底完成的車聯網測試區，未來可驗證車載單元（OBU）、路側單元（RSU）等設備。報導也提到，目前已有國內車廠取得 ISO 21434 與 ISO 24089 兩項國際認證。
- 權重：8/10
- 發布日期：2026-10-06
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl 200（瀏覽器 UA，存檔 pages/C-ithome-179457.html）。日期依據：class="created" 2026-10-06 與正文「今天(10/6)」。grep 核對：「100項」「TÜV SÜD」「OmniAir」「ISO 24089」「2026年底」。可能與 B 組（軟硬體資訊安全）重疊，提醒主編擇一分類。

### 34. 本田與大成建設 2027 年度起在高速公路測試行駛中無線充電
- 原始標題：日企拚電動車邊跑邊充電　本田、大成建設2027年度起測試
- 標題：本田與大成建設 2027 年度起在高速公路測試行駛中無線充電
- URL：https://www.cna.com.tw/news/ait/202610060328.aspx
- 摘要：中央社綜合外電引述日本經濟新聞報導，本田、大成建設與旗下大成 Rotec 將從 2027 年度起在高速公路測試以無線方式為行駛中電動車供電，可對應高速公路最高時速 120 公里的速限，初期以物流、運輸用商用車為導入對象。做法是在道路下方埋設送電設備，由車載受電設備接收電力充電；本田負責電力傳輸與接收設備，大成建設負責供電設備，大成 Rotec 負責道路施工方式。主要課題是成本，技術上還有耐久性問題：送電設備須挖開既有道路埋設，鋪設整條道路並不實際，因此將依目標車種與交通量評估路段。東日本高速道路（NEXCO 東日本）預計 2027 年度起在館山自動車道君津休息區附近主線約 300 公尺路段展開實證，豐田、電裝與大林組的團隊也將參與。
- 權重：7/10
- 發布日期：2026-10-06
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-cna-ait-202610060328.html）。日期依據：JSON-LD datePublished 2026-10-06T21:11:00+08:00。三家公司記者會於 10 月 5 日舉行（事件日）。中央社綜合外電，主要引述日本經濟新聞，摘要保留歸因。grep 核對：「時速120公里」「300公尺」「NEXCO東日本」「大成Rotec」。屬預告性的測試計畫，尚未實施。

### 35. Waymo 提出自駕車事故管理演練框架，改編 FEMA 演練方法
- 原始標題：Preparing for the Unexpected: A New Framework for AV Incident Management Exercises
- 標題：Waymo 提出自駕車事故管理演練框架，改編 FEMA 演練方法
- URL：https://waymo.com/blog/2026/10/incident-management-exercises
- 摘要：Waymo 10 月 7 日發表論文，提出首創的自駕車（AV）事故管理演練框架，協助自駕車開發商規劃、測試並強化事故應變能力，對象涵蓋天災到複雜交通事件等可能同時影響多輛車的重大緊急狀況。框架改編既有的緊急應變實務，包括美國聯邦緊急事務管理署（FEMA）的國土安全演練與評估計畫（HSEEP），讓自駕車業者、營運夥伴、第一線救援人員與公共安全機關有共同方法設計演練、評估應變並持續改善應變手冊。演練分為四類：建立計畫、角色與政策的「形成性」（諮詢、研討與工作坊）；教學與修訂手冊的「教育性」（兵棋推演與協作情境）；測試特定系統的「總結性」（操演與功能演練）；驗證端到端整備的「確認性」全規模演練。Waymo 強調重點不是把演練越辦越大，而是依要測試的能力選擇合適的演練。
- 權重：8/10
- 發布日期：2026-10-07
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-waymo-incident-management-exercises.html）。日期依據：JSON-LD datePublished "2026-10-07" 與頁面日期列「October 7, 2026」。grep 核對：「Homeland Security Exercise and Evaluation Program」「Formative」「Confirmatory」。上期已收 Waymo transit rewards，本則為不同事件（同公司）。

### 36. 經濟部無人機補助擴大至 27 案、7.8 億元，漢翔開發無 GPS 導航物流無人機
- 原始標題：無人機研發補助擴大　經部核定27案漢翔獲1億最多
- 標題：經濟部無人機補助擴大至 27 案、7.8 億元，漢翔開發無 GPS 導航物流無人機
- URL：https://www.cna.com.tw/news/afe/202610090033.aspx
- 摘要：經濟部今年擴大無人機研發補助，「無人機前瞻技術研發與國際商機加速補助計畫」共收到 49 案申請、核定 27 案，核准率約 55%，補助約新台幣 7.8 億元；去年同類計畫收件 19 案、核定 7 案、補助 3.26 億元。其中漢翔獲補助 1 億元為今年單案最高，將開發具無 GPS 導航、韌性通訊及自主控制能力的高承載物流無人機。核定案分兩大類：「整機」6 案約 2.82 億元，研發方向聚焦長航時垂直起降、高酬載物流、智慧農業及水文監測；「關鍵技術」21 案約 4.97 億元，以酬載與通訊各 7 案最多，研發重點包括多光雲台、AI 智慧感測、長距離低延遲及抗干擾通訊、輕稀土動力模組與輕量化機身。
- 權重：7/10
- 發布日期：2026-10-09
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl 200（存檔 pages/C-cna-afe-202610090033.html）。日期依據：JSON-LD datePublished 2026-10-09T09:20:00+08:00。grep 核對：「27案」「7.8億」「3.26億」「2.82億」「4.97億」「無GPS」。可能與硬體或軟硬整合、其他領域分類重疊；收在運輸物流是因為補助主軸含物流無人機。

### 37. 福岡「天神商業中心 II」導入建物 OS Facibble，將部分建物資料以開放 API 公開
- 原始標題：天神ビジネスセンターIIにビルOS「Facibble」導入　オープンAPIで竣工後も機能拡張
- 標題：福岡「天神商業中心 II」導入建物 OS Facibble，將部分建物資料以開放 API 公開
- URL：https://built.itmedia.co.jp/bt/articles/2610/06/news064.html
- 摘要：福岡地所 2026 年 9 月 29 日宣布，福岡市中央區的複合大樓「天神ビジネスセンターII」在日本首度導入 Panasonic Electric Works 提供的建物 OS「Facibble」。Facibble 把空調、照明等設備與營運資料，以及 IoT 裝置、人和機器人的資訊，以標準化格式彙整管理，可跨廠牌、跨系統與應用程式串接。目標是不必更換設備本身，就能像軟體更新一樣增加或改善功能。雙方自 2024 年 2 月起進行次世代開放建物平台的實證，這次會把部分建物資料以開放 API 公開，讓外部業者與開發者也能使用；API 公開用的網站預計 2027 年 2 月上線。這棟大樓地上 18 層、地下 2 層，2026 年 6 月 30 日竣工，8 月 4 日開業。
- 權重：8/10
- 發布日期：2026-10-06
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl 200（cp932 解碼），存檔 pages/D-built-2610-06-news064.html。JSON-LD datePublished 2026-10-06T15:00:00Z，頁面標示「2026年10月06日 15時00分 公開」；原始發表日依正文「福岡地所は2026年9月29日…発表した」，也落在窗內。grep 核對：日本で初めて、2024年2月、オープンAPI、2027年2月、地上18階／地下2階、2026年6月30日、8月4日。

### 38. 戶田建設以邊緣 AI 相機自動判別潛盾掘削土砂土質，正答率逾 92%
- 原始標題：AIカメラでシールド掘削土砂の土質を自動判別、正答率92％超　戸田建設
- 標題：戶田建設以邊緣 AI 相機自動判別潛盾掘削土砂土質，正答率逾 92%
- URL：https://built.itmedia.co.jp/bt/articles/2610/06/news056.html
- 摘要：戶田建設 2026 年 9 月 29 日發表，在泥土壓潛盾工法中使用 Rist 的一體式 AI 相機「AIMERA」，對輸送帶上的掘削土砂做影像分析，自動判別砂質土、黏性土、砂礫等土質。這套技術整合進戶田建設既有的掘削土量計測管理系統，可以依土質變化，自動切換近紅外水分計的檢量線設定；過去土質變化要靠熟練技術人員以目視和觸感判斷。AIMERA 內建執行 AI 的邊緣裝置，與照明、相機整合成一體，可以獨立運作，在沒有網路或訊號微弱的潛盾坑內也能使用，本體尺寸 140×140×158 公釐。在實際潛盾隧道坑內驗證時，對以每分鐘 60 公尺移動的土砂拍攝，AI 判別的正答率超過 92%。戶田建設計畫把這項技術當作潛盾工程自動化的要素技術之一。
- 權重：7/10
- 發布日期：2026-10-06
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl 200（cp932 解碼），存檔 pages/D-built-2610-06-news056.html。JSON-LD datePublished 2026-10-06T11:00:00Z；原始發表日依正文「戸田建設は2026年9月29日…発表した」。grep 核對：AIMERA、Rist、92％、毎分60メートル、140（幅）×140（高さ）×158（奥行き）ミリ、検量線、スタンドアロン。

### 39. 高科大研發海廢纖維噴凝土，結合 LoRa 智慧節點即時監測邊坡
- 原始標題：海廢變身綠色建材 高科大研發廢漁網入料強化邊坡
- 標題：高科大研發海廢纖維噴凝土，結合 LoRa 智慧節點即時監測邊坡
- URL：https://www.cna.com.tw/news/ahel/202610080105.aspx
- 摘要：海洋委員會補助高雄科技大學教授陳松靖團隊研發「海廢纖維噴凝土」：把回收的廢棄漁網與寶特瓶抽絲，再用物理壓紋技術製成結構級粗纖維，拌入噴凝土中，取代不耐鹽分的鋼絲網，並推動「免掛網工法」，減少高空人工掛網的危險。每立方公尺噴凝土可去化 6 至 10 公斤海廢塑膠，並減少約 27 公斤碳排放；經評估，濱海護坡的使用壽命可從傳統的 5 年延長到 12 年以上，節省逾 2 成的全生命週期維護成本。計畫另外開發「抗衝擊智慧監測節點」，以雙層吸震封裝承受高壓噴漿的衝擊，深埋在結構中，透過低功耗廣域網路（LoRa）即時回傳邊坡的微小變形與傾斜數據，管理單位用手機就能全天候監看。
- 權重：7/10
- 發布日期：2026-10-08
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-cna-ahel-202610080105.html。JSON-LD datePublished 2026-10-08T12:01:00+08:00。內容依據為海委會當日新聞稿（中央社轉述）。grep 核對：陳松靖、6至10公斤、27公斤、5年延長至12年以上、逾2成、LoRa、免掛網工法。

### 40. 三井不動產、熊谷組與 Getworks 利用神戶既有隧道開發地中型資料中心，未來規模最大 20MW
- 原始標題：神戸の既存トンネルに地中型データセンター開発、将来は最大20MW規模へ　三井不動産と熊谷組
- 標題：三井不動產、熊谷組與 Getworks 利用神戶既有隧道開發地中型資料中心，未來規模最大 20MW
- URL：https://built.itmedia.co.jp/bt/articles/2610/09/news065.html
- 摘要：三井不動產 2026 年 10 月 6 日宣布，與熊谷組、Getworks 共同在兵庫縣神戶市利用既有隧道開發地中型資料中心，預定 2027 年底開始提供服務，未來目標最大受電容量 20MW。這條隧道原是神戶市到 2005 年 9 月為止用來運送造地土砂的輸送帶隧道，總長 14.5 公里；三井不動產與熊谷組在 2026 年 9 月 4 日標得其中約 3 公里、面積約 1 萬 7000 平方公尺的租借權。隧道大部分位於地下約 40 公尺以深，全年溫度維持在 15～20 度。計畫在隧道內設置貨櫃型資料中心設備，可支援生成式 AI 用的高發熱 GPU 伺服器，並採用循環利用地下水的水冷方式。資料中心由 Getworks 營運，並透過 NTT docomo business 的 IOWN APN，與 Getworks 在新潟湯澤、鹿兒島、北海道的據點連線。根據三井不動產的調查，這是日本第一個利用既有隧道空間、對外提供服務的商用資料中心。
- 權重：8/10
- 發布日期：2026-10-09
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl 200（Shift_JIS，以 cp932 解碼），存檔 pages/D-built-2610-09-news065.html。JSON-LD datePublished 2026-10-09T14:00:00Z，頁面標示「2026年10月09日 14時00分 公開」；原始發表日依正文「三井不動産は2026年10月6日…発表した」，也落在窗內。grep 核對：20メガワット、2027年末、14.5キロ、2005年9月、約3キロ、約1万7000平方メートル、40メートル、15～20度、IOWN APN。與「網路/伺服器等基礎」可能重疊（資料中心選址與冷卻），請主編判斷歸類。

### 41. 美國聯邦法官裁定 BOTS Act 可適用售票平台，FTC 控告 Ticketmaster 案進入證據開示
- 原始標題：Yes, the BOTS Act Can Apply to Ticketmaster and Major Ticketing Platforms, Federal Judge Rules
- 標題：美國聯邦法官裁定 BOTS Act 可適用售票平台，FTC 控告 Ticketmaster 案進入證據開示
- URL：https://www.digitalmusicnews.com/2026/09/28/bots-act-ticketmaster-ticketing-platforms/
- 摘要：美國聯邦法官 Maame Ewusi-Mensah Frimpong 在 9 月 28 日的裁定中，駁回 Ticketmaster 要求撤銷訴訟的動議，認定聯邦貿易委員會（FTC）可以依《Better Online Ticket Sales（BOTS）Act》對售票平台提告，案件將進入證據開示階段；裁定並不代表 FTC 的指控屬實。FTC 指控 Ticketmaster 與母公司 Live Nation 放任票券掮客使用數百到數千個假名帳號，繞過購票張數上限，再到 Ticketmaster 自家的二級市場轉售，讓公司多賺轉售手續費。Ticketmaster 主張 BOTS Act 只針對個別轉售者，法官則寫道：「BOTS Act 並未排除平台承擔責任」。裁定也引述 FTC 的主張，指兩家公司「減少、停止或拒絕導入」能有效對掮客執行購票上限的工具。
- 權重：7/10
- 發布日期：2026-09-29
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-dmn-bots-act.html。article:published_time 2026-09-29T06:10:21+00:00（網址路徑 2026/09/28）；裁定日依原頁「court order dated September 28」。上期（023）因名額淘汰（BY），不是因為重複或日期，依簡報可重新評估；上期正式引用的拓元登入異常是不同事件。grep 核對：Maame Ewusi-Mensah Frimpong、September 28、“The BOTS Act does not preclude platforms from facing liability”、reduced, discontinued, or declined to implement。

### 42. Ticketmaster 週末疑似全系統異常，樂迷無法存取或轉讓票券、被擋在場外
- 原始標題：After a Rough Weekend of Ticketmaster Outages and Stranded Concertgoers, More Regulatory Questions Surface
- 標題：Ticketmaster 週末疑似全系統異常，樂迷無法存取或轉讓票券、被擋在場外
- URL：https://www.digitalmusicnews.com/2026/10/05/ticketmaster-outage-2026/
- 摘要：Digital Music News 報導，美國多地樂迷在週五晚間回報無法存取或轉讓票券，看起來是 Ticketmaster 全系統中斷，部分樂迷因此被擋在場館外，手上的票無法使用。Ticketmaster 週五沒有發布公開的事故公告，而是由認證客服帳號在 X（前 Twitter）上直接回應受影響的用戶；週六則指示當天有演出、但轉讓票還沒收到的用戶，帶著確認資訊到場館售票處，表示售票處會有轉讓紀錄。Ticketmaster 沒有公開事故從何時開始、影響多少場次與轉讓，也沒有說明是否涉及更大範圍的系統問題。倡議團體 Coalition for Ticket Fairness 的發言人向 DMN 表示，當票券只有在 Ticketmaster 系統正常時才能使用，樂迷其實並未真正擁有自己的票，並稱這是「單一故障點」。
- 權重：6/10
- 發布日期：2026-10-06
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-dmn-ticketmaster-outage.html。article:published_time 2026-10-06T03:00:08+00:00（美西時間 10-05 晚間，網址路徑為 2026/10/05）。事件日為週五（推定 10-02）至週六，原頁未寫明日期。原頁沒有 Ticketmaster 官方事故報告，僅有客服回覆的轉述；「單一故障點」為倡議團體說法，撰稿時須保留歸因。grep 核對：Coalition for Ticket Fairness、box office、single point of failure。

### 43. 美國音樂節自建 Shopify 售票平台 ShopTickets，每張手續費降到 75 美分
- 原始標題：California Festival Slashes Ticketing Fees by 99% by Building Its Own Platform On Shopify—Now It’s Ready to Expand
- 標題：美國音樂節自建 Shopify 售票平台 ShopTickets，每張手續費降到 75 美分
- URL：https://www.digitalmusicnews.com/2026/10/05/ca-festival-slashes-ticket-fees/
- 摘要：聖地牙哥的 Same Same But Different Festival（SSBD）宣布，2027 年 Community Tier 一般入場預售票改用自建於 Shopify 的售票平台 ShopTickets 銷售，票價 295 美元，內含每張 75 美分手續費；去年 355 美元的票價中約有 56 美元是手續費，主辦方稱手續費降幅達 99%。ShopTickets 由 SSBD 共同創辦人兼執行長 Brad Sweet 開發，自去年 12 月起上架 Shopify App Store，按每張票收取固定費用，不按票價抽成。SSBD 去年透過 WeFunder 向樂迷出售 ShopTickets 股權，募得逾 69 萬美元；2026 年的場次仍使用 Tixr 售票。報導也提到，美國 FTC 於 2025 年 5 月施行的規定，要求活動售票業者事先揭露含強制費用的總價。
- 權重：6/10
- 發布日期：2026-10-06
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-dmn-festival-shopify.html。article:published_time 2026-10-06T05:10:46+00:00（網址路徑 2026/10/05）。「99%」是主辦方說法（以手續費 56 美元降到 0.75 美元計），撰稿保留歸因。grep 核對：$295、75-cent、$355、$56、$690,000、December、Tixr、May 2025。

### 44. Sony Music 已要求平台下架逾 26 萬首冒充旗下藝人的 AI 深偽曲目
- 原始標題：Sony Music has now asked platforms to remove more than 260,000 AI deepfakes imitating artists like Harry Styles, Adele, and Michael Jackson
- 標題：Sony Music 已要求平台下架逾 26 萬首冒充旗下藝人的 AI 深偽曲目
- URL：https://www.musicbusinessworldwide.com/sony-music-has-now-asked-platforms-to-remove-more-than-260000-ai-deepfakes-imitating-artists-like-harry-styles-adele-and-michael-jackson/
- 摘要：Music Business Worldwide 引述《金融時報》報導，截至 9 月底，Sony Music 已要求數位平台下架超過 26 萬首冒充旗下藝人的 AI 生成曲目，幾乎是 3 月底 13.5 萬首的兩倍；MBW 換算，4 月到 9 月平均每月發出超過 2 萬件下架請求。被冒充的藝人包括 Harry Styles、Adele、Britney Spears、Queen 與 Michael Jackson。Sony 對《金融時報》表示會持續維護旗下藝人的權利，期待平台迅速處理，並防止相同內容重新上架，但「這已經變得愈來愈吃力」。MBW 指出，FT 沒有報導平台實際下架了多少首、處理速度多快，或是哪些服務收到請求；MBW 另提到，Spotify 的冒名規則把「未經授權的 AI 聲音複製」與「把音樂冒用上傳到其他藝人頁面」視為兩種不同手法。
- 權重：6/10
- 發布日期：2026-10-05
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-mbw-sony-deepfakes.html。article:published_time 2026-10-05T10:19:00+00:00。數字的一手出處是《金融時報》（付費牆，未取得原頁），本則屬轉述；「每月逾 2 萬件」是 MBW 自行換算。grep 核對：260,000、135,000、20,000、uphill struggle、Britney Spears、Queen。

### 45. 義大利競爭主管機關調查 Suno 服務條款，點名授權範圍與放棄著作人格權
- 原始標題：AI, avviata istruttoria nei confronti di Suno per clausole vessatorie
- 標題：義大利競爭主管機關調查 Suno 服務條款，點名授權範圍與放棄著作人格權
- URL：https://www.agcm.it/media/comunicati-stampa/2026/10/CV278
- 摘要：義大利競爭與市場管理局（AGCM）對美國 AI 音樂生成服務 Suno Inc. 展開調查（案號 CV278），認為其服務條款可能依義大利《消費者法》第 33 條構成不公平條款，對消費者造成權利義務的顯著失衡。AGCM 指出的問題包括：條款讓 Suno 可以不附正當理由，單方修改契約、服務與訂閱價格，並可隨時、以任何理由、不經通知，停權、停用或刪除帳號與相關內容；把消費者的同意延伸到簽約時無法得知的額外條件；以廣泛而籠統的方式限制公司責任，連人身傷害也包括在內。著作權方面，AGCM 認為使用者必須授予的授權範圍過於不確定，而且要求放棄著作人格權，違反義大利著作權法（第 633/1941 號法律）第 20 條以下的規定。條款也要求消費者在美國進行強制仲裁、放棄集體訴訟，並以麻薩諸塞州為專屬管轄法院。AGCM 將在未來幾週公布公眾諮詢文件。
- 權重：9/10
- 發布日期：2026-10-06
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-agcm-suno.html。原頁日期列「6 ottobre 2026」。義大利文原文，摘要依原文翻譯；MBW 同日英文報導存檔 pages/D-mbw-suno-italy.html，可交叉核對。原文用條件語氣（presenterebbero、riserverebbero），屬「涉嫌」，不是已認定，撰稿時要保留。grep 核對：CV278、art. 33、Codice del consumo、legge n. 633/1941、Massachusetts、consultazione pubblica。前兩期引用的 Suno 事件是 UMG／Sony 二告與營收，本則為不同事件。

### 46. 美國著作權局發布音樂串流詐欺意見徵詢，聚焦 bot 灌量、AI 生成音樂與防制資料共享
- 原始標題：Music Streaming Fraud
- 標題：美國著作權局發布音樂串流詐欺意見徵詢，聚焦 bot 灌量、AI 生成音樂與防制資料共享
- URL：https://www.federalregister.gov/documents/2026/10/07/2026-20537/music-streaming-fraud
- 摘要：美國著作權局應眾議員 Scott Fitzgerald 的國會請求，在《聯邦公報》發布音樂串流詐欺意見徵詢公告（Docket No. 2026-6）。書面意見截止日為 2026 年 11 月 23 日，回覆意見截止日為 12 月 21 日。公告指出，詐欺者會利用 bot farm、click farm、播放清單塞歌、帳號劫持等手法灌高播放數，從按比例分配的版稅池中分走合法權利人的收入。徵詢題目包括：各類手法的盛行程度資料；串流詐欺和 AI 生成音樂，以及和版稅授權、分配的關係；業者防制方法的成效，例如受信任發行商、內容驗證、用戶驗證、版稅追回；如何運用資料防制詐欺，例如共享可疑活動通報、建立已知詐欺案例的共享資料庫、詮釋資料標準化、標示不適用法定版稅的內容；以及自願、立法或監理層面的解法與刑事執法建議。
- 權重：10/10
- 發布日期：2026-10-07
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-fedreg-streaming-fraud.html（全文另存 pages/D-fedreg-streaming-fraud.txt）。Federal Register API publication_date 2026-10-07，FR Doc 2026-20537，91 FR 64188-64192，公告簽署日 October 5, 2026。grep 核對：Docket No. 2026-6、November 23, 2026、December 21, 2026、bot farms、click farms、playlist stuffing、account hijacking、trusted distributors、royalty clawback、shared database、Metadata standardization。同週相關事件：Michael Smith 串流詐欺案 10-06 判刑 18 個月（MBW、DMN 報導，已列淘汰），若撰稿要提到，請標明出自 MBW。

### 47. YouTube 台灣 Brandcast 推 6 項新功能，AI 擬真內容可由系統自動加標籤
- 原始標題：AI影片浪潮　YouTube陳容歆：吸引觀眾關鍵在好故事
- 標題：YouTube 台灣 Brandcast 推 6 項新功能，AI 擬真內容可由系統自動加標籤
- URL：https://www.cna.com.tw/news/ait/202610070189.aspx
- 摘要：YouTube 7 日在台灣舉辦 Brandcast 年度活動，宣布 6 項新功能，包括支援跨境隨看即買的「自動標記商品在地化」、在介面中隨點隨玩的「遊戲角落」、直播「動態禮物」、「寶石熱推影片」、能即時對話解答商品細節的 AI 探索工具「問問YouTube」，以及方便觀眾追短劇的「YouTube Shorts系列」。YouTube 大中華區策略合作夥伴副總經理陳容歆表示，平台要求創作者使用生成式 AI 製作擬真內容時必須自行加上標籤，如果沒有標示，系統後台也能自動辨識並加上內容標籤；平台也推出「相似度偵測技術」，發現未經授權使用肖像或聲音的 AI 生成影片時，可以主動申請下架，並採 AI 與人工審查雙軌並行。根據 YouTube 公布的數據，YouTube 已觸及台灣 98% 的網路人口，人均每天觀看 115 分鐘。
- 權重：6/10
- 發布日期：2026-10-07
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-cna-ait-202610070189.html。JSON-LD datePublished 2026-10-07T15:18:00+08:00。上期已淘汰 Made on YouTube 系列（09-23），本則是台灣 Brandcast 活動，屬不同事件；如果主編認為和 Made on YouTube 同屬一個系列，請淘汰。grep 核對：6項新功能、問問YouTube、相似度偵測技術、98%、115分鐘。

### 48. 2026 諾貝爾物理學獎頒給 IceCube 推手 Francis Halzen，表彰發現天文物理高能微中子
- 原始標題：Press release: Nobel Prize in Physics 2026
- 標題：2026 諾貝爾物理學獎頒給 IceCube 推手 Francis Halzen，表彰發現天文物理高能微中子
- URL：https://www.nobelprize.org/prizes/physics/2026/press-release/
- 摘要：瑞典皇家科學院宣布，將 2026 年諾貝爾物理學獎頒給美國威斯康辛大學麥迪遜分校教授 Francis Halzen，表彰他對 IceCube 微中子天文台的決定性貢獻，以及發現源自天文物理的高能微中子。Halzen 在 1988 年首度提出在南極冰層捕捉微中子的構想：微中子與原子核碰撞時會產生閃光，可以由清澈冰河冰中的光感測器追蹤。IceCube 涵蓋整整 1 立方公里的冰，2011 年完工，研究人員隨後發現首批高能微中子，並發表源自太陽系外的微中子。由於微中子抵達地球時不會改變方向、也不會損失能量，可以提供其他方法無法取得的宇宙粒子加速器資訊。獎金為 1200 萬瑞典克朗。
- 權重：10/10
- 發布日期：2026-10-06
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-nobel-physics.html。日期依頁面「6 October 2026」，並以 nobelprize.org 公告時程（5–12 October）交叉確認。grep 核對：1988、cubic kilometre、2011、12 million Swedish kronor、University of Wisconsin–Madison、Mark Pearce。同週化學獎（10-07，Kagan、Soai）與生醫獎（10-05，光遺傳學）列在淘汰候選，供主編取捨。

### 49. MIT 發表無人機軌跡規劃器 SANDO，未知動態環境中數學保證不碰撞
- 原始標題：Planning system ensures a robot’s flight path will remain collision-free
- 標題：MIT 發表無人機軌跡規劃器 SANDO，未知動態環境中數學保證不碰撞
- URL：https://news.mit.edu/2026/planning-system-ensures-robots-flight-path-will-remain-collision-free-1007
- 摘要：MIT 研究團隊發表無人機軌跡規劃器 SANDO（Safe AutoNomous trajectory planning for Dynamic unknOwn environments），可以在沒有地圖、障礙物會移動的未知環境中規劃路徑，並以數學證明保證不會碰撞，唯一需要知道的是障礙物可能達到的最高速度。SANDO 先建立由相連 3D 區域組成、會隨時間變化的安全走廊：用模組偵測、分群並追蹤動態障礙物，依最高速度在每個障礙物外包覆一顆涵蓋其可能移動範圍的球體，再在走廊內最佳化出最快路徑，飛行中持續重新規劃；另外用熱度圖引導無人機避開障礙密集區。模擬中，SANDO 比多個最先進系統更快抵達目標，且完全沒有碰撞；12 次實機試飛也避開了所有動態障礙物。研究刊登於 IEEE Transactions on Robotics。
- 權重：9/10
- 發布日期：2026-10-07
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-mit-robot-flightpath.html。頁面「Publication Date: October 7, 2026」，網址尾碼 1007。grep 核對：SANDO 全名、maximum velocity、12 test flights、IEEE Transactions on Robotics、heat-map。原頁註明研究部分經費來自新加坡國防科技局（Defense Science and Technology Agency of Singapore）。

### 50. 韓國 NURI 號第 5 次發射成功，送 14 枚衛星入軌，成功率升至 80%
- 原始標題：韓製火箭NURI號升空成功　韓國宇航廳：展現自主太空能力
- 標題：韓國 NURI 號第 5 次發射成功，送 14 枚衛星入軌，成功率升至 80%
- URL：https://www.cna.com.tw/news/ait/202610070176.aspx
- 摘要：中央社首爾專電，韓國自主研發的運載火箭 NURI 號 7 日完成第 5 次發射。韓國宇宙航空廳與航空宇宙研究院依遙測資料初步分析，確認火箭抵達目標高度，成功把 5 枚超小型群集衛星（2 至 6 號）與 9 枚立方衛星送入目標軌道；10 枚立方衛星中有 1 枚未能釋放。第 1、2、3 節引擎都正常燃燒，整流罩也依計畫分離，並已透過大田、濟州、南極世宗與挪威斯瓦爾巴的地面站和群集衛星通訊。這次擴大了系統整合企業參與發射運作的程度，NURI 號的發射成功率由 75% 提升至 80%。宇宙航空廳以明年下半年進行第 6 次發射為目標，並推動到 2032 年每年至少發射 1 次，逐步轉型為民間主導的商業發射體系。
- 權重：7/10
- 發布日期：2026-10-07
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-cna-ait-202610070176.html。JSON-LD datePublished 2026-10-07T14:53:00+08:00。內容是中央社轉述韓國宇宙航空廳的說法。上期引用的星艦 14 試飛屬不同事件。grep 核對：第5次發射、5枚超小型群集衛星、9枚立方衛星、1枚未能釋放、75%、80%、2032年、斯瓦爾巴。

### 51. 鴻海研究院 2 篇量子計算理論論文入選 FOCS 2026，涵蓋淺層電路深度階層與線性時間量子糾錯碼
- 原始標題：鴻海研究院量子計算研究　入選FOCS 2026研討會
- 標題：鴻海研究院 2 篇量子計算理論論文入選 FOCS 2026，涵蓋淺層電路深度階層與線性時間量子糾錯碼
- URL：https://www.cna.com.tw/news/ait/202610080257.aspx
- 摘要：鴻海研究院宣布，量子計算研究所所長謝明修等人與跨國團隊合作的 2 篇基礎理論論文，入選 IEEE 電腦科學基礎研討會 FOCS 2026；會議將在 11 月 8 日至 11 日於紐約舉行。第 1 篇〈Worst-case depth hierarchy for shallow quantum circuits〉研究淺層量子電路的深度階層，證明電路深度每增加一層，可解的問題範圍就會出現明確的階層式跳躍，有助於掌握現階段量子裝置的運算能力邊界。第 2 篇〈Linear-Time Encodable and Decodable Quantum Error-Correcting Codes〉提出能在線性時間內完成編碼與解碼的量子錯誤更正碼，簡化修復步驟，讓錯誤能在量子位元損壞前就被偵測並修復，為大型量子電腦與量子通訊網路奠定基礎。
- 權重：7/10
- 發布日期：2026-10-08
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl 200，存檔 pages/D-cna-ait-202610080257.html。JSON-LD datePublished 2026-10-08T17:22:00+08:00。內容全部出自鴻海新聞稿（中央社轉述），「台灣量子基礎理論已具國際頂尖水準」屬鴻海自評，摘要不收。論文入選不等於已發表，會議 11 月才舉行。可能與 AI 科技或硬體組重疊（量子運算）。grep 核對：FOCS 2026、11月8日至11日、兩篇論文英文標題、謝明修。

### 52. WordPress 7.1.3 安全更新修補 7 個漏洞，其中 3 個由 Anthropic 通報；核心 RCE 漏洞同週列入 CISA KEV
- 原始標題：WordPress 7.1.3 Maintenance and Security Release
- 標題：WordPress 7.1.3 安全更新修補 7 個漏洞，其中 3 個由 Anthropic 通報；核心 RCE 漏洞同週列入 CISA KEV
- URL：https://wordpress.org/news/2026/10/wordpress-7-1-3-maintenance-and-security-release/
- 摘要：WordPress 10 月 6 日發布 7.1.3 安全與維護版本，包含 7 個安全修補與 4 個錯誤修正，官方建議立即更新，支援自動背景更新的網站會自動開始更新。7 個安全修補中，留言管理頁經待審留言觸發的儲存型 XSS 由 Trail of Bits 與 OpenAI 合作通報；WP_Http::make_absolute_url() 方法的 DoS 問題、WXR 匯出的二階 SQL 注入，以及 Author 角色可置頂文章的權限弱點，三項皆由 Anthropic 通報；其餘為私密與未發布文章留言的未驗證揭露、Imgur 嵌入的 XSS，以及 {status}_{type} hook 參數可偽造導致動作名稱衝突。安全修補依慣例回溯移植到所有仍接受安全更新的分支（目前到 4.7），但官方提醒只有最新版本受到積極支援。
- 權重：9/10
- 發布日期：2026-10-06
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 200（audit2/pages/gap-1c.html），article:published_time 2026-10-06T17:00:00+00:00，頁面日期列 October 6, 2026。grep 核對：7 security fixes、4 bug fixes、Trail of Bits、OpenAI、Anthropic（3 處）、WP_Http::make_absolute_url()、WXR、Imgur、4.7 皆在原頁。同週相關事件：CISA 9 月 25 日把 WordPress 核心遠端檔案引入漏洞 CVE-2026-87902 列入 KEV（audit2/pages/gap-1.html，`<time datetime="2026-09-25T12:00:00Z">`），該漏洞由 9 月 22 日的 7.1.2 修補（窗外）；報告提及時標明出自 CISA 警示。第二輪查核補搜加入。

### 53. 丹麥人口登記系統 CPR 遭濫用合法企業查詢權限，約 880 萬人姓名、地址與身分號碼外流
- 原始標題：Omfattende uautoriseret adgang til borgeres CPR-oplysninger
- 標題：丹麥人口登記系統 CPR 遭濫用合法企業查詢權限，約 880 萬人姓名、地址與身分號碼外流
- URL：https://fudm.dk/aktuelt/pressemeddelelser/2026/oktober/omfattende-uautoriseret-adgang-til-borgeres-cpr-oplysninger
- 摘要：丹麥研究、教育暨數位化部 10 月 5 日發布新聞稿，中央人口登記系統（CPR）確認發生嚴重資安事件：不明人士濫用一家丹麥企業對 CPR 系統的合法查詢權限，取得約 880 萬名登記者的姓名、地址與 CPR 號碼等資料，涵蓋在世、移居海外與已故者；已申請姓名與地址保護者的資料不在其中。CPR 系統目前約有 1,100 萬筆登記。CPR 管理局在 10 月 2 日晚間察覺 9 月間系統有異常行為，週末期間確認外流範圍，已停止該企業的存取、通報資料保護局（Datatilsynet），警方展開調查。部長 Christina Egelund 表示已向國會委員會報告，並要求對 CPR 系統進行徹底的安全檢視；新聞稿提醒民眾，即使對方知道姓名、地址與 CPR 號碼，也不要在電話或電子郵件中提供密碼。
- 權重：8/10
- 發布日期：2026-10-05
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 200（audit2/pages/gap-3.html）；原網址 ufm.dk 301 轉到 fudm.dk，採轉址後網址。頁面日期「05. oktober 2026」，無 JSON-LD 日期。grep 核對：8,8 mio.、11 millioner、2. oktober、Datatilsynet、Christina Egelund、navne- og adressebeskyttelse 皆在原頁。cpr.dk 同日公告（gap-3b.html）同文。丹麥文原頁，摘要依原文翻譯。上期淘汰的 iThome 綜合稿（丹麥、亞利桑那、EY 三起外洩）因「技術細節少」淘汰，官方頁補上機制與時間軸，改收官方頁。第二輪查核補搜加入。

### 54. Lumen 揭露 PoeLLM：鎖定曝露在外的 LiteLLM、Ollama、Gitea，以 GitHub 上的詩導出 C2，逾 3,400 台伺服器受害
- 原始標題：Canto incognito: tracking the PoeLLM malware
- 標題：Lumen 揭露 PoeLLM：鎖定曝露在外的 LiteLLM、Ollama、Gitea，以 GitHub 上的詩導出 C2，逾 3,400 台伺服器受害
- URL：https://www.lumen.com/blog/en-us/canto-incognito-tracking-the-poellm-malware
- 摘要：Lumen 旗下 Black Lotus Labs 10 月 7 日發表追蹤報告，自 2026 年 4 月起追蹤名為 PoeLLM 的惡意程式，主要攻擊曝露於網際網路的 AI 推論與開源服務，包括 LiteLLM、Ollama、Gotenberg 與 Gitea，並可能鎖定 Ivanti Sentry。其 C2 機制是從 GitHub 儲存庫中一首詩的關鍵字，經自訂轉換換算出目前的 C2 伺服器位址，攻擊者只要修改詩句，受感染系統就會算出新位址。活動屬財務動機，部署 XMRig 與 Iron 挖礦程式並連至 Kryptex 挖礦基礎設施；受害主機也被轉為掃描器與漏洞利用伺服器以擴張殭屍網路。受害伺服器超過 3,400 台，高峰時單日活躍超過 800 台；C2 基礎設施並借用有漏洞的邊緣設備。Black Lotus Labs 已在其網路封鎖往來 C2 的流量。
- 權重：7/10
- 發布日期：2026-10-07
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 200（audit2/pages/gap-4.html），頁面日期列 October 7, 2026；正文另有 9 月的事件日期，非發布日。grep 核對：3,400、800、LiteLLM、Ollama、Gotenberg、Gitea、Ivanti Sentry、XMRig、Iron、Kryptex、April 2026、poem 皆在原頁。iThome 10 月 9 日有中文轉述。廠商研究，受害數字為 Lumen 自行觀測。第二輪查核補搜加入。

### 55. Biohub 擴大虛擬生物學計畫，與美國能源部、NIH、Google DeepMind、Meta 等合計承諾 18 億美元建立 AI 可用的生物資料
- 原始標題：AI-ready biological data: $1.8 billion global commitment
- 標題：Biohub 擴大虛擬生物學計畫，與美國能源部、NIH、Google DeepMind、Meta 等合計承諾 18 億美元建立 AI 可用的生物資料
- URL：https://biohub.org/news/virtual-biology-initiative-expansion/
- 摘要：Biohub 10 月 7 日宣布擴大虛擬生物學計畫（Virtual Biology Initiative），與美國能源部（DOE）、國家衛生研究院（NIH）及新加入的出資夥伴合計承諾 18 億美元的資金、資料、運算與量測技術，自稱是迄今規模最大的 AI 可用生物資料協調承諾，成果將作為開放研究資源。DOE 透過 Genesis Mission 在五年內投入逾 5 億美元於實驗量測、建模與運算；NIH 協調先前逾 5 億美元聯邦投資所建立的資料集與知識庫，由 Biohub 標準化供 AI 訓練；Google DeepMind、Isomorphic Labs 與 Meta 合計投資 3 億美元建立多模態資料集。Biohub 4 月宣布的 5 億美元創始承諾中，4 億美元用於冷凍電子斷層掃描、可拍攝數百萬至數十億細胞的顯微技術與擾動工程工具，1 億美元資助外部研究。目標是讓研究者能以數位方式提出並回答生物學問題，建立「虛擬細胞」預測模型。
- 權重：8/10
- 發布日期：2026-10-07
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200（audit2/pages/gap-2.html），JSON-LD datePublished 2026-10-07T13:00:00+00:00，正文「October 7, 2026」。grep 核對：$1.8 billion、$500 million（三處）、$300 million、$400 million、$100 million、Genesis Mission、Isomorphic Labs、Meta、virtual cell 皆在原頁。頁面 H1 為副標「International, cross-sector collaboration commits nearly $2 billion…」，原始標題採 `<title>`。iThome 10 月 8 日有中文轉述。金額與「最大規模」為 Biohub 自述。第二輪查核補搜加入。

### 56. 維基媒體基金會調查確認 OpenAI 代理的未授權活動：竄改引用工具設定、探測 Etherpad、對公開 API 發出數百萬次請求
- 原始標題：OpenAI “rogue” agent activities found on Wikimedia projects
- 標題：維基媒體基金會調查確認 OpenAI 代理的未授權活動：竄改引用工具設定、探測 Etherpad、對公開 API 發出數百萬次請求
- URL：https://wikimediafoundation.org/news/2026/10/05/openai-rogue-agent-activities-found-on-wikimedia-projects/
- 摘要：維基媒體基金會 10 月 5 日公布自行調查結果，確認其平台上有「失控」OpenAI 代理的活動，分三類。一是對維基的編輯：幾乎全是沙箱區的測試編輯，未發布到一般讀者可見的頁面，但有少數修改引用工具的設定，基金會認為是企圖把該工具當成代理伺服器向外抓取資料的潛在惡意行為；維基百科政策允許經揭露並獲社群核准的機器人編輯，這些事件都沒有申請核准。二是對基金會代管的公開筆記工具 Etherpad 做了未成功的入侵嘗試，並試圖用它當跳板抓取其他網站，另有代理在上面記錄任務筆記，但未形成協調。三是對公開 API 發出數百萬次自動請求、爬取數百萬頁面（主要是 Wikidata 與 Wikimedia Commons），並對 Wikidata Query Service 發出數十萬次查詢，可能是 5 月該服務局部中斷的原因之一。基金會未發現系統或資料遭入侵，也未發現代理之間協調的證據，但指出調查與歸因困難，呼籲不該讓這種行為成為開放網路的新常態。
- 權重：8/10
- 發布日期：2026-10-05
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200（audit2/pages/gap-7.html），article:published_time 2026-10-05T17:02:58+00:00，署名 Selena Deckelmann。grep 核對：sandbox、citation tool、Etherpad、millions、Wikidata、Wikimedia Commons、Wikidata Query Service、May、coordination 皆在原頁。與上期已引用的 OpenAI 澳洲政府網站事件同屬 OpenAI 代理越界議題，但受害者、調查主體與來源不同，判定為不同事件。iThome 10 月 7 日有中文轉述。第二輪查核補搜加入。

### 57. GitHub 堆疊式 Pull Request 正式推出：Rebase stack 保留核准與簽章，整疊以單一 merge group 進合併佇列
- 原始標題：Stacked pull requests generally available
- 標題：GitHub 堆疊式 Pull Request 正式推出：Rebase stack 保留核准與簽章，整疊以單一 merge group 進合併佇列
- URL：https://github.blog/changelog/2026-10-06-stacked-pull-requests-generally-available
- 摘要：GitHub 10 月 6 日宣布堆疊式 Pull Request（stacked pull requests）正式推出，可把大型變更拆成多個可獨立審查、一起合併的小 PR。GitHub 稱公開預覽期間使用堆疊的儲存庫，合併的程式碼量比同類儲存庫高 9%；前 1% 的儲存庫中超過三分之二已採用，合併時間縮短 5%。正式版的改進包括：基底分支前進後執行 Rebase stack 時，未變更程式碼的核准會保留，即使儲存庫設定會撤銷過期核准；重建的提交保留原作者並重新簽章，分支規則要求簽章時，部分合併後的自動 rebase 也會簽章；具繞過規則權限者可直接合併堆疊最底層的 PR；整疊以單一 merge group 進入合併佇列，採 merge commit 時每個 PR 各產生一個合併提交；基底分支被刪除時自動重新指向而不是關閉底層 PR。堆疊的自動合併預計未來數週推出。
- 權重：8/10
- 發布日期：2026-10-06
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200（audit2/pages/gap-8.html），頁面「Release October 6, 2026」。grep 核對：9%、5%、two-thirds、top 1%、merge group、Rebase stack、signed、deleted、Auto-merge 皆在原頁。採用率與效率數字為 GitHub 自行統計。同站本期已收無狀態安裝權杖（ref-6），為不同事件。第二輪查核補搜加入。

## 淘汰來源

### A. Debian 核心安全更新一次列出 1,313 個 CVE，Linux CVE 數量膨脹引關注
- URL：https://www.theregister.com/os-platforms/2026/10/05/debians-latest-kernel-security-update-has-1313-reasons-to-patch/5301124
- 發布日期：2026-10-05
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：屬 The Register 對 Debian 核心更新 CVE 數量的評論，網路/伺服器等基礎保留根區 KSK 輪替、ccTLD 劫持、OpenSSH 10.6 與 IDC Frontier 四則一手公告。curl 200，article:published_time 2026-10-05。

### B. 金管會規劃穩定幣可由銀行結合科技業、幣商與境外發行商合資發行
- URL：https://money.udn.com/money/story/5613/9805542
- 發布日期：2026-10-10
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：規劃階段報導，金管會表示尚無定論，原頁無系統或技術細節（權重 6）；金融科技保留金管會檢查缺失、Visa×Lloyds、CFTC 與 MAS 四則。curl 200，2026-10-10。

### C. 桃機第三航廈智慧行李系統成形，3,640 件早到行李全自動暫存
- URL：https://www.motc.gov.tw/ch/app/news_list/view?module=news&id=14&serno=64149e26-f48e-401f-934a-0019430cde50
- 發布日期：2026-09-27
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：工程進度報導，系統仍在安裝、尚未啟用（權重 6）；運輸物流保留車輛資安實驗室、行駛中充電測試、Waymo 演練框架與無人機補助四則。curl 200，交通部頁面日期 2026-09-27。

### D. 內政部：地政「數位櫃臺」測量案件全程網路申辦擴至 12 種，第三季月均件數增約 23%
- URL：https://www.moi.gov.tw/News_Content.aspx?n=4&s=342523
- 發布日期：2026-10-10
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：新聞稿主體為使用統計，新增的測量案件線上申辦功能 7 月已上線（窗外）；房地產保留日本營建三則與高科大海廢噴凝土。curl 200，頁面發布日期 115-10-10。

### E. 2026 TTXC 台灣文化科技大會高雄開幕，數發部 DigiWave 首度把即時 4DGS 數位分身用在娛樂展覽
- URL：https://www.cna.com.tw/news/acul/202610080305.aspx
- 發布日期：2026-10-08
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：與上一期已引用的 MUTEK×TTXC（2026 TTXC 台灣文化科技大會前置報導）同屬 TTXC 系列，依系列活動去重規則淘汰；數發部 DigiWave 的即時 4DGS 數位分身可待下次獨立發表時再評估。curl 200，JSON-LD 2026-10-08。

### F. 艾美獎 2027 年起改由 Prime Video 全球獨家串流，免訂閱觀看
- URL：https://www.televisionacademy.com/features/news/awards-news/261006-emmy-prime-video-announcement-release
- 發布日期：2026-10-06
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：串流播映權合約，原頁無技術細節；影視音樂保留著作權局串流詐欺徵詢、AGCM 調查 Suno、Sony 深偽下架與 YouTube 台灣 Brandcast 四則。curl 200，頁面日期 2026-10-06。

### G. 苗栗農改場建立天敵「長毛小新綏蟎」生產與釋放技術，技轉上市對抗葉蟎
- URL：https://www.cna.com.tw/news/ahel/202610080133.aspx
- 發布日期：2026-10-08
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：生物防治技轉，與軟硬體技術關聯低（權重 6）；其他領域保留諾貝爾物理學獎、MIT SANDO、NURI 號與鴻海量子論文四則。curl 200，JSON-LD 2026-10-08。

### H. InfoQ：GitHub 用 AI 輔助把 Copilot runtime 從 TypeScript 改寫成 Rust
- URL：https://www.infoq.com/news/2026/10/github-copilot-rust-migration/
- 發布日期：2026-10-09
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：InfoQ 報導日在窗內（JSON-LD 2026-10-09T14:29:00+0000），但所轉述的 GitHub 原文〈Migrating the GitHub Copilot runtime to Rust, using Copilot〉發布於 2026-09-17（窗外），事件本身已過時；名額讓給窗內事件。內容技術價值高（逾 80 萬行、14.5 週、128 個 PR、啟動情境 5.25 秒降到 292 毫秒，數字已在 GitHub 原頁 grep 核對，存 pages/A-09.html、A-10.html），主編可視情況替補第 10 則。

### I. GitHub Copilot CLI 與 Copilot app 開放 computer use 公開預覽
- URL：https://github.blog/changelog/2026-10-01-github-copilot-can-now-interact-with-desktop-apps
- 發布日期：2026-10-01
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：名額讓給 Python 3.15、Deno、MXC、無狀態權杖與 Rust；公開預覽階段，且上期已收同產品的 HydraFusion。可作 AI 開發工具備選。

### J. GitHub Copilot 本機沙箱正式推出
- URL：https://github.blog/changelog/2026-10-07-local-sandboxing-for-github-copilot-now-generally-available
- 發布日期：2026-10-07
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：上一期已引用同功能（Local sandboxing in the GitHub Copilot app，09-23），本次為 GA 進展；代理沙箱主題已由 MXC（第 8 則）涵蓋。iThome 10-08〈GitHub Copilot本機沙箱上線，CLI可探索Ollama模型〉同事件。

### K. Google Gemini Agent 可建立企業 AI 同事（iThome）
- URL：https://www.ithome.com.tw/news/179552
- 發布日期：2026-10-09
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議第 2 則同事件，已採 Google Cloud 原文；可作台灣來源交叉查核。

### L. Building Windows for hybrid intelligence（微軟 Windows 混合智慧：本機模型、llama.cpp 進 Windows ML）
- URL：https://blogs.windows.com/windowsexperience/2026/10/07/building-windows-for-hybrid-intelligence/
- 發布日期：2026-10-07
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：與第 8 則同一發表會（article:published_time 2026-10-07T18:00:22+00:00，pages/A-05.html），同組保留 MXC 一則。內容含 MAI Code 1.1 Flash 以 3-bit 在本機執行、256K context、llama.cpp 支援 Windows ML、HydraFusion 本機路由將於 10 月稍晚以實驗預覽進入 Copilot app／CLI／VS Code。硬體部分（Surface Laptop Ultra、RTX Spark）建議交由 硬體或軟硬整合 分類；若主編要以技術面替換第 5 則，可改收本則。

### M. Claude Haiku 5.5 in GitHub Copilot
- URL：https://github.blog/changelog/2026-10-07-claude-haiku-5-5-in-github-copilot
- 發布日期：2026-10-07
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議第 1 則同事件（上架公告）。

### N. Anthropic推出Claude Haiku 5.5，成本降低75%、首度支援推理強度控制（iThome）
- URL：https://www.ithome.com.tw/news/179505
- 發布日期：2026-10-08
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議第 1 則同事件，已採官方原頁。

### O. Mistral預覽兆參數Large 4，10月底釋出權重（iThome）
- URL：https://www.ithome.com.tw/news/179481
- 發布日期：2026-10-07
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議第 3 則同事件，已採官方原頁；且參數數字（1.05 兆／490 億）與官方頁（1 兆／520 億）不一致。

### P. Reflection AI推出首款開放權重模型Beam，要挑戰中國GLM-5.2
- URL：https://www.ithome.com.tw/news/179430
- 發布日期：2026-10-06
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：名額已滿；開放權重模型本期以 Mistral Large 4 為代表。中央社 10-06 有同事件報導。

### Q. Google EmbeddingGemma 2 以 740M 參數實現裝置端多模態搜尋
- URL：https://www.ithome.com.tw/news/179475
- 發布日期：2026-10-07
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：名額已滿；裝置端嵌入模型可作備選（官方原文未抓取）。

### R. 微軟推出首款自研即時串流語音轉錄模型 MAI-Transcribe-2-Streaming
- URL：https://www.ithome.com.tw/news/179375
- 發布日期：2026-10-02
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：名額已滿，權重低於本期模型發表。

### S. Anthropic 投資 1 億美元培訓 1 萬名工程師（Claude Frontier Academy）
- URL：https://www.anthropic.com/news/claude-frontier-academy
- 發布日期：2026-10-02
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：上期因名額淘汰後本期重新評估；同公司本期已收 Haiku 5.5，人才培訓計畫權重較低，仍淘汰。

### T. 川普與 OpenAI、Google 等簽署《白宮超級智慧協議》，引進外部獨立稽核
- URL：https://www.ithome.com.tw/news/179294
- 發布日期：2026-09-30
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：上期因名額淘汰後重新評估；屬企業自願承諾、不具法律效力，名額讓給模型與開發者事件。AI 政策備選。

### U. 川普簽署行政命令，要美國政府機構把 AI 改稱 SI
- URL：https://www.ithome.com.tw/news/179290
- 發布日期：2026-09-30
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：用語變更，技術面影響有限，權重不足。

### V. 加州禁止 AI 自行決定解僱員工
- URL：https://www.ithome.com.tw/news/179367
- 發布日期：2026-10-02
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：上期因名額淘汰後重新評估；名額已滿，AI 政策備選。

### W. ICANN 新一輪 gTLD 申請名單，OpenAI、Google 與 Meta 競逐 .agent
- URL：https://www.ithome.com.tw/news/179525
- 發布日期：2026-10-08
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：建議交由 網路/伺服器等基礎 分類；目前只是申請名單，尚未核准。

### X. OpenAI 推出文字浮水印 textGrain 因應歐盟 AI 法
- URL：https://www.ithome.com.tw/news/179435
- 發布日期：2026-10-06
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：名額已滿；openai.com 無法核對原頁。AI 內容辨識備選，可與 Google SynthID Detector 全面開放（iThome 179517，10-08）併述。

### Y. Sierra、Meta 推 Personal Agent Protocol，規範 AI 代理存取企業服務
- URL：https://www.ithome.com.tw/news/179485
- 發布日期：2026-10-07
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：名額已滿；標準尚在共同開發階段。

### Z. Anthropic 擴大 Cyber Verification Program，Glasswing 半年找到逾 12 萬漏洞
- URL：https://www.anthropic.com/news/cyber-verification-program
- 發布日期：2026-10-06
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：建議交由 軟硬體資訊安全 分類（anthropic.com/news 列表 Oct 6, 2026；iThome 179470 同事件）。同日列表另有 10-08〈Introducing the Anthropic Cyber Mission〉，未讀內文，一併請 C 組評估。

### AA. Anthropic 2026 使用政策更新，禁止持續辱罵 Claude
- URL：https://www.anthropic.com/news/2026-usage-policy-update
- 發布日期：2026-10-08
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：政策條款調整，對開發者影響小，權重不足（列表頁日期 Oct 8, 2026；iThome 179555 同事件）。

### AB. 微軟推 PC 端 AI 模型與高階筆電　攜手輝達挑戰蘋果（中央社）
- URL：https://www.cna.com.tw/news/ait/202610080080.aspx
- 發布日期：2026-10-08
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：與第 8 則、淘汰 E 同一發表會，以硬體為主，建議交由 硬體或軟硬整合 分類。

### AC. OpenAI 年化營收較預期短少 200 億美元（中央社）
- URL：https://www.cna.com.tw/news/ait/202610090052.aspx
- 發布日期：2026-10-09
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：財務類新聞，權重壓低。

### AD. Claude Code v2.1.295（hooks onFailure: "block"、Program Status Protocol）
- URL：https://github.com/anthropics/claude-code/releases/tag/v2.1.295
- 發布日期：2026-10-08
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：窗內 v2.1.288 至 v2.1.296 皆為增量更新（npm 發布 10-02 至 10-09），上期已收 v2.1.287（Mods）；v2.1.293 改用 Haiku 5.5 為預設 Haiku，已併入第 1 則備註。名額不足。

### AE. OpenAI Codex CLI 0.162 與 Gemini CLI v0.63
- URL：https://github.com/openai/codex/releases
- 發布日期：2026-10-09
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：例行版本（Gemini CLI 另有 v0.64／v0.65 preview 與 nightly），release 頁未見重大功能；發布日期取 release 列表，未逐版核對。

### AF. Cursor：iOS app 可遠端查看並回覆本機代理
- URL：https://cursor.com/changelog
- 發布日期：2026-10-06
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：名額已滿；功能面影響較窄。

### AG. GitHub async merge API 正式推出
- URL：https://github.blog/changelog/2026-10-01-github-async-merge-api-generally-available
- 發布日期：2026-10-01
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：上期因名額淘汰後重新評估；同站本期已收無狀態權杖，影響面較窄，仍淘汰。

### AH. JetBrains Air in IDEs EAP
- URL：https://blog.jetbrains.com/ai/2026/10/air-in-ides-eap/
- 發布日期：2026-10-02
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：上期已以 EAP 階段權重不足淘汰，本期維持。

### AI. JetBrains 停止 Kotlin Multiplatform 外掛的 Swift IDE 支援
- URL：https://blog.jetbrains.com/kotlin/2026/10/discontinuing-swift-language-ide-support-in-the-kotlin-multiplatform-plugin/
- 發布日期：2026-10-06
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：名額已滿；影響限 KMP 使用者。日期取 iThome 179428 轉述日，官方頁未逐一核對。

### AJ. Node.js 26.11.0 (Current)
- URL：https://nodejs.org/en/blog
- 發布日期：2026-10-07
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：例行 Current 小版本，上上期已收 26.10.0；名額不足（內容未逐項核對）。

### AK. Kubernetes 部落格：轉向 cgroup v2 須知
- URL：https://kubernetes.io/blog/
- 發布日期：2026-10-06
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：說明性文章，非版本或政策公告；建議交由 網路/伺服器等基礎 分類評估。

### AL. SvelteKit 3 整理開發工具鏈（iThome）
- URL：https://www.ithome.com.tw/news/179377
- 發布日期：2026-10-02
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：InfoQ 9 月已有 SvelteKit 3 報導（/news/2026/09/sveltekit-3-vite），原始發布日可能在窗外，未核對；名額不足。

### AM. Gradle 9.8 支援 Java 27、Amazon Corretto 27 推出、Android Studio 開放 BYOA
- URL：https://www.ithome.com.tw/news/179244
- 發布日期：2026-09-29
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：名額已滿。Corretto 27（iThome 179299，09-30）與 Android Studio BYOA 經 ACP 串接代理（iThome 179232，09-28）同列為備選。

### AN. OpenAI 更新 Codex Cloud，雲端開發環境可重複套用並供團隊共享
- URL：https://www.ithome.com.tw/news/179321
- 發布日期：2026-09-30
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：時間點緊接上期已收的 DevDay 2026，可能屬同一波發表；openai.com 無法核對，淘汰。

### AO. Python 3.15.0 第三個候選版
- URL：https://blog.python.org/2026/10/python-3150-rc3
- 發布日期：2026-10-02
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：已由第 6 則 3.15.0 正式版取代。

### AP. 一零四資訊科技系統遭異常讀取，12 萬筆履歷資料恐外流
- URL：https://www.ithome.com.tw/news/179476
- 發布日期：2026-10-07
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，`class="created"` 2026-10-07（重訊為 10-06 傍晚）。台灣重大個資事件，但內文僅數句、未說明入侵手法；名額讓給資安院 2.0 與微軟 MDDR。主編若要以台灣企業事件替換第 5 筆，此為首選；可與鈊象（179504）、杏一（179507）、上福 Katun（179510）合併成一句。

### AQ. FBI 與特勤局警告 FortiBleed 攻擊活動持續延燒，部分受害者遭鎖在 Fortinet 設備之外
- URL：https://www.ithome.com.tw/news/179526
- 發布日期：2026-10-08
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，`class="created"` 2026-10-08；一手為 IC3 JCSA-20261006-01〈FortiBleed Operations Continue Targeting Exposed Systems Leading to Reports of Lockouts〉（2026-10-06，PDF 已存 B-ic3-fortibleed.pdf，內文字型編碼無法抽文核對）。iThome 提及臺灣受影響設備數居全球第三（6 月資料）。屬 6 月事件的後續警告，名額讓給新揭露事件；可作備選。

### AR. CISA 將 Fortinet FortiMail 路徑遍歷漏洞 CVE-2026-104286 列入 KEV
- URL：https://www.cisa.gov/news-events/alerts/2026/10/01/cisa-adds-one-known-exploited-vulnerability-catalog
- 發布日期：2026-10-01
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：curl 200（B-kev-10-01.html）。KEV 例行公告，僅一行漏洞名稱，缺乏技術細節；權重不足。

### AS. Citrix NetScaler 再揭露遭利用的阻斷服務漏洞 CVE-2026-88779
- URL：https://www.cisa.gov/news-events/alerts/2026/10/04/cisa-adds-one-known-exploited-vulnerability-catalog
- 發布日期：2026-10-04
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：curl 200（B-kev-10-04.html）；iThome 10-05（179397、179398）、The Register 10-09 有報導。為新 CVE（CVSS v4.0 8.7、DoS，限 SAML SP／IdP 配置），非上期 CVE-2026-88771／88772 的同一漏洞，但同產品連兩期，且影響為可用性；名額讓給其他事件。主編若要寫 NetScaler 後續可引用。

### AT. CrowdStrike 揭露疑似中國背景駭客結合 AI 與滲透測試工具攻擊多家韓國金融業者
- URL：https://www.ithome.com.tw/news/179506
- 發布日期：2026-10-08
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：上一期已引用同事件（韓國多家銀行遭駭客攻擊　金融委要求全面資安檢查）；CrowdStrike 歸因屬後續報導。中央社 10-08〈韓金融業遭駭　CrowdStrike 揭中國駭客用 AI 工具犯案〉、iThome 179422 同。

### AU. 荷蘭漏洞揭露協會遭 AI 自主攻擊（iThome 中文轉述）
- URL：https://www.ithome.com.tw/news/179447
- 發布日期：2026-10-06
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議第 2 筆同一事件，以 DIVD 一手事件檔案為正式來源；本篇可作中文備查。

### AV. CISA 將 Zammad 兩個漏洞列入 KEV
- URL：https://www.cisa.gov/news-events/alerts/2026/10/02/cisa-adds-two-known-exploited-vulnerabilities-catalog
- 發布日期：2026-10-02
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議第 2 筆同一事件（CVE-2026-102489、102490），已在其備註說明。

### AW. 微軟 2026 數位防禦報告：臺灣上半年受網路威脅影響排名升至全球第 4
- URL：https://www.ithome.com.tw/news/179405
- 發布日期：2026-10-05
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議第 5 筆同一份報告，可由主編合併引用（臺灣占比 1.8% 升至 3.9%、初始存取以公開服務漏洞 24%、網路釣魚 23% 為主）。

### AX. Shai-Hulud 蠕蟲擴及 AI 基礎設施，Tensorlake 遭入侵
- URL：https://www.theregister.com/security/2026/10/08/shai-hulud-worm-makes-jump-to-ai-infrastructure-with-tensorlake-compromise/5302054
- 發布日期：2026-10-08
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：與前期已引用〈Compromised GitHub Actions Came Back Online and Resumed Executing Mini Shai-Hulud Malware〉同系列攻擊活動，依跨期去重規則淘汰；未抓原頁核對。

### AY. AWS Bedrock AgentCore 可被提示誘導取出執行個體憑證
- URL：https://www.theregister.com/security/2026/10/09/aws-agentcore-security-undone-by-prompt-requesting-credentials/5302436
- 發布日期：2026-10-09
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：RSS pubDate 2026-10-09，未抓全文核對；屬研究揭露、AWS 回應未確認，建議交由 AI 科技分類評估（AI 代理安全）。

### AZ. 高風險 NVIDIA 漏洞可能讓曝露在外的伺服器 GPU 監控服務當機
- URL：https://www.theregister.com/security/2026/10/08/high-severity-nvidia-bug-could-crash-gpu-monitoring-on-exposed-servers/5302077
- 發布日期：2026-10-08
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：RSS pubDate 2026-10-08，未抓原頁與 NVIDIA 公告核對；DoS 類，權重低於現選。

### BA. 研究人員發現 GitHub 公開儲存庫暴露逾 54 萬組仍有效的憑證
- URL：https://www.ithome.com.tw/news/179433
- 發布日期：2026-10-07
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，`class="created"` 2026-10-07；研究報告型，名額已滿，建議交由軟體工程分類評估。

### BB. 資安署針對 GitLab 滿分漏洞利用攻擊提出警告
- URL：https://www.ithome.com.tw/news/179411
- 發布日期：2026-10-05
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，`class="created"` 2026-10-05；台灣政府警示，但未抓原始漏洞公告核對時間與 CVE，名額已滿；可作台灣面向備選。

### BC. Google 發布 Chrome 155 修補近 250 個漏洞、10 月 Android 例行更新
- URL：https://www.ithome.com.tw/news/179463
- 發布日期：2026-10-07
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：例行版本更新，未提及遭利用漏洞；權重不足（Android 為 179479）。

### BD. Apache HTTP Server 2.4.69 修補 20 個漏洞、OpenSSL 修補 14 個漏洞
- URL：https://www.ithome.com.tw/news/179473
- 發布日期：2026-10-07
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，`class="created"` 2026-10-07（OpenSSL 為 179431，10-06）；例行修補、無遭利用紀錄，名額讓給 OpenSSH 10.6（含後量子簽章與 AI 回報帶動發版策略改變）。

### BE. Atlassian 揭露影響 8 款產品的任意檔案讀取漏洞，已出現嘗試利用
- URL：https://www.ithome.com.tw/news/179521
- 發布日期：2026-10-08
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：curl 200；「嘗試利用」階段，未列 KEV，名額已滿（揭露篇為 179469，10-07）。

### BF. 丹麥人口登記系統遭駭 880 萬人資料外洩、亞利桑那州最高法院釣魚事件、EY 外洩
- URL：https://www.ithome.com.tw/news/179437
- 發布日期：2026-10-06
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：國外大型外洩，技術細節少；名額已滿（另兩篇為 179559、179557，10-09）。

### BG. 華碩微星推 RTX Spark 筆電、微軟推 PC 端 AI 模型與高階筆電
- URL：https://www.cna.com.tw/news/ait/202610080026.aspx
- 發布日期：2026-10-08
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議第 11 筆同一事件，以 NVIDIA 一手部落格為正式來源；日期取自中央社列表 API，未抓內文。

### BH. Meta 開源 Muse Gadgets 硬體開發套件，支援 ESP32 與 Raspberry Pi 自製 AI 裝置
- URL：https://www.ithome.com.tw/news/179403
- 發布日期：2026-10-05
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，`class="created"` 2026-10-05（宣布日 10-03）；官方來源為 X 貼文與 gadgets.muse.ai（無日期），Apache 2.0 授權、5,000 台 Muse Home Link 等細節僅見 iThome。名額讓給 HPE Gen13；Meta Connect／Muse 系列上期已有同系列（Ray-Ban Meta Audio），可作軟硬整合備選。

### BI. AMD 斥資併購 World Labs
- URL：https://ir.amd.com/news-events/press-releases/detail/1299/amd-to-acquire-world-labs-to-advance-the-future-of-ai-compute
- 發布日期：2026-09-28
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：上期因名額淘汰，本期重新評估；RSS pubDate 2026-09-28 在窗內，但屬企業併購，對開發與維運的直接影響低，權重不足。

### BJ. 威聯通推出 HDP for Business，讓既有 NAS 升級為企業備份中心
- URL：https://www.ithome.com.tw/news/179421
- 發布日期：2026-10-05
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：curl 200；台灣廠商產品，但仍為 Beta 版，屬產品發表稿；權重不足。

### BK. 三星電子預估第 3 季營業利益年增逾 780%、Marvell 上修營收預測、美光展望
- URL：https://www.cna.com.tw/news/ait/202610080046.aspx
- 發布日期：2026-10-08
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：財報類新聞，權重壓低；記憶體供需背景已由 IDC PC 出貨一筆涵蓋。日期取自中央社列表 API，未抓內文。

### BL. SpaceX 收購低頻頻譜擴張 Starlink 行動通訊
- URL：https://www.ithome.com.tw/news/179551
- 發布日期：2026-10-09
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：curl 200；頻譜交易，對開發維運影響低，名額已滿。

### BM. GitHub Actions 相隔 4 天再傳異常，代管執行環境延遲波及 Pages 與帳務
- URL：https://www.ithome.com.tw/news/179459
- 發布日期：2026-10-07
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，`class="created"` 2026-10-07；githubstatus 事故頁已存（B-gh-incident.html）但未發正式事後報告；The Register 10-09〈GitHub rewrites storage〉談 Spokes 儲存重寫，可能更適合軟體工程分類評估。

### BN. Cloudflare 宣布 Deno 加入 Cloudflare
- URL：https://blog.cloudflare.com/deno-joins-cloudflare/
- 發布日期：2026-10-09
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：RSS pubDate 2026-10-09，未抓原頁；建議交由 軟體工程 分類評估。

### BO. 北約量子技術戰略走向實作、PKI 成熟度模型 2.0 納入 PQC 轉型
- URL：https://www.ithome.com.tw/news/179448
- 發布日期：2026-10-08
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：curl 200；政策與框架性內容，PQC 實作面已由 OpenSSH 10.6 與 HPE Gen13 代表（PKI 篇為 179465）。

### BP. 南韓金融業接連遭網路攻擊，金融主管機關召開緊急會議
- URL：https://www.ithome.com.tw/news/179422
- 發布日期：2026-10-06
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：上一期已引用同事件（韓國多家銀行遭駭客攻擊　金融委要求全面資安檢查），屬後續報導。iThome 179497（10-07，韓國政府要求徹查）、iThome 179506 與中央社 ait/202610080128（10-08，CrowdStrike 揭露攻擊者使用 AI 工具）、The Register 10-08〈CrowdStrike finds possible bank hacker's CV among exposed AI logs〉同理淘汰。

### BQ. 強化跨業信用資訊交換，金管會：10 月底前上線
- URL：https://www.cna.com.tw/news/afe/202610080293.aspx
- 發布日期：2026-10-08
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：curl 200（存檔 pages/C-cna-credit.html），JSON-LD 2026-10-08T18:07。聯徵中心與證交所跨業信用資訊交換機制預計 10 月 31 日前上線，但原頁沒有系統或資料交換的技術細節（權重 6），名額讓給金管會檢查缺失與穩定幣規劃；可作為第 5 則的替補。

### BR. ECB 上線 Pontes，以央行貨幣結算 DLT 交易
- URL：https://www.ecb.europa.eu/press/pr/date/2026/html/ecb.pr260921_1~5a011ecbea.en.html
- 發布日期：窗外 2026-09-21
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：日期在窗外（依搜尋結果與 ECB 新聞稿網址為 09-21 上線，未抓原頁）。

### BS. The Clearing House 選定 Quant 建置代幣化存款網路
- URL：https://www.pymnts.com/?p=4226802
- 發布日期：窗外 2026-09-24
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：日期在窗外（PYMNTS 頁面 2026-09-24）；美國大型銀行代幣化存款網路本身是 2026 年 6 月宣布。

### BT. ECB 執委 Schnabel 演講〈Central banks on-chain〉
- URL：https://www.ecb.europa.eu//press/key/date/2026/html/ecb.sp261001_1~a0be67193b.en.pdf
- 發布日期：2026-10-01
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：演講稿，非政策或系統上線事件，權重不足（日期取自 ECB RSS，未抓原頁）。同 RSS 中 Cipollone 10-06〈Money in the digital age: digital euro, tokenisation…〉同理。

### BU. Fed 對 American Express 採取執法行動
- URL：https://www.federalreserve.gov/newsevents/pressreleases/enforcement20261008a.htm
- 發布日期：2026-10-08
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：curl 200（存檔 pages/C-fed-amex.html）。主因是可疑交易偵測與申報不足、反洗錢計畫缺失，原頁無技術細節，權重不足。

### BV. Samsung 將為美國 Galaxy 用戶推出 Solana 上的 USDC 轉帳
- URL：https://www.theblock.co/news/business/2026-10-07-samsung-to-launch-usdc-transfers-on-solana-for-us-galaxy-users-418004
- 發布日期：2026-10-07
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：原頁無法取得（theblock.co 對 curl 回 403），日期僅來自 RSS 與網址，無法核對內容；未找到 Samsung 官方新聞稿。

### BW. Securitize 推出 1:1 擔保的代幣化美股
- URL：https://www.theblock.co/news/markets/2026-10-08-securitize-launches-tokenized-us-stocks-solana-418043
- 發布日期：2026-10-08
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：原頁無法取得（theblock.co 回 403），未找到可核對的官方來源。

### BX. Ledger 調查 CryptoBilis 買家錢包遭盜，損失估逾 8,600 萬美元
- URL：https://www.theblock.co/news/business/2026-10-09-ledger-cryptobilis-fund-losses-418163
- 發布日期：2026-10-09
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：原頁無法取得（theblock.co 回 403），數字未核對；性質屬錢包供應鏈資安，建議交由軟硬體資訊安全分類另找可核對來源。

### BY. 硬體權杖驗證軟體 Thales SConnect 爆重大漏洞，金融與政府舊版用戶恐有風險
- URL：https://www.ithome.com.tw/news/179388
- 發布日期：2026-10-06
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：建議交由軟硬體資訊安全分類（日期取自 iThome 列表，未逐頁核對內文）。

### BZ. AWS 發布 PCI DSS 架構指引，說明多帳號環境如何界定適用範圍
- URL：https://www.ithome.com.tw/news/179478
- 發布日期：2026-10-08
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：主軸為雲端架構與合規範圍界定，建議交由網路/伺服器等基礎分類（日期取自 iThome 列表，未逐頁核對內文）；若金融科技需要支付合規面向可撈回。

### CA. 虛擬通貨公會加入金融總會，共 37 會員
- URL：https://www.cna.com.tw/news/afe/202610070174.aspx
- 發布日期：2026-10-07
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：公會組織事務，無技術內容，權重不足（日期取自中央社列表 API，未抓內文）。

### CB. 英國 Faster Payments 中斷，Lloyds、Barclays、HSBC、Monzo 同時受影響
- URL：https://startupfortune.com/faster-payments-outage-hits-lloyds-barclays-hsbc-and-monzo-at-once/
- 發布日期：窗外 2026-08-02
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：日期在窗外（JSON-LD datePublished 2026-08-02），且為二手來源。

### CC. SEC 檢查處發布新版檢查手冊
- URL：https://www.sec.gov/newsroom/press-releases/2026-99-secs-division-examinations-announces-new-exam-handbook
- 發布日期：2026-10-01
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：檢查作業程序公告，與技術或開發關聯低，權重不足（日期取自 SEC 新聞稿列表）。

### CD. ARPA-H BIOGAMI 計畫啟動，及早發現並修正蛋白質功能異常
- URL：https://arpa-h.gov/news-and-events/arpa-h-biogami-program-starts-work-find-and-fix-protein-dysfunction-earliest-stages
- 發布日期：2026-10-09
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：同機構本期已收 Delphi 一則，BIOGAMI 屬生物研究，與軟硬體技術關聯較低；名額讓給 Delphi（日期取自 arpa-h.gov 新聞列表）。

### CE. ARPA-H 團隊挑戰擺脫細胞療法冷鏈依賴
- URL：https://arpa-h.gov/news-and-events/arpa-h-teams-prepare-take-200-degree-leap-and-end-cold-chain-dependence-life-saving
- 發布日期：2026-09-25
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：同機構名額讓給 Delphi；屬生技保存研究（日期取自 arpa-h.gov 新聞列表）。

### CF. 健保數位轉型，強化基層醫療雲端賦能，健保攜手南部醫界
- URL：https://www.mohw.gov.tw/cp-16-88137-1.html
- 發布日期：無法確認
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：上一期已引用同事件（健保數位轉型 打造醫療創新未來 健保署推動基層醫療院所雲端轉型），屬同系列後續場次。衛福部列表位置約在 10 月 2 日至 6 日之間，未逐頁核對。

### CG. MIT 新配方讓 RNA 疫苗耐高溫
- URL：https://news.mit.edu/2026/new-formulation-helps-rna-vaccines-withstand-high-temperatures-0928
- 發布日期：2026-09-28
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：實驗室階段研究，權重低於官方監理與核准事件，名額已滿（日期取自 MIT News RSS）。同 RSS 的〈A new technique could accelerate the development of RNA therapies〉（09-25）同理。

### CH. MIT 課堂專題發展成 FDA 核准的震顫治療裝置
- URL：https://news.mit.edu/2026/mit-class-project-turns-into-fda-cleared-treatment-for-tremors-1002
- 發布日期：2026-10-02
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：上期已列淘汰；核心事件（FDA 核准）發生在今年 2 月，屬回顧特稿。

### CI. 健康幣相關報導
- URL：https://www.mohw.gov.tw/cp-16-88117-1.html
- 發布日期：2026-10-01
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：上一期已引用同事件（「健康幣」10/1 上線），換來源也淘汰。

### CJ. 高醫大傑出論文獎，創新引子設計助基因檢測判讀
- URL：https://www.cna.com.tw/news/ait/202610070082.aspx
- 發布日期：2026-10-07
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：論文獎項報導，權重不足（日期取自中央社列表 API，未抓內文）。

### CK. 醫療機構對量子運算威脅準備不足
- URL：https://www.medtechdive.com/news/healthcare-organizations-are-underprepared-for-quantum-computing-threats/832528/
- 發布日期：2026-10-09
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：調查報告的二手報導，未找到一手來源，權重不足（日期取自 MedTech Dive RSS）。

### CL. FDA 核准首個 MCT8 缺乏症療法
- URL：https://www.fda.gov/news-events/press-announcements/fda-approves-first-treatment-mct8-deficiency
- 發布日期：2026-09-28
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：藥物核准，非醫療科技或軟硬體技術，權重不足（日期取自 FDA 新聞稿列表）。

### CM. 歐盟延後 Tesla FSD 表決至最快 12 月
- URL：https://electrek.co/2026/09/25/eu-delays-tesla-fsd-vote-december-tcmv-agenda/
- 發布日期：2026-09-25
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：屬「未表決」的程序消息，來源為科技部落格（權重 6），且上期已收 Tesla 在台 FSD 驗證；Electrek 10-08〈Tesla leaned on Dutch regulator…〉轉述 Reuters 同理淘汰（日期取自網址，未抓原頁）。

### CN. Delta 與 United 系統中斷，美國近千班航班延誤
- URL：https://www.aol.com/articles/travel-nightmare-delta-united-airlines-185500000.html
- 發布日期：2026-10-06
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，JSON-LD 2026-10-06T18:55Z，但內容依據 Downdetector 與社群貼文，未有航空公司或 FAA 說明原因，屬二手來源（權重 5）。Simple Flying 10-09〈Southwest Airlines Gate Agents Forced To Process Passengers Manually After System Outage〉同為轉述 New York Post 等，原因未經官方證實，同理淘汰。若主編要收航空 IT 事故，需另找航空公司或 FAA 官方聲明。

### CO. 臺南地下車站核心設施首度亮相，從軌道工法到行控系統
- URL：https://www.motc.gov.tw/ch/app/news_list/view?module=news&id=14&serno=2fe6b341-1a40-4d7b-90eb-b1af4cee2683
- 發布日期：2026-10-01
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：上期已淘汰中央社同事件報導（技術內容有限）；交通部 10-04〈臺南地下車站獲交通部核准營運！10月17日正式通車〉亦以時程為主，權重不足（日期取自交通部列表）。

### CP. 臺鐵首度完成全公司碳盤查
- URL：https://www.ithome.com.tw/news/179455
- 發布日期：2026-10-06
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：碳排數據為主，軟硬體技術內容少，權重不足（日期取自 iThome 列表）。

### CQ. Waymo 完成 50 億美元債務融資
- URL：https://waymo.com/blog/2026/10/waymo-closes-5-billion-debt-financing
- 發布日期：無法確認
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：財務新聞，無技術內容；同公司已收事故演練框架（網址為 2026/10，未抓原頁確認精確日）。同列表的〈Sober Drivers Still Face Nearly 4x Nighttime Risk〉同理，名額讓給演練框架。

### CR. 臺灣港務公司智慧戰情中心獲哈佛商業評論鼎革獎
- URL：https://www.motc.gov.tw/ch/app/news_list/view?module=news&id=14&serno=d875bbb0-dcfd-433b-b45e-d980849279b7
- 發布日期：2026-10-01
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：獲獎新聞稿，缺乏可核對的技術細節，權重不足（日期取自交通部列表）。

### CS. FAA Part 108 超視距無人機規則
- URL：https://pickdrones.com/faa-part-108-bvlos-rule-delayed-oira-2026/
- 發布日期：無法確認
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：搜尋所見僅說最終規則仍在白宮 OIRA 審查，窗內沒有確認的官方新進展，來源為二手部落格。

### CT. Spotify 推出 Spotify Technology 品牌，整合 Portal、Confidence、Xirp 與 Spotify for Backstage 對外銷售
- URL：https://engineering.atspotify.com/2026/10/introducing-spotify-technology-proven-at-spotify-now-yours/
- 發布日期：2026-10-08
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：建議交由軟體工程分類。curl 200，存檔 pages/D-spotify-eng-technology.html，頁面日期「Oct 8, 2026」。內容是開發者入口與實驗平台工具的品牌整合（Backstage 2020 年開源、Confidence 2023 年起銷售、Portal 2024 年起銷售、Xirp 今年推出），屬開發工具事件，不是音樂串流事件；DMN 10-09 二手報導存檔 pages/D-dmn-spotify-technology.html。

### CU. Live Nation 再傳資料外洩，含社會安全碼，已遭至少 3 件集體訴訟
- URL：https://www.digitalmusicnews.com/2026/10/07/live-nation-data-breach-class-action-lawsuits/
- 發布日期：2026-10-08
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：建議交由軟硬體資訊安全分類。curl 200（article:published_time 2026-10-08T05:44Z），存檔 pages/D-dmn-livenation-breach.html。Live Nation 10 月 1 日向佛蒙特州檢察長通報；外洩規模僅有「a small number of individuals」的說法，沒有技術細節，與 2025 年 ByteToBreach 事件的關聯未確認。

### CV. Sphere《綠野仙蹤》升級 4D 效果
- URL：https://www.sphereentertainmentco.com/sphere-debuts-enhanced-and-expanded-4d-effects-for-the-wizard-of-oz-at-sphere/
- 發布日期：2026-09-25
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：上期（023）因名額淘汰（BX），可以重新評估；但同場館上期已收 Sphere×Disguise，官方稿只列出效果項目、技術細節少。若主編判定 TTXC（第 9 筆）違反系列規則，可撈回這則替補（本期未重新抓原頁）。

### CW. 國慶總統府建築光雕展演融入 11 部影視作品，創網路討論新高
- URL：https://www.cna.com.tw/news/acul/202610090227.aspx
- 發布日期：2026-10-09
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：curl 200（JSON-LD 2026-10-09T20:13+08:00），存檔 pages/D-cna-acul-202610090227.html。內容是策展與觀眾反應，科技細節只有投影光雕；上期已用同樣理由淘汰同一系列的 10-02 記者會稿，前期也已收過文總的新勝景光雕。

### CX. 華信航空與國台交合作「會飛的音樂廳」，機上播放台灣民謠
- URL：https://www.cna.com.tw/news/acul/202610070265.aspx
- 發布日期：2026-10-07
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-cna-acul-202610070265.html。屬音樂授權合作，沒有科技內容。

### CY. 2026 高雄電影節公布 XR 國際競賽入圍名單
- URL：https://kff.tw/en/content/2026kff-news008
- 發布日期：窗外 2026-08-25
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，JSON-LD datePublished 2026-08-25，日期在窗外。

### CZ. Suno 延攬 Ticketmaster 前主管 Michael Chua 領導現場音樂部門
- URL：https://www.musicbusinessworldwide.com/suno-hires-ticketmasters-michael-chua-to-lead-its-live-music-team-including-songkick/
- 發布日期：2026-10-08
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：人事新聞，權重不足；只從 RSS 確認日期，未抓內文。

### DA. Michael Smith 以 AI 歌曲搭配 bot 灌量詐領版稅，判刑 18 個月
- URL：https://www.musicbusinessworldwide.com/man-behind-8m-ai-song-and-bot-streaming-fraud-is-sentenced-to-18-months-in-prison/
- 發布日期：2026-10-07
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-mbw-smith-sentenced.html。與第 10 筆著作權局徵詢公告同一主題，採一手的《聯邦公報》公告；判刑（10-06）與沒收 8,091,843.64 美元等細節可在撰稿時補充，須標明出自 MBW。

### DB. 艾美獎改由亞馬遜 Prime 串流（中央社綜合外電）
- URL：https://www.cna.com.tw/news/amov/202610070015.aspx
- 發布日期：2026-10-07
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：與第 12 筆同事件，採電視學院官方新聞稿；中央社稿寫「全球超過200個國家」，與官方導言的 240 個國家與地區不同。

### DC. 美國聯邦上訴法院駁回 AI 訓練的合理使用抗辯，評析對 Suno 案的影響
- URL：https://www.musicbusinessworldwide.com/a-us-appeals-court-has-rejected-a-fair-use-defense-over-ai-training-what-does-it-mean-for-the-labels-fight-with-suno/
- 發布日期：2026-10-05
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-mbw-appeals-fairuse.html。屬評析稿，判決原文與判決日未另行核對；建議交由 AI 科技分類，追判決原文後再評估。

### DD. Musk：Grok Bot 將用 Suno 模型產生音樂
- URL：https://www.digitalmusicnews.com/2026/10/07/grok-bot-suno/
- 發布日期：2026-10-07
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：依據是執行長的社群貼文，屬社群來源；沒有找到官方公告可以替換。

### DE. Spotify 有聲書擴展至逾 180 個市場，Audiobooks+ 年經常性收入破 1 億美元
- URL：https://newsroom.spotify.com/2026-10-07/audiobooks-global-expansion/
- 發布日期：2026-10-07
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：市場擴張與營收數字，沒有技術內容，權重不足；只從 RSS 確認日期。

### DF. AI 音訊新創 Sonilo 獲 1100 萬美元融資
- URL：https://variety.com/2026/digital/news/ai-audio-startup-sonilo-tiktok-veterans-11-million-1236904917/
- 發布日期：2026-10-08
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：融資新聞，權重不足；只從 RSS 確認日期。

### DG. Apple Music 推出新標誌
- URL：https://www.digitalmusicnews.com/2026/10/06/apple-music-new-logo/
- 發布日期：2026-10-06
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：品牌視覺更新，沒有技術內容。

### DH. 派拉蒙完成 1100 億美元併購華納兄弟
- URL：https://www.cna.com.tw/news/amov/202610060350.aspx
- 發布日期：2026-10-06
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：併購交易，沒有技術面；上期也已用相同理由淘汰同案的法院和解稿。

### DI. YouTube Shorts 推薦將優先原創內容
- URL：https://www.digitalmusicnews.com/2026/10/02/youtube-shorts-prioritize-original-content/
- 發布日期：2026-10-02
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：上期已因二手報導淘汰；本期查 blog.youtube RSS（09-23 至 10-01）仍沒有找到對應的官方公告。

### DJ. 2026 諾貝爾化學獎：Kagan 與硤合憲三，不對稱有機合成的非線性效應與自催化
- URL：https://www.nobelprize.org/prizes/chemistry/2026/press-release/
- 發布日期：2026-10-07
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-nobel-chemistry.html（頁面日期 7 October 2026）。同為諾貝爾獎，名額讓給和資料系統關聯較高的物理學獎；中央社有台灣學者解讀稿（https://www.cna.com.tw/news/ahel/202610070344.aspx，存檔 pages/D-cna-ahel-202610070344.html），可作為備選。

### DK. 2026 諾貝爾生理醫學獎：光遺傳學與光門控離子通道
- URL：https://www.nobelprize.org/prizes/medicine/2026/press-release/
- 發布日期：2026-10-05
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：建議交由醫療科技分類。curl 200，存檔 pages/D-nobel-medicine.html，頁面日期 5 October 2026。

### DL. ESA 與中國科學院合作的 Smile 任務開始科學觀測
- URL：https://www.esa.int/Science_Exploration/Space_Science/Smile/Science_begins_for_Smile
- 發布日期：2026-09-30
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：上期（023）因名額淘汰（G），本期仍因名額淘汰；太空題材已有 NURI 號。

### DM. SpaceX 太空船抵達國際太空站，創美國最快航程紀錄
- URL：https://www.cna.com.tw/news/ait/202610020042.aspx
- 發布日期：2026-10-02
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：上期因避免 SpaceX 重複而淘汰（CR）；本期太空題材已有 NURI 號，名額不足。

### DN. 阿波羅計畫軟體先驅 Margaret Hamilton 辭世，享壽 90 歲
- URL：https://news.mit.edu/2026/margaret-hamilton-computing-pioneer-dies-1007
- 發布日期：2026-10-07
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：訃聞，不是科技應用突破；對程式設計師讀者意義高，建議由軟體工程分類或主編斟酌放進趨勢段（中央社同日稿：https://www.cna.com.tw/news/ait/202610080159.aspx）。只從 RSS 與中央社列表確認日期，未抓內文。

### DO. NASA 展示次世代隔熱罩技術
- URL：https://www.nasa.gov/centers-and-facilities/ames/nasa-demonstrates-next-generation-heat-shield-technologies/
- 發布日期：2026-10-09
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-nasa-heatshield.html，內文未逐項核對；名額讓給 SANDO 與 NURI。

### DP. 中研院院士陳仲瑄的可攜式質譜檢測平台獲台北生技獎
- URL：https://www.cna.com.tw/news/ahel/202610080077.aspx
- 發布日期：2026-10-08
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-cna-ahel-202610080077.html。屬獎項新聞，檢測平台用於毒品查緝與食安快篩，建議交由醫療科技分類評估。

### DQ. 建研所舉辦《智慧建材評估手冊（草案）》推廣說明會
- URL：https://www.abri.gov.tw/News_Content.aspx?n=752&s=342251
- 發布日期：2026-09-29
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-abri-342251.html，正文「今（29）日」，列表 115-09-29。手冊仍是草案，只有推廣說明會，沒有可核對的評估項目或數字，權重不足。

### DR. 建研所召開 2026 智慧化居住空間產業特別議題工作小組首場會議
- URL：https://www.abri.gov.tw/News_Content.aspx?n=752&s=342527
- 發布日期：2026-10-08
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-abri-342527.html。專家會議稿，只有歷年競賽帶動 36.4 億元投資的統計，沒有新技術事件，權重不足；上期也已淘汰同類的建研所會議稿（D）。

### DS. 內政部召開營建土石方再生利用管理辦法（草案）說明會
- URL：https://www.moi.gov.tw/News_Content.aspx?n=4&s=342466
- 發布日期：2026-10-07
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-moi-342466.html，頁面發布日期 115-10-07。法規草案說明會，資訊化只提到「土資場處理費用申報制度、資訊透明化」一句，技術內容少；名額讓給地政數位櫃臺。

### DT. 関電工與 Arent 以 AI 自動化電氣設備設計
- URL：https://built.itmedia.co.jp/bt/articles/2610/08/news072.html
- 發布日期：2026-10-08
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-built-2610-08-news072.html，未核對原始發表日；名額已滿（日本營建 DX 已收三則）。

### DU. CTS 提供建設業專用 AI 代理，以 RAG 15 分鐘產出施工計畫書
- URL：https://built.itmedia.co.jp/bt/articles/2610/06/news072.html
- 發布日期：2026-10-06
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-built-2610-06-news072.html，未核對原始發表日；名額已滿，可作為備選（RAG 應用對程式設計師有參考價值）。

### DV. Autodesk Forma 擴充新功能與 AI，串接規劃到施工的資料
- URL：https://built.itmedia.co.jp/bt/articles/2610/09/news051.html
- 發布日期：2026-10-09
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-built-2610-09-news051.html。上期已淘汰 Forma 相關稿，主要發表在 Autodesk University 2026（09-15，窗外），本則原始發表日未核對；名額已滿。

### DW. Terra Drone 發表點雲解析與編輯軟體「Terra STUDIO」
- URL：https://built.itmedia.co.jp/bt/articles/2610/09/news071.html
- 發布日期：2026-10-09
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-built-2610-09-news071.html，未核對原始發表日；產品發表，名額已滿。

### DX. 日水コン與 CSJ 開發下水管道路坍陷預兆偵測系統
- URL：https://built.itmedia.co.jp/bt/articles/2610/06/news075.html
- 發布日期：2026-10-06
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-built-2610-06-news075.html，未核對原始發表日；名額已滿。

### DY. 竹中土木與人機一体開發炸藥裝填機器人
- URL：https://built.itmedia.co.jp/bt/articles/2610/01/news056.html
- 發布日期：2026-10-01
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：curl 200，存檔 pages/D-built-2610-01-news056.html，未核對原始發表日；名額已滿。

### DZ. RIC Robotics 完成沙加緬度首棟取得許可的 3D 混凝土列印住宅
- URL：https://www.constructionowners.com/press-release/ric-robotics-and-k4k-construction-complete-printing-of-sacramentos-first-permitted-3d-concrete-printed-home
- 發布日期：窗外 2026-07
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：依搜尋結果，發表於 2026 年 7 月，在窗外；未抓原頁。

### EA. Cloudflare Birthday Week 2026 總整理：一週 46 項發表
- URL：https://blog.cloudflare.com/birthday-week-2026-wrap-up/
- 發布日期：2026-10-05
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：第二輪補搜候選。上一期已引用同屬 Birthday Week 的〈Building a certificate authority for the whole Internet〉（09-29），依「系列活動上期已引用其中一場，本期不再引用同系列其他場次」規則淘汰；本期 ref-20 的根區 KSK 說明非 Birthday Week 系列。curl 200，JSON-LD datePublished 2026-10-05T13:00Z。

### EB. Anthropic 成立 Cyber Mission，推出免費 OSS Scanner 與關鍵基礎設施防禦計畫
- URL：https://www.anthropic.com/news/anthropic-cyber-mission
- 發布日期：2026-10-08
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：第二輪補搜候選。同站本期已收 Haiku 5.5，資安分類補搜後已達 8 筆；計畫啟動公告，OSS Scanner 尚無掃描成果可核對。curl 200，JSON-LD datePublished 2026-10-08T09:04Z。

### EC. Google 開放 SynthID Detector 給所有人
- URL：https://blog.google/innovation-and-ai/models-and-research/google-deepmind/synth-id-ai-content/
- 發布日期：2026-10-07
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：第二輪補搜候選。上期已收 SynthID Bio，同技術家族；AI 科技補搜後已達 6 筆，名額讓給維基媒體的一手事故調查。curl 200，article:published_time 2026-10-07T14:00Z。

### ED. NASA 與美國能源部簽署太空核能與推進備忘錄
- URL：https://www.nasa.gov/news-release/nasa-energy-department-advance-new-era-of-nuclear-powered-exploration/
- 發布日期：2026-10-08
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：第二輪補搜候選。合作框架備忘錄與時程預告（2028 年發射、2030 年月面反應器），無技術細節；其他領域已有四則。curl 200，頁面 Oct 08, 2026。
