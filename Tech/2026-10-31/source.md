# 候選來源整理

- 報告日期：2026-10-31
- 時間範圍：2026-10-17 至 2026-10-31（含首尾）
- 判定原則：以原始頁面標示的發布日為準；無法確認落在時間窗內者直接排除。
- 來源優先序：官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載。中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。
- 跨期去重：本期窗期與 2026-10-24 期（2026-10-10 至 2026-10-24）重疊八天、與 2026-10-17 期（2026-10-02 至 2026-10-17）重疊一天，篩選前已比對兩期 `references.md`，重複事件即使落在窗內也淘汰。
- 蒐集方式：四組 `tech-collector` 代理依分類平行蒐集，主編收斂、複審並逐筆回原頁核對；摘要只寫該來源原頁可查證的內容，其他媒體的細節記在備註。

## 正式納入來源

### 1. Google 發表 Gemini 4 Carbon，綜合能力評測居首、資安基準創最佳成績，先限縮開放給受信任資安人員
- 原始標題：Google發表Gemini 4 Carbon，綜合能力評測登頂、資安表現創新高
- 標題：Google 發表 Gemini 4 Carbon，綜合能力評測居首、資安基準創最佳成績，先限縮開放給受信任資安人員
- URL：https://www.ithome.com.tw/news/180049
- 摘要：iThome 報導，Google 於 10 月 28 日發表新一代模型 Gemini 4 Carbon，在 Artificial Analysis Intelligence Index v5.0 取得 59 分居首，Google 另公布 17 項基準測試，Carbon 在其中 15 項領先。資安方面，Carbon 在漏洞偵測的 SEC-bench Pro 為 88.2%、漏洞可利用性的 ExploitGym 為 54.8%、漏洞修補的 CWE-bench 為 71.0%，皆創最佳成績，但這三項都在未啟用安全防護限制下測試，成績未必反映實際部署表現。考量濫用風險，Google 本周起先透過 Fairwind Program 提供部分受信任的資安防禦人員使用，再逐步擴大至一般開發者、企業與消費者，尚未公布全面開放日期。定價沿用 Argon 的初期定價：每百萬輸入 Token 2 美元、輸出 10 美元，快取輸入享 95% 折扣。
- 權重：8/10
- 發布日期：2026-10-29
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-11-ithome.com.tw-180049.html；日期依 iThome 內文頁 class="created"「2026-10-29」（事件為 10-28 周三）。grep 核對：Gemini 4 Carbon、Artificial Analysis、59分、SEC-bench Pro、88.2%、ExploitGym、54.8%、CWE-bench、71.0%、Fairwind Program、2美元、15項。Google 官方頁未另核對，以 iThome 為主要來源；上期淘汰的是 Gemini 4 Argon 推向方案用戶（iThome 179677），本篇為後續新模型 Carbon，屬不同事件。

### 2. OpenAI 推出 GPT-6.1 Terra，強化視覺判讀與電腦操作，API 價格為 GPT-6.1 Sol 的一半
- 原始標題：OpenAI新模型GPT-6.1 Terra強化視覺與電腦操作，API價格僅Sol一半
- 標題：OpenAI 推出 GPT-6.1 Terra，強化視覺判讀與電腦操作，API 價格為 GPT-6.1 Sol 的一半
- URL：https://www.ithome.com.tw/news/179985
- 摘要：iThome 報導，OpenAI 推出 GPT-6.1 Terra，強化視覺判讀與電腦操作能力，標準 API 輸入與輸出價格均為 GPT-6.1 Sol 的一半，每百萬 Token 輸入 1 美元、快取輸入 0.05 美元、輸出 5 美元。開發者可用 gpt-6.1-terra 呼叫，ChatGPT Work 與 Codex 的 Plus、Pro、Enterprise 及 Edu 用戶也能使用。OpenAI 測試顯示，Agents’ Last Exam 中等推理強度得分比前代 GPT-5.6 Terra 高 15 個百分點，每項任務成本約為前代三分之一；Terminal-Bench 4.0 最高推理強度解決 50.3% 任務。內部幻覺測試的低推理強度錯誤率由 53.6% 降至 16.7%，但官方說明測試採特別容易誘發幻覺的案例。OpenAI 仍建議最複雜的程式開發任務改用 GPT-6.1 Sol 或 GPT-6 Astra。
- 權重：8/10
- 發布日期：2026-10-27
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-14-ithome.com.tw-179985.html；日期依 iThome 內文頁 class="created"「2026-10-27」。grep 核對：GPT-6.1 Terra、gpt-6.1-terra、Terminal-Bench 4.0、50.3%、53.6%、16.7%、0.05美元、Agents’ Last Exam、15個百分點。openai.com 全 UA 403，未能開官方頁，改用 iThome 並以其內文引述的 OpenAI 測試數字為準；文中 Hacker News 討論與 OpenAI 研究人員 Ted Sanders 回應不納入摘要。上期已引 iThome 179915（GPT-6 上 Google Cloud），本篇是新模型，不同事件。

### 3. Mistral 釋出 Mistral Large 4（Le Chonk）開放權重，主打程式開發與防禦性資安
- 原始標題：Mistral Large 4 (Le Chonk) is now open weight | Built for Coders, Trusted by Defenders.
- 標題：Mistral 釋出 Mistral Large 4（Le Chonk）開放權重，主打程式開發與防禦性資安
- URL：https://mistral.ai/news/mistral-large-4-oss/
- 摘要：Mistral 於 10 月 29 日釋出 Mistral Large 4（Le Chonk）的權重。該模型為 1 兆參數的原生多模態旗艦模型，10 月稍早先以公開預覽推出，之後再做三週強化學習。官方稱在 Cognition 的私有基準 FrontierCode 2.0 以 19.7% 居首；Artificial Analysis Coding Agent Index 為 48%，與領先的開放權重模型 GLM-5.3 大致持平，但每項任務平均少用 47% Token；Terminal-Bench 4.0 較預覽版提升 13 個百分點至 41%。資安方面，Artificial Analysis Cyber Index 為 51%，對惡意資安請求的平均拒絕率為 96.6%。模型支援三種推理模式，Mistral 也提到觀察到實際流量中有被用於攻擊的潛在風險，正在調整防護，並僅向經審查的設計夥伴提供資安專用變體預覽。
- 權重：9/10
- 發布日期：2026-10-29
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-31-mistral.ai-mistral-large-4-oss.html；日期依 JSON-LD datePublished「2026-10-29T12:00:07.000Z」。grep 核對：1-trillion-parameter、FrontierCode 2.0、19.7%、Coding Agent Index、47% fewer tokens、Terminal-Bench 4.0、41%、Cyber Index、96.6%、ENISA、three reasoning modes。基準數字皆為 Mistral 自述；同日 Hugging Face 另有 Welcome Le Chonk 文章（huggingface.co/blog/mistral-large4，Published October 29, 2026），已列淘汰作為替補。上期淘汰的是 Voxtral 3，與本篇不同事件。

### 4. Anthropic 研究：50 位專業分析師與 Claude Code 合作時，86% 的分析選擇跟隨代理被設定的傾向
- 原始標題：How AI agents shape experts’ judgment calls
- 標題：Anthropic 研究：50 位專業分析師與 Claude Code 合作時，86% 的分析選擇跟隨代理被設定的傾向
- URL：https://www.anthropic.com/research/agents-judgment-calls
- 摘要：Anthropic 對 50 位具因果推論經驗的專業分析師做隨機對照實驗，請他們用 Claude Code 為一個虛構農業合作社評估諮詢服務是否有效。研究者在系統提示中，依擲硬幣結果暗中設定代理在五項決策（四項分析選擇與最終建議）上各偏好某一選項，並要求不得曲解結果。結果分析師在四項選擇合計有 86% 與代理的傾向一致；若分析師事前已有偏好，代理不同意時有 60% 改變立場，代理同意時只有 6%（僅 38 例，原文自述估計不精確）。事後解釋選擇時，77% 的分析師使用了代理的論述，但只有 15% 說明這來自代理。Anthropic 指出，真實的代理有時也會有傾向，未指定傾向時 Claude Opus 4.8 在 123 次執行中有 112 次做出相同的五項選擇，本實驗則刻意加強傾向；代理未被給予明確偏好與表達指示時，影響可能較小；使用代理者完成較快、嚴重錯誤較少，但不使用代理的對照組小且經驗較淺。
- 權重：9/10
- 發布日期：2026-10-27
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-33-anthropic.com-agents-judgment-calls.html；日期依 JSON-LD datePublished「2026-10-27T00:00:00.000Z」。grep 核對：50 professional analysts、86%、60%、77%、15%、Claude Opus 4.8、112 out of 123、coin flip、Claude Code、Greenfields Farming Cooperative。原頁另載招募 61 人、11 人未用代理而排除；摘要採分析的 50 人。

### 5. 國科會主委吳誠文：TAIDE 預計年底前公布含語言模型、行為模型的新模型並開放民間使用
- 原始標題：國科會：TAIDE已進一步發展　年底前公布新模型
- 標題：國科會主委吳誠文：TAIDE 預計年底前公布含語言模型、行為模型的新模型並開放民間使用
- URL：https://www.cna.com.tw/news/aipl/202610270268.aspx
- 摘要：中央社報導，國科會主委吳誠文 10 月 27 日在立法院會備詢時表示，可信任人工智慧對話引擎 TAIDE 已有進一步發展，預計年底前公布包含語言模型、行為模型的新模型，並開放民間使用；他說明年編列較高預算就是要投資主權 AI，民間也同步在發展新模型。國民黨立委謝衣鳯質詢時關切台灣過去較偏重硬體，大型語言模型著墨較少，並指出發展主權 AI 需要符合繁體中文、台語、客語的資料庫。數發部次長侯宜秀說明，政府資料在不涉及個資與機敏性的前提下原則上盡量鼓勵開放，民間資料以尊重著作權為基礎，目前語料庫已有 200 個機關、超過 33 億個 Token 的資料。數發部 AI 算力中心 BOO 案有 2 階段、4 家廠商發展中，民間投資後會回饋 1 到 3% 算力供公共使用。
- 權重：8/10
- 發布日期：2026-10-27
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-34-cna.com.tw-202610270268.html；日期依 article:published_time「2026-10-27T18:33:00+08:00」。grep 核對：吳誠文、TAIDE、33億、200個機關、謝衣鳯、侯宜秀、BOO案、1到3%、主權AI、語料庫。內容為立法院質詢答詢，屬官員說法，尚非正式發布；摘要中「預計」「原則上」照原文。

### 6. Anthropic 向 SEC 提交 S-1，擬以代號 ANT 在 Nasdaq 掛牌，發行股數與價格尚未決定
- 原始標題：Anthropic files S-1 with the SEC for proposed initial public offering
- 標題：Anthropic 向 SEC 提交 S-1，擬以代號 ANT 在 Nasdaq 掛牌，發行股數與價格尚未決定
- URL：https://www.anthropic.com/news/s1-sec
- 摘要：Anthropic 宣布，Anthropic, PBC 已向美國證券交易委員會（SEC）提交 S-1 登記文件，申請首次公開發行 A 類普通股，擬在 Nasdaq Global Select Market 以代號「ANT」掛牌。發行股數與價格區間尚未決定；發行只會透過公開說明書進行，初步公開說明書備妥後可向 Goldman Sachs 與 Morgan Stanley 索取。登記文件已提交 SEC 但尚未生效，生效前不得出售證券或接受購買要約，公告本身也不構成出售要約或購買邀約。頁尾說明 Anthropic 為公益公司（Public Benefit Corporation）。
- 權重：8/10
- 發布日期：2026-10-26
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/X-01-anthropic.com-s1-sec.html；日期依 JSON-LD datePublished「2026-10-26T00:00:00.000Z」，頁面 Published Oct 26, 2026。grep 核對：Form S-1、Class A common stock、Nasdaq Global Select Market、ANT、have not yet been determined、Goldman Sachs、Morgan Stanley、has not yet become effective、Public Benefit Corporation。A 組列為淘汰候選並建議交由他組，主編改收於 AI 科技；頁面沒有營收、估值等財務數字。

### 7. GitHub Universe 2026 開發者端彙整：Copilot app、Copilot Fusion、Copilot projects 與 Git 架構重做
- 原始標題：GitHub Universe 2026: Evolving every layer of the stack
- 標題：GitHub Universe 2026 開發者端彙整：Copilot app、Copilot Fusion、Copilot projects 與 Git 架構重做
- URL：https://github.blog/news-insights/company-news/github-universe-2026-evolving-every-layer-of-the-stack/
- 摘要：Jay Parikh 在 10 月 28 日的 GitHub Universe 彙整中，將 GitHub 定位為端到端的軟體交付系統。Copilot Fusion 依任務協調一個或多個模型，在 Artificial Analysis 的 Coding Agent Index，Fusion Max 與 Opus 5.5 Max 的差距在兩分以內、成本一半、每項任務少 40% 時間；Copilot projects 可跨多個儲存庫並行執行代理工作；session continuity 可跨 app、VS Code、CLI 與網頁延續同一個雲端代理工作階段；Copilot code review 新增 Max。GitHub Enterprise 客戶可不另購訂閱使用全部 Copilot 功能，依 AI 點數計費，目前透過 GitHub Sales 洽購，現有 Copilot Business 與 Copilot Enterprise 客戶可維持既有方案。基礎設施方面，今年新增 400 萬個 CPU 核心、160 PB 儲存與 50 Tb/s 網路，預計明年初完成遷往 Azure 多區域。
- 權重：9/10
- 發布日期：2026-10-28
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-01-github.blog-universe-2026-evolving-every-layer.html；日期依 JSON-LD datePublished「2026-10-28T09:09:28-07:00」（UTC 為 10-28）。grep 核對：Evolving every layer of the stack、Copilot Fusion、4 million CPU cores、160 PB、50 Tb/s、ReviewBench、multi-region deployment in Azure、Copilot projects、Session continuity、separate enterprise subscription。本篇為 Universe 官方開發者端彙整；原頁以「Today at GitHub Universe」描述 10-28 當天發布，未另核對 10-29 場次。上期淘汰的 github.blog 首頁盤點未收單篇彙整，本篇為單篇官方文章。

### 8. Android Dev Summit 開發者工具彙整：Android Studio 支援自帶代理、Android CLI 可串接實體裝置
- 原始標題：What's new in Android developer tools and performance at Android Dev Summit
- 標題：Android Dev Summit 開發者工具彙整：Android Studio 支援自帶代理、Android CLI 可串接實體裝置
- URL：https://developer.android.com/blog/posts/android-dev-summit-26-developer-tools-performance
- 摘要：Google 於 10 月 28 日在 Android Developers' Blog 彙整 Android Dev Summit 的工具與效能發布。Android Studio Rabbit 2 的 Bring Your Own Agent 轉為穩定版，透過 Agent Client Protocol 支援 40 多個相容的程式開發代理，並新增 Change Review 代理式審查；Android Bench 2.0 是評估模型與代理在長時間 Android 開發任務表現的排行榜。Android CLI 新增 android device remote 取用 Google 裝置實驗室的實體裝置，以及 android preview 在無模擬器下轉譯 Compose Preview，Google 內部測試稱使用後 UI 任務完成速度快 77%、Token 最多少用三倍；Android CLI 也有 Claude 與 Codex 外掛。另將 LeakCanary 整合進 Android CLI 與 Profiler，並提到 androidx.tracing 2.0。
- 權重：9/10
- 發布日期：2026-10-28
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200（需帶 cookie jar 避免 302 迴圈），存檔 pages/A-22-developer.android.com-ads26-developer-tools-performance.html；日期依頁面日期晶片 adb--date-chip「28 Oct 2026」（頁面無 datePublished）。grep 核對：Bring Your Own Agent、Android Studio Rabbit 2、Change Review、Android Bench 2.0、android device remote、android preview、77% faster、androidx.tracing 2.0、over 40 ACP-compatible、Agent Client Protocol。窗內開發者大會除 GitHub Universe 外，Google Android Dev Summit（10-28 至 10-29）有官方開發者彙整，故收此篇；KubeCon NA 2026 為 11-09 至 11-12（搜尋結果），在窗外。

### 9. Node.js 26 於 10 月 28 日進入 LTS（代號 Lithium），支援至 2029 年 4 月底
- 原始標題：Node.js 26.13.0 (LTS)
- 標題：Node.js 26 於 10 月 28 日進入 LTS（代號 Lithium），支援至 2029 年 4 月底
- URL：https://nodejs.org/en/blog/release/v26.13.0
- 摘要：Node.js 官方發布 26.13.0（LTS），發布日為 2026-10-28，代號 Lithium。這個版本標誌 Node.js 26.x 轉入長期支援（LTS），官方說明將持續更新至 2029 年 4 月底。除了更新 process.release 物件等中繼資料以反映 LTS 狀態外，相較 26.12.1 沒有其他變更。官方另提醒，從更早的 LTS（例如 Node.js 24 或 22）升級的人，自 Node.js 25 起 Linux 官方二進位檔改為連結 libatomic，視 Linux 發行版可能需要另外安裝。頁面同時列出各平台安裝檔與 SHASUMS。
- 權重：9/10
- 發布日期：2026-10-28
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-41-nodejs.org-release-v26.13.0.html；日期依頁面標題行「2026-10-28, Version 26.13.0 'Lithium' (LTS)」，與部落格列表 Oct 28, 2026 一致。grep 核對：Lithium、Long Term Support、April 2029、libatomic、26.12.1、process.release、2026-10-28。頁面無 datePublished meta，日期取內文發布行。

### 10. Claude Code v2.1.316 發布：新增子代理推理強度環境變數，Opus 4.8 快速模式 11 月底移除
- 原始標題：Release v2.1.316 · anthropics/claude-code
- 標題：Claude Code v2.1.316 發布：新增子代理推理強度環境變數，Opus 4.8 快速模式 11 月底移除
- URL：https://github.com/anthropics/claude-code/releases/tag/v2.1.316
- 摘要：Claude Code v2.1.316 於 10 月 31 日（UTC）在 GitHub 發布，這是一個標為 Immutable 的 Release。新增項目包含 CLAUDE_CODE_DISABLE_ULTRATHINK（關閉 ultrathink 關鍵字）、CLAUDE_CODE_SUBAGENT_EFFORT（設定子代理在未另行指定時使用的推理強度），以及 Claude apps gateway 的 pooled 群組預算（admin API 的 pooled_budget）與 managed.policy_mode: layered 分層政策。原頁寫明 Opus 4.8 的快速模式自 2026 年 10 月 30 日起棄用，將於 11 月 30 日移除，移除後快速模式請求會回傳錯誤、不會退回標準 Opus 4.8，需改用 Opus 5.5 才能保留加速。另修正多項問題，例如特定寫法下 PowerShell hook 未依 exit code 2 阻擋、--restricted 工作階段在 Read 允許規則涵蓋時可能上傳工作目錄外檔案。
- 權重：8/10
- 發布日期：2026-10-31
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-06-github.com-claude-code-v2.1.316.html；日期依 relative-time datetime「2026-10-31T01:01:35Z」（頁面顯示 31 Oct 01:01，UTC 日期 10-31）。grep 核對：v2.1.316、CLAUDE_CODE_DISABLE_ULTRATHINK、CLAUDE_CODE_SUBAGENT_EFFORT、pooled_budget、managed.policy_mode: layered、November 30, 2026、Migrate to Opus 5.5、Immutable。上期淘汰的是 Release 列表頁盤點（v2.1.310 等），本篇改收單一版本 tag 頁；臺灣時間為 10-31 09:01，仍在窗內。Codex 與 Cursor 的 changelog 已查（Cursor 窗內有 10-20、10-16 條目），未逐條核對，未收。

### 11. JetBrains IDE 終端機從 2026.3 起改用 libghostty，改善 Claude Code、Codex 等 AI 代理的相容性
- 原始標題：JetBrains IDE終端機改採libghostty，改善AI代理與TUI工具操作相容性
- 標題：JetBrains IDE 終端機從 2026.3 起改用 libghostty，改善 Claude Code、Codex 等 AI 代理的相容性
- URL：https://www.ithome.com.tw/news/180036
- 摘要：iThome 報導，JetBrains 旗下 IDE 自 2026.3 版起將在重新設計的終端機中改用 Ghostty 的終端機模擬函式庫 libghostty，取代多年使用的 JediTerm，主要改善 Claude Code、Codex 等命令列 AI 程式代理，以及 Neovim、tmux 等工具在 IDE 內的鍵盤快捷鍵與畫面顯示相容性。新引擎支援 Kitty 鍵盤協定，可區分 Enter、Shift+Enter 與 Ctrl+Enter，使用 Claude Code 或 Codex 輸入多行提示詞時能以 Shift+Enter 換行而不誤送出；並處理近 50 種 JediTerm 先前忽略或解析錯誤的控制序列，也可隨 IDE 深淺色主題通知終端機工具。不過遠端程式要求複製到本機剪貼簿、桌面通知與顯示圖片等指令，因 JetBrains 尚未完成 IDE 端整合，目前仍無法透過新終端機使用。新引擎已在 2026.3 EAP 預設啟用，官方表示後續測試版與正式版也將採用。
- 權重：7/10
- 發布日期：2026-10-28
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/A-16-ithome.com.tw-180036.html；日期依 iThome 內文頁 class="created"「2026-10-28」。grep 核對：libghostty、JediTerm、2026.3、Kitty、Shift+Enter、近50種、Neovim、tmux。新引擎目前僅在 2026.3 EAP 預設啟用，狀態照原頁寫為後續版本將採用。

### 12. Linux 核心 TCP 漏洞可遠端取得 root 權限，部分發行版尚未修補
- 原始標題：Linux TCP漏洞可被用來遠端取得root權限，部分發行版尚未修補
- 標題：Linux 核心 TCP 漏洞可遠端取得 root 權限，部分發行版尚未修補
- URL：https://www.ithome.com.tw/news/180101
- 摘要：Linux 核心存在影響 IPv4 TCP 連線處理的漏洞 CVE-2026-98432，Linux 核心 CVE 團隊指出成因是不同 CPU 同時處理重傳連線請求或請求遷移時的競態條件，造成釋放後使用（use-after-free），可追溯至 Linux 4.4 版引入的程式變更。Anthropic 於 10 月 27 日公開攻擊驗證結果，對具多路徑 TCP（MPTCP）監聽服務的 Linux 伺服器，不需登入帳號即可遠端以 root 權限執行命令；取得核心位址約耗時 48 分鐘，後續執行命令約需 5 分鐘。Canonical 列為高優先級、CVSS 3 評分 9.8，Red Hat 給 8.1。上游修補已納入 6.12.113、6.18.56、7.2.10 及 7.3-rc7 等核心版本；Debian 12 與 13 已釋出更新，Ubuntu 多個版本仍在修補，Red Hat 將 RHEL 8、9 及 10 相關核心套件列為暫緩修補。
- 權重：8/10
- 發布日期：2026-10-30
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-01-ithome-linux-tcp-mptcp-cve-2026-98432.html；日期依 class="created"「2026-10-30」。grep 核對：CVE-2026-98432、MPTCP、use-after-free、KASLR、48分鐘、6.12.113、7.3-rc7、Canonical、9.8、Red Hat、暫緩修補、Linux 4.4。修補版本與發行版進度皆為 iThome 報導內容。

### 13. PHP2Shell 與 Linux 核心漏洞被串連利用，25 臺 Palo Alto Networks 設備遭取得 root 權限
- 原始標題：PHP2Shell與Linux核心漏洞被串連利用，中國駭客藉此取得25臺防火牆root權限
- 標題：PHP2Shell 與 Linux 核心漏洞被串連利用，25 臺 Palo Alto Networks 設備遭取得 root 權限
- URL：https://www.ithome.com.tw/news/180111
- 摘要：以色列資安新創 Dream Security 於 10 月 26 日揭露，使用簡體中文的駭客疑似借助 AI，串連 PHP2Shell 重大漏洞（CVE-2026-109618、CVE-2026-109619）與 Linux 核心本機權限提升漏洞 Fragnesia（CVE-2026-46300），入侵位於臺灣、日本、韓國與美國的 25 臺伺服器並取得 root 權限。事隔 3 天該公司更新文章，指出這些伺服器是執行特定版本 PAN-OS 的 Palo Alto Networks 防火牆與管理伺服器，Unit 42 也獨立確認。攻擊者先以 FOFA 找出約 1.9 萬臺對外暴露管理介面的防火牆，篩選出 240 臺鎖定，成功入侵 24 臺並植入 Web Shell。Palo Alto Networks 透露全球僅約 0.02% 用戶將管理介面曝露於網際網路。Dream Security 在攻擊基礎設施發現 Claude Code、aiscan 等工具，並依約 40 支指令碼風格一致，認為駭客很可能利用 AI 協助開發。
- 權重：8/10
- 發布日期：2026-10-30
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-02-ithome-php2shell-fragnesia-panos.html；日期依 class="created"「2026-10-30」。grep 核對：Dream Security、CVE-2026-109618、Fragnesia、CVE-2026-46300、PAN-OS、Unit 42、0.02%、FOFA、240臺、24臺、aiscan、Web Shell。PHP2Shell 事件上一期已收（PHP 公告與數發部盤點），本篇為串連 Linux 核心漏洞入侵 PAN-OS 設備的新攻擊活動，視為新實質進展。

### 14. Google Brotli 漏洞恐造成資訊洩漏及阻斷服務，.NET、PHP 與 Linux 陸續修補
- 原始標題：Google Brotli漏洞恐造成資訊洩漏及阻斷服務，.NET、PHP與Linux陸續修補
- 標題：Google Brotli 漏洞恐造成資訊洩漏及阻斷服務，.NET、PHP 與 Linux 陸續修補
- URL：https://www.ithome.com.tw/news/180003
- 摘要：Google 開發的開源壓縮程式庫 Brotli 存在越界寫入漏洞 CVE-2026-111497，攻擊者可用特製壓縮資料觸發記憶體破壞，造成阻斷服務或資訊洩漏。Imperva 先前公布 Node2Shell 研究，證實特定條件下可利用受影響的 Node.js 遠端執行程式碼。微軟於 10 月 25 日發布 .NET 8.0.33、9.0.22、10.0.14 及 .NET 11 RC3 修補；PHP 團隊 10 月 26 日重建 4 個 Windows 套件，內含 Brotli 更新至 1.2.1；Python 套件 Brotli 與 brotlicffi 也已發布修補版本。Debian、Ubuntu、Alpine 等發行版進度不一，Red Hat 將 RHEL 7 至 10 列為受影響。未修補前，紅帽建議限制接收不受信任來源的 Brotli 壓縮資料，或在反向代理移除 Content-Encoding: br 標頭。JFrog 另證實可透過特製 JPEG XL 圖片觸發。
- 權重：8/10
- 發布日期：2026-10-28
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-03-ithome-brotli-cve-2026-111497.html；日期依 class="created"「2026-10-28」。grep 核對：CVE-2026-111497、Node2Shell、8.0.33、1.2.1、Content-Encoding: br、JPEG XL、libjxl、ClickHouse、PyArrow、brotlicffi、RHEL 7、Imperva。Node.js 十月安全版本上一期已淘汰，本篇為其他平臺的後續修補整理。

### 15. Cloudflare 公布 GLM-5.3 Workers AI 模型的跨請求 KV 快取外露事件與 SGLang 修補
- 原始標題：Cross-request KV cache exposure in the GLM-5.3 Workers AI model, and our remediation with SGLang
- 標題：Cloudflare 公布 GLM-5.3 Workers AI 模型的跨請求 KV 快取外露事件與 SGLang 修補
- URL：https://blog.cloudflare.com/kv-cache-exposure-remediation/
- 摘要：Cloudflare 表示，研究人員 Gadi Evron（Knostic）於 9 月 8 日通報，自 8 月 27 日起，Workers AI 上的 GLM-5.3 模型（@cf/zai-org/glm-5.3）出現租戶隔離問題。8 月 27 日至 9 月 9 日間，共有 155 筆回應含有他人請求的資料，皆為超過 681,280 個 token 的提示。Cloudflare 稱未發現刻意利用的證據，並在宣告事件後 40 分鐘內將模型下線，9 月 9 日修補後恢復服務。成因有二：部署時設定 1,048,576 個 token 的脈絡視窗，但預填充 GPU 的 KV 快取池只容納 681,280 個 token；另一個是開源推論引擎 SGLang 在分離式預填充與解碼模式下，未中止被拒絕的超長請求，使解碼節點讀到舊快取頁。修補把快取池擴大到約 204 萬個 token，並修改引擎的拒絕路徑；修補自 SGLang v0.5.20 釋出，Cloudflare 建議升級至 v0.5.22 以上。文章與 SGLang 的貼文同步揭露。
- 權重：9/10
- 發布日期：2026-10-26
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-04-cloudflare-kv-cache-exposure-glm-5-3.html；日期依 datePublished「2026-10-26T22:01:23.889Z」。grep 核對：GLM-5.3、Knostic、681,280、1,048,576、155 responses、SGLang、HackerOne、40 minutes、disaggregated、2.04 million、v0.5.21、Mooncake。UTC 日期 2026-10-26，台灣時間為 10-27 清晨。事件本身發生於 8 至 9 月，文章為 10 月公開的事後報告。

### 16. 新光三越疑遭外部入侵，約 2 萬名顧客個資受影響，已通報主管機關
- 原始標題：新光三越疑遭外部入侵，約2萬名顧客個資受影響，已通報主管機關
- 標題：新光三越疑遭外部入侵，約 2 萬名顧客個資受影響，已通報主管機關
- URL：https://www.ithome.com.tw/news/180011
- 摘要：iThome 指出，臺灣多家媒體報導新光三越發生資安事件、2 萬名顧客個資受影響，但新光三越網站未發布公告，iThome 向該公司詢問後取得其總公司發布的資訊系統異常事件說明。新光三越在 10 月 22 日的聲明表示，透過內部資安監測機制發現資訊系統異常、疑似遭外部不法入侵；初步清查，部分宅配訂單顧客的姓名、地址及聯絡電話受到影響。公司已啟動緊急應變機制、通報主管機關、協同警察機關調查，並主動通知受影響顧客，提醒留意不明來電、可疑簡訊與連結。聲明指出，截至 10 月 22 日警方尚未接獲顧客因本次事件遭詐騙的通報，並強調持續依循 ISO 27701 隱私資訊管理標準。
- 權重：7/10
- 發布日期：2026-10-28
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-05-ithome-shin-kong-mitsukoshi-breach.html；日期依 class="created"「2026-10-28」。grep 核對：新光三越、2萬名、10月22日、宅配訂單、姓名、地址及聯絡電話、ISO 27701、通報主管機關、警察機關、內部資安監測機制。公司聲明日為 10 月 22 日，iThome 報導日 10 月 28 日；人數 2 萬為 iThome 轉述媒體報導，iThome 引述的聲明段落只寫「部分宅配訂單顧客」，未提人數。

### 17. Apple 發表搭載 PROLED XDR 顯示器與觸控的 MacBook Pro
- 原始標題：Apple unveils groundbreaking MacBook Pro with PROLED XDR Display and Touch for the first time on Mac
- 標題：Apple 發表搭載 PROLED XDR 顯示器與觸控的 MacBook Pro
- URL：https://www.apple.com/newsroom/2026/10/apple-unveils-groundbreaking-macbook-pro-with-proled-xdr-display/
- 摘要：Apple 發表搭載 PROLED XDR 顯示器的新款 MacBook Pro，提供 14 與 16 吋，採用串聯式（tandem）OLED，標示峰值亮度最高 2000 尼特、對比 10,000,000:1、120Hz 可變更新率，色域涵蓋 P3 與 Adobe RGB。這是 Mac 首度內建觸控，觸控感測器直接整合在顯示面板內；Dynamic Island 也來到 Mac。處理器為 M5 Pro 與 M5 Max，記憶體最高 128GB、儲存最高 16TB，配備 Thunderbolt 5，電池續航最長 24 小時，機身為 3 與 4 磅的更薄更輕設計，搭配 macOS 27。Apple 表示 macOS 會自動把觸控轉成點擊，許多既有 App 可直接使用，系統手勢 API 也已更新，開發者可打造專為觸控設計的體驗。即日起預購，11 月 6 日開始供貨。
- 權重：9/10
- 發布日期：2026-10-28
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-10-apple-macbook-pro-proled-xdr.html；日期依 datePublished「2026-10-28Z」。grep 核對：PROLED XDR、2000 nits、10,000,000:1、M5 Pro、M5 Max、128GB、16TB、Thunderbolt 5、macOS 27、November 6、gesture APIs、Dynamic Island。Apple 原頁摘要為廠商自述（如「world’s best laptop display」），摘要只寫規格與供貨日。

### 18. Apple 發表搭載 M6 晶片的 14 吋 MacBook Pro
- 原始標題：Apple introduces the new 14‑inch MacBook Pro with M6
- 標題：Apple 發表搭載 M6 晶片的 14 吋 MacBook Pro
- URL：https://www.apple.com/newsroom/2026/10/apple-introduces-the-new-14-inch-macbook-pro-with-m6/
- 摘要：Apple 發表搭載 M6 晶片的 14 吋 MacBook Pro。M6 配備 12 核心 CPU（比前代多兩核）、12 核心 GPU（每核心含 Neural Accelerator）與雙 16 核心 Neural Engine。Apple 表示 GPU 圖形效能比 M5 快最多 30%，裝置端 AI 工作負載快最多 25%，Neural Engine 快最多 1.9 倍；記憶體標配 16GB、最高可配 32GB，頻寬最高 170GB/s。新機支援 Wi-Fi 7 與 Bluetooth 6，續航最長 24 小時，並保留 Liquid Retina XDR 顯示器、12MP Center Stage 相機與六揚聲器系統，搭配 macOS 27。提供太空黑與銀色，10 月 28 日起預購，11 月 6 日開始供貨。
- 權重：9/10
- 發布日期：2026-10-27
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-11-apple-14-inch-macbook-pro-m6.html；日期依 datePublished「2026-10-27Z」。grep 核對：M6、12-core CPU、30 percent、25 percent、Dual 16-core Neural Engine、Wi-Fi 7、Bluetooth 6、24 hours、16GB、32GB、170GB/s、November 6。效能倍數皆為 Apple 自述。與同日 iMac M6 為同批發表，iMac 列淘汰候選。

### 19. AMD 與 Meta 深化合作：初期的 Helios 機櫃已在 Meta 安裝、測試中
- 原始標題：AMD and Meta Advance Strategic Partnership to Power Meta’s Superintelligence Infrastructure
- 標題：AMD 與 Meta 深化合作：初期的 Helios 機櫃已在 Meta 安裝、測試中
- URL：https://ir.amd.com/news-events/press-releases/detail/1302/amd-and-meta-advance-strategic-partnership-to-power-metas-superintelligence-infrastructure
- 摘要：AMD 表示，AMD 初期的 Helios 機櫃級方案已在 Meta 安裝、測試中，朝更廣泛部署推進；AMD EPYC 處理器支援 Meta 的 Muse 個人 AI 代理的專屬運算環境，Meta 已部署數百萬顆各世代 EPYC，也是第 6 代 EPYC 的首批主要客戶（lead customer），雙方並合作未來世代「Verano」。Instinct GPU 目前在 Meta 基礎設施中用於訓練與排名、推薦引擎；Meta 是 Instinct MI450 架構的早期定義客戶，並將部署為其工作負載最佳化的客製 Instinct GPU，合作也將影響 MI500 系列。軟體面，雙方透過 PyTorch 推進 ROCm，AMD 對 Muse Spark Open 與 Muse Glimmer 提供 Day-0 支援。新聞稿另載明 AMD 將投資 10 億美元於 Meta 的股權發行。
- 權重：8/10
- 發布日期：2026-10-27
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-12-amd-meta-helios-partnership.html；日期依 頁面日期列「October 27, 2026 9:20 am EDT」。grep 核對：Helios、Muse Spark Open、Muse Glimmer、MI450、MI500、Verano、$1 billion、gigawatt、Day-0、ROCm、Pensando、Lisa Su。AMD 新聞稿含前瞻性聲明，「朝更廣泛部署」「將部署」為計畫。

### 20. Intel 與 Oracle 規劃擴大合作，OCI X14 預計採用 Diamond Rapids
- 原始標題：Intel and Oracle Plan Expanded Collaboration to Support Enterprise and Agentic AI on Oracle Cloud Infrastructure
- 標題：Intel 與 Oracle 規劃擴大合作，OCI X14 預計採用 Diamond Rapids
- URL：https://www.intel.com/content/www/us/en/newsroom/news/corporate/intel-oracle-collaborate-on-enterprise-and-agentic-ai.html
- 摘要：Intel 與 Oracle 於 Oracle AI World 宣布規劃多年期合作，擴大 Oracle Cloud Infrastructure（OCI）上以 Xeon 為基礎的運算，預期涵蓋現有與未來 Xeon 平臺，包括預計以 Intel 次世代伺服器處理器 Diamond Rapids 為基礎的 OCI X14 方案。雙方打算協調產品路線圖與處理器產能規劃。新聞稿指出，Diamond Rapids 預期提供強化的 Intel AMX（支援 FP8、FP16、BF16）與 APX 指令集擴充，以支援嵌入生成、重排序與小型模型推論。Intel 資料中心事業群主管 Kevork Kechichian 與 Oracle 的 Pradeep Vincent 皆有引言。全文使用「計畫」「預期」措辭，並附前瞻性聲明。
- 權重：8/10
- 發布日期：2026-10-27
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-13-intel-oracle-diamond-rapids-oci.html；日期依 newsroom_date「2026-10-27T07:00:00.000Z」。grep 核對：Diamond Rapids、OCI X14、AMX、FP8、BF16、APX、ORACLE AI WORLD、Kevork Kechichian、Pradeep Vincent、Acceleron、multiyear。Intel 新聞稿全文為計畫與預期，無上市時程。稽核時以瀏覽器 UA 重抓回 403；第二輪起改用 curl 預設 UA 重抓為 HTTP 200，正文與 newsroom_date 與蒐集時副本一致。

### 21. Intel 宣布收購量子軟體公司 Classiq，打造全端量子運算平臺
- 原始標題：Intel to Acquire Classiq to Create a Full-stack Quantum Computing Platform
- 標題：Intel 宣布收購量子軟體公司 Classiq，打造全端量子運算平臺
- URL：https://www.intel.com/content/www/us/en/newsroom/news/corporate/intel-classiq-accelerate-scalable-quantum-computing.html
- 摘要：Intel 宣布已簽署最終協議，收購量子運算軟體供應商 Classiq。Intel 表示，Classiq 的演算法合成平臺與 Intel 的矽自旋量子位元（spin-qubit）製造及既有軟體結合，可讓 Intel 成為全端量子運算方案供應商，並把量子處理器（QPU）加入 CPU、GPU 與 ASIC 的運算產品組合。新聞稿稱 Intel 自 2015 年起投入量子運算，並表示是唯一能以傳統矽半導體製造通用的設備與製程量產量子位元晶片與複雜低溫控制電子的公司。交易須通過主管機關核准與其他慣例條件，預計 2027 上半年完成；完成前兩家公司維持獨立運作，收購後 Intel 表示將持續支援 Classiq 既有的多平臺整合。
- 權重：8/10
- 發布日期：2026-10-26
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-14-intel-classiq-quantum-acquisition.html；日期依 newsroom_date「2026-10-26T07:00:00.000Z」。grep 核對：Classiq、definitive agreement、spin-qubit、QPU、Lip-Bu Tan、Nir Minerbi、full-stack、2015、first half of 2027、cryogenic。「唯一能…」為 Intel 自述；交易尚待核准。稽核時以瀏覽器 UA 重抓回 403；第二輪起改用 curl 預設 UA 重抓為 HTTP 200，正文與 newsroom_date 與蒐集時副本一致。

### 22. Cloudflare Radar：2026 年第三季網際網路中斷回顧
- 原始標題：What took the Internet offline in Q3 2026
- 標題：Cloudflare Radar：2026 年第三季網際網路中斷回顧
- URL：https://blog.cloudflare.com/q3-2026-internet-disruption-summary/
- 摘要：Cloudflare 回顧 Radar 在 2026 年第三季偵測並標註的網際網路中斷，共 49 起：政府下令的斷網 19 起（其中 18 起為伊拉克的考試斷網）、停電 14 起、天然災害 5 起。文章指出停電是主要原因之一，例如古巴 9 月 18 至 20 日歷時三天的停電，以及宏都拉斯 9 月 10 日一處互連設施停電影響至少 11 家主要業者，全國 HTTP 流量下降 63%、約持續三小時。8 月 13 日美國鳳凰城一座資料中心的冷卻系統故障，使 Namecheap 的流量近乎全面下降。天災方面，颱風 Bavi 再度造成關島停電與連線中斷，哥倫比亞 8 月規模 7.4 地震使網路中斷約四天半。文章也提到美國、日本與葡萄牙等網路韌性較高的國家同樣出現中斷。
- 權重：8/10
- 發布日期：2026-10-27
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-06-cloudflare-q3-2026-internet-disruption.html；日期依 datePublished「2026-10-27T13:00:00.000Z」。grep 核對：49 disruptions、19 incidents、18 exam shutdowns in Iraq、14 incidents、Cuba、Honduras、63%、Phoenix、Namecheap、Super Typhoon Bavi、magnitude 7.4、Cloudflare Radar。Radar 季報，涵蓋 7 至 9 月事件。

### 23. Cloudflare 2026 年第三季 DDoS 威脅報告：小型攻擊變多、巨型攻擊變少
- 原始標題：Cloudflare DDoS Threat Report 2026 Q3: More swarms, fewer giants
- 標題：Cloudflare 2026 年第三季 DDoS 威脅報告：小型攻擊變多、巨型攻擊變少
- URL：https://blog.cloudflare.com/ddos-threat-report-2026-q3/
- 摘要：Cloudflare 第 26 期 DDoS 威脅報告涵蓋 2026 年第三季。該季自動攔截 1,820 萬次網路層 DDoS 攻擊與 14.4 兆次 HTTP DDoS 請求，約每小時 8,226 次網路層攻擊。網路層攻擊比 2025 年同季增加 208%，其中 96% 在 10 分鐘內結束、98% 低於 1 Gbps；超過 1 Tbps 的超大流量攻擊由第二季的 805 次降至 251 次，文中推測可能與年初執法行動拆除 Aisuru、KimWolf、JackSkid 與 Mossad 四個物聯網殭屍網路有關，但 Dysphoria 等新變種持續出現。攻擊手法方面，CLDAP 反射攻擊下降 99.5%，DNS 放大攻擊成長 215%，其他 UDP 洪水從 14.06% 升至 31.31%。被攻擊最多的國家由中國回到美國。
- 權重：8/10
- 發布日期：2026-10-29
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-07-cloudflare-ddos-threat-report-2026-q3.html；日期依 datePublished「2026-10-29T12:55:00.000Z」。grep 核對：26th edition、208%、1 Tbps、805、251 attacks、CLDAP、99.5%、215%、18.2 million、14.4 trillion、Aisuru、8,226。主題也可歸資安，由主編依需要調整分類。

### 24. Cloudflare 私有來源服務正式推出（GA）
- 原始標題：Cloudflare services for private origins is now generally available
- 標題：Cloudflare 私有來源服務正式推出（GA）
- URL：https://blog.cloudflare.com/private-origins-public-to-private/
- 摘要：Cloudflare 宣布「私有來源」服務正式推出：把已代理的 A 或 AAAA DNS 紀錄指向私有 IP，Cloudflare 即透過客戶既有的 Cloudflare One 連線抵達來源，來源保持私有、不需開放防火牆入站，WAF、快取、Bot 管理、速率限制、轉換與改寫規則及 Workers 的運作與公開來源相同。此功能 6 月以封閉測試推出，現在開放給測試群組以外的客戶。對 RFC 1918 私有 IPv4、RFC 6598 CGNAT 位址與 RFC 4193 唯一本地 IPv6 位址會自動啟用私有網路路由且無法關閉。API 以 DNS 紀錄的 private_routing 屬性控制。仍有限制：不支援 Argo Smart Routing 與專屬 CDN 出口 IP，來源健康檢查須搭配 Load Balancing。下一步是私有對私有流量，目標 2027 年初開始封閉測試。
- 權重：8/10
- 發布日期：2026-10-30
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-08-cloudflare-private-origins-ga.html；日期依 datePublished「2026-10-30T14:23:43.668Z」。grep 核對：private_routing、RFC 1918、RFC 6598、100.64.0.0/10、fc00::/7、Argo Smart Routing、closed beta、Cloudflare Mesh、2606:4700:cf1:5000::/64、early 2027、Cloudflare One。「開放給測試群組以外」依原頁 Today, we’re opening access beyond that beta group；仍需向帳號團隊啟用 Private Origins 權限。

### 25. 英國擬修法強化海底電纜安全，要求業者管理安全風險並通報事故
- 原始標題：英國擬修法強化海底電纜安全，要求業者管理安全風險並通報事故
- 標題：英國擬修法強化海底電纜安全，要求業者管理安全風險並通報事故
- URL：https://www.ithome.com.tw/news/180038
- 摘要：iThome 報導，英國政府於 10 月 22 日公布白皮書，計畫修法強化海底關鍵基礎設施安全，提高破壞海底電纜及能源管線的刑責，並加強對海底電信基礎設施業者的安全監管。報導指出，英國高達 99% 的國際資料流量仰賴海底電信電纜，現行保護法規可追溯至一百多年前。修法擬擴大刑事處罰範圍，除實體破壞外，也涵蓋透過網路攻擊、遠端電子干擾等方式危害設施安全的行為；依蓄意、魯莽或重大過失，最高刑期分別為 14 年、10 年及 2 年。業者也將被要求評估並降低安全風險、提前做好事故應變與服務復原準備，並向政府及主管機關通報安全事件。此為英國政府提出的修法方案。
- 權重：7/10
- 發布日期：2026-10-30
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/B-09-ithome-uk-subsea-cable-security.html；日期依 class="created"「2026-10-30」。grep 核對：10月22日、白皮書、99%、14年、10年、2年、海底電纜、網路攻擊、遠端電子干擾、通報、事故應變、一百多年前。英國白皮書日 10 月 22 日，iThome 報導日 10 月 30 日；日期以報導日計。

### 26. Google TPU 將進駐甲骨文 OCI，2027 年起與 GPU 並列為 AI 運算選項
- 原始標題：Google TPU將進駐甲骨文OCI，2027年起與GPU並列AI運算選項
- 標題：Google TPU 將進駐甲骨文 OCI，2027 年起與 GPU 並列為 AI 運算選項
- URL：https://www.ithome.com.tw/news/180043
- 摘要：據 iThome 報導，Google 與甲骨文宣布合作，計畫 2027 年起在甲骨文雲端基礎架構（OCI）提供 Google 自行設計的 AI 加速晶片 TPU，OCI 將成為 Google 以外首家提供 TPU 的超大規模雲端業者。甲骨文將在 OCI 資料中心部署 TPU，負責電力、液冷散熱與網路設備，用戶不必把運算移到 Google Cloud，可在同一雲端依訓練、微調與推論需求選擇 GPU 或 TPU。Google 指出，資料已存放在 OCI 的企業可直接用既有資料（例如 Oracle 資料庫中的業務資料）微調模型與推論，減少跨雲傳輸。TPU 以晶片間高速互連與光學交換傳輸資料，硬體或連線異常時可自動調整路徑；甲骨文以 Acceleron 網路技術連接 TPU、資料庫與儲存服務，並以智慧網路卡隔離不同客戶的流量。報導也提到 Google 近期開源 TorchTPU。
- 權重：8/10
- 發布日期：2026-10-28
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl HTTP 200（瀏覽器 UA），存檔 pages/A-18-ithome.com.tw-180043.html；日期依文章 submitted 區塊 class="created"「2026-10-28」。grep 核對：甲骨文、OCI、2027年、Hyperscaler、液冷、Acceleron、智慧網路卡、光學交換、TorchTPU。A 組淘汰候選 I 建議交由他組，主編改收於網路/伺服器等基礎；Google 與甲骨文原始新聞稿未取得，全文歸因 iThome。TorchTPU 為上一期 ref-57，本則為不同事件。

### 27. ECB 執行董事會成員 Cipollone：T+1 結算、代幣化與歐洲金融基礎設施轉型
- 原始標題：Next-day securities settlement, tokenisation and the transformation of Europe's financial infrastructure
- 標題：ECB 執行董事會成員 Cipollone：T+1 結算、代幣化與歐洲金融基礎設施轉型
- URL：https://www.ecb.europa.eu/press/key/date/2026/html/ecb.sp261029~e9b57c3495.en.html
- 摘要：歐洲央行（ECB）執行董事會成員 Piero Cipollone 於 2026 年 10 月 29 日在法蘭克福的 EU T+1 產業委員會活動發表主題演講。演講指出歐洲將於 2027 年 10 月 11 日轉為 T+1 結算，T2S 的夜間結算流程調整預計在 2027 年 6 月進行。談到代幣化時，他說 Eurosystem 自 3 月 30 日起接受在中央證券保管機構以分散式帳本技術（DLT）發行的可交易資產作為擔保品；Pontes 自 9 月 21 日起讓代幣化資產的批發交易以央行貨幣結算，並規劃在 2027 年中大幅延長營運時間、2028 年達到 24/7/365，最快明年提供即時結算終局性。Appia 目標在 2028 年提出藍圖，前一天（10 月 28 日）已發布公開諮詢結果報告。他也強調 T2S 不會很快消失，新舊基礎設施需並存。
- 權重：8/10
- 發布日期：2026-10-29
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-1-ecb-europa-eu-cipollone-tokenisation-t1.html；日期依 article:published_time「2026-10-29」。grep 核對：11 October 2027、T2S、30 March、21 September、Pontes、24/7/365、Appia、2028、public consultation。ECB RSS 列表亦列為 29 Oct 2026。

### 28. FSB 秘書長 Schindler：創新與韌性，管理變動中金融體系的風險
- 原始標題：Innovation and resilience: managing the risks of a changing financial system
- 標題：FSB 秘書長 Schindler：創新與韌性，管理變動中金融體系的風險
- URL：https://www.fsb.org/2026/10/innovation-and-resilience-managing-the-risks-of-a-changing-financial-system/
- 摘要：金融穩定委員會（FSB）秘書長 John Schindler 於 2026 年 10 月 21 日在 RiskLive Asia 2026 發表主題演講（頁面註明為講者以秘書長身分的看法，不必然代表 FSB 或其成員）。內容整理 FSB 近期工作：一是剛發布的《負責任採用 AI 的健全做法》，共十二項，定位為可調整的工具箱而非最低標準，涵蓋 AI 治理、生命週期管理、資安風險與第三方供應商監督；二是全球穩定幣的跨境脆弱性，已向 G20 提交摘要，列出加強監測、支持 2023 年建議的落實、蒐集穩定幣危機處置規劃三個關注面向；三是公開徵詢中的八項監管現代化原則，預計 2027 年定案；四是銀行處置的公共部門資金，同儕檢視指出僅五分之一成員司法管轄區完全符合相關政策。
- 權重：8/10
- 發布日期：2026-10-21
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-4-fsb-org-innovation-resilience-schindler.html；日期依 article:published_time「2026-10-21T01:25:00+00:00」。grep 核對：RiskLive Asia 2026、twelve sound practices、flexible toolkit、2023 high-level recommendations、eight principles、finalised in 2027、one in five。頁面聲明演講內容為講者以秘書長身分的看法，不必然代表 FSB 或其成員。

### 29. ACI Worldwide 與 Circle 合作，示範在既有支付基礎設施整合 USDC 結算
- 原始標題：ACI Worldwide and Circle Collaborate to Bring USDC Settlement to Existing Payments Infrastructure in Latin America
- 標題：ACI Worldwide 與 Circle 合作，示範在既有支付基礎設施整合 USDC 結算
- URL：https://www.circle.com/pressroom/aci-worldwide-and-circle-collaborate-to-bring-usdc-settlement-to-existing-payments-infrastructure-in-latin-america
- 摘要：ACI Worldwide 與 Circle 於 2026 年 10 月 27 日宣布合作，示範金融機構如何把穩定幣結算整合進既有銀行與支付基礎設施。做法是結合 ACI 的雲端原生支付協調平台 ACI Connetic 與 Circle 的 USDC 基礎設施，讓穩定幣結算能與傳統支付軌道在同一平台上協調運作。實作初期聚焦哥倫比亞，ACI 在當地建置了即時支付生態系 Bre-B 的核心基礎設施。新聞稿引述 ACI 主管 Craig Ramsey 的說法，指穩定幣的討論正從可能性走向實務，並稱此合作讓機構能在熟悉的營運環境中評估新的結算模式。新聞稿同時表示，ACI Connetic 支援持續演進的支付網路、數位資產業者與未來結算模式。
- 權重：7/10
- 發布日期：2026-10-27
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-2-circle-com-aci-usdc-settlement.html；日期依 JSON-LD datePublished「2026-10-27」。grep 核對：ACI Connetic、USDC、Colombia、Bre-B、Craig Ramsey、Kash Razzaghi、single platform、Oct. 27, 2026。屬合作與示範，非上線公告。

### 30. 金管會：鼓勵銀行提供定存解約與大額匯款通知指定聯絡人服務
- 原始標題：銀行提供定存解約/大額匯款通知指定聯絡人服務，協助民眾防詐
- 標題：金管會：鼓勵銀行提供定存解約與大額匯款通知指定聯絡人服務
- URL：https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202610200002&dtable=News
- 摘要：金管會 2026 年 10 月 20 日發布新聞稿，表示鼓勵金融機構依與客戶之契約約定，提供定存解約或匯出大額款項時通知指定聯絡人的服務。民眾可預先在金融機構註記信任的親友為聯絡人，發生符合約定條件的交易時，銀行會通知該聯絡人，但聯絡人不代為決定交易，也不代表所有交易都會被通知或自動停止。服務採「自由申請、自主指定」原則。金管會表示，截至 115 年 9 月底已有 24 家銀行開辦，另有 7 家本國銀行及中華郵政規劃於 116 年 6 月底前陸續開辦。金管會強調防詐需要民眾、家庭與金融機構共同合作，從事後追查走向事前預防與即時攔阻。
- 權重：7/10
- 發布日期：2026-10-20
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-3-fsc-gov-tw-fraud-designated-contact.html；日期依頁面日期列「2026-10-20」（dataserno 202610200002 亦一致，頁尾更新日期 2026-10-30 不採用）。grep 核對：指定聯絡人、定存解約、大額匯款、自由申請、自主指定、24家銀行、7家本國銀行、中華郵政、116年6月底。

### 31. 英國政府確認無限期承認 CE 標示醫療器材，並推進可因應 AI 的醫療器材新許可方式
- 原始標題：Government confirms indefinite recognition of CE marked medical devices
- 標題：英國政府確認無限期承認 CE 標示醫療器材，並推進可因應 AI 的醫療器材新許可方式
- URL：https://www.gov.uk/government/news/government-confirms-indefinite-recognition-of-ce-marked-medical-devices
- 摘要：英國政府於 2026 年 10 月 21 日宣布，將長期繼續接受已取得歐盟 CE 標示的醫療器材與體外診斷器材（IVD）進入大不列顛市場。此決定源自 2026 年 2 月 16 日至 4 月 10 日的公開諮詢，共收到逾 1,000 份回應。頁面指出大不列顛登記的醫療器材中逾 90% 帶有 CE 標示；UKCA 標示仍是本地核准途徑，並正透過上市前法規修訂更新要求。政府也表示將持續尋求初級立法的授權，發展未來的醫療器材許可方式，以因應包含軟體與 AI 醫療器材在內的新技術，並呼應英國 AI 醫療照護監管國家委員會的建議。MHRA 將持續以 Yellow Card 等機制監控器材安全。
- 權重：8/10
- 發布日期：2026-10-21
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-5-gov-uk-mhra-ce-mark-indefinite-recognition.html；日期依 JSON-LD datePublished「2026-10-21T09:26:46+01:00」。grep 核對：CE marked、16 February 2026、10 April 2026、1,000 responses、90%、UKCA、pre-market statutory instrument、National Commission into the Regulation of AI in Healthcare、Yellow Card。與上期 MHRA 2030 策略為不同事件（本件為 CE 承認決定）。

### 32. Nature Medicine：具細粒度可解釋性的臨床多模態視覺語言基礎模型 EVLF-FM
- 原始標題：A clinical multimodal vision language foundation model with fine-grain explainability
- 標題：Nature Medicine：具細粒度可解釋性的臨床多模態視覺語言基礎模型 EVLF-FM
- URL：https://www.nature.com/articles/s41591-026-04655-5
- 摘要：Nature Medicine 於 2026 年 10 月 29 日刊出論文，提出醫學用的可解釋視覺語言基礎模型 EVLF-FM。開發與測試涵蓋來自 18 個全球資料集的逾 130 萬筆樣本，跨 10 種影像模態與皮膚科、肝臟科、眼科、病理、胸腔與放射六個臨床專科；外部驗證使用 17 個額外資料集的 13,443 筆獨立樣本。模型支援疾病診斷、視覺問答與像素級視覺定位。內部驗證的疾病診斷平均準確度為 0.895，視覺定位在 0.5 交集比的平均準確度為 0.842，並以 S.C.O.R.E. 框架進行人工評估，推理輸出整體平均 4.25/5。摘要同時指出仍需跨不同醫療場域的額外驗證，且需要前瞻性臨床研究才適合常規部署。
- 權重：8/10
- 發布日期：2026-10-29
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-6-nature-com-evlf-fm-vision-language-foundation-model.html；日期依 JSON-LD datePublished「2026-10-29T00:00:00Z」。grep 核對：EVLF-FM、1.3 million、18 global datasets、13,443、0.895、0.842、S.C.O.R.E.、4.25/5、Prospective clinical studies。

### 33. STAT：FDA 與 CMS 急著避免法規堵塞，因更多州想在臨床場域測試 AI
- 原始標題：FDA, CMS scramble to avoid regulatory logjam as more states look to test AI in clinical settings
- 標題：STAT：FDA 與 CMS 急著避免法規堵塞，因更多州想在臨床場域測試 AI
- URL：https://www.statnews.com/2026/10/30/fda-cms-health-ai-regulation-state-sandboxes-run-into-federal-rules/
- 摘要：STAT 於 2026 年 10 月 30 日刊出 STAT+ 訂閱者專屬報導（頁面僅公開開頭段落）。公開部分指出，希望推動醫療 AI 採用的衛生官員，正在幕後處理州政府與聯邦政府之間逐漸升高的衝突。川普政府尋求減輕健康 AI 開發商的法規負擔，並建立了新的給付方式，但聯邦與各州對執行臨床工作（例如開立處方）的 AI 仍有重疊管轄：各州管理醫療執業，並核發醫師與其他臨床人員的執照，若 AI 在無人監督下執行這類工作，很可能會讓產品落入負責監管醫療器材的 FDA 管轄。標題與副標寫明官員擔心管轄權重疊造成的混亂可能使醫療 AI 的採用停滯。
- 權重：7/10
- 發布日期：2026-10-30
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-18-statnews-fda-cms-state-ai-sandboxes.html；日期依 JSON-LD datePublished「2026-10-30T08:30:00+00:00」。grep 核對：exclusive to STAT+ subscribers、overlapping jurisdiction、writing prescriptions、Mario Aguilar、regulatory burden、licenses to doctors、Food and Drug Administration。付費牆，僅依公開段落撰寫，正文後續內容未讀。

### 34. FDA 加速核准首款質體 DNA 免疫療法 Voceryq，用於成人復發性呼吸道乳突瘤
- 原始標題：FDA Approves First Plasmid DNA-based Immunotherapy for Adults with Recurrent Respiratory Papillomatosis
- 標題：FDA 加速核准首款質體 DNA 免疫療法 Voceryq，用於成人復發性呼吸道乳突瘤
- URL：https://www.fda.gov/news-events/press-announcements/fda-approves-first-plasmid-dna-based-immunotherapy-adults-recurrent-respiratory-papillomatosis
- 摘要：美國 FDA 於 2026 年 10 月 30 日宣布，加速核准 Voceryq 用於治療成人復發性呼吸道乳突瘤（RRP），FDA 稱這是美國首款獲核准的質體 DNA 免疫療法。RRP 是由人類乳突病毒 6 型與 11 型造成的罕見疾病。該療法經肌肉注射，並使用 CELLECTRA 5PSP 裝置以電穿孔方式協助遞送兩種質體，其中一種含 HPV 蛋白遺傳指令，另一種含免疫增強分子 IL-12。核准依據是一項 32 名成人的開放標籤多中心試驗，在至少有三次基線手術的 26 名患者中，有 7 人（27%）在治療後第一年不需手術。常見不良反應包括注射部位反應、頭痛、疲倦、高血壓、噁心與頭暈。製造商須進行核准後試驗驗證臨床效益；獲核准者為 Inovio Pharmaceuticals。
- 權重：8/10
- 發布日期：2026-10-30
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-7-fda-gov-voceryq-plasmid-dna-immunotherapy.html；日期依 article:published_time「Fri, 10/30/2026 - 16:32」及頁面「For Immediate Release: October 30, 2026」。grep 核對：Voceryq、accelerated approval、CELLECTRA 5PSP、electroporation、IL-12、32 adults、Seven (27%)、26 patients、Inovio Pharmaceuticals。fda.gov 此次未遇 401。

### 35. Anthropic 公布以 Claude 加速藥物開發的早期進展，並收購單人公司 Mithril Medicine
- 原始標題：Early progress on accelerating drug development with Claude
- 標題：Anthropic 公布以 Claude 加速藥物開發的早期進展，並收購單人公司 Mithril Medicine
- URL：https://www.anthropic.com/research/early-progress-drug-development
- 摘要：Anthropic 生命科學團隊說明與六家藥物開發機構（BigHat Biosciences、Bristol Myers Squibb、Divergence Labs、Enveda、Generate Biomedicines、The Column Group）的合作，並已展開自有藥物研發。案例包括：Generate 的六位科學家用 Claude Code 提出 CAR-T 基因指令片段的新設計，其中一款縮短約 70%，實驗室測試中免疫細胞產生的受體約多 10 倍；Claude 為 Divergence Labs 在約一個月內大致自主產生約 35,000 個抗體設計；Enveda 以 1,061 頁文件測試，Claude 抓出人工審查發現的全部 11 個問題並另標出 7 個，審查時間減少 89%。Anthropic 也收購單人公司 Mithril Medicine，創辦人以 Claude 協調 11 家外部實驗室，不到 18 個月讓一種肌肉失養症候選療法在小鼠取得有希望的結果，若候選藥物持續有效，最快 2028 年底可準備進入人體試驗。Anthropic 表示這些研究多數仍屬臨床前。
- 權重：8/10
- 發布日期：2026-10-27
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/X-02-anthropic.com-early-progress-drug-development.html；日期依 JSON-LD datePublished「2026-10-27T00:00:00.000Z」，頁面 Published Oct 27, 2026。grep 核對：BigHat Biosciences、Bristol Myers Squibb、Divergence Labs、Enveda、70% shorter、35,000 antibody designs、1,010 variants、1,061 pages、Mithril Medicine、11 external labs、late 2028、preclinical。A 組淘汰候選 J（iThome 180028）與 K 為同一事件，主編改收 Anthropic 一手頁。

### 36. Charger Logistics 與 Aurora 簽備忘錄，預計購買最多 500 輛 Aurora Driver 無人駕駛卡車
- 原始標題：Charger Logistics and Aurora to Begin Scaling Autonomous Fleet to 500 Trucks
- 標題：Charger Logistics 與 Aurora 簽備忘錄，預計購買最多 500 輛 Aurora Driver 無人駕駛卡車
- URL：https://ir.aurora.tech/news-events/press-releases/detail/154/charger-logistics-and-aurora-to-begin-scaling-autonomous-fleet-to-500-trucks
- 摘要：Aurora Innovation 於 2026 年 10 月 26 日宣布與貨運業者 Charger Logistics 簽署備忘錄（MOU），Charger 有意購買最多 500 輛搭載 Aurora Driver 的卡車，預計 2027 與 2028 年交付。新聞稿強調這是非約束性 MOU，建立在雙方 7 月簽的既有合約之上；最終協議簽定後，Charger 打算採用 Aurora 的 Driver as a Service（DaaS）模式，由業者持有實體車輛。Charger 營運範圍橫跨美國與墨西哥，計畫把卡車部署在邊境附近與全國的高流量路線。Aurora 表示 DaaS 協議是其 2030 年擴展至 30,000 輛無人駕駛卡車計畫的關鍵部分，並稱還有其他客戶正洽談 DaaS 合約。
- 權重：8/10
- 發布日期：2026-10-26
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-10-ir-aurora-tech-charger-500-trucks.html；日期依頁面日期列「October 26, 2026 9:00am EDT」。grep 核對：memorandum of understanding、up to 500、2027 and 2028、non-binding、Driver as a Service、30,000 driverless trucks、Charger Logistics、Andy Khera。

### 37. FAA 與運輸部：佛羅里達州完成 eIPP 首批示範飛行，成為第七個啟動地點
- 原始標題：Trump's Transportation Secretary Sean P. Duffy Marks Major Milestone in Administration's Successful eVTOL Pilot Program
- 標題：FAA 與運輸部：佛羅里達州完成 eIPP 首批示範飛行，成為第七個啟動地點
- URL：https://www.faa.gov/newsroom/trumps-transportation-secretary-sean-p-duffy-marks-major-milestone-administrations
- 摘要：美國運輸部於 2026 年 10 月 30 日宣布，佛羅里達州完成 eVTOL 整合試辦計畫（eIPP）的首批示範飛行，成為依該計畫啟動的第七個地點。佛州運輸部（FDOT）與 Joby、BETA Technologies 合作，重現 1914 年世界首次定期客運航班的路線，測試坦帕灣上空的貨運與航線；BETA 的 Alia CX300 電動傳統起降機與 Joby 的 S4 電動垂直起降機自 Albert Whitted 機場飛往坦帕。新聞稿說 11 月 FDOT 與 Electra 將在佛州中部多處進行飛行測試，FAA 可能運用試辦資料制定新規。頁面指出 eIPP 共八個入選專案，橫跨 28 州。
- 權重：8/10
- 發布日期：2026-10-30
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-12-faa-gov-eipp-florida-first-flights.html；日期依頁面日期列「Friday, October 30, 2026」。grep 核對：eIPP、seventh location、Albert Whitted Airport、Alia CX300、Joby、S4、Electra、28 states、1914。與上期 FAA 垂直起降場草案標準與 eVTOL 市場調查證書為不同事件；本件為佛羅里達州示範飛行的新進展。

### 38. Toyota 與 Waymo 宣布自駕合作進入下一階段，2027 年在日本測試驗證 bZ4X 車隊
- 原始標題：Toyota and Waymo Advance Autonomous Driving Collaboration for Safer Streets and Freedom of Movement for All
- 標題：Toyota 與 Waymo 宣布自駕合作進入下一階段，2027 年在日本測試驗證 bZ4X 車隊
- URL：https://waymo.com/blog/2026/10/toyota-bz4x-partnership
- 摘要：Toyota 與 Waymo 於 2026 年 10 月 30 日宣布雙方自駕合作的下一階段，延續 2025 年 4 月公布的初步協議。兩家公司將於 2027 年在日本開始測試與驗證自駕版 Toyota bZ4X 車隊，並規劃在之後幾年部署到英國及其他 Waymo 服務市場。Toyota 將在愛知縣豊田市的高岡工廠一站式完成基礎車輛組裝與 Waymo 自駕硬體整合。頁面稱此為日本首個使用國產量產車輛的全自動叫車服務擴展的重要里程碑。雙方也將繼續探討個人自有 Toyota 車輛的自駕技術，並與 Woven by Toyota 研究提升其他用路人安全的方案。Waymo 共同執行長 Dmitri Dolgov 在新聞稿中說，Waymo 在營運地區對嚴重傷害事故的表現可較人類駕駛安全達 20 倍。
- 權重：8/10
- 發布日期：2026-10-30
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-20-waymo-toyota-bz4x-partnership.html；日期依 JSON-LD datePublished「2026-10-30」。grep 核對：bZ4X、April 2025、Japan in 2027、United Kingdom、Takaoka plant、Woven by Toyota、Dmitri Dolgov、20x safer。與上期 Waymo 馬德里、多倫多、債務融資為不同事件。

### 39. Maersk 在新加坡完成全球最大規模乙醇加註，約 5,000 公噸
- 原始標題：Maersk completes the world's largest ethanol bunkering in Singapore
- 標題：Maersk 在新加坡完成全球最大規模乙醇加註，約 5,000 公噸
- URL：https://www.maersk.com/news/articles/2026/10/19/maersk-completes-worlds-largest-ethanol-bunkering-singapore
- 摘要：A.P. Moller - Maersk 於 2026 年 10 月 19 日宣布，在新加坡完成雙燃料船 Maersk Halifax 的乙醇加註，標題稱為全球最大規模的乙醇加註。Maersk Halifax 是該公司首艘改裝的雙燃料船，新聞稿稱這是 Maersk 船隊首度在改裝船上加註乙醇。作業與新加坡海事及港務局（MPA）等夥伴合作，加註約 5,000 公噸通過 ISCC 認證的生質乙醇，並在加註同時進行貨物作業。Maersk 表示此次作業提供了基礎設施、採購、供應鏈準備度與船舶營運的實務經驗；能源市場主管 Emma Mazhari 表示公司延續多燃料策略，今年稍早也已在 Laura Maersk、Antonia Maersk 與 Tangier Maersk 進行乙醇試驗。
- 權重：8/10
- 發布日期：2026-10-19
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-13-maersk-com-ethanol-bunkering-singapore.html；日期依 JSON-LD datePublished「2026-10-19T04:00:00.0000000Z」。grep 核對：Maersk Halifax、ethanol、5,000 metric tonnes、ISCC-certified、Maritime and Port Authority of Singapore、dual-fuel、Laura Maersk、Antonia Maersk、Tangier Maersk。

### 40. 台北市 2 處多事故路口 11 月起測試多功能科技執法，2027 年 2 月正式取締
- 原始標題：北市2路口多交通事故 11月啟動多功能科技執法測試
- 標題：台北市 2 處多事故路口 11 月起測試多功能科技執法，2027 年 2 月正式取締
- URL：https://www.cna.com.tw/news/asoc/202610300211.aspx
- 摘要：中央社報導，台北市警察局交通警察大隊 2026 年 10 月 30 日表示，因交通事故多，擇定中山北路與民權西路口、士商路與承德路口兩處，自 11 月 1 日起測試路口多功能科技執法設備，宣導期 3 個月，明年 2 月 1 日起正式啟用取締。中山北路與民權西路口的取締項目含闖紅燈、不停讓行人、不依標誌標線號誌行駛、不依規定轉彎與行駛公車專用道；士商路與承德路口含闖紅燈、不停讓行人、機車未依規定車道行駛與違規停車等。測試宣導期間將以掛號寄送免裁罰的宣導通知單，告知設備正式啟用時間。警方說明設置目的是提升執法強度以減少違規、促進用路安全與順暢。
- 權重：7/10
- 發布日期：2026-10-30
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/C-14-cna-com-tw-taipei-intersection-enforcement.html；日期依 JSON-LD datePublished「2026-10-30T17:01:00+08:00」。grep 核對：中山北路與民權西路口、士商路與承德路口、11月1日、宣導期、明年2月1日、掛號、闖紅燈、不停讓行人、免裁罰。報導未說明設備採用何種辨識技術。

### 41. セレンディクス以 3D 列印機建成大分縣水力發電所的詰所（值班站房）
- 原始標題：3Dプリンタで水力発電所の詰所を建設、セレンディクスが屋根まで出力：デジタルファブリケーション - BUILT
- 標題：セレンディクス以 3D 列印機建成大分縣水力發電所的詰所（值班站房）
- URL：https://built.itmedia.co.jp/bt/articles/2610/28/news047.html
- 摘要：ITmedia BUILT 報導，セレンディクス（Serendix）於 2026 年 10 月 26 日發表，已在大分縣內的水力發電所設施，用建設用 3D 列印機建成一棟詰所（供設備管理作業員使用的站房）。該公司稱，發電所設施的建築採用建設用 3D 列印建造物，屬世界首例。建物為平房鋼筋混凝土造，延床面積約 20 平方公尺，設有休息空間、倉庫與廁所；3D 列印部材的製作、運輸與施工（內裝除外）由該公司負責。包含屋頂在內，整棟分成十幾個部件列印，再於現場組裝，部件在熊本縣水俣市的合作工廠輸出。CTO 飯田國大把建設用 3D 列印機定位為「使建設現場自動化的機器人平台」；該公司今後將把 B2B 事業擴大到鐵道、橋梁與災害應對等社會基礎設施領域。
- 權重：8/10
- 發布日期：2026-10-28
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-02-built.itmedia.co.jp-serendix-3dprinter-hydro.html；日期依 頁面日期列「2026年10月28日 09時00分 公開」。grep 核對：セレンディクス、大分県、詰所、世界初、水俣市、十数個、飯田國大、2026年10月26日、約20平方メートル、B2B。ITmedia BUILT 為 Shift_JIS，以 cp932 解碼；企業原始發表日為 2026-10-26（頁內「2026年10月26日…発表」），報導日 2026-10-28，兩者皆在窗內。JSON-LD datePublished 帶 Z 但與頁面日期列一致，取頁面日期列。

### 42. Bedrock Robotics 完成 6 億美元 C 輪募資，將自主挖土機技術擴及混合車隊
- 原始標題：Bedrock Robotics digs up $600M in new funding
- 標題：Bedrock Robotics 完成 6 億美元 C 輪募資，將自主挖土機技術擴及混合車隊
- URL：https://www.constructiondive.com/news/bedrock-robotics-digs-up-new-funding/873065/
- 摘要：Construction Dive 報導，把重型機具改成自主機具的 Bedrock Robotics 宣布完成 6 億美元 C 輪募資，由 CapitalG 與 Emergence Capital 共同領投，累計募資接近 10 億美元，整體公司募後估值 41 億美元。報導指出，這顯示實體 AI（physical AI）正進入營建領域；今年 8 月瑞士新創 Gravis Robotics 完成 2 億美元 A 輪，去年 FieldAI 募得 4.05 億美元。依公司公告，公司目標是以這筆資金從挖土機擴展到混合重型機具車隊；公司並稱 2025 年以來客戶量成長超過一倍，客戶包含 Sundt Construction 與 Zachry Construction，並強調機器已在進行中的工地執行付費工作。文中並提到 Icon 在 10 月 13 日宣布完成 2 億美元 D 輪募資，該公司以機器人 3D 列印大型結構。
- 權重：8/10
- 發布日期：2026-10-28
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-06-constructiondive.com-bedrock-robotics-600m.html；日期依 JSON-LD datePublished「2026-10-28T13:40:00」，頁面日期列「Published Oct. 28, 2026」。grep 核對：Bedrock Robotics、$600 million、Series C、CapitalG、Emergence Capital、$4.1 billion、Sundt Construction、Zachry Construction、Gravis Robotics、FieldAI、Icon。文中「Monday」為公司公告日（約 2026-10-26），報導日 10-28；TechCrunch 10-26 同事件另有報導，未採用。

### 43. MIT 以摺紙式模組建構法做出建築尺度的輕量承重結構
- 原始標題：Origami-based construction method yields lightweight, load-bearing structures on architectural scales
- 標題：MIT 以摺紙式模組建構法做出建築尺度的輕量承重結構
- URL：https://news.mit.edu/2026/origami-based-construction-method-yields-lightweight-load-bearing-structures-architecture-1027
- 摘要：MIT News 報導，MIT 研究人員發展出以摺紙為基礎的模組化建構法，可由平面板材（如鋁板）摺成單元，再連成不需內部支柱的承重殼層結構，組裝只需螺絲起子等手工具。團隊以自動化求解器為使用者指定的結構設計出可製造的單元，設計檔可交給 CNC 銑床從平板切出構件。模擬顯示，結構剛性約為其他部分摺紙技術的 3.5 倍，並依文中說法僅需約三分之二的材料。研究團隊另在波士頓公共圖書館掛設一件 23 英尺鋁製摺疊雕塑；據第一作者 Parra Rubio 說，雕塑由沒有專業營建經驗的團隊在數日內搭成。MIT News 指此法可能特別適合可平板運送、快速架設的災後避難所，也可用於飛機零件或建築立面等；論文刊於《International Journal of Solids and Structures》，下一步希望測試更大的建築結構。
- 權重：8/10
- 發布日期：2026-10-27
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-07-news.mit.edu-origami-construction.html；日期依 頁面日期列「Publication Date: October 27, 2026」。grep 核對：Alfonso Parra Rubio、Neil Gershenfeld、Center for Bits and Atoms、International Journal of Solids and Structures、Boston Public Library、Tomohiro Tachi、Ron Resch、3.5 times stiffer、two-thirds as much material、23-foot、CNC milling machine。頁面日期列為 Publication Date，未見 JSON-LD datePublished 值（class 名稱含 publication-date）；研究方法偏建築結構，也可能被他組視為其他領域。

### 44. 竹中工務店開始提供耐火集成材「燃エンウッド」的民間建築工程技術授權
- 原始標題：耐火集成材「燃エンウッド」の民間建築工事向けライセンス提供を開始、竹中工務店：木造／木質化 - BUILT
- 標題：竹中工務店開始提供耐火集成材「燃エンウッド」的民間建築工程技術授權
- URL：https://built.itmedia.co.jp/bt/articles/2610/30/news067.html
- 摘要：ITmedia BUILT 報導，竹中工務店於 2026 年 10 月 22 日宣布，自家專利的耐火集成材「燃エンウッド」之 1 小時與 2 小時耐火規格，開始提供民間建築工程用的技術授權。授權對象是由有木造耐火建築設計實績的設計事務所設計、並由竹中工務店以外的施工公司施工的建物，公共與民間建築皆可使用。過去僅對公共建築工程授權製造與販售，1 小時規格於 2017 至 2019 年、2 小時規格於 2024 年，與齋藤木材工業、藤壽產業、銘建工業、山佐木材 4 家集成材廠商簽約。公共建築工程採用這兩種規格時，可適用於 14 層樓的木造建築，或最上層起 14 層為木造的建物。此次授權包含專利技術、大臣認定與商標使用。燃エンウッド由荷重支持部、燃止層與燃代層 3 層構成。
- 權重：7/10
- 發布日期：2026-10-30
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-05-built.itmedia.co.jp-takenaka-moenwood.html；日期依 頁面日期列「2026年10月30日 13時00分 公開」。grep 核對：竹中工務店、燃エンウッド、2026年10月22日、1時間／2時間耐火、14階建て、齋藤木材工業、銘建工業、大臣認定、燃え代層。ITmedia BUILT 以 cp932 解碼；企業原始發表日 2026-10-22，報導日 2026-10-30，皆在窗內。偏建材而非資訊技術，權重較低。

### 45. Garth Brooks 因機器人搶票氾濫，暫停堪薩斯城加場演出的售票
- 原始標題：Garth Brooks Unexpectedly Pulls Ticket Sales From Kansas City Due to Rampant Bots
- 標題：Garth Brooks 因機器人搶票氾濫，暫停堪薩斯城加場演出的售票
- URL：https://www.digitalmusicnews.com/2026/10/27/garth-brooks-kansas-city-tickets-bots/
- 摘要：Digital Music News 報導，Garth Brooks 上週末中止第三場堪薩斯城演唱會（11 月 7 日，T-Mobile Center）的售票，並親自致歉，他將原因歸咎於機器人（bot）活動過度，稱情況在這次巡演中「逐步惡化」。這場加場在 10 月 21 日於他的個人網站宣布，票券經由 AXS 於中部時間上午 10 點開賣，購票時段很短，約 10:35 出現停售通知，10:49 出現 Brooks 本人的訊息。報導指出，上個月他也因同樣原因在 30 分鐘後停售鹽湖城 Delta Center 10 月 11 日場次，該場票券由 SeatGeek 發售；他向鹽湖城購票者表示演出照常、票券有效，報導推測堪薩斯城也會比照辦理。巡演之後前往西雅圖 Climate Pledge Arena，11 月 12 日至 15 日列有 4 場，其中週四場是 10 月 23 日加開，當時 Brooks 表示有超過 3 萬名真人在排隊。
- 權重：7/10
- 發布日期：2026-10-27
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-08-digitalmusicnews.com-garth-brooks-bots.html；日期依 JSON-LD datePublished「2026-10-27T10:30:15+00:00」（UTC）。grep 核對：Garth Brooks、Kansas City、November 7、T-Mobile Center、AXS、October 21、Delta Center、SeatGeek、Climate Pledge Arena、over 30,000 real people、progressively getting worse。取 UTC 日期 10-27；dateModified 為 10-28，不採用。與上期 Raye 皇家艾伯特音樂廳為不同事件。

### 46. 巴西政府下令 StubHub 等 5 個轉售平台在 BTS 演唱會前暫停營運
- 原始標題：Brazilian Government Orders StubHub and Four Other Resale Sites to Suspend Operations Ahead of BTS Shows
- 標題：巴西政府下令 StubHub 等 5 個轉售平台在 BTS 演唱會前暫停營運
- URL：https://www.digitalmusicnews.com/2026/10/28/brazilian-government-orders-stubhub-suspend-operations-bts-shows/
- 摘要：Digital Music News 報導，巴西聯邦消費者保護機構 Senacon 命令 StubHub、TicketSwap、Viagogo、BuyTicket 與 FunBuyNet 5 個售票轉售平台，在 BTS 3 場聖保羅演唱會前停止促成轉售。BTS 的 ARIRANG 世界巡演將於 10 月 28、30、31 日在 Estádio do MorumBIS 演出，預期觀眾逾 20 萬人。命令指稱這 5 家公司違反透明度、總價揭露與申訴及取消管道的要求；Senacon 給這些網站 72 小時停止巴西境內轉售，違反時每日罰款 10 萬巴西雷亞爾（約 18,621 美元）。報導並指出，這是繼 8 月 31 日簽署的巴西「Taylor Swift 法」之後的執法，該法要求揭露原價與附加費用，並規範虛擬排隊、取消與轉讓權，且要求轉售公司讓政府存取資料；文中以美國的 TICKET Act 與 GHOST Act 對照，指出美國仍依賴各州法律拼湊。
- 權重：7/10
- 發布日期：2026-10-28
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-09-digitalmusicnews.com-brazil-stubhub-bts.html；日期依 JSON-LD datePublished「2026-10-28T20:26:18+00:00」（UTC）。grep 核對：Senacon、StubHub、TicketSwap、Viagogo、BuyTicket、FunBuyNet、72 hours、BRL 100,000、Estádio do MorumBIS、Taylor Swift law、August 31st、TICKET Act。取 UTC 日期 10-28；dateModified 為 10-29，不採用。與上期華府 RESALE Act 訴訟為不同事件、不同國家。

### 47. 《David Bowie: Stage》以 35mm 影像、透明 LED 與 7.1 環繞聲重現 1978 年演出，2027 年 2 月柏林首演
- 原始標題：Legendary David Bowie 1978 Concert Presented for the First Time in Immersive Global Experience
- 標題：《David Bowie: Stage》以 35mm 影像、透明 LED 與 7.1 環繞聲重現 1978 年演出，2027 年 2 月柏林首演
- URL：https://www.digitalmusicnews.com/2026/10/27/david-bowie-concert-immersive-experience/
- 摘要：Digital Music News 報導，前 AEG Live 總裁 Rob Hallet 的 Wonderworld 與 David Bowie 遺產管理方、導演 Brett Morgen 合作，將 Bowie 1978 年 Isolar II 巡演帶進大型室內場館，作品名為《David Bowie: Stage》，與柏林影展合作，於 2027 年 2 月 14 日在柏林 Uber Arena 全球首演，票券 10 月 28 日上午 9 點開賣。內容取自未曾公開的 35mm 原始底片，以多螢幕呈現，並整合 Patrick Woodroffe 設計的燈光與 Paul Massey 的沉浸式混音。音響採 Clair Global 系統與進階 DSP 演算法，搭配吊掛陣列，為每個座位提供 7.1 環繞聲；視覺採用 Unilumin/Roe 全幅透明 LED 螢幕（70×40），營造 Bowie 與樂團身在舞台上的錯覺。首演後將展開全球巡演，場館容量從 5,000 席起跳。
- 權重：7/10
- 發布日期：2026-10-27
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-13-digitalmusicnews.com-bowie-immersive.html；日期依 JSON-LD datePublished「2026-10-27T10:00:12+00:00」（UTC）。grep 核對：David Bowie: Stage、Rob Hallet、Brett Morgen、Uber Arena Berlin、February 14, 2027、Patrick Woodroffe、Paul Massey、7.1 surround sound、Unilumin/Roe、70×40、Isolar II、35mm。內容多為製作方說法（Hallet 等人引述），摘要僅陳述原頁敘述；「全球首演」為原頁 world premiere。

### 48. 北美館「坂本龍一｜觀音．聽時」開展，以裝置作品將電磁波、降雨資料轉為視聽
- 原始標題：多元感官開啟「聲音」想像　坂本龍一作品展登台
- 標題：北美館「坂本龍一｜觀音．聽時」開展，以裝置作品將電磁波、降雨資料轉為視聽
- URL：https://www.cna.com.tw/news/acul/202610300296.aspx
- 摘要：中央社報導，「坂本龍一｜觀音．聽時」大型回顧展 10 月 31 日起在台北市立美術館展出至 2027 年 3 月 14 日，30 日舉行媒體預展。策展人難波祐子表示，展出 7 組橫跨 20 年以上的裝置作品，這是首次在台灣呈現。真鍋大度與坂本龍一合作的「感測流 2026——不可見、不可聞（台北版）」，透過北美館外的天線，由帶狀 LED 顯示器把城市中無法直接察覺的電磁波轉為可聽可看的感知場域；高谷史郎與坂本龍一的「水的樣態 1」擷取包含台北氣象衛星的降雨量資訊；「LIFE——流動、無形、無聲……」以歌劇 LIFE 為基礎，透過演算法生成不斷變化的視聽景象。互動區「聲音盒」則以廢棄鋼琴為基礎，讓民眾創造聲響。
- 權重：8/10
- 發布日期：2026-10-30
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-20-cna.com.tw-sakamoto-exhibition.html；日期依 JSON-LD datePublished「2026-10-30T19:36:00+08:00」。grep 核對：坂本龍一、觀音．聽時、7組、真鍋大度、感測流2026、高谷史郎、演算法生成、聲音盒、2027年3月14日、電磁波、難波祐子。展覽屬科技藝術展演而非現場演出，歸入「沉浸式與科技藝術展演」方向；台灣題。

### 49. 馬里蘭州 Prince George's 郡議會 8 比 0 通過約 2 億美元融資案，迎接 National Harbor 的 Sphere 場館
- 原始標題：Prince George's County Commits $200 Million to Bring the Next Sphere to the DC Area
- 標題：馬里蘭州 Prince George's 郡議會 8 比 0 通過約 2 億美元融資案，迎接 National Harbor 的 Sphere 場館
- URL：https://www.digitalmusicnews.com/2026/10/28/sphere-dc-area-final-approval/
- 摘要：Digital Music News 報導，馬里蘭州 Prince George's 郡議會於週二以 8 比 0 通過最終表決，承諾提供約 2 億美元融資，將 Sphere 場館引進 National Harbor。議會授權發行最多 2.15 億美元的特別義務債券，協助興建這座 6,000 席場館及其複合設施，債券由 Sphere Entertainment 逐步償還。條件包含郡政府興建 4,000 萬美元停車場、提供 1.3 億美元債券融資，州政府另提供逾 1,300 萬美元。郡長 Aisha Braveboy 稱此案對郡帶來 13 億美元、對馬里蘭州帶來 15 億美元的經濟效益。專案總成本約 14 億美元，動土典禮將於近期排定，目標 2030 年初開幕。報導並指出，勞資和平協議不如原先期待，且不涵蓋營建工人。
- 權重：7/10
- 發布日期：2026-10-29
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-12-digitalmusicnews.com-sphere-dc.html；日期依 JSON-LD datePublished「2026-10-29T04:20:21+00:00」（UTC）。grep 核對：Prince George、$200 million、8-0、$215 million、6,000-seat、National Harbor、Aisha Braveboy、$40 million parking garage、$1.4 billion、early 2030、labor peace。取 UTC 日期 10-29（URL 日期為 10-28）；內容偏財政與場館融資，技術面較少，權重 7。

### 50. 貓王音樂作品所有者控告 Anthropic，指稱以 274 首歌曲訓練 AI 模型
- 原始標題：Anthropic涉擅用貓王274首歌曲訓練AI模型　挨告侵權
- 標題：貓王音樂作品所有者控告 Anthropic，指稱以 274 首歌曲訓練 AI 模型
- URL：https://www.cna.com.tw/news/ait/202610260141.aspx
- 摘要：中央社綜合外電報導，引述英國《衛報》，貓王音樂作品與肖像權的授權機構 Authentic Brands Group 向 Anthropic 提告，指控其未經許可使用貓王 274 首歌曲訓練 AI 模型。訴訟於 23 日提出，由《告示牌》率先披露。報導稱此案是藝人遺產管理機構直接對 AI 開發商發起的首批重大法律挑戰之一，結果可能為 AI 公司如何使用既有音樂作品樹立先例。訴狀指稱 Claude 對網路上幾乎每首歌都生成侵權內容，首席律師 Richard Busch 並在訴狀中寫道，被告把整個商業模式建立在大規模著作權侵權上；訴狀並稱 Anthropic 設置護欄後仍知情且持續故意侵權。原告尋求每首歌 15 萬美元，總額約 4100 萬美元。文末提及，Spotify 上週宣布過去一年從推薦內容移除約 5000 萬首被視為 AI 粗製濫造的歌曲。
- 權重：8/10
- 發布日期：2026-10-26
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-18-cna.com.tw-elvis-anthropic.html；日期依 JSON-LD datePublished「2026-10-26T15:28:00+08:00」。grep 核對：貓王、274首、Authentic Brands Group、衛報、告示牌、15萬美元、4100萬美元、Claude、護欄、Richard Busch、5000萬首。中央社為綜合外電，摘要已標出引述對象；Digital Music News 10-25 同事件另有較細報導（訴狀含 $150,000 每首、約 $41.1 million），未混入摘要。

### 51. 文策院 TCCF 創意內容大會迎 251 名國際買家，首度與金馬獎合作並預告 Wētā FX 發布會
- 原始標題：文策院TCCF大會迎海外買家　首度攜手金馬獎推台灣新秀演員
- 標題：文策院 TCCF 創意內容大會迎 251 名國際買家，首度與金馬獎合作並預告 Wētā FX 發布會
- URL：https://www.cna.com.tw/news/acul/202610300266.aspx
- 摘要：中央社報導，文化內容策進院主辦的 2026 TCCF 創意內容大會將於 11 月 6 日至 9 日在南港展覽館二館 7 樓登場。院長王敏惠表示，今年新增與金馬獎合作的台灣新秀演員推介會，以及特映會。MARKET 市場展迎接 251 名國際買家、來自 28 個國家與地區，以韓國為大宗；PITCHING 提案大會入選企劃中由台灣主導或參與的跨國合製占比突破 6 成，並首創 4 個專場、每場設超過 3 萬美元大獎。國際論壇將探討短影音、生成式 AI 重塑產製流程等趨勢。董事長王時思透露，大會期間的 4 場產業發布會之一，是文策院與特效公司 Wētā FX 的發布會，他並稱在大眾對生成式 AI 應用於文化內容仍有疑慮時，特效與後製應是適合切入的主題。
- 權重：7/10
- 發布日期：2026-10-30
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-19-cna.com.tw-tccf-golden-horse.html；日期依 JSON-LD datePublished「2026-10-30T18:25:00+08:00」。grep 核對：TCCF、Wētā FX、251名國際買家、28國家與地區、金馬獎、3萬美元、6成、南港展覽館二館7樓、王時思、王敏惠、生成式AI。活動預告（大會 11 月 6 至 9 日舉行），發布日取新聞稿日期而非活動日；上期 TTXC 與文策院泰越市場為不同事件。

### 52. Suno 在 UMG 訴訟中反擊 Apple 的傳票異議，要求取得 Apple Music AI 授權條款資訊
- 原始標題：Suno Fires Back Against Apple’s Subpoena Opposition, Doubling Down on Its Push for Information About ‘Current License Negotiations,’ ‘Anti-AI Deal Terms,’ and More
- 標題：Suno 在 UMG 訴訟中反擊 Apple 的傳票異議，要求取得 Apple Music AI 授權條款資訊
- URL：https://www.digitalmusicnews.com/2026/10/28/suno-apple-subpoena-dispute/
- 摘要：Digital Music News 報導，在 UMG 對 Suno 的訴訟中，Suno 以 24 頁的反對書狀回應 Apple 的撤銷傳票聲請，主張其所求資訊（Apple Music 與主要唱片公司的授權談判、「反 AI 條款」等）對其合理使用與著作權濫用抗辯至關重要。Apple 則稱這些議題無關、過於寬泛且不成比例。依雙方說法，2026 年大部分時間都在來回協商證人與文件提供，目前似乎卡在 4 項修改後的證詞議題，包括 Apple Music 與環球、索尼目前的授權談判與其中的 AI 倡議、沒有主要唱片公司曲庫時的商業可行性、串流詐騙情形，以及與原告就此案的往來溝通。合理使用第四要素涉及市場影響，Suno 因此主張 Apple Music 的 AI 合約條款（包括保證最低版稅與把 AI 內容排除於版稅池的條款）與本案相關。報導指出，另有幾份尚未被異議的第三方傳票，可能引發更多爭議。
- 權重：7/10
- 發布日期：2026-10-28
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-24-digitalmusicnews.com-suno-apple-subpoena.html；日期依 JSON-LD datePublished「2026-10-28T23:46:44+00:00」（UTC）。grep 核對：Suno、Apple、motion to quash、24-page、four modified deposition topics、Apple Music、fair use、copyright misuse、guaranteed minimum royalties、streaming fraud、cudgel。取 UTC 日期 10-28；屬訴訟程序報導，Reservoir 訴訟為上期已收的不同事件。

### 53. 據報 Spotify 準備在 2027 年初推出 AI 翻唱與混音工具，訂閱戶可能每月多付 4 至 5 美元
- 原始標題：Spotify Reportedly Prepares to Launch Its AI Cover and Remix Tool in Early 2027, Charging Subscribers Up to $5 More Per Month
- 標題：據報 Spotify 準備在 2027 年初推出 AI 翻唱與混音工具，訂閱戶可能每月多付 4 至 5 美元
- URL：https://www.digitalmusicnews.com/2026/10/30/spotify-ai-cover-remix-tool-launch/
- 摘要：Digital Music News 報導，Spotify 據報準備於明年初推出 AI 翻唱與混音工具，美國定價可能為每月 5 美元；此時程來自《金融時報》引述匿名消息人士的報導，Digital Music News 提醒應保留看待。報導指出，環球音樂、Believe/TuneCore、Kobalt 與 Merlin 已簽訂相關授權，索尼、華納與 BMG 不在名單上，但 Spotify 高層先前說不需要「完整曲庫」就能起步。工具可能搭配 2 月第 69 屆葛萊美獎正式亮相，Premium 訂閱戶可能每月多付 4 至 5 美元；參與藝人等細節目前很少。報導並提到 Spotify 將面臨生成式 AI 競爭，包括 Suno 與華納的合作、三大唱片公司與 Klay Vision 的平台、Udio 重啟，以及環球與 ElevenLabs 的合作。
- 權重：7/10
- 發布日期：2026-10-30
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-14-digitalmusicnews.com-spotify-ai-cover-q1-2027.html；日期依 JSON-LD datePublished「2026-10-30T20:30:58+00:00」（UTC）。grep 核對：Financial Times、early 2027、$5、Universal Music、Believe/TuneCore、Kobalt、Merlin、full catalog、69th Grammy Awards、Klay Vision、ElevenLabs。上期已收 Spotify AI 混音與 Believe 授權（10-20）；本期差異為據報的推出時程與價格，屬匿名消息來源報導，非官方宣布，故權重 7。

### 54. IBM 以 l-coupler 連接兩顆 Nighthawk 量子處理器，量子態傳輸保真度平均 99%
- 原始標題：Modular quantum computing takes shape with l-couplers | IBM Quantum Computing Blog
- 標題：IBM 以 l-coupler 連接兩顆 Nighthawk 量子處理器，量子態傳輸保真度平均 99%
- URL：https://www.ibm.com/quantum/blog/connecting-quantum-processors-with-l-couplers
- 摘要：IBM Quantum 部落格發表，IBM 研究人員用 4 條各 80 公分的 l-coupler 在稀釋冰箱內連接兩顆 IBM Quantum Nighthawk R1 處理器，量子態傳輸保真度最高 99.3%、平均 99%。l-coupler 模式的內部品質因子為 940,000；透過跨模組傳輸量子態建構的遠端 CZ 閘，4 條連結平均雙量子位元閘保真度為 94.75%，可產生兩模組共享的糾纏態，並展示同時使用兩條 l-coupler 產生獨立糾纏態。IBM 表示，實驗只引出部分量子位元以供開發，晶片本身是完整的 Nighthawk；據其所知，這是首次以多條量子通道連接超導量子處理器並達到平均 99% 的傳輸保真度。IBM 稱這條路可擴展到容錯的 IBM Quantum Starling，未來將改善良率、重現性與錯誤率。
- 權重：9/10
- 發布日期：2026-10-27
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-30-ibm.com-connecting-quantum-processors-l-couplers.html；日期依 JSON-LD datePublished「2026-10-27T12:00:00.000Z」，頁面日期「27 Oct 2026」。grep 核對：l-coupler、Nighthawk R1、99.3%、940,000、94.75%、80-centimeter、four l-couplers、Starling、Ryan Mandelbaum、Neereja Sundaresan、dilution。Science News 同日報導（science.org 對 curl 回 403，未用）；Network World 與 Quantum Computing Report 亦有報導，未混入摘要。與上期 Quantinuum 為不同事件。

### 55. NASA 發出徵求資訊書，探詢哈伯太空望遠鏡的商業在軌維護能力
- 原始標題：NASA Explores Potential Commercial Servicing for Hubble Telescope
- 標題：NASA 發出徵求資訊書，探詢哈伯太空望遠鏡的商業在軌維護能力
- URL：https://science.nasa.gov/missions/hubble/nasa-explores-potential-commercial-servicing-for-hubble-telescope/
- 摘要：NASA 官方發布，NASA 於 10 月 29 日發出徵求資訊書（Request for Information），了解產業界為哈伯太空望遠鏡提供在軌維護的能力。徵詢項目包括：以任務把哈伯推升到較高軌道以延長科學壽命、維護哈伯以強化其能力，或在任務結束時執行安全受控的再入大氣層或軌道處置。局長 Jared Isaacman 表示，若有創新且符合成本效益的方式可延長在軌資產壽命，NASA 有責任為美國納稅人與科學界探索。文中說明，哈伯沒有推進系統，高度因大氣阻力緩慢下降，分析預測哈伯可能在 2033 至 2034 年間再入大氣層，因此 NASA 預期任務需在 2032 年前執行。資訊書回覆截止時間為 11 月 30 日（週一）美東時間下午 3 點。
- 權重：9/10
- 發布日期：2026-10-30
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-26-nasa.gov-hubble-servicing.html；日期依 JSON-LD datePublished「2026-10-30T10:51:21-04:00」，頁面日期列「Oct 30, 2026」。grep 核對：Request for Information、Oct. 29、Jared Isaacman、Nicky Fox、Nov. 30、2033 to 2034、by 2032、propulsion system、re-entry。上期 NASA Swift 結束為不同事件；NASA 頁面導覽內容龐大，已讀正文全文。

### 56. Google Project Suncatcher 原型衛星傳回第一個 AI 回應，軌道上的 TPU 運行 Gemma 4
- 原始標題：We've received our first response from the Project Suncatcher prototype satellite.
- 標題：Google Project Suncatcher 原型衛星傳回第一個 AI 回應，軌道上的 TPU 運行 Gemma 4
- URL：https://blog.google/innovation-and-ai/models-and-research/google-research/project-suncatcher-satellite-response/
- 摘要：Google 官方部落格（Google Research 分類）由 Travis Beals 發表，Project Suncatcher 原型衛星於 10 月 1 日發射，團隊花數週完成試運轉檢核，包括啟動主機與 TPU 托盤並成功執行早期機器學習測試。本週達成「Hello World」里程碑，Google 稱這是資料中心等級 TPU 在軌道上的第一個 AI 回應：在地面站過境時，團隊把第一道提示上傳給衛星上的 Gemma 4 開放模型，要它寫一首關於太空的俳句，衛星經過挪威斯瓦巴時下傳了詩作。之後還測試了太空主題的五行打油詩與回報酬載系統狀態的遙測提示。接下來將進行一系列測試，評估 TPU 在軌道上承受熱應力與輻射的表現，為 2027 年兩顆互連衛星的下一個里程碑鋪路。
- 權重：8/10
- 發布日期：2026-10-30
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-31-blog.google-suncatcher-satellite-response.html；日期依 JSON-LD datePublished「2026-10-30T17:00:00+00:00」，頁面日期「Oct 30, 2026」。grep 核對：Project Suncatcher、October 1、Hello World、Gemma 4、haiku、Svalbard、twin interconnected satellites、2027、thermal stress、Travis Beals、limericks。blog.google 以 curl 可取得完整正文；The Verge 同日有報導（theverge.com/tech/1023528），未混入摘要。可能與硬體或 AI 組重疊。

### 57. 宜蘭大學王金燦以 AI 數位孿生結合微生物燃料電池處理廢水並回收電力，獲史蒂維科技卓越金獎
- 原始標題：王金燦研究AI助攻廢水能源化　巴黎獲頒科技卓越金獎
- 標題：宜蘭大學王金燦以 AI 數位孿生結合微生物燃料電池處理廢水並回收電力，獲史蒂維科技卓越金獎
- URL：https://www.cna.com.tw/news/ait/202610290021.aspx
- 摘要：中央社巴黎專電報導，國立宜蘭大學機械與機電工程學系特聘教授王金燦，以結合人工智慧、數位孿生與生物電化學的廢水能源化技術，獲史蒂維科技卓越獎（Stevie Awards for Technology Excellence）綠色潔淨科技類別「永續與節能運算卓越獎」金獎，28 日在巴黎領獎。王金燦表示，這項技術以微生物燃料電池為核心，結合 AI 預測、即時感測、數位孿生與熱流分析，除處理廢水、去除污染物，也能利用微生物分解有機物時產生的能量回收電力。團隊透過 AI 分析水質、流量、電壓與操作條件的關係，預測能源產出、污染物去除效率與系統性能，並以數位孿生模擬實際系統。他期望技術未來用於分散式廢水處理、智慧工廠、循環資源利用與偏遠地區能源系統；報導並提到他近年已將研究延伸至模擬微重力環境下的生物能源轉換。
- 權重：7/10
- 發布日期：2026-10-29
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：curl HTTP 200，存檔 pages/D-22-cna.com.tw-wang-wastewater-ai.html；日期依 JSON-LD datePublished「2026-10-29T08:20:00+08:00」。grep 核對：王金燦、國立宜蘭大學、史蒂維、微生物燃料電池、數位孿生、巴黎、綠色潔淨科技、永續與節能運算卓越獎、熱流、微重力。史蒂維獎為商業與科技獎項（頁面自述），非學術期刊審查；研究細節僅來自受訪者說法。台灣題。

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

## 淘汰來源

### A. 廣達 MIT 論壇閉幕：林百里盼透過 APEC 讓 AI 醫療走出實驗室
- URL：https://www.cna.com.tw/news/afe/202610300283.aspx
- 發布日期：2026-10-30
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：中央社報導為論壇閉幕致詞，沒有具體產品、數據或落地案例，權重低於本期醫療科技其他正式來源；主編降為淘汰。

### B. 熊谷組以 AI 虛擬號誌式控制讓 2 台鉸接式傾卸卡車自動運行，3 台機具由 1 人運用
- URL：https://built.itmedia.co.jp/bt/articles/2610/27/news068.html
- 發布日期：2026-10-27
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：熊谷組 ADT 自動運行屬營建機具自動化，與已收 Bedrock Robotics 自主挖土機題材重疊，且代理自述為湊滿名額列入；主編降為淘汰。

### C. YouTube Music 與 Premium 訂閱戶突破 1.5 億，客廳觀看占 YouTube 廣告營收逾三分之一
- URL：https://www.digitalmusicnews.com/2026/10/28/youtube-music-subscribers-q3-2026/
- 發布日期：2026-10-28
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：以 Alphabet 第三季財報為主的訂閱數與營收數字；上一期已以「財報類」淘汰 Spotify 第三季財報，本期維持一致而淘汰。

### D. VS Code 1.144 發布（Agent Host、Copilot Fusion、模型比較、電腦操作等）
- URL：https://code.visualstudio.com/updates/v1_144
- 發布日期：2026-10-28
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：原頁 Release date: October 28, 2026（curl 200，存檔 pages/A-21-code.visualstudio.com-v1_144.html）；品質足夠，但內容與 GitHub Universe 彙整高度重疊（Copilot Fusion、session continuity），為軟體工程的替補首選，主編若要多收一則開發工具版本可換入。

### E. GitHub 發表能在單一任務內跨模型協同的 Copilot Fusion（iThome）
- URL：https://www.ithome.com.tw/news/180064
- 發布日期：2026-10-29
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：與 Universe 官方彙整同一事件，已有一手來源，維持淘汰；可作 Fusion 細節（Single、Cascade、Critique 三種工作流）的補充引用。

### F. Mistral Large 4 on Hugging Face（Welcome Le Chonk）
- URL：https://huggingface.co/blog/mistral-large4
- 發布日期：2026-10-29
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：與 Mistral 官方頁同一事件；原頁 Published October 29, 2026，載明約 1T 總參數、49B 啟用、1M Token 上下文，可作為補充來源，但已收 Mistral 一手頁。

### G. Anthropic 與美國 GSA 擴大合作，政府客戶享 40% 折扣
- URL：https://www.anthropic.com/news/expanding-partnership-gsa
- 發布日期：2026-10-27
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：原頁 datePublished 2026-10-27，屬美國政府採購與商務，與台灣程式設計師關聯較低，權重 6/10 以下，維持淘汰；備選。

### H. AI for Science 擴大至基金會與研究機構（Anthropic）
- URL：https://www.anthropic.com/news/ai-for-science-expands-foundations-research-institutions
- 發布日期：2026-10-28
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：原頁 datePublished 2026-10-28，為研究補助與合作名單，對開發者實用性低，維持淘汰。

### I. Google 推出 Connected Apps 平臺，第三方應用可透過 MCP 串接 Gemini 與搜尋（iThome）
- URL：https://www.ithome.com.tw/news/180073
- 發布日期：2026-10-29
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：iThome class="created" 為 2026-10-29；為預覽版且須申請參與，實用性中等，是 AI 科技的替補（開發者可透過 MCP 伺服器接入 Gemini 與搜尋）。

### J. 微軟推出 AI 代理防護新機制（Dynamic Permissions、Dynamic Agent Risk、Dynamic Conditional Access）
- URL：https://www.ithome.com.tw/news/180048
- 發布日期：2026-10-28
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：iThome class="created" 為 2026-10-28；屬代理安全防護，建議交由他組（軟硬體資訊安全）。

### K. Anthropic 揭露收購 Mithril Medicine，公布自有藥物研發進展（iThome）
- URL：https://www.ithome.com.tw/news/180028
- 發布日期：2026-10-28
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：iThome class="created" 為 2026-10-28；屬藥物研發，建議交由他組（醫療科技）。

### L. Anthropic 公共利益基金（Investing in the public benefit）
- URL：https://www.anthropic.com/news/public-benefit-fund
- 發布日期：2026-10-18
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：上一期已淘汰，維持。

### M. Anthropic Claude Mythos 5 與 UK AISI 事件對齊評估
- URL：https://www.anthropic.com/research/alignment-assessment-ukaisi
- 發布日期：2026-10-23
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：上一期已引用，同事件不收。

### N. Meta 與五所美國大學合作加速醫學與科學突破
- URL：https://about.fb.com/news/
- 發布日期：2026-10-28
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：僅見 about.fb.com 列表頁摘要（October 28, 2026），未開原文，內容為研究合作與資金，對開發者實用性低，未收。

### O. .NET 2026 年 10 月 Out-of-Band 安全更新（Brotli 解碼器與 tarball 擁有者漏洞）
- URL：https://devblogs.microsoft.com/dotnet/
- 發布日期：2026-10-19
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：僅見 .NET Blog 列表頁日期 Oct 19, 2026，未取得單篇網址與原頁核對；屬安全更新，建議交由他組（軟硬體資訊安全）。

### P. 微軟發布 Windows 緊急更新，移除 eMudhra 問題憑證的預設信任
- URL：https://www.ithome.com.tw/news/180066
- 發布日期：2026-10-30
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：同事件（eMudhra 憑證外洩）2026-10-24 期已引用 Cloudflare 公告（ref-11）；本篇為微軟 10 月 26 日緊急更新移除 6 張根憑證與 1 張交叉簽署憑證的後續，屬實質進展，列為資安備選，若主編想補 eMudhra 後續可改收。

### Q. 思科修補防火牆已遭積極利用的阻斷服務漏洞
- URL：https://www.ithome.com.tw/news/180102
- 發布日期：2026-10-30
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：備選：Cisco ASA/FTD SSL VPN 漏洞 CVE-2026-76418 已遭利用（思科 10 月 28 日公告），權重 8/10，因已有 5 筆資安正式建議、本組不再增收；主編若要補廠商漏洞類可換入。

### R. Google 修補 Chrome 156，公布 21 個資安漏洞
- URL：https://www.ithome.com.tw/news/180097
- 發布日期：2026-10-30
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：備選：例行瀏覽器修補，實質影響低於已收的 Linux、Brotli 漏洞，未全文核對。

### S. 全家行動購部分會員資料遭非法擷取，起因是委外廠商 91APP 資料庫遭自動化攻擊
- URL：https://www.ithome.com.tw/news/180105
- 發布日期：2026-10-30
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：同事件（91APP 資料庫遭自動化攻擊）2026-10-17 期已引用 iThome 179741（ref-15）；本篇為全家 10 月 29 日重大訊息的後續。台灣題備選，已有新光三越一筆台灣資安題。

### T. 北韓駭客鎖定 216 臺 PHP 主機掃描 PHP2Shell 漏洞，臺灣列入目標範圍
- URL：https://www.ithome.com.tw/news/180045
- 發布日期：2026-10-28
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：PHP2Shell 事件上一期已收（2026-10-24 期 ref-12、ref-13），本篇為 Cyfirma 報告的掃描活動，進展程度低於已收的 PAN-OS 串連入侵，維持淘汰。

### U. Cloudflare deploys protections against php2shell vulnerability
- URL：https://blog.cloudflare.com/php-vulnerabilities-waf-protection/
- 發布日期：2026-10-21
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：同事件 PHP 重大漏洞上一期已收（2026-10-24 期 ref-12），WAF 防護規則屬廠商產品通知。

### V. There's always a patient zero: Defending the NetScaler front door before the patch
- URL：https://blog.cloudflare.com/protect-your-netscaler-gateway/
- 發布日期：2026-10-19
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：備選：Cloudflare 對 NetScaler 閘道的修補前防護說明，屬廠商產品導向，未全文核對。

### W. Apple unveils new iMac with M6
- URL：https://www.apple.com/newsroom/2026/10/apple-unveils-new-imac-with-m6/
- 發布日期：2026-10-27
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：與同日 14 吋 MacBook Pro M6 為同批 M6 發表，只收一筆避免重複；規格含 24 吋 4.5K、Wi-Fi 7，備選。

### X. Thin, Light and Built for Everything: NVIDIA RTX Spark Windows Laptops Gain New Models, Agent Tools and Games
- URL：https://blogs.nvidia.com/blog/local-ai-rtx-spark-laptops-updates-models-agents-games/
- 發布日期：2026-10-28
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：備選：原頁寫 RTX Spark 筆電已由 ASUS、Dell、HP、Lenovo、Microsoft、MSI 供貨（Blackwell GPU 加 Grace CPU 單一超級晶片，最高 128GB 統一記憶體），但整篇主體是 Nemotron 3.5 Transcribe、LFM3、NVIDIA App 與遊戲更新，硬體資訊占比低。

### Y. Introducing tsrs: a Port of TypeScript to Rust
- URL：https://blog.cloudflare.com/typescript-rust-port/
- 發布日期：2026-10-20
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：建議交由他組（軟體工程）：TypeScript 移植到 Rust 的工具，與本組分類無關。

### Z. Cloudflare 後量子地理金鑰管理（Bringing post-quantum cryptography to geographically fenced key management）
- URL：https://blog.cloudflare.com/post-quantum-geo-key-manager/
- 發布日期：2026-10-23
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：備選：Cloudflare Geo Key Manager 後量子密碼，權重 8/10；本組已收 4 筆 Cloudflare 與基礎設施題，為避免單一來源過度集中未收，未全文核對。

### AA. Introducing full transaction detection for Cloudflare WAF
- URL：https://blog.cloudflare.com/full-transaction-waf/
- 發布日期：2026-10-21
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：廠商產品功能公告，優先序低於已收的事件與漏洞類。

### AB. Amazon Web Services 近兩週部落格（AWS Weekly Roundup 10 月 26 日等）
- URL：https://aws.amazon.com/blogs/aws/
- 發布日期：2026-10-26
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：AWS News Blog 窗內只有 ECS Gateway（10-20，上一期已引用）、Continuum（10-22，上一期已淘汰）與每週彙整，沒有基礎設施事故或新服務可收；Lambda Web Functions 為 10-12 窗外。

### AC. Google Cloud europe-west2 incident（status.cloud.google.com incidents.json 窗內僅此一筆）
- URL：https://status.cloud.google.com/incidents.json
- 發布日期：2026-10-20
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：上一期已引用（2026-10-24 期 ref-22，Google Cloud 倫敦斷電）；incidents.json 窗內無其他事故。

### AD. NVIDIA Opens Vera Rubin Architecture at OCP Global Summit
- URL：https://blogs.nvidia.com/blog/ocp-global-summit-vera-rubin-scale-ai-factories/
- 發布日期：2026-10-12
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：發布日 10-12 在時間窗之外。

### AE. NVIDIA Vera Rubin NVL72 Delivers Leading Performance in MLPerf Inference v6.1 Debut
- URL：https://blogs.nvidia.com/blog/vera-rubin-nvl72-mlperf-inference/
- 發布日期：2026-09-16
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：發布日 09-16 在時間窗之外。

### AF. Building Trusted AI Infrastructure for Safe and Secure AI (NVIDIA × Eclypsium)
- URL：https://blogs.nvidia.com/blog/eclypsium-trusted-safe-secure-ai-infrastructure/
- 發布日期：2026-10-29
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：廠商合作公告，未全文核對，權重低於已收資安題。

### AG. Qualcomm Snapdragon Summit 2026 新品（Snapdragon 8 Elite Gen 6 等）
- URL：https://www.qualcomm.com/news/releases/2026/09/snapdragon-leads-the-agentic-ai-age-with-two-of-the-world-s-fast
- 發布日期：2026-09-24
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：新聞稿位於 2026/09 路徑，發布在時間窗之外（Snapdragon Summit 為 9 月 22 至 24 日）；窗內未找到 Qualcomm 新品發表。日期取自搜尋結果與網址，未回原頁核對。

### AH. SEC 提出投資顧問與基金加密資產託管新規則提案
- URL：https://www.sec.gov/newsroom/press-releases/2026-100-sec-proposal-would-address-how-investment-advisers-funds-can-custody-crypto-assets-under-federal
- 發布日期：2026-10-01
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：頁面日期 Oct. 1, 2026，在時間窗（10-17 起）之外。

### AI. Visa 2026 會計年度第四季與全年財報公告
- URL：https://usa.visa.com/about-visa/newsroom/press-releases.releaseId.22876.html
- 發布日期：2026-10-27
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：頁面僅預告財報發布與網路直播，無技術內容。

### AJ. PayPal 2026 年第三季財報公告
- URL：https://newsroom.paypal-corp.com/2026-10-27-PayPal-Reports-Third-Quarter-2026-Results
- 發布日期：2026-10-27
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：頁面僅說明財報與電話會議，無技術內容。

### AK. Kodiak AI 長途無人駕駛自主就緒度達 99%
- URL：https://kodiak.ai/news/kodiak-autonomy-readiness-99
- 發布日期：2026-10-30
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：原頁 curl 200、日期 2026-10-30 可核對，為進度數字更新，權重次於已收的 Aurora，名額已滿。

### AL. Joby 將垂直起降空中計程車帶到佛羅里達
- URL：https://www.jobyaviation.com/news/joby-brings-its-vertical-takeoff-and-landing-air-taxi-to-florida
- 發布日期：2026-10-30
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：與 FAA 佛羅里達 eIPP 示範飛行為同一事件，已用 FAA 官方頁。

### AM. MHRA 核准 Casgevy 擴及五歲以上兒童
- URL：https://www.gov.uk/government/news/mhra-approves-gene-editing-treatment-for-children-aged-five-and-over-with-serious-inherited-blood-disorders
- 發布日期：2026-10-30
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：屬藥品適應症擴大，與軟體或技術較遠，名額已有 FDA Voceryq。

### AN. FDA 核准首創慢性 B 型肝炎治療
- URL：https://www.fda.gov/news-events/press-announcements/fda-approves-first-its-kind-chronic-hepatitis-b-treatment
- 發布日期：2026-10-20
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：藥品核准，與技術較遠，已有 FDA Voceryq 為代表。

### AO. RadNet 以 3.5 億美元收購遠距放射科服務商 Onrad
- URL：https://www.medtechdive.com/news/radnet-expands-into-teleradiology-with-350m-onrad-deal/873315/
- 發布日期：2026-10-28
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：以併購財務為主，AI 內容少，名額已滿。

### AP. Neuralink 發表 Telepathy 與 Blindsight 兩款腦部植入裝置
- URL：https://www.cna.com.tw/news/ait/202610300298.aspx
- 發布日期：2026-10-30
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：中央社綜合外電、主要引述 Benzinga 與馬斯克貼文，「盲視」尚未展示人類視力恢復，權重 6/10；建議交由他組（硬體或軟硬整合）時再評估。

### AQ. Panasonic EW 與ライナフ以公寓對講機解鎖自動門鎖的 API 串接
- URL：https://built.itmedia.co.jp/bt/articles/2610/29/news053.html
- 發布日期：2026-10-29
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：企業原始發表日為 2026-10-09，在窗外，BUILT 僅為窗內的轉述報導；已存檔 pages/D-04-built.itmedia.co.jp-panasonic-linaf.html，列備援。

### AR. Suno 推出可在 ChatGPT、Claude、Gemini 內作曲的 MCP 工具，開發者 API 仍為 Beta（Music Business Worldwide）
- URL：https://www.musicbusinessworldwide.com/sunos-new-mcp-tool-lets-users-make-songs-inside-chatgpt-claude-and-gemini-as-its-developer-api-gets-a-sign-in-portal-but-remains-in-beta/
- 發布日期：2026-10-30
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：curl 回 HTTP 403（pages/D-11、D-27 為擋頁），無法核對原頁日期與內容；僅見 RSS 標題與 pubDate。若主編能取得原頁，對程式設計師價值高，建議複查。

### AS. IBM 以超導 l-coupler 連接兩顆量子晶片（Science News）
- URL：https://www.science.org/content/article/ibm-links-two-quantum-chips-key-step-toward-bigger-computers
- 發布日期：2026-10-27
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：science.org 對 curl 回 HTTP 403，無法核對；同事件已改收 IBM 官方部落格。

### AT. Ticketmaster 與 CashorTrade 擴大合作，Front Gate Tickets 加入面額轉售整合
- URL：https://www.digitalmusicnews.com/2026/10/30/live-nation-ticketmaster-cashortrade-front-gate-tickets/
- 發布日期：2026-10-30
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：已回原頁核對（HTTP 200，datePublished 2026-10-30T19:28:20+00:00），為售票轉售合作，技術細節少，現場表演藝術已有 5 筆較強者，列備援。

### AU. Sam Fender 巡演預售遭機器人攻擊而延後（Digital Music News）
- URL：https://www.digitalmusicnews.com/2026/10/28/sam-fender-pre-sale-bot-swarm/
- 發布日期：2026-10-28
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：已回原頁核對（HTTP 200，datePublished 2026-10-28T18:30:16+00:00）；與已收 Garth Brooks 同屬機器人搶票類，只留一則，列備援。

### AV. Elvis Presley 權利人控告 Anthropic（Digital Music News）
- URL：https://www.digitalmusicnews.com/2026/10/25/elvis-presley-ip-anthropic-copyright-infringement/
- 發布日期：2026-10-26
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：同事件已收中央社版本；DMN 版（datePublished 2026-10-26T04:44:03+00:00）資訊較細，可作為替換來源，已存檔 pages/D-17。

### AW. Google Project Suncatcher 衛星傳回首個 AI 回應（The Verge）
- URL：https://www.theverge.com/tech/1023528/google-project-suncatcher-ai-satellite-transmission
- 發布日期：2026-10-30
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：同事件已收 Google 官方部落格（一手來源）；Verge 為二手轉述。建議交由他組（硬體或軟硬整合／AI 科技）評估是否歸類。

### AX. IBM l-coupler 報導（Network World／Quantum Computing Report）
- URL：https://www.networkworld.com/article/4241386/ibm-connects-quantum-chips-with-quantum-channels-at-99-accuracy.html
- 發布日期：2026-10-27
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：同事件已收 IBM 官方部落格，二手轉述淘汰。

### AY. Bedrock Robotics 6 億美元融資（TechCrunch）
- URL：https://techcrunch.com/2026/10/26/this-startups-self-driving-excavators-help-dig-up-600m-in-new-funding/
- 發布日期：2026-10-26
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：同事件已收 Construction Dive；未開原頁，僅見 RSS 標題。建議交由他組（運輸物流／AI 科技）若要引用自主機具題材。

### AZ. PHP 資訊性公告：建議關閉 session.upload_progress 以防範不太可能發生的 RCE 路徑
- URL：https://www.php.net/archive/2026.php#2026-10-23-1
- 發布日期：2026-10-23
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：PHP 官方自述此 RCE 只在少見的組態與程式碼組合下發生（執行期以 ini_set() 切換 session.serialize_handler），將於下一個例行版本處理並公布 CVE-2026-115560；屬上一期 PHP 重大漏洞（2026-10-24 期 ref-12）的補充建議，影響範圍小，資安名額已滿。


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
