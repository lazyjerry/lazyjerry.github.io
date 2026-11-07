# 候選來源整理

- 報告日期：2026-11-07
- 時間範圍：2026-10-24 至 2026-11-07（含首尾）
- 判定原則：以原始頁面標示的發布日為準；無法確認落在時間窗內者直接排除。
- 來源優先序：官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載。中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。
- 跨期去重：本期窗期與 2026-10-31 期（2026-10-17 至 2026-10-31）重疊八天、與 2026-10-24 期（2026-10-10 至 2026-10-24）重疊一天，篩選前已比對兩期 `references.md` 與上期淘汰清單，重複事件即使落在窗內也淘汰。
- 蒐集方式：四組 `tech-collector` 代理依分類平行蒐集，主編收斂、複審並逐筆回原頁核對；摘要只寫該來源原頁可查證的內容，其他媒體的細節記在備註。

## 正式納入來源

### 1. OpenAI 發表資安專用模型 GPT-6 Cyber，在 Firefox 找出 81 個未知高風險漏洞
- 原始標題：OpenAI發表GPT-6 Cyber，找出Firefox 81個未知高風險漏洞
- 標題：OpenAI 發表資安專用模型 GPT-6 Cyber，在 Firefox 找出 81 個未知高風險漏洞
- URL：https://www.ithome.com.tw/news/180285
- 摘要：iThome 報導，OpenAI 周四（11/5）發表資安研究專用模型 GPT-6 Cyber。OpenAI 研究人員以它檢測 Firefox 程式碼庫，發現 81 個先前未知的高風險漏洞，並確認另外 30 個已知漏洞的嚴重程度高於原先評估，相關證據與修補建議已提供給 Mozilla，Mozilla 已完成其中多項修補。Linux 核心測試中，從 2,308 個疑似漏洞成功重現 1,724 個，並針對其中 948 個開發出可實際運作的提權攻擊程式，耗費約 121 萬美元 API 額度，平均每項約 1,279 美元；GPT-5.6 Sol 在 7 月的相同研究架構下僅成功利用 166 個。ExploitGym 成績 48.5%，高於 GPT-5.6 Cyber 的 32.1%。OpenAI 依準備度框架把模型的資安能力風險等級列為 Critical，初期僅透過 API 及 Codex 提供給部分經核准的 Daybreak Red 客戶，並已向 Linux 核心維護者通報 304 項重大發現。
- 權重：8/10
- 發布日期：2026-11-06
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：B 組存檔 pages/B-40-ithome.com.tw-180285.html，主編確認 curl HTTP 200；日期依頁面「2026-11-06 發表」與 class="created"。openai.com 擋抓取，以 iThome 為準。B 組列淘汰並建議交由 AI 科技，主編補入。grep 核對：GPT-6 Cyber、Firefox、81個、30個、2,308個、1,724個、948個、121萬美元、1,279美元、166個、48.5%、Daybreak Red、304項、Critical。

### 2. Gemini Omni 1.2 Flash 支援 15 秒影片，價格較 1.1 降 30%
- 原始標題：Gemini Omni 1.2 Flash: Fast and cost-effective with longer clips
- 標題：Gemini Omni 1.2 Flash 支援 15 秒影片，價格較 1.1 降 30%
- URL：https://blog.google/innovation-and-ai/technology/developers-tools/introducing-gemini-omni-1-2-flash/
- 摘要：Google DeepMind 宣布推出 Gemini Omni 1.2 Flash，並在 Gemini API 與 Gemini for business 正式開放（generally available），Google Cloud 也提供。新版支援原生 15 秒影片生成（Omni 1.1 為 10 秒），可在 3 至 15 秒間以 1 秒為單位指定長度，並新增多輪對話式編輯與更好的參考圖遵循，可結合角色、商品或風格圖片、最長 3 秒動態片段與音訊提示。官方表示價格較 Omni 1.1 降低 30%，720p 影片每秒 0.07 美元，可先以 360p 或 720p 草稿，再升級到 1080p 或 4K。輸出帶有不可察覺的 SynthID 浮水印。官方也說明快速的運動賽事動作、劇本快速變化與複雜物理仍在持續改善。
- 權重：8/10
- 發布日期：2026-11-05
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-05-deepmind.google-gemini-omni-12-flash.html；日期依 JSON-LD datePublished「2026-11-05T17:00:00+00:00」。deepmind.google 網址會轉址到 blog.google 的同一頁（canonical），兩份存檔（pages/A-05、pages/A-06）為同一篇；參考表改列 canonical 網址，作者為 Google DeepMind 產品經理。grep 核對：Gemini Omni 1.2 Flash、15-second、30%、$0.07 per second、Gemini API、Google Vids、SynthID、Provisioned Throughput、multi-turn、generally available。

### 3. Anthropic 發表 FlashProve，以 zkSNARK 證明模型推論
- 原始標題：Progress on provable inference for large language models
- 標題：Anthropic 發表 FlashProve，以 zkSNARK 證明模型推論
- URL：https://www.anthropic.com/research/provable-inference
- 摘要：Anthropic Frontier Red Team 發表可證明推論（provable inference）進展，目標是讓使用者能驗證回應確實來自開發者宣稱的模型，而非被路由服務暗中替換或遭人竄改。文中以名為 FlashProve 的系統改進 zkSNARK 推論證明，並稱由 Claude 產出優化。以 400B 參數的 Llama 4 Maverick、4 位元量化權重為例，單張 H100 每秒約產生 110 個 token 的證明，每 1,024 token 請求的證明約 19 MB，GPU 時間約為在 vLLM 執行模型本身的 70 至 95 倍。團隊以 Lean 提供可稽核的安全保證陳述，並以 Apache 2.0 授權釋出程式碼、Lean 證明與文件，也說明這是階段性進展而非完整研究議程。
- 權重：8/10
- 發布日期：2026-11-02
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-07-anthropic.com-provable-inference.html；日期依 JSON-LD datePublished 與 article:published_time「2026-11-02」，頁面亦標示 Published Nov 2, 2026。「由 Claude 產出優化」為 Anthropic 自述。grep 核對：FlashProve、zkSNARK、Llama 4 Maverick、110 tokens/second、~19 MB、70-95x、vLLM、Lean、Apache 2.0、Frontier Red Team。

### 4. Anthropic 工程團隊談代理記憶的組成與「dreaming」
- 原始標題：The components of agent memory
- 標題：Anthropic 工程團隊談代理記憶的組成與「dreaming」
- URL：https://www.anthropic.com/research/components-of-agent-memory
- 摘要：Anthropic 工程團隊說明如何為 Claude 設計跨工作階段的代理記憶，並以評測檢視各組成的貢獻。文中把記憶定義為 Claude 從經驗取得、保留於工作階段之間並存成可讀取脈絡的知識，不含權重更動、情境內學習與壓縮。團隊以 Claude Managed Agents 執行 CL-Bench 1.0 資料庫任務：Claude Opus 5 是這批模型中第一個能讓記憶形成學習迴圈者。玩 Pokémon Red 時，Sonnet 3.7 寫了 413 個記憶檔、拿到 1 枚徽章，Fable 5 只寫 9 個檔加上 global.md、拿到 4 枚。文中也說對較強的模型給予判斷重要性的自由，比設定固定規則有效；「dreaming」則是回頭檢視紀錄來修正錯誤，或產生新的筆記與表徵。
- 權重：8/10
- 發布日期：2026-11-06
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-08-anthropic.com-components-of-agent-memory.html；日期依 JSON-LD datePublished「2026-11-06」，頁面標示 Published Nov 6, 2026、Team Engineering。研究結果為 Anthropic 自家評測。grep 核對：CL-Bench、Claude Managed Agents、dreaming、sleep-time compute、Claude Opus 5、Pokémon Red、413 memory files、global.md、Fable 5、Continual Learning Bench。

### 5. Google、OpenAI、微軟與 Anthropic 支援共通 AI 訓練偏好訊號
- 原始標題：4大AI業者支援共通AI訓練偏好訊號，網站將可透過robots.txt統一設定
- 標題：Google、OpenAI、微軟與 Anthropic 支援共通 AI 訓練偏好訊號
- URL：https://www.ithome.com.tw/news/180132
- 摘要：iThome 報導，Google、OpenAI、微軟與 Anthropic 將支援共同的 AI 訓練偏好訊號，網站管理者未來可在 robots.txt 以共同標記 __usage_ai-training 表達是否允許內容用於生成式 AI 訓練，不必分別維護各家規則。提案由 Anthropic 工程師 Kevin Kelley 以個人 Internet-Draft 形式提交，源自 IETF AI Preferences 工作小組討論，尚未成為正式標準。報導指 Anthropic 已開始實作，OpenAI 預計未來數個月內支援，Google 計畫 2027 年導入，微軟預計 2027 年 2 月 1 日支援，並另提供 AI Grounding 設定。共同標記控制的是內容使用目的，不等於禁止搜尋引擎抓取。
- 權重：8/10
- 發布日期：2026-11-02
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200（帶瀏覽器 UA），存檔 pages/A-04-ithome.com.tw-180132.html；日期依頁面 class="created"「2026-11-02」。各家時程為記者依提案與業者說明整理，屬 iThome 敘述。grep 核對：__usage_ai-training、Kevin Kelley、Internet-Draft、IETF、Google-Extended、2027年2月1日、AI Grounding、Bing Webmaster Tools、NoArchive、GPTBot。

### 6. OpenAI 公布 LifeVal 基準，AI 助理仍難善用過往對話
- 原始標題：OpenAI揭露AI助理個人化瓶頸，模型仍難善用過往對話
- 標題：OpenAI 公布 LifeVal 基準，AI 助理仍難善用過往對話
- URL：https://www.ithome.com.tw/news/180267
- 摘要：iThome 報導，OpenAI 公布日常生活任務基準 LifeVal，共 169 項任務，涵蓋照護、教育、購物、個人財務與政府服務，結合去識別化的 ChatGPT 對話與記憶、參考檔案，測試 AI 以瀏覽器與電腦操作完成工作。研究發現，需要從歷史對話取得資訊的評分條件平均達標率僅 33.33%；被判定需要 ChatGPT 記憶者為 47.8%，需要額外背景資訊者為 55.8%。把原本直接提供的背景資訊放進歷史對話後，達標率從 55.8% 降到 41.5%。整體評測中 GPT-6 Astra 平均 80.6%，GPT-5.6 為 80.0%，GPT-5.2 為 49.3%。LifeVal 目前只公開論文與結果，未釋出完整資料集與評測程式。
- 權重：7/10
- 發布日期：2026-11-05
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200（帶瀏覽器 UA），存檔 pages/A-09-ithome.com.tw-180267.html；日期依頁面 class="created"「2026-11-05」。openai.com 擋抓取，改以 iThome 報導為準，未核對 OpenAI 原文。報導註明論文未指明個人化分析所採用的模型。grep 核對：LifeVal、169項任務、33.33%、47.8%、55.8%、41.5%、GPT-6 Astra、80.6%、GPT-5.6、49.3%。

### 7. OpenAI 收購 Pierre，擴充 Codex 程式碼管理與審查能力
- 原始標題：OpenAI收購Pierre，擴充Codex程式碼管理與審查能力
- 標題：OpenAI 收購 Pierre，擴充 Codex 程式碼管理與審查能力
- URL：https://www.ithome.com.tw/news/180257
- 摘要：iThome 報導，OpenAI 周三（11/4）宣布收購開發者工具新創 Pierre Computer Company，計畫整合其 Git 版本控制、程式碼儲存與審查技術到 Codex，交易金額未公開。Pierre 成立於 2023 年，旗下 Code Storage 以 Git 儲存程式碼並追蹤版本歷史，另有開源函式庫 Trees、Diffs 與 Highlights。OpenAI 表示收購前 Codex 已採用 Trees 與 Diffs，並承諾 Pierre 的開源專案維持開源、現有客戶可繼續使用 Code Storage。報導援引 Axios，認為這可能進一步挑戰微軟旗下 GitHub；也指出此事與 OpenAI 11/2 發表自建 Git 後端 Pando 相呼應，OpenAI 稱 Pando 可將推送延遲中位數縮短近 80%。
- 權重：8/10
- 發布日期：2026-11-05
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200（帶瀏覽器 UA），存檔 pages/A-01-ithome.com.tw-180257.html；日期依頁面 class="created"「2026-11-05」。openai.com 擋抓取，以 iThome 為準。「可能挑戰 GitHub」為 Axios 看法經 iThome 轉述。Pando 另有 iThome 180219 專文，列於淘汰候選供主編參考。grep 核對：Pierre Computer Company、Code Storage、Jacob Thornton、Axios、Pando、近80%、Trees、Diffs、Highlights、2,200萬美元。

### 8. GitHub Actions 將於 12 月 2 日預設封鎖公開儲存庫的 pull_request_target
- 原始標題：pull_request_target blocked by default December 2
- 標題：GitHub Actions 將於 12 月 2 日預設封鎖公開儲存庫的 pull_request_target
- URL：https://github.blog/changelog/2026-11-02-pull_request_target-blocked-by-default-december-2
- 摘要：GitHub 表示，自 2026 年 12 月 2 日起，GitHub Actions 將在所有公開儲存庫預設封鎖 pull_request_target 事件，除非適用的 Actions 事件政策明確允許；原訂 11 月 2 日強制執行。規則最初以評估模式運作，可先看哪些工作流程執行會被擋。私有與內部儲存庫不受影響。GitHub 說明原因：該事件在基底儲存庫情境執行並可存取機密，若執行來自 fork 的不受信任程式碼，可能危及管線或竊取機密。永久強制前會有兩次演練封鎖，11 月 9 日與 11 月 16 日，皆為 UTC 16:00 至 18:00，期間被擋的執行會失敗並附錯誤註解。適用 Free、Team 與 Enterprise Cloud，不含 Enterprise Server。
- 權重：8/10
- 發布日期：2026-11-02
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-12-github.blog-pull_request_target.html；日期依 JSON-LD datePublished「2026-11-02T07:14:46-08:00」（UTC 2026-11-02）。與上期已引用的 GitHub package firewall、GitHub Universe 為不同事件。grep 核對：pull_request_target、December 2, 2026、November 2, 2026、November 9, 2026、November 16, 2026、16:00–18:00、brownout、evaluate mode、GitHub Enterprise Server、workflow file targeting。

### 9. Go 部落格：encoding/json/v2 在 Go 1.27 正式可用
- 原始標題：A new Go API for JSON
- 標題：Go 部落格：encoding/json/v2 在 Go 1.27 正式可用
- URL：https://go.dev/blog/jsonv2
- 摘要：Go 團隊表示，新的 encoding/json/v2 與 encoding/json/jsontext 套件已穩定，並在 Go 1.27 正式可用。文章回顧 encoding/json 的缺陷，例如接受無效 UTF-8、接受重複成員名稱，以及 Encoder 與 Decoder 缺乏真正串流而在特定情形下效能呈二次方。v2 的目標是修正這些問題，同時讓 v1 使用者容易遷移，選項成為 marshal 與 unmarshal 函式的一級參數。效能方面，Marshal 與 v1 大致相當，Unmarshal 明顯較快，基準測試最高達 10 倍；要取得更多收益，既有 Marshaler 與 Unmarshaler 實作需改為 MarshalerTo 與 UnmarshalerFrom 以串流處理。
- 權重：8/10
- 發布日期：2026-11-04
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-10-go.dev-jsonv2.html；日期依頁面作者列「4 November 2026」，亦與 go.dev/blog/feed.atom 的 2026-11-04 一致。原頁自述為去年實驗性介紹文章的更新版。grep 核對：encoding/json/v2、encoding/json/jsontext、Go 1.27、RFC 8259、4 November 2026、Michael Pratt、MarshalerTo、UnmarshalerFrom、up to 10x、invalid UTF-8。

### 10. Claude Code v2.1.319：LLM 閘道後的 auto mode 改為無法伺服器端檢查就詢問或拒絕
- 原始標題：v2.1.319
- 標題：Claude Code v2.1.319：LLM 閘道後的 auto mode 改為無法伺服器端檢查就詢問或拒絕
- URL：https://github.com/anthropics/claude-code/releases/tag/v2.1.319
- 摘要：Claude Code v2.1.319 於 UTC 11 月 6 日在 GitHub 發布。行為變更方面，auto mode 在關閉遙測或功能旗標（包括位於 LLM 閘道後）時，伺服器無法檢查的呼叫會改為詢問或拒絕，不再退回內建分類器；要沿用內建分類器需設定 CLAUDE_CODE_AUTO_MODE_SERVER=0，Bedrock、Vertex 與 Foundry 不受影響。新增功能包括：MCP 伺服器以 task 執行工具呼叫時，終端機會立即移到背景、完成後通知 Claude，可用 CLAUDE_CODE_DISABLE_MCP_TASK_BACKGROUND 關閉；permissions.denyInsteadOfPrompting 設定讓原本要等權限提示的工具呼叫直接被拒、回合繼續；CLAUDE_CODE_DISABLE_FEATURE_FLAGS 可停止取得功能旗標而不關閉遙測。修正項目包括 claude -p 在 auto mode 因沒有安全檢查而拒絕動作時，原本以 0 結束，現在改為 1。
- 權重：7/10
- 發布日期：2026-11-06
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/X-github.com-claude-code-v2.1.319.html；日期依 relative-time datetime「2026-11-06T17:04:01Z」，內文另以 GitHub API 取得。窗內另有 v2.1.317（11-03）與 v2.1.318（11-04），以變更較大的 v2.1.319 為代表；上期已收 v2.1.316。grep 核對：v2.1.319、CLAUDE_CODE_AUTO_MODE_SERVER、Bedrock、CLAUDE_CODE_DISABLE_MCP_TASK_BACKGROUND、denyInsteadOfPrompting、CLAUDE_CODE_DISABLE_FEATURE_FLAGS、claude -p、built-in classifier。

### 11. VS Code 1.145：遠端代理工作階段預覽應用程式、cron 排程與代理詳盡度
- 原始標題：Visual Studio Code 1.145
- 標題：VS Code 1.145：遠端代理工作階段預覽應用程式、cron 排程與代理詳盡度
- URL：https://code.visualstudio.com/updates/v1_145
- 摘要：VS Code 1.145 於 2026 年 11 月 4 日釋出，主打讓遠端代理工作階段更像本機：在 Agents 視窗透過遠端代理主機載入整合瀏覽器，預覽代理在遠端機器啟動的開發伺服器（Preview），並可使用互動式 canvases。Automations 可用 cron 運算式設定排程，超出內建預設；對話新增代理詳盡度選項（Experimental），可選精簡或完整顯示推理與工具呼叫；另有排除資料夾但仍保持檔案可見與可搜尋的檔案排除功能。原頁並列出彩蛋式的 Blobby 跳躍小遊戲。頁首另註記 1.145.1 與 1.145.2 兩次修正更新。
- 權重：7/10
- 發布日期：2026-11-04
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-11-code.visualstudio.com-v1_145.html；日期依頁面「Release date: November 4, 2026」，與 code.visualstudio.com/feed.xml 的 2026-11-04 一致（頁面 JSON-LD datePublished 為 2021-11-03，非本篇發布日，不採用）。與上期淘汰的 1.144 為不同版本。grep 核對：Visual Studio Code 1.145、Release date: November 4, 2026、1.145.1、1.145.2、workbench.browser.enableRemoteProxy、Remote canvases、cron、Agent verbosity、Blobby、File exclusions。

### 12. 微軟 .NET 團隊展示把 Agent Skills 封裝進 NuGet 套件
- 原始標題：Delivering Skills in NuGet packages
- 標題：微軟 .NET 團隊展示把 Agent Skills 封裝進 NuGet 套件
- URL：https://devblogs.microsoft.com/dotnet/delivering-skills-in-nuget-packages/
- 摘要：.NET 團隊分享實驗：把 Agent Skills（SKILL.md）放進 NuGet 套件，讓每個套件版本都帶有量身的使用指引。文章指出，剛發布的新版 API 不在模型知識內，而 dotnet restore 本來就會把套件下載到本機，套件內的 SKILL.md 也會一併取得。團隊提供 dotnet-inspect 檢查套件內的技能，以及 dotnet-package-skills 掃描專案並把技能複製到 .agents/skills 目錄，並以 Markout 函式庫示範。測試結果是：使用前沿模型時效益改善空間不大；較弱模型則因遵循技能的程度較低而表現不穩。NuGet MCP 尚未支援技能，團隊計畫之後處理。
- 權重：7/10
- 發布日期：2026-11-03
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-13-devblogs.microsoft.com-nuget-skills.html；日期依 JSON-LD datePublished 與 article:published_time「2026-11-03T19:00:14+00:00」。iThome 180214 有同事件報導（2026-11-04），其中「供應鏈攻擊途徑」提醒為 iThome 轉述微軟提醒，本筆摘要未採用。grep 核對：SKILL.md、dotnet restore、dotnet-inspect、dotnet-package-skills、Markout、.agents/skills、NuGet MCP、Pareto efficiency、introduced by Anthropic、in 2025。

### 13. OpenSSH 發布緊急更新 10.6p2，修補長密碼可繞過身分驗證的 SSHole 漏洞
- 原始標題：OpenSSH發布緊急更新，修補可利用長密碼繞過身分驗證的資安漏洞SSHole
- 標題：OpenSSH 發布緊急更新 10.6p2，修補長密碼可繞過身分驗證的 SSHole 漏洞
- URL：https://www.ithome.com.tw/news/180281
- 摘要：資安研究公司 Wakefield 揭露 OpenSSH 存在長達約 10 年的密碼驗證繞過漏洞 SSHole（CVE-2026-123158），CVSS 評分 8.1。攻擊者只要在密碼欄位輸入 257 至 1,024 個字元的任意字串，就可能登入原本沒有設定密碼的帳號。問題只影響採用 musl C 函式庫、OpenSSH 未啟用 PAM、密碼驗證保持開啟的 Linux 系統，包含 Alpine Linux、OpenWrt、postmarketOS 與部分 Docker 映像檔。Wakefield 指出，成因是 musl（2012）、OpenSSH（2016）與 Alpine Linux（2022）三個專案各自的防護調整組合出可利用條件。Wakefield 於 11 月 3 日發現並通報，OpenSSH 於 11 月 5 日發布 10.6p2，Alpine 也釋出修補套件。無法立即更新時，可停用 PasswordAuthentication；若登入記錄中密碼欄位為「*」的帳號出現 Accepted password，應視為可能遭利用。
- 權重：9/10
- 發布日期：2026-11-06
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-01-ithome.com.tw-180281.html；日期依 iThome 頁面日期列 class="created"「2026-11-06」（無 JSON-LD datePublished）。交叉核對一手來源 OpenSSH 官方 10.6p2 發布說明（https://www.openssh.com/txt/release-10.6p2，curl 跟隨轉址後 HTTP 200，存檔 pages/B-08-openssh.com-release-10.6p2.txt），載明 2026-11-05 發布、critical security workaround 影響使用 musl libc 且關閉 PAM 的 Linux 系統、回報者為 Wakefield；官方說明未使用 SSHole 或 CVE 名稱，故摘要採 iThome 內容。本期首見，與上期 Linux TCP、PHP2Shell 事件不同。 grep 核對：SSHole、CVE-2026-123158、10.6p2、Wakefield、musl、PAM、Alpine Linux、257至1,024個字元、PasswordAuthentication、Accepted password。

### 14. cPGuard 更新通道遭入侵，約 2,950 臺伺服器執行遭竄改更新而中招
- 原始標題：cPGuard更新通道遭到入侵，近3千臺伺服器被植入惡意程式
- 標題：cPGuard 更新通道遭入侵，約 2,950 臺伺服器執行遭竄改更新而中招
- URL：https://www.ithome.com.tw/news/180217
- 摘要：伺服器資安防護軟體 cPGuard 的開發商 OpsShield 於 11 月 3 日揭露供應鏈攻擊：攻擊者入侵其帳務及授權伺服器，取得更新所需金鑰，竄改 cPGuard 更新內容，約 2,950 臺客戶伺服器下載並執行。攻擊發生於 UTC 11 月 2 日凌晨 2 時 6 分，若在 2 時 8 分至 3 時 20 分之間檢查並安裝更新，或版本為 5.88.12 至 5.88.19，可能已中招。惡意更新以 root 權限蒐集 /etc/shadow、/etc/passwd、root 的 SSH 私鑰、MySQL root 密碼與 Shell 記錄，部分伺服器的 S3 存取金鑰也受影響，並留下隱藏的 root Shell 與排程工作。攻擊者另從帳務系統竊得約 7,900 筆客戶帳號資料。OpsShield 已撤銷遭竊金鑰、發布可移除後門的 cPGuard 5.88.26，並呼籲輪替或重設憑證。
- 權重：8/10
- 發布日期：2026-11-04
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-03-ithome.com.tw-180217.html；日期依 iThome 頁面日期列 class="created"「2026-11-04」，OpsShield 公告日為 11 月 3 日（依 iThome 轉述，未另開 OpsShield 原始公告）。供應鏈攻擊。 grep 核對：cPGuard、OpsShield、2,950臺、5.88.12至5.88.19、5.88.26、/etc/shadow、MySQL、S3、7,900筆、世界協調時間（UTC）11月2日。

### 15. Cursor 擴充套件市集出現惡意 Claude Code for VS Code 版本，企圖在開發者電腦建立 SSH 後門
- 原始標題：Cursor市集出現惡意Claude Code擴充套件，攻擊者企圖建立SSH後門
- 標題：Cursor 擴充套件市集出現惡意 Claude Code for VS Code 版本，企圖在開發者電腦建立 SSH 後門
- URL：https://www.ithome.com.tw/news/180119
- 摘要：iThome 報導，Cursor 公告旗下擴充套件市集 10 月 29 日出現遭植入惡意程式碼的 Claude Code for VS Code 擴充套件，受影響版本為 2.1.312 及 2.1.313，可能有多達 5,000 名使用者受影響，惡意版本上架約 11 小時後下架。資安研究業者 Phorion 發現，編輯器載入受影響的擴充套件後，惡意程式碼會自動執行，嘗試把攻擊者的 SSH 公鑰加入授權金鑰檔案，即使移除擴充套件仍可能留有惡意元件。微軟安全研究人員確認，這批惡意版本並未透過 Visual Studio Marketplace 或 NPM 套件 @anthropic-ai/claude-code 散布，Anthropic 也向微軟確認公司系統未遭入侵。Cursor 表示惡意程式碼並非 Anthropic 開發，要求客戶更新至 2.1.314，並公布檢查與清除方式。
- 權重：8/10
- 發布日期：2026-11-02
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/X-ithome.com.tw-180119.html；日期依頁面「2026-11-02 發表」。事件日 10-29 在窗內。Cursor 公告與 Phorion 原文未另開，以 iThome 為準。grep 核對：Cursor、Claude Code for VS Code、2.1.312、2.1.313、5,000名、11小時、Phorion、Visual Studio Marketplace、@anthropic-ai/claude-code、2.1.314。

### 16. 永豐銀行異常轉帳確認為駭客攻擊，起因是新網銀交易系統供應商的安全設定漏洞
- 原始標題：永豐銀行異常轉帳確認為駭客攻擊，供應商安全設定漏洞遭利用
- 標題：永豐銀行異常轉帳確認為駭客攻擊，起因是新網銀交易系統供應商的安全設定漏洞
- URL：https://www.ithome.com.tw/news/180233
- 摘要：永豐銀行於 11 月 4 日晚間召開緊急記者會，表示日前客戶帳戶異常轉帳事件已確認是外部駭客利用新網銀交易系統供應商的安全設定漏洞所致，先前該行曾說明為新網銀系統程式異常。先前傳出事件初步影響 400 多名客戶、每筆轉出約 10 萬元，款項已於 11 月 3 日全數返還。該行表示已阻斷攻擊手法、加強驗證與異常交易監控，並透過金融資安資訊分享與分析中心（F-ISAC）分享情資，也將向未公布身分的外國系統供應商求償。受影響客戶的身分證字號均為 P 開頭，銀行說明駭客是以特定手法隨機嘗試取得首碼相同的有效帳戶資料，並非先取得個資，目前尚未發現個資外洩跡象。該交易系統在臺灣尚無其他金融業者導入；記者詢問的駭客轉帳手法與限額問題，銀行表示無法透露細節。
- 權重：8/10
- 發布日期：2026-11-04
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-02-ithome.com.tw-180233.html；日期依 iThome 頁面日期列 class="created"「2026-11-04」，內文為 11 月 4 日晚間記者會。台灣企業資安事件。原頁指出銀行對駭客如何未經授權完成轉帳等問題無法透露細節，摘要已保留限定語氣。 grep 核對：永豐銀行、新網銀交易系統、供應商、11月3日、F-ISAC、富邦銀行、身分證字號、P開頭、400多名客戶、求償。

### 17. TWCA 部分 CA 憑證序號亂數不足遭 Mozilla 揭露，數發部要求換發並啟動第三方檢測
- 原始標題：TWCA CA憑證序號亂數不足遭Mozilla揭露，數發部要求換發並啟動第三方檢測
- 標題：TWCA 部分 CA 憑證序號亂數不足遭 Mozilla 揭露，數發部要求換發並啟動第三方檢測
- URL：https://www.ithome.com.tw/news/180167
- 摘要：Mozilla Bugzilla 揭露臺灣網路認證（TWCA）部分 CA 憑證的序號雖有 128 bits，但真正由密碼學安全亂數產生的只有約 24 bits，低於 CA/Browser Forum 要求至少 64 bits 的規範；研究人員檢視 24 張 CA 憑證，皆發現相同結構。數發部表示 10 月 30 日接獲通報後，要求 TWCA 於 2 日內產製新憑證；政府端影響 962 個機關、共 9,772 張網站 TLS 憑證，TWCA 於 11 月 1 日完成重新產製並主動以 Email 補發。TWCA 強調並非網站遭入侵或私鑰外洩，成因是 2016 年規範調整時，CA 端憑證產製程式未同步更新。原頁引述 Will 保哥的說法，指出目前沒有證據顯示造成立即危害；報導並指核心問題是合規性。數發部也將委託第三方檢視 TWCA 憑證產製與管理流程。
- 權重：8/10
- 發布日期：2026-11-03
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-05-ithome.com.tw-180167.html；日期依 iThome 頁面日期列 class="created"「2026-11-03」。歸因：「沒有證據顯示造成立即危害」是原頁引述多奇數位創意技術總監黃保翕的個人臉書說法；「非資安事件」是 TWCA 的說法。台灣題。 grep 核對：TWCA、Bugzilla、24 bits、64 bits、CA/Browser Forum、962個政府機關、9,772張、11月6日、數發部、CSPRNG。

### 18. 中國駭客利用 Zyxel GS1900 交換器零時差漏洞，Binarly 揭露前次修補不完整
- 原始標題：中國駭客利用Zyxel GS1900系列交換器零時差漏洞並竊得敏感資料
- 標題：中國駭客利用 Zyxel GS1900 交換器零時差漏洞，Binarly 揭露前次修補不完整
- URL：https://www.ithome.com.tw/news/180254
- 摘要：兆勤（Zyxel）修補 GS1900 系列交換器漏洞 CVE-2026-107441，通報的韌體安全公司 Binarly 公布發現過程。Binarly 在調查資安廠商 Acronis、GreyNoise 揭露的中國駭客 Red Heron 及相關團體 Kapibala 時，於其 Linux 惡意程式 Jitterly、Rootkit 程式 Sixzut 的基礎設施中，發現經混淆的 Python 漏洞利用工具，目標是 GS1900 的網頁管理介面。該工具針對已修補 CVE-2026-7273 的交換器，因為先前修補沒有完全消除底層弱點，被登記為獨立的 CVE-2026-107441。漏洞位於 dispatcher.cgi，會把 HTTP POST 參數複製到固定大小的全域記憶體區塊，卻在複製前未充分檢查參數長度與數量；先前加入的參數數量檢查排在複製之後，攻擊者仍可先以過長參數破壞計數器再繞過檢查，進而取得任意記憶體寫入能力。
- 權重：8/10
- 發布日期：2026-11-05
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-07-ithome.com.tw-180254.html；日期依 iThome 頁面日期列 class="created"「2026-11-05」。同事件的修補公告報導 iThome 180252（Zyxel 11 月 3 日公告、CVSS 8.8 取自 Tenable 與 EUVD，列淘汰備援）。摘要只寫本篇內容；本篇是否「已遭實際利用」以標題為「零時差漏洞」，內文敘述為在駭客基礎設施發現利用工具。 grep 核對：CVE-2026-107441、Binarly、Red Heron、Kapibala、Jitterly、Sixzut、CVE-2026-7273、dispatcher.cgi、HTTP POST、任意記憶體寫入。

### 19. NVIDIA 公布 Vera CPU 代理工作負載數據：每瓦可跑的代理數為最快 x86 的 1.6 倍
- 原始標題：Vera Delivers the Best of Both Worlds: Highest Throughput and Fastest Agents
- 標題：NVIDIA 公布 Vera CPU 代理工作負載數據：每瓦可跑的代理數為最快 x86 的 1.6 倍
- URL：https://blogs.nvidia.com/blog/vera-cpu-highest-throughput-fastest-agents/
- 摘要：NVIDIA 官方部落格指出，AI 代理在 GPU 推理與 CPU 執行之間來回，AI 工廠受限於電力，需要兼顧速度與每瓦容量的 CPU。文中稱在 100 MW 資料中心的比較中，NVIDIA 發現單一 Vera CPU 優於最快與最省電的 x86 CPU：相較最快的 x86，每瓦可支援的代理數為 1.6 倍；相較最省電的 x86，代理速度為 2 倍。早期採用者數據包含：Perplexity 的代理式寫程式任務快 1.5 倍並計畫部署；DeepInfra 最高達最佳 x86 的 2.2 倍；ClickHouse 以標準二進位檔跨 176 核心近線性擴展並登上 ClickBench 硬體排行榜榜首；Daytona 以 10.8 秒啟動 1,000 個代理沙箱，對比 x86 的 88.4 秒；Modal 每核心沙箱吞吐最高 2 倍。以上皆為 NVIDIA 自行發布的比較與合作夥伴測試結果。
- 權重：7/10
- 發布日期：2026-11-05
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-21-blogs.nvidia.com-vera-cpu.html；日期依 JSON-LD datePublished「2026-11-05T20:00:41+00:00」與頁面日期列「November 5, 2026」（台灣時間 11-06 清晨）。數據皆為 NVIDIA 自行比較，已在摘要標明；與上期 NVIDIA×Meta（ref-60）為不同事件。 grep 核對：Vera、100-megawatt、1.6x more agents per watt、2x faster agent speed、Perplexity、DeepInfra、ClickHouse、ClickBench、Daytona、10.8 seconds、88.4 seconds。

### 20. Marvell 擬以約 1,150 億美元全股票收購 Lumentum，整合 AI 晶片與光通訊
- 原始標題：Marvell砸1,150億美元收購Lumentum，整合AI晶片與光通訊技術
- 標題：Marvell 擬以約 1,150 億美元全股票收購 Lumentum，整合 AI 晶片與光通訊
- URL：https://www.ithome.com.tw/news/180171
- 摘要：Marvell 於 11 月 2 日宣布以全股票交易收購光通訊元件業者 Lumentum，交易企業價值約 1,150 億美元，預計 2028 年上半年完成。Lumentum 股東每持有 1 股可換 4.5 股 Marvell 股票，相當於每股約 1,132 美元，較 10 月 28 日收盤價溢價 23.9%；交易完成後 Marvell 原股東持有約 67%。雙方要整合 AI 晶片、網路交換與光通訊技術，強化 AI 資料中心的高速互連，Marvell 預估合併後可服務市場規模達 5,500 億美元。報導引述 SiliconANGLE，指出 Lumentum 掌握磷化銦雷射、光放大器與光電路交換器，去年也推出針對共封裝光學（CPO）最佳化的雷射。Marvell 預期長期每年成本綜效超過 10 億美元；消息公布當天 Marvell 股價下跌約 13%，Lumentum 重挫近 19%。
- 權重：7/10
- 發布日期：2026-11-03
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-23-ithome.com.tw-180171.html；日期依 iThome 頁面日期列 class="created"「2026-11-03」，原頁稱 Marvell 周一（11/2）宣布。Marvell 官網 403，未取得一手新聞稿；磷化銦、CPO 等技術背景為 iThome 引述 SiliconANGLE，Murphy 談話引述 CNBC，皆非 iThome 自行查證。屬併購新聞，權重 7/10。 grep 核對：Marvell、Lumentum、1,150億美元、2028年上半年、4.5股、23.9%、67%、5,500億美元、共封裝光學、CPO。

### 21. Apple 發表 iPad mini：8.5 吋 OLED、A20 Pro 與 IP67，11 月 6 日開賣
- 原始標題：Apple gives iPad mini its biggest update ever
- 標題：Apple 發表 iPad mini：8.5 吋 OLED、A20 Pro 與 IP67，11 月 6 日開賣
- URL：https://www.apple.com/newsroom/2026/10/apple-gives-ipad-mini-its-biggest-update-ever/
- 摘要：Apple 發表新款 iPad mini，採用 8.5 吋 OLED 顯示器（另有奈米紋理選項），尖峰亮度最高 1200 nits，為前代 2 倍以上，並有 IP67 防水防塵。晶片為 A20 Pro，每個 GPU 核心配有 Neural Accelerator，512GB 版本具備雙 16 核心 Neural Engine；原頁指出統一記憶體頻寬增加逾 2 倍。新機首度搭載 N1 無線網路晶片與 C2 數據機，前鏡頭為橫向邊緣的 12MP Center Stage，並新增 Acoustic Display。預載 iPadOS 27 與新一代 Apple Intelligence 及 Siri AI，支援 Apple Pencil Pro 與 Apple Pencil（USB-C）。10 月 28 日起在 36 個國家與地區預購，11 月 6 日開始到貨與上架，容量 128GB、256GB、512GB，Wi-Fi 版美國售價 699 美元起、Wi-Fi + Cellular 版 849 美元起。
- 權重：8/10
- 發布日期：2026-10-26
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-20-apple.com-ipad-mini.html；日期依 JSON-LD datePublished「2026-10-26Z」（Apple Newsroom RSS 條目日期亦為 2026-10-26）。與上期 MacBook Pro M6／PROLED 為不同產品；同批 iMac M6 上期已淘汰，不重複。原頁為新聞稿，規格與價格為 Apple 自述；「雙 16 核心 Neural Engine」原頁限定 512GB 組態。 grep 核對：A20 Pro、8.5-inch OLED、1200 nits、IP67、Neural Accelerators、Dual 16-core Neural Engine、N1 wireless networking chip、C2 modem、$699、November 6。

### 22. Google 指控 Android 裝置製造商 Videostrong 預載後門，XCPE 殭屍網路控制逾 130 萬臺機上盒
- 原始標題：XCPE殭屍網路控制逾130萬臺機上盒，Google指控Android裝置製造商刻意預載後門
- 標題：Google 指控 Android 裝置製造商 Videostrong 預載後門，XCPE 殭屍網路控制逾 130 萬臺機上盒
- URL：https://www.ithome.com.tw/news/180161
- 摘要：Google 威脅情報團隊（GTIG）揭露 XCPE 殭屍網路瓦解行動，該網路控制全球超過 130 萬臺機上盒。Google 指控 Android 裝置製造商 Videostrong 刻意在韌體預載後門，向犯罪合作夥伴販售裝置存取權限，用於廣告詐欺或充當常駐代理網路節點。Videostrong 同時是 OEM 與 ODM，Google 高度確信這是公司刻意行為；惡意程式主要出現在 Android TV 機上盒，也見於部分遠距醫療裝置、卡拉OK 設備與數位看板。Google 已瓦解 C2 基礎設施，並禁止該公司製造、銷售經 Google 認證的 Android 裝置，同時調整認證程序、強化 Android TV 韌體完整性檢查。但後門預載於韌體，移除後重新開機仍會從韌體分割區自動重裝，原頁引述 Bleeping Computer，指出使用者可能需要重新安裝未受感染的韌體。
- 權重：8/10
- 發布日期：2026-11-04
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-24-ithome.com.tw-180161.html；日期依 iThome 頁面日期列 class="created"「2026-11-04」。未開 Google GTIG 原始報告。同事件另有 iThome 180211／180216（XCPE 波及臺灣近 9 萬臺 Android 設備、全球排名第 5，來自資安日報，未開原頁核對內文），可作台灣影響補充。歸類硬體或軟硬整合（韌體預載），亦可歸軟硬體資訊安全，由主編裁量。 grep 核對：XCPE、Videostrong、130萬臺、GTIG、OEM、ODM、C2、Android TV、韌體分割區、Bleeping Computer。

### 23. Debian、Ubuntu 修補 APT 驗證繞過漏洞，中間人可在下載重試時替換套件取得 root
- 原始標題：Debian、Ubuntu修補高風險APT套件漏洞，中間人可替換套件取得root權限
- 標題：Debian、Ubuntu 修補 APT 驗證繞過漏洞，中間人可在下載重試時替換套件取得 root
- URL：https://www.ithome.com.tw/news/180262
- 摘要：Debian 與 Ubuntu 發布 APT 安全更新，修補驗證繞過漏洞 CVE-2026-109518。攻擊者若能控制系統與套件伺服器之間的 HTTP 傳輸流量，可在特定條件下替換已通過驗證的套件，使其以 root 權限執行任意程式碼。成因是 HTTP 重新導向讓兩個下載工作指向相同 URI 時，APT 可能合併工作；遇到暫時性 HTTP 錯誤而重新下載時，對檔案硬連結處理不當，已驗證的套件就可能被覆寫。利用條件包括攻擊者能操控 HTTP 流量、目標正在安裝套件且啟用下載重試；APT 自 2.3.2 版起預設啟用重試，Debian 12 與 Ubuntu 22.04 LTS 以後預設皆受影響。Canonical 評為高風險，CVSS 4.0 為 7.7，Snap 不受影響。Debian 12、13 已推出 APT 2.6.2、3.0.4，管理員可暫時關閉下載重試，或改用 HTTPS 套件來源降低風險。
- 權重：8/10
- 發布日期：2026-11-05
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-33-ithome.com.tw-180262.html；日期依 iThome 頁面日期列 class="created"「2026-11-05」。屬 Linux 套件管理基礎設施漏洞，亦可歸軟硬體資訊安全，由主編裁量；摘要只寫 iThome 內容，Debian、Canonical 公告未另開。 grep 核對：CVE-2026-109518、APT、HTTP重新導向、硬連結、2.3.2、Debian 12、Ubuntu 22.04、CVSS 4.0、7.7、2.6.2、Snap。

### 24. Cloudflare 如何把 DNS 建置延遲減半、記憶體用量降低 85%
- 原始標題：How we halved DNS build delay and cut memory use by 85%
- 標題：Cloudflare 如何把 DNS 建置延遲減半、記憶體用量降低 85%
- URL：https://blog.cloudflare.com/dns-targeted-zone-builds/
- 摘要：Cloudflare 說明其 DNS 傳播管線中 Zone Builder 的改進。2022 年 Zone Builder 每秒約處理 250 筆 DNS 記錄變更，現在約 700 筆，另有約 100 筆區域設定等事件；部分區域已有超過 2,000 萬筆記錄，預期往數億筆成長。過去區域設定變更會重建整個區域，記錄數千萬筆的區域連記憶體都放不下。團隊打造「目標建置規劃器」，選出能證明安全的最小建置，並用新排程器合併同一區域的工作，使完整建置減少約 40%、尖峰記憶體降低 85%，並得以縮短管線為求韌性而設的等待時間，讓 DNS 變更到資料寫入 Quicksilver 的時間減半。文中也談到事件必須說明變更內容、共用資料與資料庫在事件和建置之間可能改變等挑戰。
- 權重：8/10
- 發布日期：2026-11-02
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-10-blog.cloudflare.com-dns-targeted-zone-builds.html；日期依 JSON-LD datePublished 與 article:published_time「2026-11-02T14:00:00.000Z」。與上期 Cloudflare 各篇（KV 快取、DDoS 報告、私有來源等）為不同題材。摘要的「2,000 萬筆」即原頁 more than 20 million records。 grep 核對：Zone Builder、Quicksilver、Kafka、250 DNS record changes per second、700、20 million records、40%、85%、Universal SSL、targeted build planner。

### 25. NetApp 揭露多款儲存產品受 Linux 核心 TCP 漏洞 CVE-2026-98432 影響
- 原始標題：NetApp揭露旗下多款儲存產品受Linux核心TCP漏洞影響
- 標題：NetApp 揭露多款儲存產品受 Linux 核心 TCP 漏洞 CVE-2026-98432 影響
- URL：https://www.ithome.com.tw/news/180208
- 摘要：Linux 核心 TCP 漏洞 CVE-2026-98432 不只影響各發行版，也涵蓋基於 Linux 平臺的其他產品。儲存廠商 NetApp 於 11 月 2 日發布公告，指出受影響產品包括 AFF、ASA 與 FAS 系列儲存設備的 BMC 控制器與 Service Processor 處理器、E 系列儲存設備的 SANtricity OS、StorageGRID 系列儲存設備，以及 ONTAP Select Deploy 管理工具。漏洞位於 IPv4 TCP 連線處理程序，NetApp 表示可能造成儲存設備敏感資訊外洩、資料新增或竄改，以及服務阻斷。公告中尚未列出已修補版本，NetApp 提醒用戶檢查設備與軟體版本、持續追蹤修補資訊，待修補版本發布後儘速升級，並限制 BMC 與 Service Processor 等管理介面僅能由可信任的管理網路存取。
- 權重：7/10
- 發布日期：2026-11-04
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-32-ithome.com.tw-180208.html；日期依 iThome 頁面日期列 class="created"「2026-11-04」。上期已引用同一 Linux TCP 漏洞的 iThome 180101（ref-12，MPTCP 與發行版修補），本篇為新進展：廠商產品受影響與 NetApp 公告，未重複上期內容。NetApp 公告原頁未另開。 grep 核對：CVE-2026-98432、NetApp、BMC、Service Processor、SANtricity OS、StorageGRID、ONTAP Select Deploy、IPv4、11月2日、服務阻斷。

### 26. IREN 延後交付微軟 AI 基礎設施，宣布追加約 150 億美元資本支出
- 原始標題：IREN延後交付微軟AI基礎設施　宣布追加150億美元投資
- 標題：IREN 延後交付微軟 AI 基礎設施，宣布追加約 150 億美元資本支出
- URL：https://www.cna.com.tw/news/ait/202611060121.aspx
- 摘要：中央社綜合外電報導，AI 資料中心與雲端基礎設施公司 IREN 於 11 月 5 日宣布，延後部分為微軟建置基礎設施的交付時程，並提出規模約 150 億美元的投資計畫。IREN 表示交付延遲是因微軟要求修改網路設計，不會導致財務處罰；超過 40 億美元年化營收目標的達成時間從年底延至明年 1 月，進度可能再延至 2 月底，IREN 指出這項調整是因客戶要求變更設計與供應商交貨時程。IREN 正在德州為微軟建置 200 MW 的資料中心。彭博稍早報導，微軟正加強監督由 IREN、Nebius 與 Nscale 等新雲端業者承接的部分資料中心專案，原因是專案出現延遲與成本上升；路透報導 AI 類股拋售重創晶片與 neocloud 業者。IREN 季報顯示截至 9 月底資本承諾 189.5 億美元，GPU 硬體價值由 20.4 億美元增至 58.2 億美元。
- 權重：7/10
- 發布日期：2026-11-06
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-31-cna.com.tw-202611060121.html；日期依 JSON-LD datePublished「2026-11-06T12:59:00+08:00」。歸因：原頁為中央社綜合外電，延遲原因為 IREN 說法，微軟加強監督與退出較高風險專案為彭博報導，股市拋售為路透報導，均非中央社自行查證。同題材另有 CNA 11-05「路透：微軟不擴大與 Nscale 德州資料中心算力租用合約」、11-07「傳微軟逐步終止租用甲骨文 AI 算力」（均為傳聞或路透，未開原頁）。 grep 核對：IREN、150億美元、200兆瓦、40億美元、189.5億美元、58.2億美元、neocloud、彭博、Nscale、網路設計。

### 27. 金管會預告穩定幣發行許可及管理辦法草案
- 原始標題：金管會預告「穩定幣發行許可及管理辦法」草案及修正金融機構洗錢防制相關規定
- 標題：金管會預告穩定幣發行許可及管理辦法草案
- URL：https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202611030002&dtable=News
- 摘要：金管會研訂「穩定幣發行許可及管理辦法」草案，並同步修正金融機構洗錢防制相關規定，將依行政程序法預告徵求意見。新聞稿說明，虛擬資產服務法於 115 年 7 月 22 日公布，施行日期由行政院另定。草案重點包括：申請對象為銀行、金融控股公司或銀行轉投資的股份有限公司，及其他經公告得申請的機構；非銀行發行人最低實收資本額新臺幣 3 億元，須公開發行並專營穩定幣發行及贖回；可發行與新臺幣或單一外國貨幣一比一連結的穩定幣；準備資產公允價值總額不得低於流通在外餘額，並定期委請會計師查核。洗錢防制部分，穩定幣發行人將被指定為金融機構。各界可於公告翌日起 40 日內陳述意見。
- 權重：9/10
- 發布日期：2026-11-03
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-03-fsc.gov.tw-202611030002.html；日期依標題下方頁面日期列「2026-11-03」（頁尾「更新日期」是網站層級更新，不當發布日）。grep 核對：穩定幣發行許可及管理辦法、虛擬資產服務法、115年7月22日、新臺幣3億元、公開發行、一比一、準備資產、公允價值、洗錢防制法第5條第1項第18款、40日內。同日金管會另有〈預告「虛擬資產服務法」有關虛擬資產服務商管理之 8 項授權法規命令草案〉（dataserno=202611030001），僅見列表標題，未開頁核對，不納入摘要。

### 28. Binance 公布約 63.4 億美元竊案初步調查：假面試植入惡意程式，再經內部 AI 工具取得容器部署權限
- 原始標題：Binance揭露63億美元竊案攻擊鏈，駭客以假面試誘使工程師執行惡意程式
- 標題：Binance 公布約 63.4 億美元竊案初步調查：假面試植入惡意程式，再經內部 AI 工具取得容器部署權限
- URL：https://www.ithome.com.tw/news/180203
- 摘要：iThome 報導，Binance 公開約 63.4 億美元加密資產遭竊事件的初步調查。攻擊最早可追溯至今年 6 月，一名錢包維運工程師為安裝 AI 程式開發工具，下載遭變造的 Homebrew 安裝程式；9 月駭客透過合法求職平臺假冒企業主管安排兩輪面試，要求另一名工程師在工作電腦下載含惡意程式碼的面試作業，把 pyenv 執行檔換成惡意版本，端點防護當時未能偵測。10 月 20 日駭客利用遭入侵電腦及 Binance 內部 AI 工具控制另外兩名錢包工程師的電腦，找到具容器部署權限的權杖；10 月 30 日凌晨部署容器、侵入錢包簽章服務，繞過正常提款流程轉走多個區塊鏈熱錢包的資產，並利用以太坊 EIP-7702 授權機制。熱錢包採 MPC 簽章，無法以單一私鑰立即撤銷授權。Binance 表示約 28.5 億美元已凍結或攔截，承諾自行吸收損失，調查仍在進行。
- 權重：8/10
- 發布日期：2026-11-04
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/X-ithome.com.tw-180203.html；日期依頁面「2026-11-04 發表」。同事件 iThome 180126（11-02，事件公告與 FBI 歸因 TraderTraitor，金額寫 63 億美元）存檔 pages/X-ithome.com.tw-180126.html，作備註不另收；本篇金額為「約 63.4 億美元」。B 組列淘汰並建議交由金融科技，主編補入。grep 核對：63.4億美元、Homebrew、pyenv、內部AI工具、容器部署權限、錢包簽章服務、EIP-7702、MPC、28.5億美元、10月20日。

### 29. OCC 發布銀行使用 Super Intelligence 的監理框架
- 原始標題：OCC Issues Supervisory Framework on Bank Use of Super Intelligence
- 標題：OCC 發布銀行使用 Super Intelligence 的監理框架
- URL：https://www.occ.gov/news-issuances/news-releases/2026/nr-occ-2026-97.html
- 摘要：美國貨幣監理署（OCC）發布一份供銀行檢查人員使用的框架，用來評估銀行在一般業務活動中使用 Super Intelligence（SI）與 agentic SI 的情形，以及相關風險與控制。新聞稿指出，SI 與 agentic SI 是快速演進的新技術，銀行持續把 SI 部署到新的使用情境。框架明確說明，檢查人員不應把 SI 視為獨立的風險類別，也不應要求銀行另行訂定 SI 風險胃納。OCC 表示打算定期更新框架，以因應 SI 的演進與利害關係人回饋，並維持技術中立的做法，鼓勵銀行安全穩健且持續創新。
- 權重：8/10
- 發布日期：2026-11-04
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-01-occ.gov-nr-occ-2026-97.html；日期依 JSON-LD datePublished「2026-11-04T06:30:00」與頁面日期列「November 4, 2026」。grep 核對：Super Intelligence、agentic SI、bank examination workforce、separate and distinct risk category、separate SI risk appetite、technology-neutral approach、News Release 2026-97、November 4, 2026。

### 30. Visa 推出 Agentic Commerce Benchmark，AI 購物測試近半失敗
- 原始標題：Visa Releases First-of-Its-Kind Industry Benchmark for AI Shopping; Almost Half of Test Runs Fail
- 標題：Visa 推出 Agentic Commerce Benchmark，AI 購物測試近半失敗
- URL：https://usa.visa.com/about-visa/newsroom/press-releases.releaseId.22936.html
- 摘要：Visa 推出 Visa Agentic Commerce Benchmark，讓 AI 模型面對擬真的購物任務：模型必須從對話中找出消費者需求，若沒有符合需求的商品就應選擇不買。首輪測試涵蓋來自 12 個實驗室的 22 個 AI 模型、15 個購物情境。新聞稿列出的結果包括：整體通過率 57.2%，表現最佳的模型通過 82.2%、最差 28.9%；每個情境各試三次，三次全數通過的比例僅 34.2%；失敗的測試中約 54% 仍完成購買。Visa 表示計畫加入更多購物情境與商品類別，並把測試延伸到結帳、付款與下單，目前已把基準分享給主要模型供應商取得回饋；一般人也能在 Visa Payments Frontier 試做。
- 權重：8/10
- 發布日期：2026-11-05
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-06-usa.visa.com-22936.html；日期依 JSON-LD datePublished「2026-11-05T14:43:00」與稿頭「Nov. 5, 2026」。grep 核對：Visa Agentic Commerce Benchmark、22 different AI models、12 labs、15 shopping challenges、57.2%、82.2%、28.9%、34.2%、42.8%、Payments Frontier。原頁新聞稿內有一處小標題疑為「Superintelligence Sweep」，與內容無關，摘要未採用。上期引用的 Visa × BILL × Billtrust 試點為不同事件。

### 31. Anthropic 推出 Claude Personal Finance 測試版，透過 Plaid 以唯讀權限分析銀行與信用卡收支
- 原始標題：Anthropic推出Claude個人理財功能，可連結銀行帳戶分析收支
- 標題：Anthropic 推出 Claude Personal Finance 測試版，透過 Plaid 以唯讀權限分析銀行與信用卡收支
- URL：https://www.ithome.com.tw/news/180268
- 摘要：iThome 報導，Anthropic 周四（11/5）宣布推出 Claude Personal Finance，讓使用者連結銀行及信用卡帳戶，以自然語言查詢財務狀況。功能透過金融資料串接平臺 Plaid 取得使用者授權的帳戶資訊，整合不同銀行及信用卡的交易紀錄；本周起先於美國推出測試版，僅開放 Claude Pro、Max 及 Ultra 付費用戶。Claude 可依房租、餐飲等類別分析支出並與過去數月比較，找出重複扣款、異常手續費或上漲的訂閱費，也能依即將到期的帳單與餘額估算發薪前可動用的資金。Anthropic 表示 Claude 只有唯讀權限，無法轉帳、投資或執行其他金融交易，也不會取得銀行密碼；使用者可授權讀取最多兩年交易紀錄並隨時解除連結，該專區對話不會用於模型訓練。Anthropic 強調這不是投資顧問服務。報導指出 OpenAI 已將 ChatGPT 個人理財服務擴大至美國免費用戶。
- 權重：7/10
- 發布日期：2026-11-06
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/X-01-ithome.com.tw-180268.html；日期依頁面「2026-11-06 發表」。Anthropic 官網 news 列表未見對應頁（/news/claude-personal-finance 回 404），以 iThome 為準。C 組列淘汰並建議交由 AI 科技，主編收於金融科技。grep 核對：Claude Personal Finance、Plaid、Claude Pro、Max及Ultra、唯讀權限、兩年、模型訓練、投資顧問、ChatGPT個人理財。

### 32. 金管會修正金融業申請業務試辦作業要點
- 原始標題：金管會修正「金融業申請業務試辦作業要點」－優化試辦機制、提升金融創新彈性
- 標題：金管會修正金融業申請業務試辦作業要點
- URL：https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202611050002&dtable=News
- 摘要：金管會修正發布「金融業申請業務試辦作業要點」，參酌金融業實務需求，優化業務試辦的申請、審查與成果提報機制，在風險可控前提下提供更有彈性的試辦環境。該要點自 113 年 10 月訂定。修正重點有三：第一，明定金管會受理申請後應於 60 日內完成審查，並規範補送文件後的期間計算；第二，涉及個人資料的資訊安全管理系統驗證，由原本明列特定標準，改為取得相關驗證即可（如 ISO27001 等），並依試辦業務風險高低建立適當的保護措施；第三，試辦期滿或預期效益達成後的成果提報期限，由原 2 星期延長為 1 個月。
- 權重：7/10
- 發布日期：2026-11-05
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-04-fsc.gov.tw-202611050002.html；日期依標題下方頁面日期列「2026-11-05」（頁尾「更新日期」不當發布日）。grep 核對：金融業申請業務試辦作業要點、113年10月、60日內、ISO27001、2星期、1個月、資訊安全管理系統驗證、金融市場發展及創新處。

### 33. Nature Medicine：以單一深度攝影機的步態基礎模型預測多系統健康表型
- 原始標題：A gait foundation model for prediction of multisystem health phenotypes from 3D skeletal motion
- 標題：Nature Medicine：以單一深度攝影機的步態基礎模型預測多系統健康表型
- URL：https://www.nature.com/articles/s41591-026-04724-9
- 摘要：這篇 Nature Medicine 研究為三維骨架動作建立步態基礎模型，資料由單一深度攝影機在 5 項動作任務中記錄，來源為 3,328 位經深度表型分析的成人。模型把動作轉成學習而得的嵌入向量，用來預測橫跨 18 個身體系統的健康表型。論文摘要指出，學習嵌入在預測年齡、身體質量指數與內臟脂肪面積上優於人工設計特徵，並顯著預測了 3,210 項測試表型中的 1,887 項；與僅用年齡、BMI、內臟脂肪與身高的基線模型相比，嵌入在男性 18 個系統全數、女性 17 個系統改善預測。作者主張應考慮把步態分析納入常規臨床評估，作為可擴展、被動式的生命徵象。
- 權重：8/10
- 發布日期：2026-11-06
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-09-nature.com-s41591-026-04724-9.html；日期依 JSON-LD datePublished「2026-11-06T00:00:00Z」與 citation_online_date「2026/11/06」。grep 核對：gait foundation model、3,328、single-depth camera、18 body systems、1,887 of 3,210、visceral adipose tissue、Pearson、5 motor tasks、learned embeddings、passive vital sign。原頁為付費牆預覽，僅能核對摘要，全文方法與限制未讀。

### 34. Mayo Clinic Platform 推出整合 EHR 的 AI 臨床決策支援
- 原始標題：Mayo Clinic Platform Unveils EHR-Integrated Clinical Decision Support Engine Across 35+ Subspecialties
- 標題：Mayo Clinic Platform 推出整合 EHR 的 AI 臨床決策支援
- URL：https://hitconsultant.net/?p=98484
- 摘要：HIT Consultant 報導，Mayo Clinic Platform 宣布商業推出一套由 AI 驅動的臨床決策支援（CDS）方案，目標是把策展過的醫學知識直接嵌入臨床人員的 EHR 工作流程。方案提供給 Mayo Clinic 內部臨床人員，以及參與 Mayo Clinic Platform 醫療提供者計畫的外部機構。報導指出，它包含涵蓋 35 個以上次專科的臨床聊天工具，由整合的大型語言模型驅動，回答時會自動引用同儕審查的生醫文獻，且每日更新；另有 22 個可用文字或語音操作的臨床風險與診斷計算器。Mayo 的 Gelareh Zadeh 醫師表示，此方案旨在協助醫療人員做決策，不取代臨床判斷。
- 權重：7/10
- 發布日期：2026-11-03
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-21-hitconsultant.net-mayo-cds.html；日期依 JSON-LD datePublished「2026-11-03T16:46:48+00:00」與署名列「11/03/2026」。grep 核對：Mayo Clinic Platform、Clinical Decision Support、35+ Specialties、22 clinical risk and diagnostic calculators、large language model、updated daily、Gelareh Zadeh、does not replace clinical judgment。這是醫療產業媒體對 Mayo 公告的報導，非 Mayo 官方頁；Mayo 官方站與 Fierce Healthcare 對 curl 回 403，無法核對原稿。搜尋結果顯示 EurekAlert 另有同事件的新聞稿，未能開頁。

### 35. FDA 發布細胞與基因治療產品效價保證最終指引
- 原始標題：FDA Provides Clarity to Support Cell and Gene Therapy Development and Quality
- 標題：FDA 發布細胞與基因治療產品效價保證最終指引
- URL：https://www.fda.gov/news-events/press-announcements/fda-provides-clarity-support-cell-and-gene-therapy-development-and-quality
- 摘要：FDA 發布給細胞與基因治療（CGT）產品製造商的最終指引，建議以科學與風險為基礎的「效價保證策略」，在產品送到病人之前測試並驗證每一批次都達到既定的療效標準。這份《Potency Assurance for Cellular and Gene Therapy Products》取代 FDA 2011 年的效價測試指引，適用於嚴重甚至危及生命的疾病治療。指引建議把效價考量納入從早期 IND 申請、BLA 核准到上市後驗證的每個階段，重點包括原料變異的控制、製造過程中的測試，以及確認每批次具生物活性的實驗室檢驗，也涵蓋保存期限短、病毒載體基因治療與病人專屬療法的特殊考量。FDA 將於 2026 年 12 月 10 日舉辦說明會。
- 權重：7/10
- 發布日期：2026-11-02
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-16-fda.gov-cgt-clarity.html；日期依 meta article:published_time「Mon, 11/02/2026 - 08:56」與頁面「For Immediate Release: November 02, 2026」。grep 核對：Potency Assurance Strategy、Potency Assurance for Cellular and Gene Therapy Products、2011 potency testing guidance、investigational new drug、biologics license application、viral vector、December 10, 2026、Karim Mikhail。與技術距離較遠，屬醫療監理；醫療科技稀疏分類的備援級選項。

### 36. 健保署推動基層院所資訊系統雲端轉型，已有 771 家完成導入
- 原始標題：健保數位轉型 智慧醫療扎根中台灣！ 攜手產官學引領基層院所迎向數位新紀元
- 標題：健保署推動基層院所資訊系統雲端轉型，已有 771 家完成導入
- URL：https://www.mohw.gov.tw/cp-16-88338-1.html
- 摘要：衛福部中央健康保險署在逢甲大學舉辦「115年基層醫療院所資訊服務系統數位轉型觀摩會」，作為中臺灣場次，推廣自 114 年起實施的三年期「基層醫療院所資訊服務系統雲端轉型補助計畫」。副署長張禹斌表示，計畫總計挹注 3 億元；首年度（114 年）全臺已有 771 家西、中、牙醫診所及社區藥局完成系統導入，串聯電子處方箋、電子病歷、線上預約與通訊診療等應用。中區業務組組長丁增輝指出，系統上雲可減輕地端硬體與維修負擔，享有平台更新、即時備份與資安防護，也為未來導入各式 AI 智慧醫療工具鋪路。
- 權重：7/10
- 發布日期：2026-11-01
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-18-mohw.gov.tw-88338.html；日期依頁尾「建檔日期：115-11-01」（民國 115 年 = 2026 年），內文「今（1）日」與之相符。grep 核對：基層醫療院所資訊服務系統雲端轉型補助計畫、771、3億元、逢甲大學、張禹斌、丁增輝、電子處方箋、電子病歷、通訊診療、AI 智慧醫療工具。為活動報導型新聞稿，較偏政策宣導，權重不高。

### 37. FAA 首批數位塔台在佛州與阿拉斯加啟用
- 原始標題：FAA Deploys First Digital Air Traffic Control Towers in Florida and Alaska, Equipping Controllers With Better Technology
- 標題：FAA 首批數位塔台在佛州與阿拉斯加啟用
- URL：https://www.faa.gov/newsroom/faa-deploys-first-digital-air-traffic-control-towers-florida-and-alaska-equipping
- 摘要：FAA 宣布全美首批數位塔台已在佛羅里達州 Bartow Executive Airport 與阿拉斯加州 Kenai Municipal Airport 啟用。數位塔台以先進攝影機與數位顯示器，提供管制員對跑道、滑行道與周邊空域連續 360 度的視野；FAA 強調管制員仍負責管理空域，新技術是提供更多資訊輔助。另有五座無塔台機場即將取得系統，分別位於佛州 Winter Haven 與 Venice、馬里蘭州、北卡羅來納州與科羅拉多州。FAA 表示已在 William J. Hughes Technical Center 等地進行多年測試，以建立標準並確保系統符合安全、準確與可靠要求，並選定 Frequentis 的系統進行部署。
- 權重：8/10
- 發布日期：2026-11-06
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-11-faa.gov-digital-towers.html；日期依頁面日期列「Friday, November 6, 2026」與 FAA RSS pubDate「November 6, 2026」（頁面無 JSON-LD datePublished）。網址 slug 為 RSS 提供的截斷版，可開啟。grep 核對：Bartow Executive Airport、Kenai Municipal Airport、360-degree view、Frequentis、William J. Hughes Technical Center、Winter Haven Regional Airport、Durango-La Plata County Airport、Bryan Bedford。與上期 FAA eVTOL 試辦里程碑、特別適航證為不同事件。

### 38. FAA 開始以 E-IDS 取代空管使用的軟碟系統
- 原始標題：Trump’s Transportation Secretary Sean P. Duffy Begins Retiring Decades Old Floppy Disks from Air Traffic Control as Part of Ongoing Modernization Effort
- 標題：FAA 開始以 E-IDS 取代空管使用的軟碟系統
- URL：https://www.faa.gov/newsroom/trumps-transportation-secretary-sean-p-duffy-begins-retiring-decades-old-floppy-disks-air
- 摘要：美國運輸部長 Duffy 宣布，FAA 持續推動空管系統現代化，將以新系統取代存放天氣與其他重要資訊的軟碟。Enterprise – Information Display System（E-IDS）取代 1980 年代起使用、分布在 400 多個 FAA 設施的四套系統，提供單一且安全的系統，讓管制員更快取得資訊，並改善 PIREPs 與 NOTAMs 的蒐集與發布。首批取得升級的設施包括大西洋城、納許維爾、羅徹斯特機場，以及亞特蘭大與鹽湖城的資料處理中心；FAA 計畫在 2028 年底前於 435 個站點安裝。新聞稿並列出已完成的進度，例如 143 座塔台安裝 Surface Awareness Initiative 系統、226 套 IP Voice Switches。
- 權重：7/10
- 發布日期：2026-11-05
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-12-faa.gov-floppy.html；日期依頁面日期列「Thursday, November 5, 2026」與 FAA RSS pubDate「November 5, 2026」（頁面無 JSON-LD datePublished）。網址 slug 為 RSS 提供的截斷版，可開啟。grep 核對：Enterprise – Information Display System、E-IDS、floppy disks、435 sites、Atlantic City International Airport、PIREPS、NOTAMs、Surface Awareness Initiative、226 IP Voice Switches。新聞稿含政治性措辭，摘要只取技術與進度事實。

### 39. Waymo 說明 Waymo Driver 如何應對嚴峻冬季天候
- 原始標題：How the Waymo Driver Manages Severe Winter Weather
- 標題：Waymo 說明 Waymo Driver 如何應對嚴峻冬季天候
- URL：https://waymo.com/blog/2026/11/winter-weather-preparedness
- 摘要：Waymo 官方部落格說明如何讓車隊為冬季做準備。文章表示，當預報或即時天候超出安全框架驗證的條件時，會縮小服務範圍或暫停服務，暫停可能持續數小時甚至數天；每輛車都像移動氣象站，向整個車隊回傳道路與天氣資料，也參考地方官員與道路維護資訊。第六代 Waymo Driver 使用相機、雷達與光達，內建加熱器與微型雨刷維持感測器清潔，並即時量測各輪牽引力調整轉向、煞車與加速，冬季車隊也配備雪胎。Waymo 說已在紐約州北部、密西根上半島與內華達山脈累積數萬英里實測，今年冬天將在阿拉斯加進行封閉場地評估與大雪資料蒐集，並以模擬重現黑冰與白茫茫天氣。
- 權重：7/10
- 發布日期：2026-11-05
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-13-waymo.com-winter-weather.html；日期依 JSON-LD datePublished「2026-11-05」與頁面日期列「November 5, 2026」。grep 核對：Safety Framework、mobile weather station、6th-generation Waymo Driver、micro-wipers、snow tires、Upstate New York、Upper Peninsula、Sierra Nevada、black ice、El Niño。上期引用的 Waymo Toyota 合作與 Madrid 為不同事件。

### 40. Zipline 募資 15 億美元、估值 215 億美元，與 Walmart 擴大無人機配送
- 原始標題：Zipline hits $21.5B valuation as Walmart expands bet on drone delivery
- 標題：Zipline 募資 15 億美元、估值 215 億美元，與 Walmart 擴大無人機配送
- URL：https://techcrunch.com/2026/11/05/zipline-hits-21-5b-valuation-as-walmart-expands-bet-on-drone-delivery/
- 摘要：TechCrunch 報導，無人機配送與物流新創 Zipline 完成 15 億美元募資，並擴大與 Walmart 的合作。兩家公司達成新的多年期協議，將在美國新增 300 個無人機配送站點，相較目前雙方共有的 21 個營運中站點是大幅躍進。這輪募資由 Paradigm、WCM Investment Management 與 Layer Global 領投，Valor Equity Partners、Fidelity、Uber、Tiger Global、J.P. Morgan、ARK Invest 與 Salesforce Ventures 等參與，Zipline 目前估值 215 億美元。報導也回顧，Zipline 於 2022 年取得 FAA 的 Part 135 航空業者認證，得以進行長程商業無人機配送。
- 權重：7/10
- 發布日期：2026-11-05
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-15-techcrunch.com-zipline.html；日期依 JSON-LD datePublished「2026-11-05T15:40:34+00:00」（UTC，台灣時間 11-05 23:40）。grep 核對：Zipline、$21.5 billion、$1.5 billion、300 drone delivery sites、21 active drone delivery sites、Paradigm、Layer Global、Part 135、Walmart、Rwanda。數字出自 TechCrunch 敘述，未核對 Zipline 或 Walmart 官方稿；若主編要官方一手頁需另查。

### 41. 公路局擴大以無人機結合 3D 建模與 AI 影像辨識巡檢橋梁邊坡
- 原始標題：公路局擬擴大推動無人機AI巡檢，結合3D建模、AI影像辨識提升橋梁與邊坡養護效率
- 標題：公路局擴大以無人機結合 3D 建模與 AI 影像辨識巡檢橋梁邊坡
- URL：https://www.ithome.com.tw/news/180263
- 摘要：iThome 報導，交通部公路局擬擴大導入無人機，除橋梁、邊坡巡檢，也結合 3D 建模與 AI 影像辨識建立數位監測能力。副局長周廷彰表示，已把定期拍攝的影像建立 3D 模型，比對不同時間點變化；報導指出目前已在基隆工務段轄管的台 2 線部分邊坡持續監測。中區養護工程分局以超過 2 萬張橋梁影像訓練模型，辨識裂縫、混凝土剝落、鋼筋裸露等缺失，AI 辨識準確率已達 8 成以上，仍須工程人員複查；目前由中分局針對 14 座橋梁驗證，預計明年起逐步推廣。公路局規畫 2026 至 2028 年投入約 1,170 萬元採購設備、培訓飛手，無人機將由 45 架增加到 2028 年的 201 架。
- 權重：7/10
- 發布日期：2026-11-05
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl（瀏覽器 User-Agent）HTTP 200，存檔 pages/C-14-ithome.com.tw-180263.html；日期依頁面「2026-11-05 發表」與 class="created"「2026-11-05」。grep 核對：公路局、周廷彰、3D建模、2萬張橋梁影像、8成以上、14座橋梁、1,170萬元、45架無人機、201架、98人取得飛手證照。報導內數字多為受訪副局長與公路局補充說明，非 iThome 自行統計。

### 42. MIT 以縫製布料模具澆置拓撲最佳化混凝土梁，混凝土用量約為傳統梁三分之一
- 原始標題：Fabric molds could bring material-saving concrete beams within reach
- 標題：MIT 以縫製布料模具澆置拓撲最佳化混凝土梁，混凝土用量約為傳統梁三分之一
- URL：https://news.mit.edu/2026/fabric-molds-could-bring-material-saving-concrete-beams-within-reach-1106
- 摘要：MIT 工程師發表於《Journal of Building Engineering》的研究，改用縫製布料而非混凝土 3D 列印或機器雕刻的模具，來澆置經拓撲最佳化設計的混凝土梁。團隊以自動化的版型設計流程，製作 3 公尺測試梁，與承載相同重量的傳統梁相比，混凝土用量約三分之一、鋼筋約一半，實測反應與電腦模型預測相差約 2%。三種模具分別用 36、56、76 片布料，其中 56 片的平衡最佳。成本比較顯示，在材料相對昂貴的南方國家，布模梁便宜約 10 至 20%；在人工昂貴的北方國家，反而貴約 16 至 55%。文中指出，在人工昂貴的地區，重複性的矩形梁用傳統可重複使用模具仍較經濟。
- 權重：8/10
- 發布日期：2026-11-06
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-03-news.mit.edu-fabric-molds.html；日期依頁面「Publication Date: November 6, 2026」（itemprop datePublished）。grep 核對：Journal of Building Engineering、Topology optimization、graphic statics、Josephine Carstensen、one-third as much concrete、half as much steel、within about 2 percent、36, 56, and 76、16 to 55 percent、Global South。測試是以約 30% 設計載重的使用條件進行，非極限載重；頁面沒有說明大規模工地應用時程。

### 43. 竹中工務店把解體廢混凝土製成「循環混凝土」，首度用於橫濱園藝博展示設施的結構基礎
- 原始標題：竹中工務店、横浜園芸博の展示施設に「サーキュラーコンクリート」適用：サーキュラーエコノミー
- 標題：竹中工務店把解體廢混凝土製成「循環混凝土」，首度用於橫濱園藝博展示設施的結構基礎
- URL：https://built.itmedia.co.jp/bt/articles/2611/05/news088.html
- 摘要：ITmedia BUILT 報導，竹中工務店於 10 月 23 日發表，已開發出把建物解體產生的混凝土廢料回收再生骨材，搭配低碳水泥而成的「循環混凝土」，並首度用於 2027 年國際園藝博覽會的展示設施「竹中グループ くるくるく」。以質量比計約 8 成為再利用材，在確保與一般混凝土同等強度基準與耐久性下，CO2 排放量約減 6 成。一般再生骨材混凝土多用於設計基準強度 18N／平方毫米以下的低強度用途，這次提高到 24N／平方毫米，並用於獨立基礎的結構體。廢料來自橫濱市旭區一所高中的食堂與學生宿舍拆除工程，回收、製造、使用地點相近，以降低運輸排碳。研發由 NEDO 計畫支持，展示設施目標資材再利用率 99%。
- 權重：8/10
- 發布日期：2026-11-05
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-02-built.itmedia.co.jp-2611-05-news088.html（cp932）；日期依頁面「2026年11月05日 18時00分 公開」。grep 核對：サーキュラーコンクリート、GREEN×EXPO 2027、くるくるく、再生骨材、NEDO、24N／平方ミリメートル、18N／平方ミリメートル、99％、横浜商科大学高等学校。CO2 約 6 成與 8 成再利用材皆為竹中新聞稿自述，經 ITmedia 轉述。

### 44. SWCC 以相機影像建立東京電力 PG 既設變電所 3D 基底模型，首度把 PIM 概念用於實際工事計畫
- 原始標題：東京電力PGの既設変電所を3Dベースモデル化、PIMを実際の工事計画に初適用　SWCC：導入事例
- 標題：SWCC 以相機影像建立東京電力 PG 既設變電所 3D 基底模型，首度把 PIM 概念用於實際工事計畫
- URL：https://built.itmedia.co.jp/bt/articles/2611/04/news058.html
- 摘要：ITmedia BUILT 報導，SWCC 於 10 月 29 日發表，已把東京電力 Power Grid 的既設變電所做成 3D 基底模型，用在新設電纜路徑的設計上。SWCC 自行提倡的「PIM（Picture Information Modeling）」概念，這次首度實際套用於工事計畫，確認不靠圖面的工事計畫有其成效。做法是用 Regana 事業的 3D 模型生成方案「ADitor」，把市售相機拍攝的影像以影像處理技術還原成 3D 基底模型，可做尺寸量測，也能與 3D CAD 模型疊合。報導指出既設基礎設施多以 2D 圖面管理，老舊設備甚至只有紙本，要 3D 化通常需專用量測設備與軟體。SWCC 表示今後將把 ADitor 擴大到各種設備的更新與改修工程，推廣 PIM。
- 權重：7/10
- 發布日期：2026-11-04
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-01-built.itmedia.co.jp-2611-04-news058.html（Shift_JIS，以 cp932 解碼）；日期依頁面「2026年11月04日 11時00分 公開」。grep 核對：PIM、ADitor、Regana、東京電力パワーグリッド、2026年10月29日、3Dベースモデル、Picture Information Modeling、BIM、Transformation for Growth SWCC 2030。原始事件為 SWCC 10 月 29 日新聞稿，ITmedia 報導晚於發表（見 fetch-gotchas）；摘要全部出自 ITmedia 頁面，頁面沒有 PIM 精度或成本數字。

### 45. 吐利多控股導入 BIM 管理餐飲店舖開發，並開辦設計公司「BIM 習得計畫」
- 原始標題：トリドールHDが店舗開発／維持管理にBIM活用、トランスコスモスと連携：BIM
- 標題：吐利多控股導入 BIM 管理餐飲店舖開發，並開辦設計公司「BIM 習得計畫」
- URL：https://built.itmedia.co.jp/bt/articles/2611/06/news086.html
- 摘要：ITmedia BUILT 報導，連鎖餐飲集團 Toridoll Holdings 於 10 月 23 日發表，已開始導入 BIM 於店舖開發與建設業務，並與 transcosmos 合作負責 BIM 資料建模、規則制定、人才培育與定著推動。集團建構自有的 BIM 資料基盤「TORIDOLL BIM Ecosystem」，讓 3D 建物模型從土地探勘、設計、施工、營運到修繕、改裝、閉店的全生命週期共用資訊。計畫同時開放設計與建設公司報名「BIM 習得計畫」，因為餐飲店舖領域的 BIM 普及落後於大型建案。公司並進行 BIM 結合 AI 的運用開發，希望未來用累積的店舖資料支援設計最佳化、估價與出店計畫，目標在 2030 年建立連結不動產、設計、施工、設備與店舖營運的資料生態系。
- 權重：7/10
- 發布日期：2026-11-06
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-21-built.itmedia.co.jp-2611-06-news086.html（cp932）；日期依頁面「2026年11月06日 20時00分 公開」；meta datePublished 為「2026-11-06T20:00:00Z」，與頁面顯示的 JST 時刻相同（疑似 ITmedia 把 JST 標成 Z），若按 UTC 換算則為台灣時間 11-07 04:00，任一種讀法皆在窗內，取 11-06。grep 核對：トリドールホールディングス、トランスコスモス、TORIDOLL BIM Ecosystem、BIM習得プログラム、2026年10月23日、2030年、ライフサイクル、AI、再現性。BIM 導入與「BIM 習得計畫」受理已開始；AI 結合運用與 2030 年生態系，報導寫的是「今後」「目指す」，屬計畫。

### 46. 美國聯邦貿易委員會要求 Live Nation 的 BOTS Act 案件進行完整陪審團審理
- 原始標題：Federal Trade Commission Demands Full Jury Trial Against Live Nation Over BOTS Act Violations, Unlawful Resales, and Deceptive Trade Practices
- 標題：美國聯邦貿易委員會要求 Live Nation 的 BOTS Act 案件進行完整陪審團審理
- URL：https://www.digitalmusicnews.com/2026/10/29/ftc-demands-jury-trial-live-nation/
- 摘要：Digital Music News 報導，美國聯邦貿易委員會（FTC）在 Live Nation 試圖駁回訴訟失敗後，雙方就證據開示與時程出現爭議，FTC 現堅持 BOTS Act 相關案件要進入完整陪審團審理。此案由加州中區聯邦法院受理，與司法部和各州檢察長在紐約的反托拉斯訴訟分開，另有科羅拉多、佛羅里達、伊利諾、內布拉斯加、田納西、猶他與維吉尼亞七州檢察長參與。起訴書指稱 2019 至 2024 年間轉售票費用達 37 億美元，FTC 與各州尋求永久禁制令、民事罰款與金錢救濟。Live Nation 主張 BOTS Act 針對轉售市場的機器人，不應用來對付主要售票平台；是否開庭與時程，大半取決於證據開示結果。
- 權重：7/10
- 發布日期：2026-10-29
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-13-digitalmusicnews.com-ftc-live-nation.html；日期依 JSON-LD／meta datePublished「2026-10-29T20:17:58+00:00」（美東約 16:17，同日）。grep 核對：BOTS Act、Central District of California、$3.7 billion、2019 and 2024、jury trial、Colorado、Nebraska、2:25-cv-08884、Live Nation、Ticketmaster。同日另有 11-02 Live Nation 回應報導未收；上期已收的 Garth Brooks、StubHub 巴西事件為不同事件。屬訴訟動態，不是技術發表。

### 47. Easol 取得 3,000 萬美元 A 輪延伸融資並推出 AI 代理「Teammates」，鎖定活動與體驗業者
- 原始標題：AI-Powered Experience-Management Platform Easol Announces $30 Million Raise, Debuts Agentic Product ‘Teammates’
- 標題：Easol 取得 3,000 萬美元 A 輪延伸融資並推出 AI 代理「Teammates」，鎖定活動與體驗業者
- URL：https://www.digitalmusicnews.com/2026/10/28/easol-series-a-extension/
- 摘要：Digital Music News 報導，總部在倫敦的「一站式 SaaS 平台」Easol 推出 AI 代理產品 Teammates，並公布 3,000 萬美元 A 輪延伸融資，其中 2,000 萬美元為股權資金，來自 Y Combinator、Tiger Global、Foundation Capital 等；另 1,000 萬美元為 Viola Credit 的債務額度。Easol 為活動主辦方處理網站設計、付款到訂位等流程，據 Easol 網站說法，旗下 AI 代理以客戶資料訓練，用於客服、銷售等。報導引述網站說法，Afro Nation 使用後營收增加 430 萬美元，合作夥伴包括 Live Nation 與 AEG Presents。共同創辦人 Ben Simpson 表示，採用 AI 的體驗業者將有競爭優勢；Teammates 已向平台上所有創作者開放。
- 權重：7/10
- 發布日期：2026-10-28
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-11-digitalmusicnews.com-easol.html；日期依 datePublished「2026-10-28T18:50:41+00:00」。grep 核對：Easol、Teammates、$30 million、Series A、Y Combinator、Tiger Global、Viola Credit、Afro Nation、$4.3 million、Live Nation、AEG Presents。營收增幅為 Easol 網站說法經記者轉述，無獨立驗證；內文出現報導時間為「today」，以文章發布日為準。

### 48. One Arena 現場演出版稅透明網路納入加拿大 SOCAN，首度擴展到歐洲以外
- 原始標題：GEMA Hooks Canada’s SOCAN Into Its Growing One Arena Live Collective
- 標題：One Arena 現場演出版稅透明網路納入加拿大 SOCAN，首度擴展到歐洲以外
- URL：https://www.digitalmusicnews.com/2026/11/02/gema-socan-one-arena-live-collective/
- 摘要：Digital Music News 報導，由德國 GEMA 創立的 One Arena 宣布加拿大集體管理組織 SOCAN 成為最新成員，網路首度擴展到歐洲以外。One Arena 讓權利人更清楚看到國際現場演出能賺多少、何時獲付款，以及版稅如何計算，作法是逐場演唱會回報；網路會列出即將舉行的演唱會、產出版稅預測、把歌單提交給相關集體管理組織，並追蹤授權與付款狀態。成員有 SUISA、AKM、Buma-Stemra、KODA、TONO、OSA、SOCAN 與 GEMA。報導同時說明，授權與付款責任仍由各地區的集管組織依各自規則負責。
- 權重：6/10
- 發布日期：2026-11-02
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-12-digitalmusicnews.com-gema-one-arena.html；日期依 datePublished「2026-11-02T20:35:24+00:00」。grep 核對：One Arena、SOCAN、GEMA、SUISA、Buma-Stemra、Tobias Holzmüller、Jennifer Brown、royalty forecasts、setlists、setlist。摘要「首度擴展到歐洲以外」依原頁「expands the One Arena network beyond Europe」；偏業界合作公告，無具體技術細節，權重偏低，主編可視分類缺口取捨。

### 49. 文策院與特效公司 Wētā FX 簽署 MOU，TCCF 開幕日宣布投資台灣動畫公司並共推人才培育
- 原始標題：「魔戒」特效公司Wētā FX 攜手文策院推培育台灣人才合作
- 標題：文策院與特效公司 Wētā FX 簽署 MOU，TCCF 開幕日宣布投資台灣動畫公司並共推人才培育
- URL：https://www.cna.com.tw/news/acul/202611060169.aspx
- 摘要：中央社報導，TCCF 創意內容大會 6 日開幕，曾參與「魔戒」「阿凡達」特效的 Wētā FX 與文化內容策進院簽署合作備忘錄（MOU），期盼共同打造亞洲內容產業 AI 中心。Wētā FX 執行長謝安說明，首要合作是投資台灣的「夢想動畫」，也期望成立合製品牌，投資台灣影視作品，並投入技術；另一重點是人才培育，讓台灣年輕電影人能透過專案到 Wētā FX 交流或合作。文策院董事長王時思表示合作落地台灣意義非凡，文化部長李遠也出席見證，並提到全國文化大會指出文化科技與 AI 影響是未來 4 年要面對的課題。TCCF 即日起至 9 日在南港展覽館二館 7 樓舉行。
- 權重：8/10
- 發布日期：2026-11-06
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-16-cna.com.tw-202611060169.html；日期依 JSON-LD datePublished「2026-11-06T15:04:00+08:00」。grep 核對：Wētā FX、文化內容策進院、謝安、夢想動畫、王時思、李遠、TCCF創意內容大會、亞洲內容產業AI中心、南港展覽館二館7樓、備忘錄。上期以 TCCF 預告收入（ref 為中央社 10-30 稿），本筆是開幕日的新成果（MOU 與投資）；投資金額頁面未提。

### 50. DDEX 宣布 ElevenLabs 成為首家加入的 AI 公司
- 原始標題：DDEX Announces ElevenLabs as First AI Company to Join Its Ranks
- 標題：DDEX 宣布 ElevenLabs 成為首家加入的 AI 公司
- URL：https://www.digitalmusicnews.com/2026/11/05/ddex-elevenlabs-first-ai-company/
- 摘要：Digital Music News 報導，負責制定音樂產業資料交換標準的非營利組織 DDEX 宣布，AI 音訊公司 ElevenLabs 以正式會員身分加入，是第一家加入的 AI 公司。DDEX 會員超過 150 家，並有越來越多 AI 內容歸屬（attribution）公司。DDEX 秘書處 Mark Isherwood 表示，ElevenLabs 的專業能讓組織更理解這些議題的演變；ElevenLabs 的 Gabriella Heybourne 則說，希望參與全體會議與工作小組，協助制定音樂與 AI 相關資訊如何傳遞的做法。DDEX 也邀請任何與 AI 技術有商業利益的組織加入；實作 DDEX 標準不需要成為會員。報導也提到，AI 工作小組的 Generative AI Declaration Standard（GAI-D）委員會草案已完成會員意見徵詢，將進入 DDEX 同儕審查，預計 2027 年初發布。
- 權重：7/10
- 發布日期：2026-11-06
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-08-digitalmusicnews.com-ddex-elevenlabs.html；日期依 datePublished「2026-11-06T07:30:51+00:00」（UTC，台灣時間 11-06 15:30）；網址路徑為 2026/11/05，與 datePublished 差一天，取 datePublished 的 11-06，兩者皆在窗內。grep 核對：DDEX、ElevenLabs、first AI company、Mark Isherwood、Gabriella Heybourne、150、attribution、plenaries、working groups、Digital Data Exchange。頁面提到 GAI-D 草案的審查進度，但沒有說明草案內容。

### 51. Suno 聲請駁回 Jason Isbell 等人的姓名肖像權集體訴訟，主張以藝人名字描述風格受第一修正案保護
- 原始標題：Nothing Illegal Here: Suno Moves to Dismiss Jason Isbell’s Class Action Lawsuit on First Amendment and US Copyright Law Grounds
- 標題：Suno 聲請駁回 Jason Isbell 等人的姓名肖像權集體訴訟，主張以藝人名字描述風格受第一修正案保護
- URL：https://www.digitalmusicnews.com/2026/11/03/suno-moves-to-dismiss-isbell-class-action-lawsuit/
- 摘要：Digital Music News 報導，Suno 就音樂人 Jason Isbell 與 David Lowery 提出的美國隱私與公開權主張聲請駁回，稱其輸出不可能被誤認為原告。該集體訴訟由 Isbell 代表自己與其他藝人提起，指控 Suno 讓使用者透過提示詞擷取並複製音樂人的身分，涉及姓名、形象與肖像（NIL）權。Suno 在聲請中主張，以藝人名字描述曲風是通用的簡稱，受第一修正案保護，且美國著作權法不保護一般曲風與類型。報導另指出，Suno 平台會把直接輸入藝人名字的提示轉成描述性風格標籤，例如把「Pantera」轉成「aggressive metal」，但原告主張此機制容易被繞過。
- 權重：7/10
- 發布日期：2026-11-04
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-28-digitalmusicnews.com-suno-isbell.html；日期依 datePublished「2026-11-04T00:29:03+00:00」（UTC，美東 11-03 晚間、台灣時間 11-04 08:29）；網址路徑為 2026/11/03，取 datePublished 的 11-04，兩者皆在窗內。grep 核對：Jason Isbell、David Lowery、First Amendment、right of publicity、universal shorthand、Pantera、aggressive metal、1-26-cv-14005、name, image, and likeness。與上期的 Suno 對 Apple 傳票爭議為不同案件（上期 ref 為傳票），本案為 NIL 集體訴訟；僅為聲請動作，法院尚未裁定。

### 52. Adobe 與 UMG、華納音樂簽約，Premiere 行動版將內建授權音樂片段
- 原始標題：No Litigation for These Guys: Adobe Successfully Licenses Tracks from UMG and WMG in Major Music Partnership
- 標題：Adobe 與 UMG、華納音樂簽約，Premiere 行動版將內建授權音樂片段
- URL：https://www.digitalmusicnews.com/2026/11/03/adobe-premiere-mobile-umg-wmg-partnership/
- 摘要：Digital Music News 報導，Adobe 週二宣布與環球音樂集團（UMG）和華納音樂集團（WMG）合作，把兩家大廠旗下藝人的完整授權音樂片段直接帶進 Premiere 行動版。創作者可在影片中加入最長 60 秒的熱門曲目，可從空白專案或搭配音樂的可自訂範本開始，完成後匯出並發布到 YouTube Shorts、Instagram Reels 等已授權的社群平台。使用者也能用 Premiere 的影音編輯工具與 Adobe Firefly 驅動的 AI 功能。UMG 與 WMG 的音樂「即將」上線，曲目授權僅限個人非商業用途；需要商用授權音樂的專案，仍使用 Adobe Stock Audio。
- 權重：7/10
- 發布日期：2026-11-03
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-07-digitalmusicnews.com-adobe-premiere.html；日期依 datePublished「2026-11-03T14:00:19+00:00」。grep 核對：Adobe Premiere mobile、Universal Music Group、Warner Music Group、Rachel Scarpati、60 seconds、YouTube Shorts、Instagram Reels、Adobe Firefly、non-commercial、Adobe Stock Audio。音樂「will arrive soon」，尚未上線，摘要保留預告語氣；頁面沒有上線日期或授權費用。

### 53. Spotify 讓個人帳號登入聯合航空 Starlink 機隊座椅螢幕，掃 QR code 即可播放
- 原始標題：Log In to Spotify. Take Off With United.
- 標題：Spotify 讓個人帳號登入聯合航空 Starlink 機隊座椅螢幕，掃 QR code 即可播放
- URL：https://newsroom.spotify.com/2026-11-05/united-airlines-partnership-update/
- 摘要：Spotify 官方新聞室宣布，與聯合航空（United Airlines）的合作升級：去年已把精選內容帶到座椅螢幕，現在首度讓個人 Spotify 帳號串流到座椅顯示器。功能先在搭載 Starlink 的聯合航空客機推出，乘客連上「United」Wi‑Fi，點座椅螢幕上的 Spotify 圖示並用手機掃 QR code、在手機確認配對，即可取用個人化首頁、播放清單與資料庫，以及 DJ、音樂影片等功能；帳號資料不會在座椅螢幕輸入，航程結束自動登出。免費與 Premium 使用者皆可使用，功能依方案與市場而異，並在 2027 年間陸續擴及更多機型。免費的 Spotify 頻道已涵蓋聯合航空全機隊，提供 450 小時精選內容。
- 權重：7/10
- 發布日期：2026-11-05
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-09-newsroom.spotify.com-united.html；日期依 datePublished「2026-11-05T13:00:25+00:00」。grep 核對：Starlink、QR code、United Airlines、35,000 feet、MileagePlus、Ian Geller、Spotify Free and Premium、through 2027、450 hours、Your Library。同事件 Digital Music News 11-05 亦有報導（digitalmusicnews.com/2026/11/05/spotify-united-airlines-partnership/），本筆取官方頁。

### 54. NASA 發表載人實驗機 X-70 Fractal，可快速換裝飛控與酬載
- 原始標題：NASA Announces X-70 Experimental Aircraft to Advance Flight Research
- 標題：NASA 發表載人實驗機 X-70 Fractal，可快速換裝飛控與酬載
- URL：https://www.nasa.gov/news-release/nasa-announces-x-70-experimental-aircraft-to-advance-flight-research/
- 摘要：NASA 官方新聞稿指出，NASA 週三在甘迺迪太空中心的 UP.Summit 揭曉最新實驗機 X-70 Fractal，這是高性能、高度可調整的研究平台，用於加速先進航空技術的開發與測試。X-70 為載人機型，具備可快速重新配置的飛控技術，讓 NASA 探索前所未有的載人飛行操控性，內外部可容納最多 2,000 磅的實驗酬載。起飛重量 10,000 磅，設計巡航速度 Mach 0.75、最高高度 45,000 英尺，航程超過約 1,726 英里。NASA 署長 Jared Isaacman 表示，預期該機在 NASA 名下的首飛會在未來兩年內，X-70 只是航空研究新開端的一部分。
- 權重：8/10
- 發布日期：2026-11-04
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-14-nasa.gov-x-70.html；日期依頁面日期列「Nov 04, 2026」與「RELEASE 26-094」（無 JSON-LD；RSS pubDate 為 UTC 11-05 01:43，美東 11-04 晚間）。grep 核對：X-70 Fractal、UP.Summit、Jared Isaacman、2,000 pounds、10,000 pounds、Mach .75、45,000 feet、1,726 miles、26-094、Bell X-1。首飛為「預期」兩年內，尚未飛行；頁面圖為電腦生成示意圖。

### 55. MIT 與美國農業部開發蠶絲蛋白微針，可在水下為體型小至 1 至 2 公克的魚苗施打疫苗
- 原始標題：MIT engineers design a safer, more efficient vaccination system for farmed fish
- 標題：MIT 與美國農業部開發蠶絲蛋白微針，可在水下為體型小至 1 至 2 公克的魚苗施打疫苗
- URL：https://news.mit.edu/2026/mit-engineers-design-safer-more-efficient-vaccination-system-farmed-fish-1102
- 摘要：MIT 與美國農業部（USDA）研究人員在《ACS Nano》發表耐水、可食用等級的微針系統，可輕刺並附著在魚皮上，之後分解，用來投遞細菌疫苗等多種貨物。現行最有效的是金屬針人工注射，需先麻醉魚並上輸送帶，勞力密集、成本高，對魚與工人都有風險。團隊用蟲膠薄層為蠶絲蛋白微針提供防水屏障，並展示可調整疫苗釋放時間，從 15 分鐘到 10 或 24 小時；DNA 質體在乾燥環境儲存四週後仍保留一半結構，有助於免冷鏈。USDA 研究員 Gregory Wiens 表示，微針可在水下為小至 1 至 2 公克的魚施打，傳統針頭約需魚長到 30 公克。研究者說要大規模用於養殖場仍有工作要做。
- 權重：7/10
- 發布日期：2026-11-02
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-15-news.mit.edu-fish-vaccination.html；日期依頁面「Publication Date: November 2, 2026」。grep 核對：ACS Nano、Benedetto Marelli、shellac、silk、Gregory Wiens、rainbow trout、1 to 2 grams、30 grams、cold chain、J-WAFS。僅在虹鱒上測試，仍屬研究早期階段；頁面沒有田間試驗或上市時程。

### 56. Nature 搶先版研究：以氫衍生物路徑達成中國碳中和，可較再生能源加電氣化路徑降低 10.7 兆美元轉型成本
- 原始標題：Hydrogen Derivatives Enable Cost-Effective Carbon Neutrality in China
- 標題：Nature 搶先版研究：以氫衍生物路徑達成中國碳中和，可較再生能源加電氣化路徑降低 10.7 兆美元轉型成本
- URL：https://www.nature.com/articles/s41586-026-11351-4
- 摘要：《Nature》於 11 月 5 日線上刊出的搶先版（Accelerated Article Preview）研究，針對中國能源經濟提出具成本效益的碳中和轉型路徑，強調氫與其衍生物作為綠色能源載體的角色。模型納入高解析度再生能源布建、29 個省級區域的逐小時電力系統運作、逾 46,000 條氫衍生物鐵路、公路、海運與管線轉運路徑，以及各終端部門的製程級燃料採用策略。結果顯示，納入氫與其衍生物可使整體轉型成本比再生能源加電氣化路徑少 10.7 兆美元，達到負的碳減排成本（每噸 -6.15 美元），並消除石油進口支出。論文為模型推估而非實測，版本日後會被正式版取代。
- 權重：7/10
- 發布日期：2026-11-05
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-26-nature.com-s41586-026-11351-4.html；日期依 JSON-LD datePublished「2026-11-05T00:00:00Z」與 citation_online_date「2026/11/05」。grep 核對：Hydrogen Derivatives Enable Cost-Effective Carbon Neutrality in China、$ 10.7 trillion、$-6.15/ton、46,000、29 provincial regions、1.5°C、Intergovernmental Panel on Climate Change、hourly power system operations、Xinyu Chen、Michael McElroy。頁面標示為搶先版，作者含華中科技大學與哈佛等單位；摘要僅用原頁摘要，未讀全文。

### 57. NASA 模擬火星任務 CHAPEA 第二批 4 名組員結束 378 天隔離走出模擬艙
- 原始標題：助攻未來火星任務　NASA太空人隔離378天後首踏出模擬艙
- 標題：NASA 模擬火星任務 CHAPEA 第二批 4 名組員結束 378 天隔離走出模擬艙
- URL：https://www.cna.com.tw/news/ait/202611020047.aspx
- 摘要：中央社綜合外電報導，在詹森太空中心參與模擬火星任務 CHAPEA 的 4 名組員，在隔離 378 天後首度踏出模擬艙。報導引述路透社，他們於 2025 年 10 月 19 日進入以 3D 列印技術建造、面積約 158 平方公尺的隔離艙，任務包括在模擬火星土壤種植作物，並模擬星際通訊的訊息延遲。4 人接下來要進行為期兩週的任務後評估，並與 NASA 科學家交流。這是 NASA 第 2 次執行 CHAPEA，2023 至 2024 年另有一批組員完成 378 天隔離。報導指出，NASA 最快將在 2030 年代實現人類登陸火星計畫，並計劃讓太空人重返月球。
- 權重：6/10
- 發布日期：2026-11-02
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-20-cna.com.tw-202611020047.html；日期依 JSON-LD datePublished「2026-11-02T11:09:00+08:00」。grep 核對：CHAPEA、378天、詹森太空中心、2025年10月19日、158平方公尺、3D列印、路透社、艾里斯、懷渠、2030年代。報導編譯自外電，NASA 官方頁未另核對；權重 6，屬補位項目。

## 淘汰來源

### A. Stripe 讓 Samsung Wallet 穩定幣帳戶支援 USDC 購買
- URL：https://stripe.com/newsroom/news/stripe-powers-stablecoin-purchases-in-samsung-wallet
- 發布日期：2026-11-05
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：金融科技本期已收穩定幣草案、Binance 竊案與 Claude Personal Finance 等 6 筆，Stripe 為既有 Crypto Onramp 的通路擴充、內容較短，權重 7/10 低於其他正式來源；主編降為淘汰。

### B. OpenAI 自建 Git 後端 Pando，推送延遲降低近 80%
- URL：https://www.ithome.com.tw/news/180219
- 發布日期：2026-11-04
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議 6（Pierre 收購）為同一條 OpenAI Git 基礎設施敘事，已在 6 的摘要提及；若主編想單獨收 Pando 可替換。原頁核對：curl 200，created 2026-11-04，內容含 packfile-uri、近 1 PB、57 TB，存檔 pages/A-02-ithome.com.tw-180219.html。

### C. Meta 收購 AI 程式開發協作平臺 Conductor
- URL：https://www.ithome.com.tw/news/180238
- 發布日期：2026-11-05
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：可作替補，權重 7/10，但與正式建議 6 同屬 AI 程式開發工具併購，擇一以保持分散。原頁核對：curl 200，created 2026-11-05，存檔 pages/A-03-ithome.com.tw-180238.html，Conductor 11/4 起停止新用戶註冊、11/20 刪除 Cloud 資料。

### D. Postman 未經同意自動安裝 AI 外掛並代核准 Codex Hook
- URL：https://www.ithome.com.tw/news/180220
- 發布日期：2026-11-05
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：可作替補，屬單一工具爭議，權重 6/10；原頁（tmp 檢視）核對 created 2026-11-05，Postman 稱將檢討同意機制，尚無修正版本。

### E. 回應資料中心建設爭議，OpenAI 提出用電、用水與資訊公開承諾
- URL：https://www.ithome.com.tw/news/180271
- 發布日期：2026-11-06
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：偏基礎設施與政策公關，對程式設計師關聯較弱；若他組有「能源／基礎設施」分類建議交由他組。原頁核對 created 2026-11-06。

### F. NVIDIA Cosmos 3 開放模型（Hugging Face 部落格）
- URL：https://huggingface.co/blog/nvidia/cosmos-interactive-world-simulation
- 發布日期：2026-11-05
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：僅由 Hugging Face RSS 確認標題與日期（2026-11-05），未讀全頁，且上期已收 Genie 4 世界模型，同質性高；可作替補，需補核原頁。

### G. CWE-bench v2：更多覆蓋、品質與透明度
- URL：https://huggingface.co/blog/cwe-bench
- 發布日期：2026-11-03
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：datePublished 2026-11-03 已確認，但未讀全頁；A 組建議交由資安組判斷。主編評估：資安分類已收 6 筆事件與修補，基準更新的實務影響低於現有選材，維持淘汰。

### H. Next.js 2026 年 11 月安全性釋出；Django 6.1.3 等安全釋出
- URL：https://nextjs.org/blog/november-2026-security-release
- 發布日期：2026-11-03
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：日期僅取自 RSS（Next.js 2026-11-03、Django https://www.djangoproject.com/weblog/2026/nov/03/security-releases/ 同日），未讀全頁；屬例行安全修補，A 組建議交由資安組；主編評估為例行修補，影響低於現有選材，維持淘汰（Node.js 另預告 11 月 11 日安全釋出，窗外）。

### I. .NET Conf 2026
- URL：https://devblogs.microsoft.com/dotnet/get-ready-for-dotnet-conf-2026/
- 發布日期：2026-11-03
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：大會日期為 11 月 10 日起（官方頁 11 月 10 至 13 日，窗外），本篇僅為活動預告，權重低。

### J. Rust 官方部落格 rustup 1.29.3、Python 3.15.2 等例行釋出
- URL：https://blog.rust-lang.org/2026/11/03/Rustup-1.29.3/
- 發布日期：2026-11-03
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：例行修補版本，權重低；Python 3.15.2（blog.python.org，2026-10-26）與上期已引用的 3.15.1 同系列。僅由 feed 確認日期。

### K. Zyxel 修補 GS1900 交換器越界寫入漏洞（iThome）
- URL：https://www.ithome.com.tw/news/180252
- 發布日期：2026-11-05
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：同事件已收 iThome 180254（Binarly 揭露零時差利用）；本篇為 11 月 3 日 Zyxel 修補公告，CVSS 8.8 取自 Tenable 與 EUVD，內容較少，原頁核對 HTTP 200、class="created" 2026-11-05。備援。

### L. OpenSSH 修補長密碼身分驗證繞過漏洞（資安日報）
- URL：https://www.ithome.com.tw/news/180289
- 發布日期：2026-11-06
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：與已收 OpenSSH SSHole 為同一事件的日報版本，原頁 HTTP 200、class="created" 2026-11-06，同事件只收一筆。

### M. 繼 91APP 遭駭後，1shop、Cyberbiz 與 meepShop 等電商技術服務業者接連傳出資安警訊
- URL：https://www.ithome.com.tw/news/180209
- 發布日期：2026-11-04
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：備選：臺灣電商供應鏈資安風波的整理，原頁 HTTP 200、class="created" 2026-11-04；91APP 事件上期（2026-10-17 期 ref-15）已引用，本篇為新增業者的新進展，但內文多屬「傳出」「仍待釐清」，權重 7/10，名額已滿。iThome 11-06 資安週報（180291）亦涵蓋永豐銀行與電商供應鏈，未開原頁。

### N. 蘋果旗下產品已知漏洞 CVE-2024-27834 遭積極利用（CISA 警告）
- URL：https://www.ithome.com.tw/news/180239
- 發布日期：2026-11-05
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：備選：原頁 HTTP 200、class="created" 2026-11-05；CISA 警告兩年前修補的 CVE-2024-27834 已遭積極利用，內容簡短，影響低於已收項目，未全文深讀。

### O. 11 月 Android 例行安全更新修補 216 個漏洞
- URL：https://www.ithome.com.tw/news/180207
- 發布日期：2026-11-04
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：例行更新彙整，原頁 HTTP 200、class="created" 2026-11-04；實質影響低於已收漏洞與事件。備選。

### P. Cloudflare 推出 Zero Wire，公開的重大網路漏洞情資
- URL：https://blog.cloudflare.com/zero-wire/
- 發布日期：2026-11-03
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：備選：原頁 HTTP 200、JSON-LD 2026-11-03；為產品導向的漏洞情資服務介紹（Cloudflare Radar 內的公開 feed、每則簡報含影響範圍與建議行動），權重 7/10，名額已滿。存檔 pages/B-11-blog.cloudflare.com-zero-wire.html。

### Q. Cloudflare 後量子時代的網頁隱私（Privacy Pass 與後量子簽章）
- URL：https://blog.cloudflare.com/vole-mole/
- 發布日期：2026-11-06
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：備選：原頁 HTTP 200、日期取自 Cloudflare RSS pubDate 2026-11-06；研究型文章（ML-DSA-44 簽章 2,420 位元組對 ECDSA-P256 的 64 位元組），與已收基礎題相比實用性中等。存檔 pages/B-13-blog.cloudflare.com-vole-mole.html。

### R. Cloudflare：追蹤 eMudhra 弱金鑰的利用與修補
- URL：https://blog.cloudflare.com/emudhra-patching/
- 發布日期：2026-10-30
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：同事件上期已引用（2026-10-24 期 emudhra-certificate-compromise），本篇為 10-30 後續；RSS 日期 2026-10-30，未全文核對內容，名額已滿。存檔 pages/B-12-blog.cloudflare.com-emudhra-patching.html。

### S. iThome 11 月 2 日資安日報：Binance 遭竊約 63 億美元加密貨幣，調查指向北韓駭客
- URL：https://www.ithome.com.tw/news/180134
- 發布日期：2026-11-02
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：本網址是 iThome 11 月 2 日的資安日報彙整頁，不是單篇報導。B 組建議交由金融科技；主編改收內容較完整的攻擊鏈報導 iThome 180203（ref-28），同事件的 11 月 2 日單篇 iThome 180126 只作備註。

### T. Apple Siri AI 繁中測試與 iOS 27.3 開發者測試版（中央社）
- URL：https://www.cna.com.tw/news/ait/202611040028.aspx
- 發布日期：2026-11-04
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：B 組建議交由 AI 科技或軟體工程；未開原頁，日期只取自中央社列表頁的網址編號，無法確認內容與發布日，主編未補查，維持淘汰。

### U. 傳台積電進軍 3D DRAM，應輝達要求規劃製造
- URL：https://www.cna.com.tw/news/ait/202611070002.aspx
- 發布日期：2026-11-07
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：標題為「傳」，屬未證實傳聞，未開原頁，日期取 CNA 列表頁 URL 編號；權重低。

### V. NVIDIA 與 Oracle 擴大 Vera Rubin 至多吉瓦規模並將 Vera CPU 帶進 OCI
- URL：https://nvidianews.nvidia.com/news/nvidia-and-oracle-expand-nvidia-vera-rubin-to-multi-gigawatt-scale-and-bring-nvidia-vera-cpu-to-oracle-cloud-infrastructure
- 發布日期：2026-10-27
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：備選：原頁 HTTP 200，頁面日期 October 27, 2026；Vera Rubin NVL72 與 Vera CPU 於 OCI 正式推出、HGX Rubin NVL8 為計畫，日期在窗前半，且已收同組 NVIDIA Vera CPU 與上期 Intel×Oracle、NVIDIA×Meta，避免集中。存檔 pages/B-22-nvidianews.nvidia.com-oracle-vera-rubin.html。

### W. AWS Interconnect - last mile 於北維吉尼亞新增都會區
- URL：https://aws.amazon.com/about-aws/whats-new/2026/11/interconnect-last-mile-northern-virginia/
- 發布日期：2026-11-05
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：AWS What's New 例行公告，原頁 HTTP 200，日期取 AWS What's New RSS pubDate（Thu, 05 Nov 2026），內容為新增區域，技術深度低。AWS News Blog 窗內僅 Hive 表格遷移（11-04）與週報，無基礎設施事故；Google Cloud incidents.json 自 10-24 起無新事故；Azure 狀態與 kernel.org（7.4-rc1 於 11-01）、nginx（最近 10-21，窗外）、OpenSSL 皆未見窗內可收的獨立事件。

### X. ECB Cipollone 談貨幣的未來：Pontes 結算 10 億歐元、數位歐元試行
- URL：https://www.ecb.europa.eu/press/key/date/2026/html/ecb.sp261105~6495a0df6f.en.html
- 發布日期：2026-11-05
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：備援。原頁核對 HTTP 200（存檔 pages/C-02-ecb.europa.eu-sp261105-cipollone.html），為 Tirana 的 Keynote 演講，內容含 Pontes 於週一結算 ESM 發行的 10 億歐元 DLT 基準債、數位歐元試行 2027 下半年起 12 個月、已選定 36 家支付服務業者、Appia 2028 藍圖；有具體數據，但屬論壇演講，且講者與上期 ECB Cipollone 為同一人，若主編名額足夠可補入。

### Y. Nature Medicine：高負擔社區的心血管數位照護準備度
- URL：https://www.nature.com/articles/s41591-026-04800-0
- 發布日期：2026-11-05
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：備援。原頁 HTTP 200（存檔 pages/C-20-nature.com-s41591-026-04800-0.html），JSON-LD datePublished 為 2026-11-05；摘要為整合 82,999 個普查區資料，4,765 個為部署優先區、21,752 個為投資優先區。偏公衛政策分析，與程式設計師關聯較弱，且付費牆僅見摘要。

### Z. FDA 加速核准頭頸部鱗狀細胞癌新療法
- URL：http://www.fda.gov/news-events/press-announcements/fda-grants-accelerated-approval-new-treatment-head-and-neck-squamous-cell-carcinoma
- 發布日期：2026-11-05
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：藥品核准，與軟體或技術較遠；僅見 FDA 新聞稿 RSS（pubDate 2026-11-05），未開原頁。已有 FDA CGT 指引作為 FDA 代表。

### AA. 金管會預告虛擬資產服務法 8 項授權法規命令草案
- URL：https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202611030001&dtable=News
- 發布日期：2026-11-03
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議 2（穩定幣發行許可及管理辦法草案）同為虛擬資產服務法配套、同日發布，僅見列表標題，未開頁；若主編要補充 VASP 資本額與保管規則，可另行核對後併入。

### AB. Visa Direct 推出穩定幣資金調撥，試點轉入量產
- URL：https://usa.visa.com/about-visa/newsroom/press-releases.releaseId.22851.html
- 發布日期：2026-10-15
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：原頁 JSON-LD datePublished 為 2026-10-15，落在時間窗之前（窗起 2026-10-24）。

### AC. Visa 發布企業付款信任與控制新功能
- URL：https://usa.visa.com/about-visa/newsroom/press-releases.releaseId.22866.html
- 發布日期：2026-10-21
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：原頁 JSON-LD datePublished 為 2026-10-21，落在時間窗之前。

### AD. Waymo 確認 2028 年 1 月調整與 Uber 的合作關係
- URL：https://techcrunch.com/2026/11/04/waymo-confirms-its-shaking-up-its-uber-relationship-in-january-2028/
- 發布日期：2026-11-04
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：僅見 TechCrunch 分類 RSS 標題與日期，未開原頁；本組已有 Waymo 冬季天候官方文章，同一家名額不再增加。備援選項，需再核對內文。

### AE. Pew 調查：美國人期待醫療 AI 透明化（科技新報 2026-11-07 轉述）
- URL：https://technews.tw/2026/11/07/medical-ai-use-transparency-poll/
- 發布日期：2026-11-07
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：原頁 HTTP 200，發布日 2026-11-07，但內容為轉述 Pew 調查；搜尋顯示 Pew 原始短文發布於 2026-08-25（窗外），科技新報標示的「最新」不成立，二手轉載且事件在窗外，淘汰。

### AF. FAA 發布垂直起降設施設計標準草案
- URL：https://www.faa.gov/newsroom/faa-releases-draft-design-standards-vertical-flight-facilities
- 發布日期：2026-10-22
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：FAA RSS 日期 2026-10-22，早於時間窗；另上期已引用同系列 eVTOL 試辦里程碑。

### AG. 高雄亞灣智慧社宅二期公辦都更案動土，規劃 6 棟建築預計 121 年底完工
- URL：https://www.cna.com.tw/news/aloc/202611040117.aspx
- 發布日期：2026-11-04
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：備選（非淘汰）。原頁（CNA，curl 200，datePublished「2026-11-04T13:05:00+08:00」，存檔 pages/D-24-cna.com.tw-202611040117.html）為動土典禮報導，全文無智慧化技術細節，只有「智慧社宅」名稱、6 棟、地上 21 與 26 層、1200 戶以上；技術含量低，權重 5。若主編要補台灣媒體的房地產條目可替補。

### AH. 大和房屋在神戶開設關西首座租賃實驗室 DP-Lab KOBE
- URL：https://built.itmedia.co.jp/bt/articles/2611/04/news047.html
- 發布日期：2026-11-04
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：原頁（curl 200，存檔 pages/D-04-built.itmedia.co.jp-2611-04-news047.html，「2026年11月04日 09時00分 公開」）為園區與濕式實驗室開發案竣工報導，偏不動產開發而非技術突破，權重 5。

### AI. 西松建設與 Dassault 以 PLM 概念推動「工業化施工」（Archi Future 2025 講座回顧）
- URL：https://built.itmedia.co.jp/bt/articles/2610/27/news098.html
- 發布日期：2026-10-27
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：原頁（curl 200，meta 2026-10-27T20:44:00Z）為 Archi Future 2025 活動講座回顧，描述願景與路線圖，沒有新成果或數據；日期亦不易判定實際講座時間，權重 5。

### AJ. 「AI 營建機器人論壇登場」（Digitimes）
- URL：https://www.digitimes.com.tw/tech/dt/n/shwnws.asp?CnlID=13&id=767394
- 發布日期：2026-09-07
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：原頁 JSON-LD datePublished「2026/09/07 08:10」，不在時間窗內（搜尋結果誤顯示 11 月）。

### AK. 澳洲音樂產業網路推出全國巡演場地地圖 AMTN
- URL：https://www.digitalmusicnews.com/2026/11/03/australian-music-industry-touring-network-venue-map/
- 發布日期：2026-11-03
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：備選。原頁（curl 200，datePublished「2026-11-03T19:29:35+00:00」，存檔 pages/D-22-digitalmusicnews.com-venue-map.html）為免費網站，在地圖標示場地、規劃巡演路線並可匯出試算表；內容正確但屬小型工具與公益專案，權重 5。

### AL. 越南 135,000 席 VinFast—Trong Dong 體育場與 Legends Global 簽營運合約
- URL：https://www.digitalmusicnews.com/2026/10/28/vietnam-largest-stadium-world-construction-begins/
- 發布日期：2026-10-29
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：原頁（curl 200，datePublished「2026-10-29T05:17:13+00:00」，存檔 pages/D-23-digitalmusicnews.com-vietnam-stadium.html）重點是營運合作與預計 2027-07-31 開幕，技術面僅提「automated retractable roof」，權重 5；標題寫動工但內文是營運協議，標題與內文重點不一致。

### AM. Hybe 資料外洩遭韓國當局調查
- URL：https://www.digitalmusicnews.com/2026/11/04/south-korean-authorities-investigating-hybe-data-breach/
- 發布日期：2026-11-05
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：D 組建議交由軟硬體資訊安全；主編評估資安分類已收 6 筆，且 Hybe 自身揭露日為 10 月 18 日、在窗外，維持淘汰。原頁核對（curl 200，datePublished「2026-11-05T05:46:08+00:00」，存檔 pages/D-25-digitalmusicnews.com-hybe-breach.html）：Hybe 10 月 18 日揭露經外部廠商文件預覽軟體入侵，洩漏員工與合作夥伴個資，發生於 9 月 12 至 13 日與 10 月 3 至 5 日；與演出無直接關係。

### AN. Apple Music 在 iOS 27.3 新增 Selfie Sing 影片錄製模式
- URL：https://www.digitalmusicnews.com/2026/11/03/apple-music-unveils-karaoke-like-selfie-sing-video-mode/
- 發布日期：2026-11-03
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：備選。原頁（curl 200，datePublished「2026-11-03T19:29:35+00:00」，存檔 pages/D-10-digitalmusicnews.com-apple-music-selfie.html）內容出自對 Apple Insider 報導的轉述，且以評論為主（稱可能是噱頭），無官方原頁可核對，權重 5。

### AO. 日內瓦國際影展首推「台灣焦點」，陳芯宜 VR 作品《雲在兩千米》場場售罄
- URL：https://www.cna.com.tw/news/acul/202611070024.aspx
- 發布日期：2026-11-07
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：備選。原頁（curl 200，datePublished「2026-11-07T09:04:00+08:00」，存檔 pages/D-18-cna.com.tw-202611070024.html）為影展專題報導，內容是講座與巡演合作可能，無技術數據；窗後端日期，權重 6，可作影視分類補位。

### AP. Variety：TCCF 紀錄片《The Technological Sublime》揭露 AI 隱藏供應鏈
- URL：https://variety.com/2026/film/markets-festivals/ai-hidden-supply-chain-doc-taiwan-creative-content-fest-1236941783/
- 發布日期：2026-11-06
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：僅依 RSS 列表日期（Fri, 06 Nov 2026 23:18:22）與標題判斷，原頁雖已存檔（pages/D-19-variety.com-technological-sublime.html，curl 200），但未逐段核對全文與 datePublished，不收正式；內容為影展市場上的紀錄片介紹，非技術發表。

### AQ. 十三代目市川團十郎領軍，衛武營邀歌舞伎名門「成田屋」首登台
- URL：https://www.cna.com.tw/news/acul/202611040045.aspx
- 發布日期：2026-11-04
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：原頁（curl 200，存檔 pages/D-17-cna.com.tw-202611040045.html）為節目宣傳與傳統表演介紹，非科技應用；權重 4。

### AR. Pentagon 提供電池新創 6K 2.5 億美元貸款，在田納西建微波電漿製程電池材料工廠
- URL：https://techcrunch.com/2026/11/06/pentagon-offers-battery-startup-6k-250m-loan-to-build-u-s-factory/
- 發布日期：2026-11-06
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：備選。原頁（curl 200，datePublished「2026-11-06T16:50:01+00:00」，存檔 pages/D-29-techcrunch.com-6k-pentagon-loan.html）為條件式核准貸款（conditional approval）的短報導，製程細節簡略，權重 6；融資性質大於技術突破。

### AS. Nature 新聞：AI 代理設計並營運機器人實驗室
- URL：https://www.nature.com/articles/d41586-026-03587-x
- 發布日期：2026-11-06
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：原頁（curl 200，datePublished「2026-11-06T00:00:00Z」，存檔 pages/D-27-nature.com-d41586-026-03587-x.html）僅抓到一句副標與付費牆前內容，無法讀全文核對細節；D 組建議交由 AI 科技，主編因無法核對內文維持淘汰。

### AT. Live Nation 2026 第三季創紀錄財報、預計全年迎接近 1.8 億粉絲
- URL：https://www.digitalmusicnews.com/2026/11/06/live-nation-revenue-q3-2026/
- 發布日期：2026-11-06
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：財報數字類，簡報規定權重低；未開原頁核對全文。
