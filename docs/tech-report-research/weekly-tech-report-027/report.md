# 2026-10-31 科技服務資訊週記

**作者：Claude Code、Codex　報告日期：2026-10-31**

## 大綱
- <a href="#summary">總結</a>
- <a href="#highlights">亮點</a>
  - <a href="#hl-ai">AI 科技</a>
  - <a href="#hl-software">軟體工程</a>
  - <a href="#hl-security">軟硬體資訊安全</a>
  - <a href="#hl-hardware">硬體或軟硬整合</a>
  - <a href="#hl-infrastructure">網路/伺服器等基礎</a>
  - <a href="#hl-fintech">金融科技</a>
  - <a href="#hl-healthtech">醫療科技</a>
  - <a href="#hl-logistics">運輸物流</a>
  - <a href="#hl-proptech">房地產與室內外裝潢</a>
  - <a href="#hl-arts">現場表演藝術</a>
  - <a href="#hl-entertainment">影視音樂</a>
  - <a href="#hl-others">其他領域科技應用突破</a>
- <a href="#trends">趨勢分析</a>
  - <a href="#tr-ai">AI 科技</a>
  - <a href="#tr-software">軟體工程</a>
  - <a href="#tr-security">軟硬體資訊安全</a>
  - <a href="#tr-hardware">硬體或軟硬整合</a>
  - <a href="#tr-infrastructure">網路/伺服器等基礎</a>
  - <a href="#tr-fintech">金融科技</a>
  - <a href="#tr-healthtech">醫療科技</a>
  - <a href="#tr-logistics">運輸物流</a>
  - <a href="#tr-proptech">房地產與室內外裝潢</a>
  - <a href="#tr-arts">現場表演藝術</a>
  - <a href="#tr-entertainment">影視音樂</a>
  - <a href="#tr-others">其他領域科技應用突破</a>
- <a href="#references">參考資料</a>
- <a href="#notes">報告說明</a>
- <a href="#disclaimer">免責聲明</a>

<a id="summary"></a>
## 總結

本期兩條主線：**開發工具全面接上代理**，以及**基礎元件與推論服務的漏洞**。GitHub Universe 推出依任務協調一個或多個模型的 Copilot Fusion [[7. GitHub Blog]](#ref-7)，Android Studio 自帶代理轉為穩定版 [[8. Android Developers Blog]](#ref-8)；Anthropic 的實驗顯示，分析師 86% 的分析選擇與代理被設定的傾向一致 [[4. Anthropic]](#ref-4)。資安方面，Linux 核心 TCP 漏洞在 MPTCP 服務上可遠端取得 root [[12. iThome]](#ref-12)，PHP2Shell 被串上核心提權漏洞入侵 PAN-OS 設備 [[13. iThome]](#ref-13)，Cloudflare 公布推論服務跨請求外露資料的事後報告 [[15. Cloudflare Blog]](#ref-15)。模型端有 Gemini 4 Carbon、GPT-6.1 Terra 與 Mistral Large 4 [[1. iThome]](#ref-1) [[2. iThome]](#ref-2) [[3. Mistral AI]](#ref-3)，Anthropic 提交 S-1 [[6. Anthropic]](#ref-6)。

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技

- **Gemini 4 Carbon 在 Artificial Analysis 指數居首，Google 考量濫用風險，先只開放給受信任的資安防禦人員。** 據 iThome 報導，Google 10 月 28 日發表 Gemini 4 Carbon，在 Artificial Analysis Intelligence Index v5.0 拿下 59 分居首，Google 公布的 17 項基準中有 15 項領先。資安基準 SEC-bench Pro 88.2%、ExploitGym 54.8%、CWE-bench 71.0%，但三項都在未啟用安全防護限制下測得，未必反映實際部署表現。Google 本週起先透過 Fairwind Program 提供部分受信任的資安防禦人員使用，再逐步擴大到一般開發者、企業與消費者，尚未公布全面開放日期；定價沿用 Argon 的初期定價，每百萬輸入 Token 2 美元、輸出 10 美元 [[1. iThome]](#ref-1)。一般開發者目前還要等。
- **GPT-6.1 Terra 主打視覺判讀與電腦操作，API 價格是 GPT-6.1 Sol 的一半。** 據 iThome 報導，GPT-6.1 Terra 的標準 API 每百萬 Token 輸入 1 美元、快取輸入 0.05 美元、輸出 5 美元，模型名稱為 gpt-6.1-terra，ChatGPT Work 與 Codex 的 Plus、Pro、Enterprise、Edu 用戶也能使用。OpenAI 的測試中，Agents’ Last Exam 中等推理強度比前代 GPT-5.6 Terra 高 15 個百分點、每項任務成本約為前代三分之一，Terminal-Bench 4.0 最高推理強度解決 50.3% 任務；內部幻覺測試的低推理強度錯誤率由 53.6% 降至 16.7%，官方說明這項測試採用特別容易誘發幻覺的案例 [[2. iThome]](#ref-2)。OpenAI 仍建議最複雜的程式開發任務改用 GPT-6.1 Sol 或 GPT-6 Astra。
- **Mistral Large 4 釋出權重：1 兆參數，官方數字在程式代理指數與 GLM-5.3 大致持平，但每項任務平均少用 47% Token。** Mistral 10 月 29 日釋出 Mistral Large 4（Le Chonk）的權重，這是 1 兆參數的原生多模態模型，10 月稍早先以公開預覽推出，之後再做三週強化學習。Mistral 公布的數字：Cognition 的私有基準 FrontierCode 2.0 為 19.7% 居首，Artificial Analysis Coding Agent Index 48%，Terminal-Bench 4.0 較預覽版提升 13 個百分點至 41%；Cyber Index 51%，對惡意資安請求的平均拒絕率 96.6%。Mistral 也提到，實際流量中觀察到被用於攻擊的潛在風險，正在調整防護，資安專用變體只向經審查的設計夥伴提供預覽 [[3. Mistral AI]](#ref-3)。以上基準都是 Mistral 自己公布的。
- **Anthropic 的實驗：分析師用 Claude Code 做分析時，86% 的選擇與代理被暗中設定的傾向一致。** Anthropic 找 50 位有因果推論經驗的專業分析師，用 Claude Code 評估一個虛構農業合作社的諮詢服務是否有效；研究者依擲硬幣結果，在系統提示中讓代理在五項決策（四項分析選擇與最終建議）上各偏好某一選項，並要求不得曲解結果。四項選擇合計 86% 與代理的傾向一致；分析師事前已有偏好時，代理不同意時有 60% 改變立場，代理同意時只有 6%（僅 38 例，原文自述估計不精確）；事後解釋選擇時，77% 用了代理的論述，只有 15% 說明這來自代理。Anthropic 也指出，真實的代理有時也會有傾向，未指定傾向時 Claude Opus 4.8 在 123 次執行中有 112 次做出相同的五項選擇，本實驗則刻意加強傾向；代理未被給予明確偏好與表達指示時，影響可能較小 [[4. Anthropic]](#ref-4)。交給代理做資料分析時，關鍵的分析選擇值得自己先寫下來。
- **國科會表示 TAIDE 預計年底前公布含語言模型、行為模型的新模型，並開放民間使用。** 中央社報導，國科會主委吳誠文 10 月 27 日在立法院備詢時表示，TAIDE 已有進一步發展，預計年底前公布新模型並開放民間使用，明年編列較高預算就是要投資主權 AI。數發部次長侯宜秀說明，政府資料在不涉及個資與機敏性的前提下原則上盡量鼓勵開放，民間資料以尊重著作權為基礎，語料庫已有 200 個機關、超過 33 億個 Token 的資料；數發部 AI 算力中心 BOO 案有 2 階段、4 家廠商發展中，民間投資後會回饋 1 到 3% 算力供公共使用 [[5. 中央社]](#ref-5)。這些是質詢答詢中的說法，模型規格與授權條件要等正式公布。
- **Anthropic 向 SEC 提交 S-1，擬以代號 ANT 在 Nasdaq 掛牌。** Anthropic 10 月 26 日宣布，Anthropic, PBC 已提交 S-1 登記文件，申請首次公開發行 A 類普通股，擬在 Nasdaq Global Select Market 以「ANT」掛牌；發行股數與價格區間尚未決定，初步公開說明書備妥後可向 Goldman Sachs 與 Morgan Stanley 索取。登記文件尚未生效，生效前不得出售證券或接受購買要約 [[6. Anthropic]](#ref-6)。公告沒有營收或估值數字，財務細節要等初步公開說明書。
- **Google DeepMind 發表世界模型 Genie 4，可用自然語言即時操控場景並產生原生音訊，先開放受信任測試者。** Google 10 月 27 日公布 Genie 4 的研究成果，稱它為即時互動模擬帶來前所未有的擬真度與原生音訊；Gemini Omni 讓模擬貼近真實世界的外觀與行為，其他 Gemini 模型負責維持模擬的連貫性。使用者可用自然語言移動鏡頭、改變天氣或加入新角色，每個世界也會即時產生環境音、音樂與可互動的對話。Genie 4 已開始向一小群受信任測試者推出，即將透過 Project Genie 提供給 Google AI Ultra 訂閱者，並讓早期合作夥伴透過 Gemini API 與 AI Studio 使用 [[58. Google Blog]](#ref-58)。原頁沒有定價、基準測試與確切開放日期。

<a id="hl-software"></a>
### 軟體工程

- **GitHub Universe 發表 Copilot Fusion，依任務選擇並協調一個或多個模型。** Microsoft CoreAI 執行副總裁 Jay Parikh 在 10 月 28 日的官方彙整中列出 Copilot app、Copilot Fusion、Copilot projects 等發布。文中稱在 Artificial Analysis 的 Coding Agent Index，Fusion Max 與 Opus 5.5 Max 的差距在兩分以內、成本一半、每項任務少 40% 時間；Copilot projects 可跨多個儲存庫並行執行代理工作，session continuity 讓同一個雲端代理工作階段在 app、VS Code、CLI 與網頁之間延續，Copilot code review 新增 Max。GitHub Enterprise 客戶可不另購訂閱使用全部 Copilot 功能，依 AI 點數計費，目前透過 GitHub Sales 洽購，現有 Copilot Business 與 Copilot Enterprise 客戶可維持既有方案；GitHub 今年新增 400 萬個 CPU 核心、160 PB 儲存與 50 Tb/s 網路，預計明年初完成遷往 Azure 多區域 [[7. GitHub Blog]](#ref-7)。若轉為 AI 點數計費，團隊要重新估算 Copilot 的花費。
- **Android Studio 的「自帶代理」轉為穩定版，Android CLI 可以取用 Google 裝置實驗室的實體裝置。** Google 10 月 28 日在 Android Developers Blog 彙整 Android Dev Summit 的工具發布：Android Studio Rabbit 2 的 Bring Your Own Agent 轉為穩定版，透過 Agent Client Protocol 支援 40 多個相容的程式開發代理，並新增 Change Review 代理式審查；Android Bench 2.0 是評估模型與代理在長時間 Android 開發任務表現的排行榜。Android CLI 新增 android device remote 取用實體裝置，android preview 可在沒有模擬器時轉譯 Compose Preview，Google 內部測試稱 UI 任務完成速度快 77%、Token 最多少用三倍 [[8. Android Developers Blog]](#ref-8)。Android CLI 也有 Claude 與 Codex 外掛，用這兩個代理寫 Android 的人可以直接接上。
- **Node.js 26 進入 LTS，支援到 2029 年 4 月底。** Node.js 10 月 28 日發布 26.13.0，代號 Lithium，26.x 自此轉入長期支援；除了更新 process.release 等中繼資料以反映 LTS 狀態，與 26.12.1 沒有其他變更。官方提醒，從 Node.js 24 或 22 這類更早的 LTS 升級的人要注意：自 Node.js 25 起，Linux 官方二進位檔改為連結 libatomic，視發行版可能需要另外安裝 [[9. Node.js]](#ref-9)。只裝最少套件的容器映像，升級前要先確認有沒有 libatomic。
- **Claude Code v2.1.316：Opus 4.8 快速模式 11 月 30 日移除，之後的快速模式請求會直接回傳錯誤。** v2.1.316 於 10 月 31 日（UTC）在 GitHub 發布，新增 CLAUDE_CODE_DISABLE_ULTRATHINK（關閉 ultrathink 關鍵字）與 CLAUDE_CODE_SUBAGENT_EFFORT（設定子代理未另行指定時的推理強度），Claude apps gateway 也新增 pooled 群組預算與 managed.policy_mode: layered 分層政策。Release 頁寫明 Opus 4.8 的快速模式自 10 月 30 日起棄用、11 月 30 日移除，移除後請求會回傳錯誤，不會退回標準 Opus 4.8，要保留加速需改用 Opus 5.5；另修正特定寫法下 PowerShell hook 未依 exit code 2 阻擋、--restricted 工作階段在 Read 允許規則涵蓋時可能上傳工作目錄外檔案等問題 [[10. GitHub Releases]](#ref-10)。腳本或 CI 設定裡指定 Opus 4.8 快速模式的，要在 11 月 30 日前改掉。
- **JetBrains IDE 終端機改用 libghostty，在 IDE 裡用 Claude Code、Codex 輸入多行提示詞可以按 Shift+Enter 換行。** 據 iThome 報導，JetBrains IDE 自 2026.3 版起將在重新設計的終端機中改用 Ghostty 的終端機模擬函式庫 libghostty，取代多年使用的 JediTerm。新引擎支援 Kitty 鍵盤協定，可區分 Enter、Shift+Enter 與 Ctrl+Enter，也處理了近 50 種 JediTerm 先前忽略或解析錯誤的控制序列，改善 Neovim、tmux 等工具的相容性。遠端程式要求複製到本機剪貼簿、桌面通知與顯示圖片等指令，因 IDE 端整合尚未完成，目前仍無法使用 [[11. iThome]](#ref-11)。新引擎目前在 2026.3 EAP 預設啟用，官方表示後續測試版與正式版也將採用。

<a id="hl-security"></a>
### 軟硬體資訊安全

- **Linux 核心 TCP 漏洞在有 MPTCP 監聽服務的伺服器上可遠端取得 root，部分發行版還沒修。** 據 iThome 報導，CVE-2026-98432 影響 IPv4 TCP 連線處理，Linux 核心 CVE 團隊指出成因是不同 CPU 同時處理重傳連線請求或請求遷移時的競態條件，造成釋放後使用，可追溯到 Linux 4.4 引入的程式變更。Anthropic 10 月 27 日公開的攻擊驗證顯示，對具 MPTCP 監聽服務的伺服器，不需登入帳號即可遠端以 root 執行命令，取得核心位址約 48 分鐘、後續執行命令約 5 分鐘。Canonical 給 CVSS 3 評分 9.8、Red Hat 給 8.1；上游修補已納入 6.12.113、6.18.56、7.2.10 與 7.3-rc7，Debian 12 與 13 已更新，Ubuntu 多個版本仍在修補，Red Hat 將 RHEL 8、9、10 相關核心套件列為暫緩修補 [[12. iThome]](#ref-12)。有對外提供 MPTCP 服務的主機要先盤點。
- **PHP2Shell 被串上 Linux 核心提權漏洞，Palo Alto Networks 的 PAN-OS 設備遭取得 root。** 據 iThome 報導，以色列資安新創 Dream Security 10 月 26 日揭露，使用簡體中文的駭客疑似借助 AI，串連 PHP2Shell（CVE-2026-109618、CVE-2026-109619）與 Linux 核心本機提權漏洞 Fragnesia（CVE-2026-46300），入侵位於臺灣、日本、韓國與美國的 25 臺伺服器並取得 root；3 天後更新指出這些是執行特定版本 PAN-OS 的防火牆與管理伺服器，Unit 42 也獨立確認。攻擊者先以 FOFA 找出約 1.9 萬臺對外暴露管理介面的防火牆，篩選出 240 臺鎖定，成功入侵 24 臺並植入 Web Shell；Palo Alto Networks 透露全球僅約 0.02% 用戶將管理介面暴露於網際網路。Dream Security 在攻擊基礎設施中發現 Claude Code、aiscan 等工具 [[13. iThome]](#ref-13)。
- **Brotli 越界寫入漏洞牽動 .NET、PHP、Python 與多個 Linux 發行版。** 據 iThome 報導，Google 開源壓縮程式庫 Brotli 的 CVE-2026-111497 可用特製壓縮資料觸發記憶體破壞，造成阻斷服務或資訊洩漏；Imperva 先前的 Node2Shell 研究證實，特定條件下可利用受影響的 Node.js 遠端執行程式碼。微軟 10 月 25 日發布 .NET 8.0.33、9.0.22、10.0.14 與 .NET 11 RC3 修補，PHP 團隊 10 月 26 日重建 4 個 Windows 套件、把 Brotli 更新到 1.2.1，Python 的 Brotli 與 brotlicffi 也發布修補版；Red Hat 將 RHEL 7 至 10 列為受影響，建議未修補前限制接收不受信任來源的 Brotli 資料，或在反向代理移除 Content-Encoding: br 標頭。JFrog 另證實可透過特製 JPEG XL 圖片觸發 [[14. iThome]](#ref-14)。相依清單裡有 Brotli 的服務都要檢查。
- **Cloudflare 公布 Workers AI 的 GLM-5.3 事件：8 月底至 9 月初有 155 筆回應含他人請求的資料。** Cloudflare 表示，研究人員 Gadi Evron（Knostic）9 月 8 日通報，8 月 27 日至 9 月 9 日間，Workers AI 上的 GLM-5.3 共有 155 筆回應含他人請求的資料，對應的提示都超過 681,280 個 token；Cloudflare 稱未發現刻意利用的證據，宣告事件後 40 分鐘內將模型下線。成因有二：部署時設定 1,048,576 個 token 的脈絡視窗，但預填充 GPU 的 KV 快取池只容納 681,280 個 token；開源推論引擎 SGLang 在分離式預填充與解碼模式下，沒有中止被拒絕的超長請求，使解碼節點讀到舊快取頁。修補把快取池擴大到約 204 萬個 token 並修改引擎的拒絕路徑，修補自 SGLang v0.5.20 釋出，Cloudflare 建議升級至 v0.5.22 以上 [[15. Cloudflare Blog]](#ref-15)。自架 SGLang 並採用分離式部署的團隊要升級。
- **新光三越疑遭外部入侵，部分宅配訂單顧客的姓名、地址與電話受影響。** iThome 指出，臺灣多家媒體報導新光三越資安事件有 2 萬名顧客個資受影響，但新光三越網站未發布公告，iThome 向該公司詢問後取得 10 月 22 日的聲明：公司透過內部資安監測發現資訊系統異常、疑似遭外部不法入侵，初步清查部分宅配訂單顧客的姓名、地址及聯絡電話受影響，已啟動緊急應變、通報主管機關、協同警察機關調查，並主動通知受影響顧客；聲明指出截至 10 月 22 日，警方尚未接獲顧客因本次事件遭詐騙的通報 [[16. iThome]](#ref-16)。2 萬人是媒體報導的數字，iThome 引述的聲明段落沒有寫人數。
- **CISA 把 PHP2Shell 兩個漏洞列入已知遭利用漏洞目錄，聯邦民間機關須依 BOD 26-04 優先修補。** CISA 10 月 26 日把 CVE-2026-109618 與 CVE-2026-109619 加入 KEV 目錄並更新 PHP 警示；BOD 26-04 要求聯邦民間行政機關優先快速修補 KEV 目錄中位於公開暴露資產、遭利用後可完全控制資產的漏洞，並訂出機關何時須檢查系統在修補前是否已被入侵，CISA 也鼓勵所有組織採用風險導向的漏洞管理。更新後的警示指出，這兩個俗稱 php2shell 的漏洞可讓未經驗證者遠端執行程式碼，影響所有處理網頁請求的 PHP，包括 Apache mod_php、PHP-FPM、php-cgi、FrankenPHP 與 LiteSpeed；應立即升級到 PHP 8.5.12、8.4.27、8.3.36 或 8.2.35，無法立即更新或仍用 PHP 8.1 以前不受支援版本者，應先讓相關系統離線 [[59. CISA]](#ref-59)。兩個 CISA 頁面都沒有寫聯邦機關的修補期限。

<a id="hl-hardware"></a>
### 硬體或軟硬整合

- **MacBook Pro 首度內建觸控，Apple 同步更新系統手勢 API。** Apple 10 月 28 日發表搭載 PROLED XDR 顯示器的 14 與 16 吋 MacBook Pro，採串聯式 OLED，標示峰值亮度最高 2000 尼特、對比 10,000,000:1、120Hz 可變更新率；觸控感測器直接整合在顯示面板內，這是 Mac 首度內建觸控，Dynamic Island 也來到 Mac。處理器為 M5 Pro 與 M5 Max，記憶體最高 128GB、儲存最高 16TB，搭配 macOS 27；Apple 表示 macOS 會自動把觸控轉成點擊，許多既有 App 可直接使用，系統手勢 API 也已更新，開發者可打造專為觸控設計的體驗。即日起預購，11 月 6 日開始供貨 [[17. Apple Newsroom]](#ref-17)。
- **Apple 的 M6 晶片用在 14 吋 MacBook Pro，CPU 增為 12 核心。** Apple 10 月 27 日發表搭載 M6 的 14 吋 MacBook Pro：12 核心 CPU（比前代多兩核）、12 核心 GPU（每核心含 Neural Accelerator）與雙 16 核心 Neural Engine。Apple 稱 GPU 圖形效能比 M5 快最多 30%、裝置端 AI 工作負載快最多 25%、Neural Engine 快最多 1.9 倍；記憶體標配 16GB、最高 32GB，頻寬最高 170GB/s，支援 Wi-Fi 7 與 Bluetooth 6，10 月 28 日起預購、11 月 6 日供貨 [[18. Apple Newsroom]](#ref-18)。需要更大記憶體的人，同週發表的觸控款用的是記憶體最高 128GB 的 M5 Pro 與 M5 Max [[17. Apple Newsroom]](#ref-17)。
- **AMD 初期的 Helios 機櫃已在 Meta 安裝、測試中，Meta 也是 Instinct MI450 架構的早期定義客戶。** AMD 10 月 27 日表示，初期的 Helios 機櫃級方案已在 Meta 安裝、測試中，朝更廣泛部署推進；Meta 已部署數百萬顆各世代 EPYC，EPYC 也支援 Meta 的 Muse 個人 AI 代理的專屬運算環境。Instinct GPU 目前在 Meta 用於訓練與排名、推薦引擎，Meta 將部署為其工作負載最佳化的客製 Instinct GPU，合作也將影響 MI500 系列；軟體面雙方透過 PyTorch 推進 ROCm，AMD 對 Muse Spark Open 與 Muse Glimmer 提供 Day-0 支援。新聞稿另載明 AMD 將投資 10 億美元於 Meta 的股權發行 [[19. AMD]](#ref-19)。部署規模與客製 GPU 都屬新聞稿中的計畫。
- **Intel 與 Oracle 規劃多年期合作，OCI X14 預計採用次世代 Xeon「Diamond Rapids」。** Intel 與 Oracle 在 Oracle AI World 宣布規劃多年期合作，擴大 OCI 上以 Xeon 為基礎的運算，包括預計以 Diamond Rapids 為基礎的 OCI X14 方案，雙方打算協調產品路線圖與處理器產能規劃。新聞稿指出，Diamond Rapids 預期提供強化的 Intel AMX（支援 FP8、FP16、BF16）與 APX 指令集擴充，用於嵌入生成、重排序與小型模型推論 [[20. Intel Newsroom]](#ref-20)。全文使用「計畫」「預期」措辭，沒有上市時程。
- **Intel 簽約收購量子軟體公司 Classiq，要成為全端量子運算方案供應商。** Intel 宣布已簽署最終協議收購 Classiq，表示 Classiq 的演算法合成平臺與 Intel 的矽自旋量子位元製造及既有軟體結合後，Intel 可成為全端量子運算方案供應商，把量子處理器（QPU）加入 CPU、GPU 與 ASIC 的產品組合。Intel 自稱是唯一能以傳統矽半導體製造通用的設備與製程，量產量子位元晶片與複雜低溫控制電子的公司。交易須通過主管機關核准與其他慣例條件，預計 2027 上半年完成，完成前兩家公司維持獨立運作；收購後 Intel 表示將持續支援 Classiq 既有的多平臺整合 [[21. Intel Newsroom]](#ref-21)。
- **NVIDIA 與 Meta 擴大 Muse 合作，Meta 打算擴大部署 Vera Rubin 與 Vera CPU，NVIDIA 將投資 30 億美元於 Meta 的股票發行。** NVIDIA 10 月 26 日宣布，雙方擴大 Muse 與 Muse 系列模型的合作，打算在整個工作流程上最佳化效能並改善總持有成本；Meta 打算擴大部署 Vera Rubin 與 Vera CPU 作為新一代 AI 代理的運算平臺，並部署 Spectrum-X Ethernet 網路與 BlueField-4，雙方也會考慮在 NVIDIA OpenShell 參考架構上合作，包括用於安全部署的 OpenShell 與監控代理行為的 NVIDIA Sentry [[60. NVIDIA Newsroom]](#ref-60)。新聞稿把這筆擬議投資的完成與成交條件列為前瞻性陳述，正文也沒有部署規模與時程。

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎

- **Cloudflare Radar 第三季記錄 49 起網路中斷，政府斷網 19 起、停電 14 起。** Cloudflare 回顧 Radar 第三季偵測並標註的 49 起中斷：政府下令斷網 19 起（其中 18 起為伊拉克的考試斷網）、停電 14 起、天然災害 5 起。例子包括古巴 9 月 18 至 20 日歷時三天的停電；宏都拉斯 9 月 10 日一處互連設施停電影響至少 11 家主要業者，全國 HTTP 流量下降 63%、約持續三小時；8 月 13 日美國鳳凰城一座資料中心的冷卻系統故障，使 Namecheap 的流量近乎全面下降 [[22. Cloudflare Blog]](#ref-22)。宏都拉斯與 Namecheap 都是單一設施故障，影響卻擴及全國或整家業者。
- **Cloudflare 第三季 DDoS 報告：短時小型攻擊成長 208%，超過 1 Tbps 的攻擊從 805 次降到 251 次。** 第 26 期報告指出，第三季自動攔截 1,820 萬次網路層攻擊與 14.4 兆次 HTTP DDoS 請求，約每小時 8,226 次網路層攻擊；網路層攻擊比 2025 年同季增加 208%，其中 96% 在 10 分鐘內結束、98% 低於 1 Gbps。超過 1 Tbps 的攻擊由第二季 805 次降至 251 次，報告推測可能與年初執法行動拆除 Aisuru、KimWolf、JackSkid 與 Mossad 四個物聯網殭屍網路有關，但 Dysphoria 等新變種持續出現；DNS 放大攻擊成長 215%，CLDAP 反射攻擊下降 99.5% [[23. Cloudflare Blog]](#ref-23)。攻擊多半在 10 分鐘內結束，等人工發現再處理會來不及。
- **Cloudflare 私有來源正式推出：來源伺服器不開放入站，也能使用 WAF、快取與 Workers。** 把已代理的 A 或 AAAA DNS 紀錄指向私有 IP，Cloudflare 會透過客戶既有的 Cloudflare One 連線抵達來源，來源不必開放防火牆入站，WAF、快取、Bot 管理、速率限制、轉換與改寫規則及 Workers 的運作與公開來源相同。此功能 6 月以封閉測試推出，現在開放給測試群組以外的客戶，仍需向帳號團隊啟用權限；對 RFC 1918、RFC 6598 CGNAT 與 RFC 4193 位址會自動啟用私有網路路由且無法關閉，API 以 DNS 紀錄的 private_routing 屬性控制。目前不支援 Argo Smart Routing 與專屬 CDN 出口 IP，來源健康檢查須搭配 Load Balancing；私有對私有流量目標 2027 年初開始封閉測試 [[24. Cloudflare Blog]](#ref-24)。
- **英國擬修法保護海底電纜，網路攻擊與遠端電子干擾也納入刑責。** 據 iThome 報導，英國政府 10 月 22 日公布白皮書，計畫提高破壞海底電纜及能源管線的刑責，並加強對海底電信基礎設施業者的安全監管；報導指出英國 99% 的國際資料流量仰賴海底電纜，現行保護法規可追溯到一百多年前。修法擬把網路攻擊、遠端電子干擾等危害設施安全的行為也納入，依蓄意、魯莽或重大過失，最高刑期分別為 14 年、10 年與 2 年；業者將被要求評估並降低安全風險、預先做好事故應變與服務復原準備，並向政府及主管機關通報安全事件 [[25. iThome]](#ref-25)。目前是政府提出的修法方案。
- **Google TPU 將進駐甲骨文 OCI，2027 年起 OCI 用戶可在同一雲端選擇 GPU 或 TPU。** 據 iThome 報導，Google 與甲骨文宣布合作，計畫 2027 年起在 OCI 提供 TPU，OCI 將成為 Google 以外首家提供 TPU 的超大規模雲端業者。甲骨文將在 OCI 資料中心部署 TPU，負責電力、液冷散熱與網路設備，用戶不必把運算移到 Google Cloud；Google 指出，資料已存放在 OCI 的企業可直接用既有資料（例如 Oracle 資料庫中的業務資料）微調模型與推論，減少跨雲傳輸。甲骨文以 Acceleron 網路技術連接 TPU、資料庫與儲存服務，並以智慧網路卡隔離不同客戶的流量 [[26. iThome]](#ref-26)。報導也提到 Google 近期開源的 TorchTPU，可減少 PyTorch 團隊更換運算晶片時要改的程式碼。

<a id="hl-fintech"></a>
### 金融科技

- **ECB 執行董事會成員 Cipollone：歐洲 2027 年 10 月 11 日轉為 T+1，以央行貨幣結算代幣化交易的 Pontes 目標 2028 年全天候營運。** Cipollone 10 月 29 日在法蘭克福的演講指出，歐洲將於 2027 年 10 月 11 日轉為 T+1 結算，T2S 的夜間結算流程調整預計 2027 年 6 月進行。代幣化方面，Eurosystem 自 3 月 30 日起接受在中央證券保管機構以分散式帳本技術（DLT）發行的可交易資產作為擔保品；Pontes 自 9 月 21 日起讓代幣化資產的批發交易以央行貨幣結算，規劃 2027 年中大幅延長營運時間、2028 年達到 24/7/365；Appia 目標在 2028 年提出藍圖。他也強調 T2S 不會很快消失，新舊基礎設施需並存 [[27. ECB]](#ref-27)。做歐洲證券交易或清算系統的團隊，可以照這些日期排時程。
- **FSB 秘書長整理近期工作：負責任採用 AI 的十二項健全做法、穩定幣跨境脆弱性與監管現代化原則。** FSB 秘書長 John Schindler 10 月 21 日在 RiskLive Asia 2026 演講（頁面註明為講者以秘書長身分的看法，不必然代表 FSB 或其成員），提到 FSB 剛發布的《負責任採用 AI 的健全做法》共十二項，定位為可調整的工具箱而非最低標準，涵蓋 AI 治理、生命週期管理、資安風險與第三方供應商監督；穩定幣跨境脆弱性的摘要已提交 G20，列出加強監測、支持 2023 年建議的落實、蒐集穩定幣危機處置規劃三個面向；公開徵詢中的八項監管現代化原則預計 2027 年定案 [[28. FSB]](#ref-28)。金融機構寫 AI 治理文件時，可以拿這十二項對照。
- **ACI Worldwide 與 Circle 合作，示範在既有支付基礎設施上整合 USDC 結算，初期聚焦哥倫比亞。** 兩家公司 10 月 27 日宣布合作，結合 ACI 的雲端原生支付協調平台 ACI Connetic 與 Circle 的 USDC 基礎設施，讓穩定幣結算與傳統支付軌道在同一平台上協調運作；實作初期聚焦哥倫比亞，ACI 在當地建置了即時支付生態系 Bre-B 的核心基礎設施。新聞稿引述 ACI 主管 Craig Ramsey，指穩定幣的討論正從可能性走向實務；新聞稿稱此合作讓機構能在熟悉的營運環境中評估新的結算模式 [[29. Circle]](#ref-29)。這是合作與示範，不是上線公告。
- **金管會鼓勵銀行提供「指定聯絡人」服務：定存解約或大額匯款時，通知客戶預先指定的親友。** 金管會 10 月 20 日表示，鼓勵金融機構依與客戶的契約約定，在定存解約或匯出大額款項時通知指定聯絡人；聯絡人不代為決定交易，也不代表所有交易都會被通知或自動停止，服務採「自由申請、自主指定」原則。截至 115 年 9 月底已有 24 家銀行開辦，另有 7 家本國銀行及中華郵政規劃於 116 年 6 月底前陸續開辦 [[30. 金融監督管理委員會]](#ref-30)。對銀行系統來說，這是在交易流程中加一道依約定條件觸發通知的規則。

<a id="hl-healthtech"></a>
### 醫療科技

- **英國無限期承認 CE 標示醫材，並尋求立法授權，為醫材發展能因應軟體與 AI 的新許可方式。** 英國政府 10 月 21 日宣布，將長期繼續接受取得歐盟 CE 標示的醫療器材與體外診斷器材（IVD）進入大不列顛市場，依據是 2 月 16 日至 4 月 10 日、逾 1,000 份回應的公開諮詢；大不列顛登記的醫材逾 90% 帶有 CE 標示，UKCA 標示仍是本地核准途徑。政府也表示將持續尋求初級立法授權，發展未來的醫材許可方式，以因應包含軟體與 AI 醫療器材在內的新技術，並呼應英國 AI 醫療照護監管國家委員會的建議 [[31. GOV.UK]](#ref-31)。已有 CE 標示的醫材與 IVD，可以繼續用它進入大不列顛市場。
- **Nature Medicine 刊出醫學視覺語言基礎模型 EVLF-FM，可做像素級定位，論文也指出常規部署前需要前瞻性臨床研究。** 論文 10 月 29 日刊出，EVLF-FM 的開發與測試涵蓋 18 個全球資料集、逾 130 萬筆樣本，跨 10 種影像模態與皮膚科、肝臟科、眼科、病理、胸腔、放射六個臨床專科，外部驗證另用 17 個資料集的 13,443 筆獨立樣本。模型支援疾病診斷、視覺問答與像素級視覺定位；內部驗證的疾病診斷平均準確度 0.895，視覺定位在 0.5 交集比的平均準確度 0.842，以 S.C.O.R.E. 框架人工評估的推理輸出整體平均 4.25/5 [[32. Nature Medicine]](#ref-32)。摘要也寫明仍需跨不同醫療場域的額外驗證。
- **STAT：更多州想在臨床場域測試 AI，可能與 FDA 的醫材管轄重疊。** STAT 10 月 30 日的 STAT+ 訂閱者報導（頁面僅公開開頭段落）指出，推動醫療 AI 採用的衛生官員正在幕後處理州與聯邦之間逐漸升高的衝突。川普政府尋求減輕健康 AI 開發商的法規負擔，並建立了新的給付方式，但各州管理醫療執業，並核發醫師與其他臨床人員的執照，若 AI 在無人監督下執行開立處方這類臨床工作，產品很可能落入負責監管醫療器材的 FDA 管轄；標題與副標寫明 FDA 與 CMS 急著避免法規堵塞，官員擔心管轄重疊的混亂可能讓醫療 AI 的採用停滯 [[33. STAT]](#ref-33)。做臨床 AI 產品的團隊，州層級的測試許可與聯邦的醫材認定要分開看。
- **FDA 加速核准首款質體 DNA 免疫療法 Voceryq，以電穿孔裝置遞送。** FDA 10 月 30 日宣布加速核准 Voceryq 用於成人復發性呼吸道乳突瘤（RRP），FDA 稱這是美國首款獲核准的質體 DNA 免疫療法，獲核准者為 Inovio Pharmaceuticals。療法經肌肉注射，並使用 CELLECTRA 5PSP 裝置以電穿孔協助遞送兩種質體，一種含 HPV 蛋白的遺傳指令，另一種含免疫增強分子 IL-12。核准依據是一項 32 名成人的開放標籤多中心試驗，在至少有三次基線手術的 26 名患者中，7 人（27%）治療後第一年不需手術 [[34. U.S. FDA]](#ref-34)。這是加速核准，製造商須進行核准後試驗驗證臨床效益。
- **Anthropic 公布 Claude 參與藥物開發的早期案例，並收購單人公司 Mithril Medicine。** Anthropic 10 月 27 日說明與六家藥物開發機構的研究合作：Generate 的六位科學家用 Claude Code 提出 CAR-T 基因指令片段的新設計，其中一款縮短約 70%，實驗室測試中免疫細胞產生的受體約多 10 倍；Claude 為 Divergence Labs 在約一個月內大致自主產生約 35,000 個抗體設計；Enveda 以 1,061 頁文件測試，Claude 抓出人工審查發現的全部 11 個問題並另標出 7 個，審查時間減少 89%。Mithril Medicine 的創辦人以 Claude 協調 11 家外部實驗室，不到 18 個月讓一種肌肉失養症候選療法在小鼠取得有希望的結果，Anthropic 表示若候選藥物持續有效，預期最快 2028 年底可準備進入人體試驗 [[35. Anthropic]](#ref-35)。Anthropic 自己也說，這些研究多數仍在臨床前階段。

<a id="hl-logistics"></a>
### 運輸物流

- **Aurora 與 Charger Logistics 簽非約束性備忘錄，Charger 有意購買最多 500 輛無人駕駛卡車。** Aurora 10 月 26 日宣布，貨運業者 Charger Logistics 有意購買最多 500 輛搭載 Aurora Driver 的卡車，預計 2027 與 2028 年交付；新聞稿強調這是非約束性 MOU，建立在雙方 7 月的既有合約上。最終協議簽定後，Charger 打算採用 Driver as a Service（DaaS）模式，由業者持有實體車輛，部署在邊境附近與全國的高流量路線；Aurora 表示 DaaS 協議是其 2030 年擴展到 30,000 輛無人駕駛卡車計畫的關鍵部分 [[36. Aurora]](#ref-36)。MOU 不具約束力，數量要等最終協議。
- **佛羅里達完成 eIPP 首批示範飛行，Joby 與 BETA 的電動飛機飛越坦帕灣。** 美國運輸部 10 月 30 日宣布，佛州完成 eVTOL 整合試辦計畫（eIPP）的首批示範飛行，成為依該計畫啟動的第七個地點；佛州運輸部與 Joby、BETA Technologies 合作，重現 1914 年世界首次定期客運航班的路線，BETA 的 Alia CX300 電動傳統起降機與 Joby 的 S4 電動垂直起降機自 Albert Whitted 機場飛往坦帕，測試坦帕灣上空的貨運與航線。11 月佛州運輸部與 Electra 將在佛州中部多處進行飛行測試，FAA 可能運用試辦資料制定新規 [[37. U.S. FAA]](#ref-37)。eIPP 共有八個入選專案，橫跨 28 州。
- **Toyota 與 Waymo 合作進入下一階段：2027 年在日本測試與驗證自駕版 bZ4X 車隊。** 兩家公司 10 月 30 日宣布，延續 2025 年 4 月公布的初步協議，2027 年在日本開始測試與驗證自駕版 Toyota bZ4X 車隊，並規劃在之後幾年部署到英國及其他 Waymo 服務市場；Toyota 將在愛知縣豊田市的高岡工廠一站式完成基礎車輛組裝與 Waymo 自駕硬體整合。雙方也會繼續探討個人自有 Toyota 車輛的自駕技術，並與 Woven by Toyota 研究提升其他用路人安全的方案 [[38. Waymo]](#ref-38)。
- **Maersk 在新加坡為改裝雙燃料船加註約 5,000 公噸生質乙醇，標題稱為全球最大規模的乙醇加註。** Maersk 10 月 19 日宣布，改裝雙燃料船 Maersk Halifax 在新加坡完成乙醇加註，新聞稿稱這是 Maersk 船隊首度在改裝船上加註乙醇；作業與新加坡海事及港務局（MPA）等夥伴合作，加註約 5,000 公噸通過 ISCC 認證的生質乙醇，並在加註同時進行貨物作業。Maersk 表示此次作業提供了基礎設施、採購、供應鏈準備度與船舶營運的實務經驗；能源市場主管 Emma Mazhari 說，公司延續多燃料策略，今年稍早已在 Laura Maersk 等三艘船上做過乙醇試驗 [[39. Maersk]](#ref-39)。
- **台北市兩處多事故路口 11 月起測試多功能科技執法，明年 2 月正式取締。** 中央社報導，台北市警察局交通警察大隊 10 月 30 日表示，因交通事故多，擇定中山北路與民權西路口、士商路與承德路口，自 11 月 1 日起測試路口多功能科技執法設備，宣導期 3 個月，明年 2 月 1 日起正式啟用取締；兩處的取締項目依路口不同，合計包括闖紅燈、不停讓行人、不依規定轉彎、行駛公車專用道、機車未依規定車道行駛與違規停車等。宣導期間會以掛號寄送免裁罰的宣導通知單 [[40. 中央社]](#ref-40)。報導沒有說明設備採用何種辨識技術。
- **鴻海科技日發表 3 款參考設計電動車，電動移動布局延伸到日本 K-Car 輕型貨車級距。** 中央社報導，鴻海 10 月 30 日舉行年度科技日（HHTD 26），發表休旅車設計概念的 Model A+、Model K+ 與小型貨卡 Model K，並展示右駕版 Model B；電動車事業策略長關潤表示，集團 6 年前推出首款參考車型以來，參考設計電動車陣容累計 12 款。鴻海說明 Model K+ 的目標客戶包括想開發自有品牌電動休旅車的 B2B 業者，Model K 則因應配送、行動商業與防災等商用需求；現場也展示從材料、電芯、電池模組到電池管理系統（BMS）的研發成果與 E/E 架構 [[61. 中央社]](#ref-61)。報導沒有提到自駕功能與量產時程。

<a id="hl-proptech"></a>
### 房地產與室內外裝潢

- **セレンディクス用建設用 3D 列印機，在大分縣的水力發電所蓋了一棟值班站房。** ITmedia BUILT 報導，セレンディクス（Serendix）10 月 26 日發表，已在大分縣內的水力發電所設施建成一棟詰所（供設備管理作業員使用的站房），該公司稱發電所設施採用建設用 3D 列印建造物屬世界首例。建物為平房鋼筋混凝土造，延床面積約 20 平方公尺，設有休息空間、倉庫與廁所；連屋頂在內分成十幾個部件，在熊本縣水俣市的合作工廠列印後，再到現場組裝 [[41. ITmedia BUILT]](#ref-41)。CTO 飯田國大把建設用 3D 列印機定位為「使建設現場自動化的機器人平台」；該公司今後將把 B2B 事業擴大到鐵道、橋梁與災害應對等社會基礎設施。
- **Bedrock Robotics 募得 6 億美元，要把自主挖土機技術擴展到混合重型機具車隊。** Construction Dive 報導，把重型機具改成自主機具的 Bedrock Robotics 完成 6 億美元 C 輪募資，由 CapitalG 與 Emergence Capital 共同領投，累計募資接近 10 億美元，募後估值 41 億美元；依公司公告，公司目標是以資金從挖土機擴展到混合重型機具車隊，2025 年以來客戶量成長超過一倍，客戶包括 Sundt Construction 與 Zachry Construction，機器已在進行中的工地執行付費工作。報導也列出同類募資：瑞士新創 Gravis Robotics 8 月完成 2 億美元 A 輪、FieldAI 去年募得 4.05 億美元，以機器人 3D 列印大型結構的 Icon 10 月 13 日宣布完成 2 億美元 D 輪 [[42. Construction Dive]](#ref-42)。
- **MIT 用摺紙式模組做出不需內部支柱的承重殼層，組裝只需螺絲起子等手工具。** MIT News 報導，研究人員把鋁板等平面板材摺成單元，再連成不需內部支柱的承重殼層結構；自動化求解器依使用者指定的結構設計出可製造的單元，設計檔可交給 CNC 銑床從平板切出構件。模擬顯示其結構剛性約為其他部分摺紙技術的 3.5 倍，並依文中說法只需約三分之二的材料；團隊在波士頓公共圖書館掛設一件 23 英尺的鋁製摺疊雕塑；據第一作者 Parra Rubio 說，雕塑由沒有專業營建經驗的團隊在數日內搭成 [[43. MIT News]](#ref-43)。MIT News 指此法可能特別適合可平板運送、快速架設的災後避難所，研究者下一步希望測試更大的建築結構。
- **竹中工務店把耐火集成材「燃エンウッド」的技術授權開放給民間建築工程。** ITmedia BUILT 報導，竹中工務店 10 月 22 日宣布，燃エンウッド的 1 小時與 2 小時耐火規格開始提供民間建築工程用的技術授權，對象是由有木造耐火建築設計實績的設計事務所設計、並由竹中以外的施工公司施工的建物，公共與民間建築皆可使用。過去只對公共建築工程授權，已與齋藤木材工業、藤壽產業、銘建工業、山佐木材 4 家集成材廠簽約；公共建築採用這兩種規格時，可用於 14 層樓的木造建築，或最上層起 14 層為木造的建物。授權內容包含專利技術、大臣認定與商標使用 [[44. ITmedia BUILT]](#ref-44)。

<a id="hl-arts"></a>
### 現場表演藝術

- **Garth Brooks 因機器人搶票，開賣 30 多分鐘就停售堪薩斯城加場。** Digital Music News 報導，Garth Brooks 上週末中止 11 月 7 日堪薩斯城 T-Mobile Center 加場的售票並親自致歉，把原因歸咎於過度的機器人（bot）活動，稱情況在這次巡演中「逐步惡化」；票券經 AXS 於中部時間上午 10 點開賣，約 10:35 出現停售通知，10:49 出現 Brooks 本人的訊息。上個月他也因同樣原因，在開賣 30 分鐘後停售鹽湖城 Delta Center 10 月 11 日場次，那場的票券由 SeatGeek 發售 [[45. Digital Music News]](#ref-45)。兩場用的是不同售票平台，Brooks 都歸咎於機器人。
- **巴西在 BTS 聖保羅演唱會前，命令 StubHub 等 5 個轉售平台 72 小時內停止轉售。** Digital Music News 報導，巴西聯邦消費者保護機構 Senacon 命令 StubHub、TicketSwap、Viagogo、BuyTicket 與 FunBuyNet，在 BTS 10 月 28、30、31 日於 Estádio do MorumBIS 的 3 場演出前停止促成轉售，指稱它們違反透明度、總價揭露與申訴及取消管道的要求；違反時每日罰款 10 萬巴西雷亞爾。報導指出這是 8 月 31 日簽署的巴西「Taylor Swift 法」之後的執法，該法要求揭露原價與附加費用，規範虛擬排隊、取消與轉讓權，並要求轉售公司讓政府存取資料 [[46. Digital Music News]](#ref-46)。在巴西，售票系統的總價揭露與虛擬排隊已經寫進法律。
- **《David Bowie: Stage》用未公開的 35mm 底片、透明 LED 與每個座位的 7.1 環繞聲，把 1978 年巡演帶進大型室內場館。** Digital Music News 報導，前 AEG Live 總裁 Rob Hallet 的 Wonderworld 與 Bowie 遺產管理方、導演 Brett Morgen 合作，2027 年 2 月 14 日在柏林 Uber Arena 全球首演，票券 10 月 28 日開賣。內容取自 Isolar II 巡演未曾公開的 35mm 原始底片，以多螢幕呈現，整合 Patrick Woodroffe 設計的燈光與 Paul Massey 的沉浸式混音；依製作方說法，音響採 Clair Global 系統與進階 DSP 演算法搭配吊掛陣列，為每個座位提供 7.1 環繞聲，視覺採 Unilumin/Roe 全幅透明 LED 螢幕，營造 Bowie 與樂團身在舞台上的錯覺 [[47. Digital Music News]](#ref-47)。首演後將展開全球巡演，場館容量從 5,000 席起跳。
- **北美館坂本龍一回顧展 10 月 31 日開展，裝置作品把電磁波與降雨資料轉成聲音和影像。** 中央社報導，「坂本龍一｜觀音．聽時」10 月 31 日起在台北市立美術館展至 2027 年 3 月 14 日，策展人難波祐子表示，展出的 7 組裝置作品橫跨 20 年以上，這是首次在台灣呈現。真鍋大度與坂本龍一合作的「感測流 2026——不可見、不可聞（台北版）」透過北美館外的天線，以帶狀 LED 顯示器把城市中無法直接察覺的電磁波轉為可聽可看的感知場域；高谷史郎與坂本龍一的「水的樣態 1」擷取包含台北氣象衛星在內的降雨量資訊；「LIFE——流動、無形、無聲……」以歌劇 LIFE 為基礎，透過演算法生成不斷變化的視聽景象 [[48. 中央社]](#ref-48)。
- **Sphere 要在華府近郊的 National Harbor 蓋 6,000 席場館，郡議會 8 比 0 通過約 2 億美元融資。** Digital Music News 報導，馬里蘭州 Prince George's 郡議會週二以 8 比 0 通過最終表決，授權發行最多 2.15 億美元的特別義務債券協助興建，由 Sphere Entertainment 逐步償還；條件包括郡政府興建 4,000 萬美元停車場、提供 1.3 億美元債券融資，州政府另提供逾 1,300 萬美元。專案總成本約 14 億美元，動土典禮將於近期排定，目標 2030 年初開幕；郡長 Aisha Braveboy 稱此案對郡帶來 13 億美元、對馬里蘭州帶來 15 億美元的經濟效益 [[49. Digital Music News]](#ref-49)。報導也指出，勞資和平協議不如原先期待，且不涵蓋營建工人。

<a id="hl-entertainment"></a>
### 影視音樂

- **貓王音樂作品的授權機構控告 Anthropic，指稱以 274 首歌曲訓練 AI 模型。** 中央社綜合外電、引述英國《衛報》報導，貓王音樂作品與肖像權的授權機構 Authentic Brands Group 23 日向 Anthropic 提告，指控其未經許可使用貓王 274 首歌曲訓練 AI 模型，此案由《告示牌》率先披露；訴狀指稱 Claude 對網路上幾乎每首歌都生成侵權內容，首席律師 Richard Busch 並在訴狀中寫道，被告把整個商業模式建立在大規模著作權侵權上，訴狀並稱 Anthropic 設置護欄後仍知情且持續故意侵權。原告尋求每首歌 15 萬美元，總額約 4,100 萬美元 [[50. 中央社]](#ref-50)。報導稱此案是藝人遺產管理機構直接對 AI 開發商發起的首批重大法律挑戰之一；目前都是原告的主張。
- **文策院 TCCF 迎 251 名國際買家，並預告與特效公司 Wētā FX 的發布會。** 中央社報導，2026 TCCF 創意內容大會 11 月 6 日至 9 日在南港展覽館二館 7 樓登場，市場展迎接來自 28 個國家與地區的 251 名國際買家，以韓國為大宗；提案大會入選企劃中，台灣主導或參與的跨國合製占比突破 6 成，今年新增與金馬獎合作的台灣新秀演員推介會，並首度舉辦特映會。董事長王時思透露，大會期間的 4 場產業發布會之一是文策院與 Wētā FX 的發布會，並稱在大眾對生成式 AI 應用於文化內容仍有疑慮時，特效與後製應是適合切入的主題 [[51. 中央社]](#ref-51)。國際論壇也將探討短影音、生成式 AI 重塑產製流程等趨勢。
- **Suno 在 UMG 訴訟中反對 Apple 撤銷傳票，要求取得 Apple Music 的 AI 授權條款資訊。** Digital Music News 報導，在 UMG 對 Suno 的訴訟中，Suno 以 24 頁書狀反對 Apple 撤銷傳票的聲請，主張 Apple Music 與主要唱片公司的授權談判、「反 AI 條款」等資訊，對其合理使用與著作權濫用抗辯至關重要；Apple 則稱這些議題無關、過於寬泛且不成比例。報導稱爭點似乎卡在 4 項修改後的證詞議題，包括 Apple Music 與環球、索尼目前的授權談判與其中的 AI 倡議、沒有主要唱片公司曲庫時的商業可行性、串流詐騙情形等；合理使用第四要素涉及市場影響，Suno 因此主張 Apple Music 的 AI 合約條款（包括保證最低版稅與把 AI 內容排除於版稅池的條款）與本案相關 [[52. Digital Music News]](#ref-52)。
- **據《金融時報》的匿名消息，Spotify 準備明年初推出 AI 翻唱與混音工具，Premium 訂閱戶每月可能多付 4 至 5 美元。** Digital Music News 轉述《金融時報》的報導，並提醒應保留看待：工具可能搭配 2 月的第 69 屆葛萊美獎亮相，美國定價可能為每月 5 美元。報導指出環球音樂、Believe/TuneCore、Kobalt 與 Merlin 已簽相關授權，索尼、華納與 BMG 不在名單上，但 Spotify 高層先前說不需要「完整曲庫」就能起步；Spotify 也將面對 Suno 與華納、三大唱片公司與 Klay Vision、Udio、環球與 ElevenLabs 等生成式 AI 競爭 [[53. Digital Music News]](#ref-53)。這是匿名消息來源的報導，不是 Spotify 的官方宣布。

<a id="hl-others"></a>
### 其他領域科技應用突破

- **IBM 用 4 條 80 公分的 l-coupler 連接兩顆 Nighthawk 量子處理器，量子態傳輸保真度平均 99%。** IBM Quantum 部落格指出，研究人員在稀釋冰箱內以 4 條 l-coupler 連接兩顆 IBM Quantum Nighthawk R1 處理器，量子態傳輸保真度最高 99.3%、平均 99%；以跨模組傳輸量子態建構的遠端 CZ 閘，4 條連結的平均雙量子位元閘保真度為 94.75%，可產生兩模組共享的糾纏態。IBM 稱據其所知，這是首次以多條量子通道連接超導量子處理器並達到平均 99% 的傳輸保真度，並表示這條路可擴展到容錯的 IBM Quantum Starling [[54. IBM Quantum Blog]](#ref-54)。實驗只引出部分量子位元供開發，IBM 列出的下一步是改善良率、重現性與錯誤率。
- **NASA 發出徵求資訊書，探詢產業界能否把哈伯推到更高軌道或提供在軌維護。** NASA 10 月 29 日發出徵求資訊書（RFI），徵詢項目包括以任務把哈伯推升到較高軌道以延長科學壽命、維護哈伯以強化其能力，或在任務結束時執行安全受控的再入大氣層或軌道處置。哈伯沒有推進系統，高度因大氣阻力緩慢下降，分析預測哈伯可能在 2033 至 2034 年間再入大氣層，因此 NASA 預期任務需在 2032 年前執行；回覆截止為 11 月 30 日 [[55. NASA Science]](#ref-55)。局長 Jared Isaacman 表示，若有創新且符合成本效益的方式延長在軌資產壽命，NASA 有責任為納稅人與科學界探索；這是徵求資訊，不是採購決定。
- **Google Project Suncatcher 的原型衛星在軌道上用 TPU 跑 Gemma 4，傳回第一首俳句。** Google 官方部落格的 Google Research 文章指出，原型衛星 10 月 1 日發射，團隊花數週完成試運轉檢核，本週達成「Hello World」里程碑：在地面站過境時上傳第一道提示，請衛星上的 Gemma 4 開放模型寫一首關於太空的俳句，衛星經過挪威斯瓦巴時下傳詩作；Google 稱這是資料中心等級 TPU 在軌道上的第一個 AI 回應。之後還測試了打油詩與回報酬載系統狀態的遙測提示，接下來將評估 TPU 在軌道上承受熱應力與輻射的表現，為 2027 年兩顆互連衛星的下一個里程碑鋪路 [[56. Google Blog]](#ref-56)。
- **宜蘭大學王金燦以 AI 結合數位孿生的微生物燃料電池廢水處理技術，獲史蒂維科技卓越獎金獎。** 中央社巴黎專電報導，國立宜蘭大學特聘教授王金燦以結合人工智慧、數位孿生與生物電化學的廢水能源化技術，獲史蒂維科技卓越獎綠色潔淨科技類別「永續與節能運算卓越獎」金獎，28 日在巴黎領獎。他表示，技術以微生物燃料電池為核心，結合 AI 預測、即時感測、數位孿生與熱流分析，處理廢水、去除污染物的同時，利用微生物分解有機物時產生的能量回收電力；團隊以 AI 分析水質、流量、電壓與操作條件的關係，預測能源產出與污染物去除效率 [[57. 中央社]](#ref-57)。技術細節都來自受訪者說法。

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技

- **前沿模型的資安能力開始決定誰先拿到。** Gemini 4 Carbon 先只給受信任的資安防禦人員 [[1. iThome]](#ref-1)，Mistral Large 4 的資安專用變體只向經審查的設計夥伴預覽 [[3. Mistral AI]](#ref-3)。同一代模型，一般開發者拿到的時間與版本可能和資安團隊不同。
- **代理影響的不只是程式碼，也包括人的分析判斷。** Anthropic 的實驗中，分析師多數選擇與代理被設定的傾向一致，事後也很少說明論述出自代理 [[4. Anthropic]](#ref-4)。代理參與產出的分析報告，審查時要回頭看哪些關鍵選擇是代理先提的。
- **Anthropic 同週有兩個非模型的大動作。** 一是提交 S-1 申請上市 [[6. Anthropic]](#ref-6)，二是公布藥物開發合作並收購 Mithril Medicine [[35. Anthropic]](#ref-35)；模型公司的業務不再只有 API 與訂閱。
- **世界模型開始走向開發者端。** Genie 4 先給一小群受信任測試者，之後讓早期合作夥伴透過 Gemini API 與 AI Studio 使用 [[58. Google Blog]](#ref-58)；Google 把模擬世界定位為機器人與代理的安全訓練環境，這類模型未來可能成為代理訓練資料的來源之一。

<a id="tr-software"></a>
### 軟體工程

- **編輯器與 CLI 開始把第三方代理當成一般使用情境。** Android Studio 透過 Agent Client Protocol 支援 40 多個相容代理，Android CLI 另有 Claude 與 Codex 外掛 [[8. Android Developers Blog]](#ref-8)；JetBrains 換掉終端機引擎，主要為了改善 Claude Code、Codex 等代理與 Neovim、tmux 等工具在 IDE 裡的相容性 [[11. iThome]](#ref-11)；GitHub 則讓同一個雲端代理工作階段跨 app、VS Code、CLI 與網頁延續 [[7. GitHub Blog]](#ref-7)。
- **工具的版本與模型生命週期要列入維運。** Node.js 26 轉 LTS 並提醒 libatomic 相依 [[9. Node.js]](#ref-9)，Claude Code 預告 Opus 4.8 快速模式移除後不會自動退回 [[10. GitHub Releases]](#ref-10)；沒跟上的話，CI 或腳本可能在升級或移除日出錯。

<a id="tr-security"></a>
### 軟硬體資訊安全

- **單一漏洞被串成攻擊鏈。** PHP2Shell 搭上 Linux 核心提權漏洞 Fragnesia，入侵 PAN-OS 設備並拿到 root [[13. iThome]](#ref-13)；Brotli 漏洞的修補範圍則從 Node.js 擴及 .NET、PHP、Python 與多個 Linux 發行版 [[14. iThome]](#ref-14)。修補時要看的不只是直接用到的元件。
- **AI 推論服務的租戶隔離是新的資安面。** Cloudflare 的事件來自快取池容量與推論引擎拒絕路徑之間的落差 [[15. Cloudflare Blog]](#ref-15)，屬於推論引擎的設定錯誤加上引擎處理超長請求的缺陷；PAN-OS 一案的攻擊基礎設施中也出現 Claude Code 等 AI 工具 [[13. iThome]](#ref-13)。
- **PHP2Shell 進入聯邦強制修補的範圍。** CISA 把兩個漏洞列入 KEV，BOD 26-04 同時要求機關檢查修補前是否已被入侵 [[59. CISA]](#ref-59)；對已公開遭利用的漏洞，升級版本之後還要回頭查入侵跡證。

<a id="tr-hardware"></a>
### 硬體或軟硬整合

- **OCI 成為本期多家晶片廠的交會點。** Intel 規劃以 Diamond Rapids 擴充 OCI [[20. Intel Newsroom]](#ref-20)，Google TPU 也將在 2027 年進駐 OCI [[26. iThome]](#ref-26)。OCI 上的加速器選項變多，模型團隊選雲時可比較的組合也變多。
- **Mac 加入觸控，Apple 也更新了手勢 API。** 觸控 MacBook Pro 讓 macOS 自動把觸控轉成點擊 [[17. Apple Newsroom]](#ref-17)，同週的 M6 款則保留原本的 Liquid Retina XDR 顯示器 [[18. Apple Newsroom]](#ref-18)；更新後的手勢 API 讓開發者能打造專為觸控設計的體驗。
- **Meta 同週擴大與兩家 GPU 廠的合作。** AMD 的初期 Helios 機櫃已在 Meta 安裝測試 [[19. AMD]](#ref-19)，NVIDIA 則宣布 Meta 打算擴大部署 Vera Rubin 與 Vera CPU，並將投資 30 億美元於 Meta 的股票發行 [[60. NVIDIA Newsroom]](#ref-60)；同一家模型公司的基礎設施同時建立在不只一家加速器上。

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎

- **實體設施仍是網路中斷的常見來源。** Radar 第三季的停電、冷卻故障與互連設施事故 [[22. Cloudflare Blog]](#ref-22)，以及英國把海底電纜的網路攻擊與遠端干擾納入刑責的修法方案 [[25. iThome]](#ref-25)，兩者都和實體設施有關。
- **防護從「開放入站再過濾」走向「來源不開入站」。** Cloudflare 私有來源讓來源伺服器不必開放入站 [[24. Cloudflare Blog]](#ref-24)；DDoS 報告中的攻擊多半在 10 分鐘內結束 [[23. Cloudflare Blog]](#ref-23)，防護要靠自動化而不是人工切換。

<a id="tr-fintech"></a>
### 金融科技

- **代幣化與穩定幣正在接上既有的結算基礎設施。** ECB 的 Pontes 已讓代幣化資產以央行貨幣結算，並與 T2S 並存 [[27. ECB]](#ref-27)；ACI 與 Circle 示範把 USDC 結算放進既有的支付協調平台 [[29. Circle]](#ref-29)；FSB 則把穩定幣跨境脆弱性提交 G20 [[28. FSB]](#ref-28)。
- **防詐與 AI 治理都落到具體流程。** 金管會的指定聯絡人服務是交易流程中的通知規則 [[30. 金融監督管理委員會]](#ref-30)，FSB 的十二項 AI 健全做法定位為工具箱 [[28. FSB]](#ref-28)；兩者都不是硬性門檻，但都需要系統端實作。

<a id="tr-healthtech"></a>
### 醫療科技

- **醫療 AI 的關卡在監管與驗證。** 英國為醫材尋求能因應軟體與 AI 的新許可方式 [[31. GOV.UK]](#ref-31)，美國州與聯邦對執行臨床工作的 AI 有重疊管轄 [[33. STAT]](#ref-33)，EVLF-FM 的論文也寫明常規部署前需要前瞻性臨床研究 [[32. Nature Medicine]](#ref-32)。模型準確度之外，產品要先想清楚歸誰管、怎麼驗證。
- **AI 進入藥物開發的文件與營運工作。** Anthropic 的案例除了分子與抗體設計，也包括 Enveda 的製造文件審查與法規文件初稿，以及 Mithril 以 Claude 協調外部實驗室 [[35. Anthropic]](#ref-35)；FDA 核准的 Voceryq 則是以電穿孔裝置遞送的生物製劑 [[34. U.S. FDA]](#ref-34)。

<a id="tr-logistics"></a>
### 運輸物流

- **自駕的商業化走向分工。** Aurora 的 DaaS 讓貨運業者持有車輛、以訂閱方式取得自駕系統 [[36. Aurora]](#ref-36)，Toyota 在工廠產線上整合 Waymo 的自駕硬體 [[38. Waymo]](#ref-38)；車輛、自駕系統與營運不必由同一家公司包辦。
- **新航空與新燃料都在示範階段累積資料。** eIPP 的示範飛行可能成為 FAA 制定新規的依據 [[37. U.S. FAA]](#ref-37)，Maersk 的乙醇加註累積的是供應鏈與營運經驗 [[39. Maersk]](#ref-39)；台北的路口科技執法也先有 3 個月宣導期 [[40. 中央社]](#ref-40)。
- **台灣製造業以參考設計切入電動車。** 鴻海的參考設計電動車累計 12 款，布局延伸到日本 K-Car 輕型貨車級距，目標客戶包括想做自有品牌車款的 B2B 業者 [[61. 中央社]](#ref-61)；車輛平臺、E/E 架構與電池系統由同一家供應商提供，品牌方可以在上面開發自己的車款。

<a id="tr-proptech"></a>
### 房地產與室內外裝潢

- **營建自動化從單一機具走向車隊與平台。** Bedrock Robotics 要從挖土機擴展到混合重型機具車隊 [[42. Construction Dive]](#ref-42)，セレンディクス把 3D 列印機定位為「使建設現場自動化的機器人平台」[[41. ITmedia BUILT]](#ref-41)。
- **結構與材料的創新在降低施工門檻。** MIT 的摺紙式模組只需手工具組裝 [[43. MIT News]](#ref-43)，竹中工務店開放其他施工公司施工的民間建物使用耐火集成材 [[44. ITmedia BUILT]](#ref-44)；兩者都放寬了誰能使用這些工法。

<a id="tr-arts"></a>
### 現場表演藝術

- **售票的戰場在機器人與轉售管制。** Garth Brooks 兩度因機器人停售，用的是不同售票平台 [[45. Digital Music News]](#ref-45)；巴西則直接以法律規範總價揭露、虛擬排隊與轉售 [[46. Digital Music News]](#ref-46)。
- **沉浸式展演倚重影音工程。** 《David Bowie: Stage》以透明 LED 與逐座位 7.1 環繞聲重現演出 [[47. Digital Music News]](#ref-47)，坂本龍一展以天線與氣象資料驅動作品 [[48. 中央社]](#ref-48)，Sphere 則要在華府近郊新蓋場館 [[49. Digital Music News]](#ref-49)。

<a id="tr-entertainment"></a>
### 影視音樂

- **AI 音樂的爭議進入訴訟細節與授權條款。** 貓王權利人以歌曲數與每首求償金額起訴 Anthropic [[50. 中央社]](#ref-50)，Suno 要求 Apple 交出 AI 授權條款資訊 [[52. Digital Music News]](#ref-52)，Spotify 的 AI 工具目前只有部分唱片公司與發行商授權 [[53. Digital Music News]](#ref-53)。訓練資料與生成功能的授權範圍，要靠訴訟與合約來界定。
- **文策院對生成式 AI 選擇從特效與後製切入。** 文策院董事長認為特效與後製是適合切入的主題，並安排與 Wētā FX 的發布會 [[51. 中央社]](#ref-51)。

<a id="tr-others"></a>
### 其他領域科技應用突破

- **太空與量子都在處理「連接」與「延壽」。** IBM 以 l-coupler 連接兩顆量子處理器，走模組化擴展 [[54. IBM Quantum Blog]](#ref-54)；NASA 徵詢延長哈伯壽命的商業方案 [[55. NASA Science]](#ref-55)；Google 把資料中心等級的 TPU 送上軌道，下一步是兩顆互連衛星 [[56. Google Blog]](#ref-56)。
- **AI 加數位孿生進入環境工程。** 宜蘭大學的廢水能源化技術以 AI 預測與數位孿生模擬系統表現 [[57. 中央社]](#ref-57)，不過細節目前只有受訪者說法。

<a id="references"></a>
## 參考資料

| 編號 | 文章標題與搜尋連結 | 一句話繁體中文結論或亮點 | 發布日期 | 來源資料網址與名稱 | 分類 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ref-1"></a>1 | [Google發表Gemini 4 Carbon，綜合能力評測登頂、資安表現創新高](https://www.google.com/search?q=Gemini+4+Carbon+iThome) | Gemini 4 Carbon 在 Artificial Analysis 指數居首，先限縮開放給受信任的資安防禦人員。 | 2026-10-29 | [iThome](https://www.ithome.com.tw/news/180049) | AI 科技 |
| <a id="ref-2"></a>2 | [OpenAI新模型GPT-6.1 Terra強化視覺與電腦操作，API價格僅Sol一半](https://www.google.com/search?q=GPT-6.1+Terra+iThome) | GPT-6.1 Terra 強化視覺與電腦操作，API 價格為 GPT-6.1 Sol 的一半。 | 2026-10-27 | [iThome](https://www.ithome.com.tw/news/179985) | AI 科技 |
| <a id="ref-3"></a>3 | [Mistral Large 4 (Le Chonk) is now open weight ｜ Built for Coders, Trusted by Defenders.](https://www.google.com/search?q=Mistral+Large+4+Le+Chonk+open+weight) | 1 兆參數的 Mistral Large 4 釋出權重，官方基準主打程式代理與防禦性資安。 | 2026-10-29 | [Mistral AI](https://mistral.ai/news/mistral-large-4-oss/) | AI 科技 |
| <a id="ref-4"></a>4 | [How AI agents shape experts’ judgment calls](https://www.google.com/search?q=Anthropic+How+AI+agents+shape+experts+judgment+calls) | 分析師與 Claude Code 合作時，86% 的分析選擇與代理被設定的傾向一致。 | 2026-10-27 | [Anthropic](https://www.anthropic.com/research/agents-judgment-calls) | AI 科技 |
| <a id="ref-5"></a>5 | [國科會：TAIDE已進一步發展　年底前公布新模型](https://www.google.com/search?q=%E5%9C%8B%E7%A7%91%E6%9C%83+TAIDE+%E5%B9%B4%E5%BA%95%E5%89%8D%E5%85%AC%E5%B8%83%E6%96%B0%E6%A8%A1%E5%9E%8B+%E4%B8%AD%E5%A4%AE%E7%A4%BE) | 國科會稱 TAIDE 預計年底前公布含語言模型與行為模型的新模型並開放民間使用。 | 2026-10-27 | [中央社](https://www.cna.com.tw/news/aipl/202610270268.aspx) | AI 科技 |
| <a id="ref-6"></a>6 | [Anthropic files S-1 with the SEC for proposed initial public offering](https://www.google.com/search?q=Anthropic+files+S-1+SEC+initial+public+offering) | Anthropic 提交 S-1，擬以代號 ANT 在 Nasdaq 掛牌，股數與價格尚未決定。 | 2026-10-26 | [Anthropic](https://www.anthropic.com/news/s1-sec) | AI 科技 |
| <a id="ref-7"></a>7 | [GitHub Universe 2026: Evolving every layer of the stack](https://www.google.com/search?q=GitHub+Universe+2026+Evolving+every+layer+of+the+stack) | Copilot Fusion 依任務協調一個或多個模型，Enterprise 可改依 AI 點數使用全部 Copilot 功能。 | 2026-10-28 | [GitHub Blog](https://github.blog/news-insights/company-news/github-universe-2026-evolving-every-layer-of-the-stack/) | 軟體工程 |
| <a id="ref-8"></a>8 | [What's new in Android developer tools and performance at Android Dev Summit](https://www.google.com/search?q=Android+Dev+Summit+developer+tools+performance+2026) | Android Studio 自帶代理轉為穩定版，Android CLI 可取用實體裝置與無模擬器預覽。 | 2026-10-28 | [Android Developers Blog](https://developer.android.com/blog/posts/android-dev-summit-26-developer-tools-performance) | 軟體工程 |
| <a id="ref-9"></a>9 | [Node.js 26.13.0 (LTS)](https://www.google.com/search?q=Node.js+26.13.0+LTS+Lithium) | Node.js 26 轉為 LTS（Lithium），支援至 2029 年 4 月底。 | 2026-10-28 | [Node.js](https://nodejs.org/en/blog/release/v26.13.0) | 軟體工程 |
| <a id="ref-10"></a>10 | [Release v2.1.316 · anthropics/claude-code](https://www.google.com/search?q=Claude+Code+v2.1.316+release) | 新增子代理推理強度環境變數，Opus 4.8 快速模式 11 月 30 日移除。 | 2026-10-31 | [GitHub Releases](https://github.com/anthropics/claude-code/releases/tag/v2.1.316) | 軟體工程 |
| <a id="ref-11"></a>11 | [JetBrains IDE終端機改採libghostty，改善AI代理與TUI工具操作相容性](https://www.google.com/search?q=JetBrains+libghostty+%E7%B5%82%E7%AB%AF%E6%A9%9F+iThome) | JetBrains IDE 終端機改用 libghostty，支援 Kitty 鍵盤協定。 | 2026-10-28 | [iThome](https://www.ithome.com.tw/news/180036) | 軟體工程 |
| <a id="ref-12"></a>12 | [Linux TCP漏洞可被用來遠端取得root權限，部分發行版尚未修補](https://www.google.com/search?q=CVE-2026-98432+Linux+TCP+MPTCP+iThome) | Linux 核心 TCP 漏洞在 MPTCP 服務上可遠端取得 root，部分發行版尚未修補。 | 2026-10-30 | [iThome](https://www.ithome.com.tw/news/180101) | 軟硬體資訊安全 |
| <a id="ref-13"></a>13 | [PHP2Shell與Linux核心漏洞被串連利用，中國駭客藉此取得25臺防火牆root權限](https://www.google.com/search?q=PHP2Shell+Fragnesia+PAN-OS+iThome) | PHP2Shell 串連 Linux 核心提權漏洞 Fragnesia，入侵 PAN-OS 設備取得 root。 | 2026-10-30 | [iThome](https://www.ithome.com.tw/news/180111) | 軟硬體資訊安全 |
| <a id="ref-14"></a>14 | [Google Brotli漏洞恐造成資訊洩漏及阻斷服務，.NET、PHP與Linux陸續修補](https://www.google.com/search?q=Brotli+CVE-2026-111497+iThome) | Brotli 越界寫入漏洞 CVE-2026-111497，.NET、PHP、Python 與 Linux 發行版陸續修補。 | 2026-10-28 | [iThome](https://www.ithome.com.tw/news/180003) | 軟硬體資訊安全 |
| <a id="ref-15"></a>15 | [Cross-request KV cache exposure in the GLM-5.3 Workers AI model, and our remediation with SGLang](https://www.google.com/search?q=Cloudflare+KV+cache+exposure+GLM-5.3+SGLang) | GLM-5.3 因 KV 快取池容量與 SGLang 拒絕路徑問題，155 筆回應含他人請求資料。 | 2026-10-26 | [Cloudflare Blog](https://blog.cloudflare.com/kv-cache-exposure-remediation/) | 軟硬體資訊安全 |
| <a id="ref-16"></a>16 | [新光三越疑遭外部入侵，約2萬名顧客個資受影響，已通報主管機關](https://www.google.com/search?q=%E6%96%B0%E5%85%89%E4%B8%89%E8%B6%8A+%E8%B3%87%E5%AE%89%E4%BA%8B%E4%BB%B6+iThome) | 新光三越疑遭外部入侵，部分宅配訂單顧客的姓名、地址與電話受影響。 | 2026-10-28 | [iThome](https://www.ithome.com.tw/news/180011) | 軟硬體資訊安全 |
| <a id="ref-17"></a>17 | [Apple unveils groundbreaking MacBook Pro with PROLED XDR Display and Touch for the first time on Mac](https://www.google.com/search?q=Apple+MacBook+Pro+PROLED+XDR+display) | MacBook Pro 首度內建觸控並採 PROLED XDR 顯示器，系統手勢 API 同步更新。 | 2026-10-28 | [Apple Newsroom](https://www.apple.com/newsroom/2026/10/apple-unveils-groundbreaking-macbook-pro-with-proled-xdr-display/) | 硬體或軟硬整合 |
| <a id="ref-18"></a>18 | [Apple introduces the new 14‑inch MacBook Pro with M6](https://www.google.com/search?q=Apple+14-inch+MacBook+Pro+M6) | 14 吋 MacBook Pro 搭載 12 核心 CPU 的 M6，11 月 6 日供貨。 | 2026-10-27 | [Apple Newsroom](https://www.apple.com/newsroom/2026/10/apple-introduces-the-new-14-inch-macbook-pro-with-m6/) | 硬體或軟硬整合 |
| <a id="ref-19"></a>19 | [AMD and Meta Advance Strategic Partnership to Power Meta’s Superintelligence Infrastructure](https://www.google.com/search?q=AMD+Meta+Helios+strategic+partnership+superintelligence) | 初期的 Helios 機櫃已在 Meta 安裝、測試中，Meta 為 MI450 早期定義客戶。 | 2026-10-27 | [AMD](https://ir.amd.com/news-events/press-releases/detail/1302/amd-and-meta-advance-strategic-partnership-to-power-metas-superintelligence-infrastructure) | 硬體或軟硬整合 |
| <a id="ref-20"></a>20 | [Intel and Oracle Plan Expanded Collaboration to Support Enterprise and Agentic AI on Oracle Cloud Infrastructure](https://www.google.com/search?q=Intel+Oracle+Diamond+Rapids+OCI+X14) | Intel 與 Oracle 規劃多年期合作，OCI X14 預計採用 Diamond Rapids。 | 2026-10-27 | [Intel Newsroom](https://www.intel.com/content/www/us/en/newsroom/news/corporate/intel-oracle-collaborate-on-enterprise-and-agentic-ai.html) | 硬體或軟硬整合 |
| <a id="ref-21"></a>21 | [Intel to Acquire Classiq to Create a Full-stack Quantum Computing Platform](https://www.google.com/search?q=Intel+Classiq+acquisition+quantum) | Intel 簽約收購量子軟體公司 Classiq，交易預計 2027 上半年完成。 | 2026-10-26 | [Intel Newsroom](https://www.intel.com/content/www/us/en/newsroom/news/corporate/intel-classiq-accelerate-scalable-quantum-computing.html) | 硬體或軟硬整合 |
| <a id="ref-22"></a>22 | [What took the Internet offline in Q3 2026](https://www.google.com/search?q=Cloudflare+Radar+Q3+2026+internet+disruption+summary) | 第三季 49 起網路中斷，政府斷網 19 起、停電 14 起。 | 2026-10-27 | [Cloudflare Blog](https://blog.cloudflare.com/q3-2026-internet-disruption-summary/) | 網路/伺服器等基礎 |
| <a id="ref-23"></a>23 | [Cloudflare DDoS Threat Report 2026 Q3: More swarms, fewer giants](https://www.google.com/search?q=Cloudflare+DDoS+threat+report+2026+Q3) | 短時小型攻擊成長 208%，超過 1 Tbps 的攻擊由 805 次降至 251 次。 | 2026-10-29 | [Cloudflare Blog](https://blog.cloudflare.com/ddos-threat-report-2026-q3/) | 網路/伺服器等基礎 |
| <a id="ref-24"></a>24 | [Cloudflare services for private origins is now generally available](https://www.google.com/search?q=Cloudflare+private+origins+generally+available) | 私有來源正式推出，來源不開入站也能使用 WAF、快取與 Workers。 | 2026-10-30 | [Cloudflare Blog](https://blog.cloudflare.com/private-origins-public-to-private/) | 網路/伺服器等基礎 |
| <a id="ref-25"></a>25 | [英國擬修法強化海底電纜安全，要求業者管理安全風險並通報事故](https://www.google.com/search?q=%E8%8B%B1%E5%9C%8B+%E6%B5%B7%E5%BA%95%E9%9B%BB%E7%BA%9C+%E4%BF%AE%E6%B3%95+%E7%99%BD%E7%9A%AE%E6%9B%B8+iThome) | 英國擬修法提高破壞海底電纜刑責，業者須管理安全風險並通報事故。 | 2026-10-30 | [iThome](https://www.ithome.com.tw/news/180038) | 網路/伺服器等基礎 |
| <a id="ref-26"></a>26 | [Google TPU將進駐甲骨文OCI，2027年起與GPU並列AI運算選項](https://www.google.com/search?q=Google+TPU+%E7%94%B2%E9%AA%A8%E6%96%87+OCI+iThome) | OCI 將於 2027 年起提供 Google TPU，成為 Google 以外首家提供 TPU 的超大規模雲端。 | 2026-10-28 | [iThome](https://www.ithome.com.tw/news/180043) | 網路/伺服器等基礎 |
| <a id="ref-27"></a>27 | [Next-day securities settlement, tokenisation and the transformation of Europe's financial infrastructure](https://www.google.com/search?q=ECB+Cipollone+T%2B1+tokenisation+speech+October+2026) | 歐洲 2027 年 10 月 11 日轉為 T+1，Pontes 規劃 2028 年達到 24/7/365。 | 2026-10-29 | [ECB](https://www.ecb.europa.eu/press/key/date/2026/html/ecb.sp261029~e9b57c3495.en.html) | 金融科技 |
| <a id="ref-28"></a>28 | [Innovation and resilience: managing the risks of a changing financial system](https://www.google.com/search?q=FSB+Schindler+innovation+and+resilience+RiskLive+Asia+2026) | FSB 秘書長整理 AI 採用十二項健全做法與穩定幣跨境脆弱性等工作。 | 2026-10-21 | [FSB](https://www.fsb.org/2026/10/innovation-and-resilience-managing-the-risks-of-a-changing-financial-system/) | 金融科技 |
| <a id="ref-29"></a>29 | [ACI Worldwide and Circle Collaborate to Bring USDC Settlement to Existing Payments Infrastructure in Latin America](https://www.google.com/search?q=ACI+Worldwide+Circle+USDC+settlement+Latin+America) | ACI Connetic 結合 USDC 基礎設施，示範在既有支付平台整合穩定幣結算。 | 2026-10-27 | [Circle](https://www.circle.com/pressroom/aci-worldwide-and-circle-collaborate-to-bring-usdc-settlement-to-existing-payments-infrastructure-in-latin-america) | 金融科技 |
| <a id="ref-30"></a>30 | [銀行提供定存解約/大額匯款通知指定聯絡人服務，協助民眾防詐](https://www.google.com/search?q=%E9%87%91%E7%AE%A1%E6%9C%83+%E6%8C%87%E5%AE%9A%E8%81%AF%E7%B5%A1%E4%BA%BA+%E5%AE%9A%E5%AD%98%E8%A7%A3%E7%B4%84+%E5%A4%A7%E9%A1%8D%E5%8C%AF%E6%AC%BE) | 鼓勵銀行在定存解約或大額匯款時通知客戶預先指定的聯絡人。 | 2026-10-20 | [金融監督管理委員會](https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202610200002&dtable=News) | 金融科技 |
| <a id="ref-31"></a>31 | [Government confirms indefinite recognition of CE marked medical devices](https://www.google.com/search?q=UK+indefinite+recognition+CE+marked+medical+devices) | 大不列顛無限期承認 CE 標示醫材，並為醫材尋求能因應軟體與 AI 的新許可方式。 | 2026-10-21 | [GOV.UK](https://www.gov.uk/government/news/government-confirms-indefinite-recognition-of-ce-marked-medical-devices) | 醫療科技 |
| <a id="ref-32"></a>32 | [A clinical multimodal vision language foundation model with fine-grain explainability](https://www.google.com/search?q=EVLF-FM+Nature+Medicine+vision+language+foundation+model) | EVLF-FM 涵蓋六個專科與像素級定位，論文指出常規部署前需前瞻性研究。 | 2026-10-29 | [Nature Medicine](https://www.nature.com/articles/s41591-026-04655-5) | 醫療科技 |
| <a id="ref-33"></a>33 | [FDA, CMS scramble to avoid regulatory logjam as more states look to test AI in clinical settings](https://www.google.com/search?q=STAT+FDA+CMS+state+AI+sandboxes+federal+rules) | 州政府想在臨床場域測試 AI，與 FDA 醫材管轄可能重疊。 | 2026-10-30 | [STAT](https://www.statnews.com/2026/10/30/fda-cms-health-ai-regulation-state-sandboxes-run-into-federal-rules/) | 醫療科技 |
| <a id="ref-34"></a>34 | [FDA Approves First Plasmid DNA-based Immunotherapy for Adults with Recurrent Respiratory Papillomatosis](https://www.google.com/search?q=FDA+Voceryq+plasmid+DNA+immunotherapy+recurrent+respiratory+papillomatosis) | 加速核准首款質體 DNA 免疫療法 Voceryq，以電穿孔裝置遞送。 | 2026-10-30 | [U.S. FDA](https://www.fda.gov/news-events/press-announcements/fda-approves-first-plasmid-dna-based-immunotherapy-adults-recurrent-respiratory-papillomatosis) | 醫療科技 |
| <a id="ref-35"></a>35 | [Early progress on accelerating drug development with Claude](https://www.google.com/search?q=Anthropic+early+progress+accelerating+drug+development+Claude) | 六家合作機構的藥物開發案例，並收購單人公司 Mithril Medicine。 | 2026-10-27 | [Anthropic](https://www.anthropic.com/research/early-progress-drug-development) | 醫療科技 |
| <a id="ref-36"></a>36 | [Charger Logistics and Aurora to Begin Scaling Autonomous Fleet to 500 Trucks](https://www.google.com/search?q=Aurora+Charger+Logistics+500+trucks) | Charger Logistics 以非約束性 MOU 表明有意購買最多 500 輛 Aurora Driver 卡車。 | 2026-10-26 | [Aurora](https://ir.aurora.tech/news-events/press-releases/detail/154/charger-logistics-and-aurora-to-begin-scaling-autonomous-fleet-to-500-trucks) | 運輸物流 |
| <a id="ref-37"></a>37 | [Trump's Transportation Secretary Sean P. Duffy Marks Major Milestone in Administration's Successful eVTOL Pilot Program](https://www.google.com/search?q=FAA+eIPP+Florida+demonstration+flights+Joby+BETA) | 佛羅里達完成 eIPP 首批示範飛行，成為第七個啟動地點。 | 2026-10-30 | [U.S. FAA](https://www.faa.gov/newsroom/trumps-transportation-secretary-sean-p-duffy-marks-major-milestone-administrations) | 運輸物流 |
| <a id="ref-38"></a>38 | [Toyota and Waymo Advance Autonomous Driving Collaboration for Safer Streets and Freedom of Movement for All](https://www.google.com/search?q=Toyota+Waymo+bZ4X+partnership+2027+Japan) | 2027 年在日本測試驗證自駕版 bZ4X 車隊，高岡工廠整合自駕硬體。 | 2026-10-30 | [Waymo](https://waymo.com/blog/2026/10/toyota-bz4x-partnership) | 運輸物流 |
| <a id="ref-39"></a>39 | [Maersk completes the world's largest ethanol bunkering in Singapore](https://www.google.com/search?q=Maersk+ethanol+bunkering+Singapore+Maersk+Halifax) | Maersk Halifax 在新加坡加註約 5,000 公噸生質乙醇。 | 2026-10-19 | [Maersk](https://www.maersk.com/news/articles/2026/10/19/maersk-completes-worlds-largest-ethanol-bunkering-singapore) | 運輸物流 |
| <a id="ref-40"></a>40 | [北市2路口多交通事故 11月啟動多功能科技執法測試](https://www.google.com/search?q=%E5%8F%B0%E5%8C%97%E5%B8%82+%E8%B7%AF%E5%8F%A3+%E5%A4%9A%E5%8A%9F%E8%83%BD%E7%A7%91%E6%8A%80%E5%9F%B7%E6%B3%95+%E4%B8%AD%E5%B1%B1%E5%8C%97%E8%B7%AF+%E6%B0%91%E6%AC%8A%E8%A5%BF%E8%B7%AF) | 台北市兩處路口 11 月起測試多功能科技執法，明年 2 月正式取締。 | 2026-10-30 | [中央社](https://www.cna.com.tw/news/asoc/202610300211.aspx) | 運輸物流 |
| <a id="ref-41"></a>41 | [3Dプリンタで水力発電所の詰所を建設、セレンディクスが屋根まで出力：デジタルファブリケーション - BUILT](https://www.google.com/search?q=%E3%82%BB%E3%83%AC%E3%83%B3%E3%83%87%E3%82%A3%E3%82%AF%E3%82%B9+3D%E3%83%97%E3%83%AA%E3%83%B3%E3%82%BF%E3%83%BC+%E6%B0%B4%E5%8A%9B%E7%99%BA%E9%9B%BB%E6%89%80+%E8%A9%B0%E6%89%80) | セレンディクス以 3D 列印建成水力發電所的值班站房。 | 2026-10-28 | [ITmedia BUILT](https://built.itmedia.co.jp/bt/articles/2610/28/news047.html) | 房地產與室內外裝潢 |
| <a id="ref-42"></a>42 | [Bedrock Robotics digs up $600M in new funding](https://www.google.com/search?q=Bedrock+Robotics+%24600+million+Series+C) | Bedrock Robotics 完成 6 億美元 C 輪，自主機具擴及混合車隊。 | 2026-10-28 | [Construction Dive](https://www.constructiondive.com/news/bedrock-robotics-digs-up-new-funding/873065/) | 房地產與室內外裝潢 |
| <a id="ref-43"></a>43 | [Origami-based construction method yields lightweight, load-bearing structures on architectural scales](https://www.google.com/search?q=MIT+origami+construction+method+load-bearing+structures) | 摺紙式模組做出不需內部支柱的承重殼層，組裝只需手工具。 | 2026-10-27 | [MIT News](https://news.mit.edu/2026/origami-based-construction-method-yields-lightweight-load-bearing-structures-architecture-1027) | 房地產與室內外裝潢 |
| <a id="ref-44"></a>44 | [耐火集成材「燃エンウッド」の民間建築工事向けライセンス提供を開始、竹中工務店：木造／木質化 - BUILT](https://www.google.com/search?q=%E7%AB%B9%E4%B8%AD%E5%B7%A5%E5%8B%99%E5%BA%97+%E7%87%83%E3%82%A8%E3%83%B3%E3%82%A6%E3%83%83%E3%83%89+%E6%8A%80%E8%A1%93%E4%BE%9B%E4%B8%8E+%E6%B0%91%E9%96%93) | 竹中工務店開放耐火集成材「燃エンウッド」的民間建築技術授權。 | 2026-10-30 | [ITmedia BUILT](https://built.itmedia.co.jp/bt/articles/2610/30/news067.html) | 房地產與室內外裝潢 |
| <a id="ref-45"></a>45 | [Garth Brooks Unexpectedly Pulls Ticket Sales From Kansas City Due to Rampant Bots](https://www.google.com/search?q=Garth+Brooks+Kansas+City+tickets+bots) | Garth Brooks 因機器人搶票暫停堪薩斯城加場售票。 | 2026-10-27 | [Digital Music News](https://www.digitalmusicnews.com/2026/10/27/garth-brooks-kansas-city-tickets-bots/) | 現場表演藝術 |
| <a id="ref-46"></a>46 | [Brazilian Government Orders StubHub and Four Other Resale Sites to Suspend Operations Ahead of BTS Shows](https://www.google.com/search?q=Brazil+Senacon+StubHub+BTS+resale+suspend) | 巴西 Senacon 命令 5 個轉售平台在 BTS 演唱會前停止轉售。 | 2026-10-28 | [Digital Music News](https://www.digitalmusicnews.com/2026/10/28/brazilian-government-orders-stubhub-suspend-operations-bts-shows/) | 現場表演藝術 |
| <a id="ref-47"></a>47 | [Legendary David Bowie 1978 Concert Presented for the First Time in Immersive Global Experience](https://www.google.com/search?q=David+Bowie+Stage+immersive+Uber+Arena+2027) | 《David Bowie: Stage》以 35mm 影像、透明 LED 與 7.1 環繞聲重現 1978 年演出。 | 2026-10-27 | [Digital Music News](https://www.digitalmusicnews.com/2026/10/27/david-bowie-concert-immersive-experience/) | 現場表演藝術 |
| <a id="ref-48"></a>48 | [多元感官開啟「聲音」想像　坂本龍一作品展登台](https://www.google.com/search?q=%E5%9D%82%E6%9C%AC%E9%BE%8D%E4%B8%80+%E8%A7%80%E9%9F%B3%E8%81%BD%E6%99%82+%E5%8C%97%E7%BE%8E%E9%A4%A8) | 坂本龍一回顧展以裝置作品將電磁波與降雨資料轉為視聽。 | 2026-10-30 | [中央社](https://www.cna.com.tw/news/acul/202610300296.aspx) | 現場表演藝術 |
| <a id="ref-49"></a>49 | [Prince George's County Commits $200 Million to Bring the Next Sphere to the DC Area](https://www.google.com/search?q=Sphere+National+Harbor+Prince+George%27s+council+approval) | 郡議會 8 比 0 通過約 2 億美元融資，Sphere 將進駐 National Harbor。 | 2026-10-29 | [Digital Music News](https://www.digitalmusicnews.com/2026/10/28/sphere-dc-area-final-approval/) | 現場表演藝術 |
| <a id="ref-50"></a>50 | [Anthropic涉擅用貓王274首歌曲訓練AI模型　挨告侵權](https://www.google.com/search?q=%E8%B2%93%E7%8E%8B+Anthropic+274%E9%A6%96+%E8%A8%B4%E8%A8%9F+%E4%B8%AD%E5%A4%AE%E7%A4%BE) | Authentic Brands Group 控告 Anthropic 以 274 首貓王歌曲訓練模型。 | 2026-10-26 | [中央社](https://www.cna.com.tw/news/ait/202610260141.aspx) | 影視音樂 |
| <a id="ref-51"></a>51 | [文策院TCCF大會迎海外買家　首度攜手金馬獎推台灣新秀演員](https://www.google.com/search?q=TCCF+2026+251%E5%90%8D%E5%9C%8B%E9%9A%9B%E8%B2%B7%E5%AE%B6+W%C4%93t%C4%81+FX+%E6%96%87%E7%AD%96%E9%99%A2) | TCCF 迎 251 名國際買家，預告文策院與 Wētā FX 的發布會。 | 2026-10-30 | [中央社](https://www.cna.com.tw/news/acul/202610300266.aspx) | 影視音樂 |
| <a id="ref-52"></a>52 | [Suno Fires Back Against Apple’s Subpoena Opposition, Doubling Down on Its Push for Information About ‘Current License Negotiations,’ ‘Anti-AI Deal Terms,’ and More](https://www.google.com/search?q=Suno+Apple+subpoena+motion+to+quash+UMG) | Suno 反對 Apple 撤銷傳票，要求取得 Apple Music 的 AI 授權條款資訊。 | 2026-10-28 | [Digital Music News](https://www.digitalmusicnews.com/2026/10/28/suno-apple-subpoena-dispute/) | 影視音樂 |
| <a id="ref-53"></a>53 | [Spotify Reportedly Prepares to Launch Its AI Cover and Remix Tool in Early 2027, Charging Subscribers Up to $5 More Per Month](https://www.google.com/search?q=Spotify+AI+cover+remix+tool+early+2027+Financial+Times) | 據《金融時報》匿名消息，Spotify 準備 2027 年初推出 AI 翻唱與混音工具。 | 2026-10-30 | [Digital Music News](https://www.digitalmusicnews.com/2026/10/30/spotify-ai-cover-remix-tool-launch/) | 影視音樂 |
| <a id="ref-54"></a>54 | [Modular quantum computing takes shape with l-couplers ｜ IBM Quantum Computing Blog](https://www.google.com/search?q=IBM+l-coupler+Nighthawk+connecting+quantum+processors) | 4 條 l-coupler 連接兩顆 Nighthawk R1，量子態傳輸保真度平均 99%。 | 2026-10-27 | [IBM Quantum Blog](https://www.ibm.com/quantum/blog/connecting-quantum-processors-with-l-couplers) | 其他領域科技應用突破 |
| <a id="ref-55"></a>55 | [NASA Explores Potential Commercial Servicing for Hubble Telescope](https://www.google.com/search?q=NASA+commercial+servicing+Hubble+request+for+information) | NASA 發出徵求資訊書，探詢哈伯太空望遠鏡的商業在軌維護能力。 | 2026-10-30 | [NASA Science](https://science.nasa.gov/missions/hubble/nasa-explores-potential-commercial-servicing-for-hubble-telescope/) | 其他領域科技應用突破 |
| <a id="ref-56"></a>56 | [We've received our first response from the Project Suncatcher prototype satellite.](https://www.google.com/search?q=Google+Project+Suncatcher+satellite+first+AI+response) | 原型衛星上的 TPU 以 Gemma 4 傳回第一個 AI 回應，2027 年目標兩顆互連衛星。 | 2026-10-30 | [Google Blog](https://blog.google/innovation-and-ai/models-and-research/google-research/project-suncatcher-satellite-response/) | 其他領域科技應用突破 |
| <a id="ref-57"></a>57 | [王金燦研究AI助攻廢水能源化　巴黎獲頒科技卓越金獎](https://www.google.com/search?q=%E5%AE%9C%E8%98%AD%E5%A4%A7%E5%AD%B8+%E7%8E%8B%E9%87%91%E7%87%A6+%E5%8F%B2%E8%92%82%E7%B6%AD+%E5%BE%AE%E7%94%9F%E7%89%A9%E7%87%83%E6%96%99%E9%9B%BB%E6%B1%A0) | 王金燦以 AI、數位孿生與微生物燃料電池的廢水能源化技術獲史蒂維金獎。 | 2026-10-29 | [中央社](https://www.cna.com.tw/news/ait/202610290021.aspx) | 其他領域科技應用突破 |
| <a id="ref-58"></a>58 | [We’re announcing Genie 4, our new world model for real-time interactive simulation.](https://www.google.com/search?q=Google+Genie+4+world+model) | Genie 4 可用自然語言即時操控模擬世界並產生原生音訊，先開放受信任測試者。 | 2026-10-27 | [Google Blog](https://blog.google/innovation-and-ai/models-and-research/google-deepmind/introducing-genie-4/) | AI 科技 |
| <a id="ref-59"></a>59 | [CISA Adds Two Known Exploited Vulnerabilities to Catalog](https://www.google.com/search?q=CISA+Adds+Two+Known+Exploited+Vulnerabilities+PHP2Shell) | CISA 把 PHP2Shell 兩個漏洞列入 KEV，聯邦民間機關須依 BOD 26-04 優先修補。 | 2026-10-26 | [CISA](https://www.cisa.gov/news-events/alerts/2026/10/26/cisa-adds-two-known-exploited-vulnerabilities-catalog) | 軟硬體資訊安全 |
| <a id="ref-60"></a>60 | [NVIDIA and Meta to Expand Collaboration on Muse and Muse Family of Models Amid Robust Growth](https://www.google.com/search?q=NVIDIA+Meta+Expand+Collaboration+Muse) | Meta 打算擴大部署 Vera Rubin 與 Vera CPU，NVIDIA 將投資 30 億美元於 Meta 股票發行。 | 2026-10-26 | [NVIDIA Newsroom](https://nvidianews.nvidia.com/news/nvidia-and-meta-to-expand-collaboration-on-muse-and-muse-family-of-models-amid-robust-growth) | 硬體或軟硬整合 |
| <a id="ref-61"></a>61 | [鴻海科技日登場　秀3款電動車設計布局輕型車級距](https://www.google.com/search?q=%E9%B4%BB%E6%B5%B7%E7%A7%91%E6%8A%80%E6%97%A5+HHTD+26+3%E6%AC%BE%E9%9B%BB%E5%8B%95%E8%BB%8A+%E4%B8%AD%E5%A4%AE%E7%A4%BE) | 鴻海發表 3 款參考設計電動車，布局延伸到日本 K-Car 輕型貨車級距。 | 2026-10-30 | [中央社](https://www.cna.com.tw/news/afe/202610300113.aspx) | 運輸物流 |

<a id="notes"></a>
## 報告說明

本期報告的時間範圍為 2026-10-17 至 2026-10-31（今天起往前 15 天，含首尾）。來源優先序為官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載；中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。本期共蒐集候選來源 120 筆，採用 61 筆為正式參考資料、淘汰 59 筆，筆數以 `source.md` 的條目數為準。正式來源逐筆以原頁核對標題、發布日期、來源網站名稱與報告引用的數字；原頁無法取得或日期無法確認者淘汰。Codex 第二輪查核重抓 57 筆原頁、驗證 580 個來源詞並重新補搜 12 類；正式來源不變。第三輪查核再重抓 57 筆原頁，四組逐句稽核修正 35 處歸因、時態與語意精度，補搜新增 ref-58 至 ref-61 四筆正式來源與五筆淘汰。

本期窗期與上一期（2026-10-24，窗期 2026-10-10 至 2026-10-24）重疊八天，與 2026-10-17 期重疊一天，因此篩選前先比對兩期的 `references.md` 建立已引用名單。上一期事件的後續若有新的實質進展仍可收，例如 PHP2Shell 被串連入侵 PAN-OS 設備（上一期收的是 PHP 公告與數發部盤點）；後續進展較小或名額已滿者則淘汰，例如微軟移除 eMudhra 根憑證的緊急更新、PHP 的 session upload progress 資訊性公告。財報類報導維持上一期的判斷不收，例如 Alphabet 第三季財報中的 YouTube 訂閱數。

<a id="limitations"></a>
### 資料限制與判讀提醒

- **非一手來源的使用。** Gemini 4 Carbon、GPT-6.1 Terra、JetBrains 終端機、Linux TCP 漏洞、PAN-OS 入侵、Brotli 漏洞、新光三越、英國海底電纜與 Google TPU 進駐 OCI 以 iThome 為來源 [[1. iThome]](#ref-1) [[2. iThome]](#ref-2) [[11. iThome]](#ref-11) [[12. iThome]](#ref-12) [[13. iThome]](#ref-13) [[14. iThome]](#ref-14) [[16. iThome]](#ref-16) [[25. iThome]](#ref-25) [[26. iThome]](#ref-26)，其中 openai.com 擋抓取，GPT-6.1 Terra 的數字以 iThome 引述為準；TAIDE、台北科技執法、坂本龍一展、TCCF 與宜蘭大學以中央社為來源 [[5. 中央社]](#ref-5) [[40. 中央社]](#ref-40) [[48. 中央社]](#ref-48) [[51. 中央社]](#ref-51) [[57. 中央社]](#ref-57)，貓王訴訟為中央社綜合外電、引述《衛報》 [[50. 中央社]](#ref-50)；日本營建兩則為 ITmedia BUILT 對企業發表的報導 [[41. ITmedia BUILT]](#ref-41) [[44. ITmedia BUILT]](#ref-44)；Bedrock Robotics 以 Construction Dive 為來源 [[42. Construction Dive]](#ref-42)；Garth Brooks、巴西轉售禁令、Bowie 展演、Sphere 融資、Suno 傳票與 Spotify AI 工具以 Digital Music News 為來源 [[45. Digital Music News]](#ref-45) [[46. Digital Music News]](#ref-46) [[47. Digital Music News]](#ref-47) [[49. Digital Music News]](#ref-49) [[52. Digital Music News]](#ref-52) [[53. Digital Music News]](#ref-53)。
- **供應商自評數字未經第三方驗證。** Gemini 4 Carbon 的 17 項基準與三項資安基準為 Google 公布，Artificial Analysis 指數則是第三方評測機構的結果 [[1. iThome]](#ref-1)；GPT-6.1 Terra 的測試為 OpenAI 公布 [[2. iThome]](#ref-2)；Mistral Large 4 引用的 Artificial Analysis 與 Cognition 分數屬第三方基準、由 Mistral 轉述 [[3. Mistral AI]](#ref-3)；Copilot Fusion 的指數比較與 GitHub 的基礎設施數字 [[7. GitHub Blog]](#ref-7)、Android CLI 的速度與 Token 數字 [[8. Android Developers Blog]](#ref-8)、Apple 的效能倍數 [[17. Apple Newsroom]](#ref-17) [[18. Apple Newsroom]](#ref-18)、Intel 的「唯一」說法 [[21. Intel Newsroom]](#ref-21)、Anthropic 合作案例的實驗室結果 [[35. Anthropic]](#ref-35)、Aurora 的 2030 年車隊目標 [[36. Aurora]](#ref-36)、Bowie 展演的技術規格 [[47. Digital Music News]](#ref-47)、IBM 的保真度數字 [[54. IBM Quantum Blog]](#ref-54)，皆屬公司或製作方自行揭露，本報告照原文引用並標明出處。貓王訴訟的侵權主張與求償金額為原告主張，未經法院認定 [[50. 中央社]](#ref-50)；Suno 與 Apple 的說法為訴訟雙方的主張 [[52. Digital Music News]](#ref-52)。
- **稀疏分類的來源組成。** 房地產與室內外裝潢經 8 輪以上補搜，4 筆皆為國外營建科技與研究，窗內找不到台灣政府或業者的科技題；現場表演藝術 5 筆中 4 筆來自 Digital Music News；影視音樂 4 筆中，Spotify 一則為匿名消息來源的報導。
- **未來事件與已發生事件的區別。** Gemini 4 Carbon 尚未全面開放 [[1. iThome]](#ref-1)；TAIDE 新模型為預計 [[5. 中央社]](#ref-5)；S-1 登記尚未生效、股數與價格未定 [[6. Anthropic]](#ref-6)；Opus 4.8 快速模式 11 月 30 日才移除 [[10. GitHub Releases]](#ref-10)；libghostty 目前只在 2026.3 EAP 預設啟用 [[11. iThome]](#ref-11)；AMD 的更廣泛部署與客製 GPU 為計畫 [[19. AMD]](#ref-19)；Intel 與 Oracle 的合作與 Diamond Rapids 為規劃與預期 [[20. Intel Newsroom]](#ref-20)；Classiq 收購尚待核准，預計 2027 上半年完成 [[21. Intel Newsroom]](#ref-21)；Cloudflare 私有對私有流量目標 2027 年初封閉測試 [[24. Cloudflare Blog]](#ref-24)；英國海底電纜修法為白皮書方案 [[25. iThome]](#ref-25)；TPU 進駐 OCI 自 2027 年起 [[26. iThome]](#ref-26)；歐洲 T+1 與 Pontes 全天候營運分別在 2027 與 2028 年 [[27. ECB]](#ref-27)；FSB 的監管現代化原則預計 2027 年定案 [[28. FSB]](#ref-28)；ACI 與 Circle 為合作示範 [[29. Circle]](#ref-29)；7 家銀行與中華郵政規劃 116 年 6 月底前開辦 [[30. 金融監督管理委員會]](#ref-30)；英國的醫材新許可方式仍在尋求立法授權 [[31. GOV.UK]](#ref-31)；Voceryq 為加速核准，須以核准後試驗驗證效益 [[34. U.S. FDA]](#ref-34)；Anthropic 的藥物研究多數為臨床前，人體試驗最快 2028 年底 [[35. Anthropic]](#ref-35)；Aurora 與 Charger 為非約束性 MOU [[36. Aurora]](#ref-36)；Electra 試飛在 11 月 [[37. U.S. FAA]](#ref-37)；Toyota 與 Waymo 在日本的測試自 2027 年起 [[38. Waymo]](#ref-38)；台北科技執法明年 2 月起正式取締 [[40. 中央社]](#ref-40)；MIT 的大型建築結構測試為下一步 [[43. MIT News]](#ref-43)；Bowie 展演 2027 年 2 月首演 [[47. Digital Music News]](#ref-47)；Sphere 場館目標 2030 年初開幕 [[49. Digital Music News]](#ref-49)；TCCF 於 11 月 6 日至 9 日舉行 [[51. 中央社]](#ref-51)；Spotify 的 AI 工具為據報的計畫 [[53. Digital Music News]](#ref-53)；哈伯的 RFI 不是採購決定 [[55. NASA Science]](#ref-55)；Suncatcher 的互連衛星目標 2027 年 [[56. Google Blog]](#ref-56)。本報告引用的是窗內的公告或報導，並非已完成的事實。
- **日期判定的特例。** Claude Code v2.1.316 的發布時間為 UTC 10 月 31 日 01:01 [[10. GitHub Releases]](#ref-10)；Cloudflare KV 快取一文的 datePublished 為 UTC 10 月 26 日 22:01（台灣時間 10 月 27 日），取 UTC 日期 [[15. Cloudflare Blog]](#ref-15)；新光三越聲明日為 10 月 22 日，iThome 報導發布於 10 月 28 日 [[16. iThome]](#ref-16)；英國白皮書公布於 10 月 22 日，iThome 報導發布於 10 月 30 日 [[25. iThome]](#ref-25)；Android Developers Blog 沒有 datePublished，取頁面日期 [[8. Android Developers Blog]](#ref-8)；Node.js 取內文發布行的日期 [[9. Node.js]](#ref-9)；AMD、Aurora、FAA、金管會與 MIT News 取頁面日期列 [[19. AMD]](#ref-19) [[30. 金融監督管理委員會]](#ref-30) [[36. Aurora]](#ref-36) [[37. U.S. FAA]](#ref-37) [[43. MIT News]](#ref-43)；ITmedia BUILT 兩則報導發布於 10 月 28 日與 30 日，所報導的企業發表分別為 10 月 26 日與 22 日，皆在窗內 [[41. ITmedia BUILT]](#ref-41) [[44. ITmedia BUILT]](#ref-44)；Digital Music News 各則取 UTC 日期 [[45. Digital Music News]](#ref-45) [[46. Digital Music News]](#ref-46) [[47. Digital Music News]](#ref-47) [[49. Digital Music News]](#ref-49) [[52. Digital Music News]](#ref-52) [[53. Digital Music News]](#ref-53)；TCCF 為活動預告，取新聞稿日期 [[51. 中央社]](#ref-51)；Cloudflare 的 GLM-5.3 事件發生於 8 至 9 月，10 月發布的是事後報告 [[15. Cloudflare Blog]](#ref-15)。
- **原頁未提供的資訊一律不補。** 新光三越的 2 萬人為 iThome 轉述媒體報導，iThome 引述的聲明內容只寫「部分宅配訂單顧客」 [[16. iThome]](#ref-16)；STAT 為付費報導，本報告只依公開段落 [[33. STAT]](#ref-33)；台北科技執法的報導未說明辨識技術 [[40. 中央社]](#ref-40)；Anthropic 的 S-1 公告沒有營收或估值數字 [[6. Anthropic]](#ref-6)；Google 與甲骨文的原始新聞稿未取得，TPU 進駐 OCI 全文歸因 iThome [[26. iThome]](#ref-26)。以上皆不以其他報導的數字替代原頁內容。

<a id="disclaimer"></a>
## 免責聲明

本報告由 AI 工具彙整公開資訊而成，內容僅供參考，不構成投資、法律、醫療或任何專業建議。所有數據與敘述均以參考資料所列來源為準，讀者應自行回溯原始來源確認。報告中涉及的產品規格、價格、時程與政策內容可能隨時變動，實際情形請以各官方公告為準。
