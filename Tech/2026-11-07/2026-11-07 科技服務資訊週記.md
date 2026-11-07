# 2026-11-07 科技服務資訊週記

**作者：Claude Code、Codex　報告日期：2026-11-07**

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

本期主線是**開發者的工作環境成了攻擊入口**。Binance 竊案始於工程師下載變造的安裝程式與假面試作業 [[28. iThome]](#ref-28)，Cursor 市集出現植入 SSH 後門的 Claude Code 擴充套件 [[15. iThome]](#ref-15)，cPGuard 的更新通道被拿來對約 2,950 臺伺服器派送惡意更新 [[14. iThome]](#ref-14)；OpenSSH 與 APT 也各修補一個驗證繞過漏洞 [[13. iThome]](#ref-13) [[23. iThome]](#ref-23)。AI 方面，GPT-6 Cyber 在 Firefox 找出 81 個未知高風險漏洞 [[1. iThome]](#ref-1)；工具面，GitHub Actions 12 月起預設封鎖公開儲存庫的 pull_request_target [[8. GitHub Changelog]](#ref-8)。台灣有金管會預告穩定幣發行辦法草案 [[27. 金融監督管理委員會]](#ref-27)，以及永豐銀行確認異常轉帳為駭客攻擊 [[16. iThome]](#ref-16)。

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技

- **OpenAI 的 GPT-6 Cyber 在 Firefox 找出 81 個先前未知的高風險漏洞，OpenAI 把它的資安能力風險列為 Critical。** 據 iThome 報導，OpenAI 11 月 5 日發表資安研究專用模型 GPT-6 Cyber。研究人員用它檢測 Firefox 程式碼庫，找出 81 個未知高風險漏洞，另確認 30 個已知漏洞比原先評估嚴重，Mozilla 已修補其中多項。Linux 核心測試從 2,308 個疑似漏洞重現 1,724 個，並對其中 948 個寫出可運作的提權攻擊程式，耗費約 121 萬美元 API 額度、平均每項約 1,279 美元；GPT-5.6 Sol 在 7 月的相同研究架構下只成功利用 166 個。模型初期只透過 API 與 Codex 提供給部分經核准的 Daybreak Red 客戶，OpenAI 也已向 Linux 核心維護者通報 304 項重大發現 [[1. iThome]](#ref-1)。開源專案的維護者，可能要準備處理更多由 AI 產生的漏洞回報。
- **Gemini Omni 1.2 Flash 正式開放：影片最長 15 秒，價格比 1.1 便宜 30%。** Google DeepMind 11 月 5 日宣布，Gemini Omni 1.2 Flash 在 Gemini API 與 Gemini for business 正式開放，Google Cloud 也提供。影片長度可在 3 至 15 秒間以 1 秒為單位指定（1.1 為 10 秒），新增多輪對話式編輯，也能結合角色、商品或風格圖片、最長 3 秒動態片段與音訊提示。720p 影片每秒 0.07 美元，可先以 360p 或 720p 打草稿再升到 1080p 或 4K，輸出帶有 SynthID 浮水印；官方也說明快速的運動賽事動作、劇本快速變化與複雜物理仍在改善 [[2. Google Blog]](#ref-2)。用 API 產生商品或廣告影片的團隊，可以照新價格重估單位成本。
- **Anthropic 的 FlashProve 用 zkSNARK 證明回應確實來自宣稱的模型，GPU 時間約為直接推論的 70 至 95 倍。** Anthropic Frontier Red Team 11 月 2 日發表可證明推論的進展，目的是讓使用者驗證回應不是被路由服務暗中換成別的模型或遭竄改。以 4 位元量化、400B 參數的 Llama 4 Maverick 為例，單張 H100 每秒約產生 110 個 token 的證明，每 1,024 token 請求的證明約 19 MB，GPU 時間約為在 vLLM 執行模型本身的 70 至 95 倍；團隊以 Lean 提供可稽核的安全保證陳述，程式碼、Lean 證明與文件以 Apache 2.0 釋出，Anthropic 稱優化由 Claude 產出 [[3. Anthropic]](#ref-3)。Anthropic 也說明這是階段性進展，不是完整的研究議程。
- **Anthropic 談代理記憶：對較強的模型，只給記憶的用途、讓它自己判斷要記什麼，比訂固定規則有效。** Anthropic 工程團隊 11 月 6 日的文章把記憶定義為 Claude 從經驗取得、跨工作階段保留、存成可讀取脈絡的知識，不含權重更動、情境內學習與壓縮。團隊以 Claude Managed Agents 跑 CL-Bench 1.0 的資料庫任務，Claude Opus 5 是這批模型中第一個能讓記憶形成學習迴圈的；玩 Pokémon Red 時，Sonnet 3.7 寫了 413 個記憶檔、拿到 1 枚徽章，Fable 5 只寫 9 個檔加上 global.md，拿到 4 枚。文中的「dreaming」是回頭檢視紀錄來修正錯誤，或產生新的筆記與表徵 [[4. Anthropic]](#ref-4)。這些都是 Anthropic 的自家評測，自己做代理記憶的人可以拿來對照設計。
- **Google、OpenAI、微軟與 Anthropic 將支援共通的 AI 訓練偏好標記，網站可以在 robots.txt 統一設定。** 據 iThome 報導，網站管理者未來可用共同標記 __usage_ai-training 表達內容能否用於生成式 AI 訓練，不必分別維護各家規則。提案由 Anthropic 工程師 Kevin Kelley 以個人 Internet-Draft 提交，源自 IETF AI Preferences 工作小組的討論，尚未成為正式標準；報導指出 Anthropic 已開始實作，OpenAI 預計數個月內支援，Google 計畫 2027 年導入，微軟預計 2027 年 2 月 1 日支援。這個標記控制的是內容的使用目的，不等於禁止搜尋引擎抓取 [[5. iThome]](#ref-5)。各家時程不同，既有的 GPTBot、Google-Extended 規則暫時還得留著。
- **OpenAI 的 LifeVal 基準：需要從歷史對話取得資訊的評分條件，平均只有 33.33% 達標。** 據 iThome 報導，LifeVal 有 169 項日常任務，涵蓋照護、教育、購物、個人財務與政府服務，結合去識別化的 ChatGPT 對話與記憶，測試 AI 以瀏覽器與電腦操作完成工作。需要 ChatGPT 記憶的條件達標率 47.8%、需要額外背景資訊的為 55.8%；把原本直接給的背景資訊改放進歷史對話後，達標率從 55.8% 降到 41.5%。整體評測中 GPT-6 Astra 平均 80.6%、GPT-5.6 為 80.0%、GPT-5.2 為 49.3% [[6. iThome]](#ref-6)。LifeVal 目前只公開論文與結果，資料集與評測程式尚未釋出。

<a id="hl-software"></a>
### 軟體工程

- **OpenAI 收購 Pierre，要把 Git 版本控制、程式碼儲存與審查技術整合進 Codex。** 據 iThome 報導，OpenAI 11 月 4 日宣布收購開發者工具新創 Pierre Computer Company，金額未公開。Pierre 成立於 2023 年，旗下 Code Storage 以 Git 儲存程式碼並追蹤版本歷史，另有開源函式庫 Trees、Diffs 與 Highlights；OpenAI 表示 Codex 收購前就已採用 Trees 與 Diffs，並承諾 Pierre 的開源專案維持開源、現有客戶可繼續使用 Code Storage。報導援引 Axios，認為此舉可能進一步挑戰 GitHub，並提到 OpenAI 11 月 2 日才發表自建的 Git 後端 Pando [[7. iThome]](#ref-7)。Codex 的範圍從寫程式往儲存與審查延伸，和 GitHub 重疊的地方變多了。
- **GitHub Actions 12 月 2 日起，所有公開儲存庫預設封鎖 pull_request_target，11 月 9 日與 16 日先各演練一次。** GitHub 11 月 2 日公告，除非適用的 Actions 事件政策明確允許，公開儲存庫的 pull_request_target 事件將被預設封鎖，原訂 11 月 2 日強制執行；私有與內部儲存庫不受影響，GitHub Enterprise Server 也不在範圍內。理由是這個事件在基底儲存庫的情境下執行、可存取機密，若跑到 fork 送來的不受信任程式碼，管線可能被破壞或機密被竊。規則先以評估模式運作，可以先看哪些執行會被擋；兩次演練都在 UTC 16:00 至 18:00，期間被擋的執行會失敗並附錯誤註解 [[8. GitHub Changelog]](#ref-8)。依賴這個事件的公開專案，最好在第一次演練前找出受影響的工作流程。
- **Go 的 encoding/json/v2 在 Go 1.27 正式可用，Unmarshal 在基準測試中最高快 10 倍。** Go 團隊 11 月 4 日表示，encoding/json/v2 與 encoding/json/jsontext 已穩定。舊版 encoding/json 會接受無效 UTF-8 與重複的成員名稱，Encoder 與 Decoder 也缺乏真正的串流，特定情形下效能呈二次方；v2 修正這些問題，同時讓 v1 使用者容易遷移，選項改為 marshal 與 unmarshal 函式的一級參數。Marshal 效能與 v1 大致相當；要拿到更多效益，既有的 Marshaler 與 Unmarshaler 要改寫成 MarshalerTo 與 UnmarshalerFrom 以串流處理 [[9. Go Blog]](#ref-9)。有自訂序列化邏輯的服務，升級前要排出改寫的工時。
- **Claude Code v2.1.319：在 LLM 閘道後面的 auto mode，伺服器無法檢查的呼叫改為詢問或拒絕。** v2.1.319 於 UTC 11 月 6 日在 GitHub 發布。關閉遙測或功能旗標（包括位於 LLM 閘道後）時，auto mode 不再退回內建分類器，要沿用需設定 CLAUDE_CODE_AUTO_MODE_SERVER=0，Bedrock、Vertex 與 Foundry 不受影響。新增功能有：MCP 伺服器以 task 執行工具呼叫時，終端機會立刻移到背景、完成後通知 Claude；permissions.denyInsteadOfPrompting 讓原本要等權限提示的呼叫直接被拒、回合繼續；CLAUDE_CODE_DISABLE_FEATURE_FLAGS 可停止取得功能旗標而不關遙測。另修正 claude -p 在 auto mode 因沒有安全檢查而拒絕動作時以 0 結束的問題，現在改為 1 [[10. GitHub Releases]](#ref-10)。在 CI 或閘道後面跑 claude -p 的腳本，升級前要確認行為與結束碼。
- **VS Code 1.145 讓遠端代理工作階段可以預覽應用程式，Automations 也能用 cron 排程。** VS Code 1.145 於 11 月 4 日釋出，在 Agents 視窗透過遠端代理主機載入整合瀏覽器，預覽代理在遠端機器啟動的開發伺服器（Preview），也可使用互動式 canvases。Automations 可用 cron 運算式設定超出內建預設的排程；對話新增代理詳盡度選項（Experimental），可選精簡或完整顯示推理與工具呼叫；另有排除資料夾但仍保持檔案可見、可搜尋的功能 [[11. Visual Studio Code]](#ref-11)。多數新功能仍標示 Preview 或 Experimental。
- **.NET 團隊實驗把 Agent Skills 封裝進 NuGet 套件，讓每個版本附帶對應的使用指引。** .NET Blog 11 月 3 日的文章指出，剛發布的新版 API 不在模型的知識內，而 dotnet restore 本來就會把套件下載到本機，套件裡的 SKILL.md 也就一併取得。團隊提供 dotnet-inspect 檢查套件內的技能，以及 dotnet-package-skills 掃描專案、把技能複製到 .agents/skills 目錄，並以 Markout 函式庫示範。測試結果是：前沿模型的改善空間不大，較弱的模型則因遵循技能的程度較低而表現不穩；NuGet MCP 尚未支援技能 [[12. .NET Blog]](#ref-12)。函式庫作者可以考慮隨套件附上版本對應的技能文件。

<a id="hl-security"></a>
### 軟硬體資訊安全

- **OpenSSH 10.6p2 修補 SSHole：在 musl 系統上，輸入 257 至 1,024 個字元的密碼就可能登入沒設密碼的帳號。** 據 iThome 報導，資安公司 Wakefield 揭露存在約 10 年的密碼驗證繞過漏洞 SSHole（CVE-2026-123158，CVSS 8.1），只影響採用 musl C 函式庫、OpenSSH 未啟用 PAM、且密碼驗證開著的 Linux 系統，包括 Alpine Linux、OpenWrt、postmarketOS 與部分 Docker 映像檔。Wakefield 指出，成因是 musl（2012）、OpenSSH（2016）與 Alpine Linux（2022）各自的防護調整組合出可利用條件；Wakefield 11 月 3 日通報，OpenSSH 11 月 5 日發布 10.6p2，Alpine 也釋出修補。無法立即更新可先停用 PasswordAuthentication；若密碼欄位為「*」的帳號出現 Accepted password，應視為可能遭利用 [[13. iThome]](#ref-13)。以 Alpine 為基底、又開著 SSH 密碼登入的容器要優先檢查。
- **cPGuard 的更新金鑰被偷，約 2,950 臺客戶伺服器下載並執行了遭竄改的更新。** 據 iThome 報導，cPGuard 開發商 OpsShield 11 月 3 日揭露，攻擊者入侵其帳務及授權伺服器、取得更新所需的金鑰並竄改更新內容。攻擊發生於 UTC 11 月 2 日凌晨 2 時 6 分，在 2 時 8 分至 3 時 20 分之間檢查並安裝更新，或版本為 5.88.12 至 5.88.19 者可能中招。惡意更新以 root 權限蒐集 /etc/shadow、/etc/passwd、root 的 SSH 私鑰、MySQL root 密碼與 Shell 紀錄，部分伺服器的 S3 存取金鑰也受影響，並留下隱藏的 root Shell 與排程工作；攻擊者另從帳務系統竊得約 7,900 筆客戶帳號資料。OpsShield 已撤銷遭竊金鑰，並發布可移除後門的 5.88.26 [[14. iThome]](#ref-14)。受影響主機的 SSH 金鑰、資料庫與雲端憑證都要輪替。
- **Cursor 市集的 Claude Code for VS Code 擴充套件被植入惡意程式，企圖在開發者電腦加入攻擊者的 SSH 公鑰。** 據 iThome 報導，Cursor 公告其擴充套件市集 10 月 29 日出現遭植入惡意程式碼的 2.1.312 與 2.1.313 版，可能多達 5,000 名使用者受影響，上架約 11 小時後下架。資安業者 Phorion 發現，編輯器載入擴充套件後惡意程式碼會自動執行，即使移除擴充套件，電腦仍可能留有惡意元件。微軟安全研究人員確認這批版本沒有透過 Visual Studio Marketplace 或 npm 套件 @anthropic-ai/claude-code 散布，Anthropic 也向微軟確認系統未遭入侵；Cursor 要求客戶更新至 2.1.314，並公布檢查與清除方式 [[15. iThome]](#ref-15)。曾從 Cursor 市集安裝或自動更新到這兩版的人，要檢查 SSH 授權金鑰檔案。
- **永豐銀行確認異常轉帳是駭客攻擊，利用的是新網銀交易系統供應商的安全設定漏洞。** 據 iThome 報導，永豐銀行 11 月 4 日晚間召開記者會，表示先前說明為新網銀系統程式異常的事件，已確認是外部駭客所為；先前傳出的影響範圍是 400 多名客戶、每筆轉出約 10 萬元，款項已於 11 月 3 日全數返還。受影響客戶的身分證字號都是 P 開頭，銀行說明駭客是以特定手法隨機嘗試取得首碼相同的有效帳戶資料，並非先取得個資，目前未發現個資外洩跡象；銀行已阻斷攻擊手法、加強驗證與異常交易監控，透過 F-ISAC 分享情資，並將向未公布身分的外國系統供應商求償 [[16. iThome]](#ref-16)。轉帳手法與限額問題，銀行表示無法透露細節。
- **TWCA 部分 CA 憑證的序號只有約 24 bits 來自安全亂數，數發部要求換發，政府端牽涉 9,772 張網站憑證。** 據 iThome 報導，Mozilla Bugzilla 揭露 TWCA 部分 CA 憑證的序號雖有 128 bits，但真正由密碼學安全亂數產生的只有約 24 bits，低於 CA/Browser Forum 至少 64 bits 的要求，研究人員檢視的 24 張 CA 憑證都是相同結構。數發部 10 月 30 日接獲通報後要求 TWCA 於 2 日內產製新憑證，政府端影響 962 個機關、共 9,772 張網站 TLS 憑證，TWCA 已於 11 月 1 日完成重新產製並以 Email 補發。TWCA 強調不是網站遭入侵或私鑰外洩，成因是 2016 年規範調整時 CA 端的產製程式未同步更新；數發部也將委託第三方檢視 TWCA 的憑證產製與管理流程 [[17. iThome]](#ref-17)。用到這批憑證的政府網站維運者，要確認新憑證已部署。
- **Binarly 揭露 Zyxel GS1900 交換器的前次修補不完整，新漏洞另登記為 CVE-2026-107441。** 據 iThome 報導，兆勤修補 GS1900 系列漏洞 CVE-2026-107441，通報者 Binarly 公布了發現過程：它在調查中國駭客 Red Heron 及相關團體 Kapibala 的基礎設施時，找到經混淆的 Python 漏洞利用工具，目標是 GS1900 的網頁管理介面，而且針對的是已修補 CVE-2026-7273 的設備。漏洞位於 dispatcher.cgi，會把 HTTP POST 參數複製到固定大小的全域記憶體區塊；先前加入的參數數量檢查排在複製之後，攻擊者可先以過長參數破壞計數器再繞過檢查，進而取得任意記憶體寫入能力 [[18. iThome]](#ref-18)。驗證這次修補時，要看檢查是否已移到複製之前。

<a id="hl-hardware"></a>
### 硬體或軟硬整合

- **NVIDIA 公布 Vera CPU 的代理工作負載數據：每瓦可跑的代理數是最快 x86 的 1.6 倍。** NVIDIA 11 月 5 日的部落格指出，AI 代理在 GPU 推論與 CPU 執行之間來回，受電力限制的 AI 工廠需要兼顧速度與每瓦容量的 CPU。NVIDIA 以 100 MW 資料中心比較，稱 Vera 相較最快的 x86 每瓦可支援 1.6 倍代理、相較最省電的 x86 代理速度快 2 倍。早期採用者的數字包括：Perplexity 的代理式寫程式任務快 1.5 倍並計畫部署，Daytona 以 10.8 秒啟動 1,000 個代理沙箱（x86 為 88.4 秒），ClickHouse 以標準二進位檔在 176 核心上近線性擴展 [[19. NVIDIA Blog]](#ref-19)。以上都是 NVIDIA 與合作夥伴自己公布的比較；NVIDIA 把訴求放在 CPU 端的沙箱啟動與工具呼叫。
- **Marvell 擬以全股票收購光通訊元件商 Lumentum，交易企業價值約 1,150 億美元。** 據 iThome 報導，Marvell 11 月 2 日宣布這筆交易，Lumentum 股東每股可換 4.5 股 Marvell 股票，相當於每股約 1,132 美元，較 10 月 28 日收盤價溢價 23.9%，預計 2028 年上半年完成。雙方要整合 AI 晶片、網路交換與光通訊技術，強化 AI 資料中心的高速互連；報導引述 SiliconANGLE，指 Lumentum 掌握磷化銦雷射、光放大器與光電路交換器，也推出針對共封裝光學（CPO）最佳化的雷射。Marvell 預期長期每年成本綜效超過 10 億美元，消息公布當天 Marvell 股價下跌約 13%、Lumentum 重挫近 19% [[20. iThome]](#ref-20)。
- **iPad mini 改用 8.5 吋 OLED 與 A20 Pro，加入 IP67 防水防塵，11 月 6 日開賣。** Apple 10 月 26 日發表新款 iPad mini，尖峰亮度最高 1200 nits，是前代 2 倍以上；A20 Pro 的每個 GPU 核心都有 Neural Accelerator，512GB 版本具備雙 16 核心 Neural Engine，Apple 稱統一記憶體頻寬增加逾 2 倍。新機首度搭載 Apple 的 N1 無線網路晶片與 C2 數據機，前鏡頭移到橫向邊緣，預載 iPadOS 27；10 月 28 日起在 36 個國家與地區預購，美國 Wi-Fi 版 699 美元起 [[21. Apple Newsroom]](#ref-21)。雙 16 核心 Neural Engine 只在 512GB 組態，要跑端側模型的人選容量時要注意。
- **Google 指控 Android 裝置製造商 Videostrong 在韌體預載後門，XCPE 殭屍網路控制逾 130 萬臺機上盒。** 據 iThome 報導，Google 威脅情報團隊（GTIG）揭露 XCPE 殭屍網路的瓦解行動，並指控 Videostrong 刻意預載後門，把裝置存取權限賣給犯罪合作夥伴，用於廣告詐欺或充當常駐代理網路節點；惡意程式主要出現在 Android TV 機上盒，也見於部分遠距醫療裝置、卡拉 OK 設備與數位看板。Google 已瓦解 C2 基礎設施，禁止該公司製造、銷售經 Google 認證的 Android 裝置，並強化 Android TV 韌體完整性檢查。後門在韌體裡，移除後重開機會從韌體分割區自動重裝，報導引述 Bleeping Computer 指出使用者可能要重新安裝乾淨的韌體 [[22. iThome]](#ref-22)。來源不明的白牌 Android 設備，最好和內網隔開。

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎

- **Debian 與 Ubuntu 修補 APT 漏洞：下載重試時，中間人可能把已驗證的套件換掉並以 root 執行。** 據 iThome 報導，CVE-2026-109518 的成因是 HTTP 重新導向讓兩個下載工作指向同一 URI 時 APT 可能合併工作，遇到暫時性 HTTP 錯誤而重新下載時又對檔案硬連結處理不當，使已通過驗證的套件可能被覆寫。利用條件是攻擊者能操控 HTTP 流量、目標正在安裝套件且啟用下載重試；APT 自 2.3.2 版起預設啟用重試，Debian 12 與 Ubuntu 22.04 LTS 以後預設都受影響。Canonical 評為高風險，CVSS 4.0 為 7.7，Snap 不受影響；Debian 12、13 已推出 APT 2.6.2、3.0.4 [[23. iThome]](#ref-23)。CI 映像檔與容器基底大量依賴 apt，暫時可關閉下載重試或改用 HTTPS 套件來源。
- **Cloudflare 改用「目標建置」，DNS 變更寫入 Quicksilver 的時間減半，尖峰記憶體降低 85%。** Cloudflare 11 月 2 日說明其 DNS 傳播管線中 Zone Builder 的改進：2022 年每秒約處理 250 筆 DNS 記錄變更，現在約 700 筆，部分區域已超過 2,000 萬筆記錄。過去區域設定一變就重建整個區域，數千萬筆記錄的區域連記憶體都放不下；團隊做了能選出「可證明安全的最小建置」的規劃器，再用新排程器合併同一區域的工作，完整建置減少約 40%，也因此能縮短管線為了韌性而設的等待時間 [[24. Cloudflare Blog]](#ref-24)。文中也提到難處：事件必須說明變更了什麼，共用資料在事件和建置之間也可能改變。
- **Linux 核心 TCP 漏洞延燒到儲存設備：NetApp 的 BMC、Service Processor 與 StorageGRID 等產品受影響。** 據 iThome 報導，NetApp 11 月 2 日公告，CVE-2026-98432 影響 AFF、ASA 與 FAS 系列的 BMC 控制器與 Service Processor、E 系列的 SANtricity OS、StorageGRID 系列，以及 ONTAP Select Deploy 管理工具，可能造成敏感資訊外洩、資料新增或竄改，以及服務阻斷。公告尚未列出已修補版本，NetApp 建議用戶追蹤修補資訊，並限制 BMC 與 Service Processor 等管理介面只能從可信任的管理網路存取 [[25. iThome]](#ref-25)。核心漏洞會沿著內嵌 Linux 的設備往外擴散，資產盤點不能只看伺服器。
- **IREN 延後交付部分微軟 AI 基礎設施，同時提出約 150 億美元的投資計畫。** 中央社綜合外電報導，IREN 11 月 5 日宣布延後部分為微軟建置的基礎設施交付時程，表示交付延遲是因微軟要求修改網路設計，不會導致財務處罰；超過 40 億美元年化營收目標的達成時間從年底延到明年 1 月，進度可能再延至 2 月底，IREN 指出這項調整是因客戶要求變更設計與供應商交貨時程。IREN 正在德州為微軟建置 200 MW 的資料中心；報導另引述彭博，指微軟正加強監督由 IREN、Nebius 與 Nscale 等新雲端業者承接的部分資料中心專案 [[26. 中央社]](#ref-26)。向 neocloud 租算力的團隊，時程上要預留交付延遲。

<a id="hl-fintech"></a>
### 金融科技

- **金管會預告「穩定幣發行許可及管理辦法」草案：非銀行發行人實收資本額至少新臺幣 3 億元，須專營穩定幣發行及贖回。** 金管會 11 月 3 日表示，虛擬資產服務法於 115 年 7 月 22 日公布、施行日期由行政院另定，草案依行政程序法預告徵求意見。申請對象為銀行、金融控股公司或銀行轉投資的股份有限公司，以及其他經公告得申請的機構；非銀行發行人須公開發行。穩定幣可與新臺幣或單一外國貨幣一比一連結，準備資產的公允價值總額不得低於流通在外餘額，並須定期委請會計師查核；洗錢防制方面，穩定幣發行人將被指定為金融機構。各界可於公告翌日起 40 日內陳述意見 [[27. 金融監督管理委員會]](#ref-27)。做支付或錢包整合的團隊，可以先對照草案條文盤點系統需求。
- **Binance 公布約 63.4 億美元竊案的初步調查：入口是工程師的開發環境，駭客最後拿到容器部署權限。** 據 iThome 報導，攻擊最早可追溯到 6 月，一名錢包維運工程師為了安裝 AI 程式開發工具，下載了遭變造的 Homebrew 安裝程式；9 月駭客透過合法求職平臺假冒主管安排兩輪面試，讓另一名工程師在工作電腦下載含惡意程式碼的面試作業，把 pyenv 執行檔換成惡意版本，當時端點防護沒有偵測到。10 月 20 日駭客利用遭入侵的電腦與 Binance 內部 AI 工具控制另外兩名錢包工程師的電腦、找到具容器部署權限的權杖，10 月 30 日凌晨部署容器、侵入錢包簽章服務，並利用以太坊 EIP-7702 授權機制。熱錢包採 MPC 簽章，無法以單一私鑰立即撤銷授權；Binance 表示約 28.5 億美元已凍結或攔截，調查仍在進行 [[28. iThome]](#ref-28)。開發機上的工具安裝與面試作業，都是這次攻擊鏈的一環。
- **OCC 發布檢查銀行使用 Super Intelligence 的框架：檢查人員不應把 SI 當成獨立的風險類別。** 美國貨幣監理署 11 月 4 日發布供銀行檢查人員使用的框架，用來評估銀行在一般業務中使用 Super Intelligence（SI）與 agentic SI 的情形及相關風險與控制。框架明確表示，檢查人員不應把 SI 視為獨立的風險類別，也不應要求銀行另訂 SI 的風險胃納；OCC 打算定期更新框架，並維持技術中立 [[29. OCC]](#ref-29)。替美國銀行做 AI 代理的團隊，治理文件要能對應到既有的風險類別。
- **Visa 的 AI 購物基準：22 個模型、15 個情境，整體通過率 57.2%，失敗的測試中約 54% 仍完成購買。** Visa 11 月 5 日推出 Visa Agentic Commerce Benchmark，要求模型從對話中找出消費者需求，沒有符合需求的商品時就應選擇不買。首輪測試涵蓋 12 個實驗室的 22 個模型，表現最佳的通過 82.2%、最差 28.9%；每個情境各試三次，三次全數通過的比例只有 34.2%。Visa 計畫加入更多情境，並把測試延伸到結帳、付款與下單，基準已分享給主要模型供應商 [[30. Visa]](#ref-30)。這些數字出自 Visa 新聞稿；在該停手時仍完成購買，是代理購物最該先測的失敗模式。
- **Anthropic 推出 Claude Personal Finance 測試版，透過 Plaid 以唯讀權限分析銀行與信用卡收支。** 據 iThome 報導，Anthropic 11 月 5 日宣布這項功能，本週起在美國先開放給 Claude Pro、Max 及 Ultra 付費用戶。Claude 可依房租、餐飲等類別分析支出並與過去數月比較，找出重複扣款、異常手續費或上漲的訂閱費，也能依帳單與餘額估算發薪前可動用的資金。Anthropic 表示 Claude 只有唯讀權限，無法轉帳、投資或執行其他交易，也不會取得銀行密碼；使用者可授權讀取最多兩年的交易紀錄並隨時解除連結，該專區對話不會用於模型訓練，且這不是投資顧問服務 [[31. iThome]](#ref-31)。報導指出 OpenAI 的 ChatGPT 個人理財服務已擴大到美國免費用戶。
- **金管會修正金融業業務試辦要點：受理後 60 日內完成審查，資安驗證不再綁定特定標準。** 金管會 11 月 5 日修正發布「金融業申請業務試辦作業要點」（113 年 10 月訂定），重點有三：明定受理申請後 60 日內完成審查，並規範補件後的期間計算；涉及個人資料的資訊安全管理系統驗證，由原本明列特定標準改為取得相關驗證即可（如 ISO27001），並依試辦業務風險建立保護措施；試辦期滿或效益達成後的成果提報期限，由 2 星期延長為 1 個月 [[32. 金融監督管理委員會]](#ref-32)。想走試辦機制上線新服務的團隊，審查時程有了明確上限。

<a id="hl-healthtech"></a>
### 醫療科技

- **Nature Medicine 的步態基礎模型：用單一深度攝影機記錄的動作，預測出 3,210 項測試表型中的 1,887 項。** 論文 11 月 6 日刊出，資料來自 3,328 位經深度表型分析的成人，以單一深度攝影機記錄 5 項動作任務，模型把三維骨架動作轉成學習而得的嵌入向量，預測橫跨 18 個身體系統的健康表型。摘要指出，學習嵌入在預測年齡、身體質量指數與內臟脂肪面積上優於人工設計特徵；與只用年齡、BMI、內臟脂肪與身高的基線模型相比，嵌入在男性 18 個系統全數、女性 17 個系統改善預測 [[33. Nature Medicine]](#ref-33)。作者主張把步態分析納入常規臨床評估，作為被動式的生命徵象；本報告只讀到論文摘要。
- **Mayo Clinic Platform 推出嵌入 EHR 的 AI 臨床決策支援，聊天工具涵蓋 35 個以上次專科。** 據 HIT Consultant 報導，Mayo Clinic Platform 宣布商業推出這套方案，提供給 Mayo Clinic 內部臨床人員與參與 Mayo Clinic Platform 醫療提供者計畫的外部機構。聊天工具由整合的大型語言模型驅動，回答時會自動引用同儕審查的生醫文獻、每日更新，另有 22 個可用文字或語音操作的臨床風險與診斷計算器；Mayo 的 Gelareh Zadeh 醫師表示，方案是協助決策，不取代臨床判斷 [[34. HIT Consultant]](#ref-34)。這是醫院把 LLM 問答直接放進 EHR 工作流程的落地例子。
- **FDA 發布細胞與基因治療產品的效價保證最終指引，取代 2011 年的效價測試指引。** FDA 11 月 2 日發布《Potency Assurance for Cellular and Gene Therapy Products》，建議製造商採以科學與風險為基礎的「效價保證策略」，在產品送到病人之前確認每一批次都達到既定的療效標準。指引建議把效價考量納入從早期 IND 申請、BLA 核准到上市後驗證的每個階段，重點包括原料變異的控制、製程中的測試，以及確認批次生物活性的實驗室檢驗，也涵蓋保存期限短、病毒載體基因治療與病人專屬療法的特殊考量；FDA 將於 12 月 10 日舉辦說明會 [[35. U.S. FDA]](#ref-35)。做生技品質系統的團隊，批次資料的追溯範圍要從開發一路涵蓋到上市後。
- **健保署的基層院所雲端轉型補助計畫，首年已有 771 家診所與社區藥局完成系統導入。** 衛福部 11 月 1 日發布，健保署在逢甲大學舉辦中臺灣場次的觀摩會，推廣自 114 年起實施的三年期「基層醫療院所資訊服務系統雲端轉型補助計畫」。副署長張禹斌表示，計畫總計挹注 3 億元，首年度已有 771 家西、中、牙醫診所及社區藥局完成導入，串聯電子處方箋、電子病歷、線上預約與通訊診療；中區業務組組長丁增輝指出，系統上雲可減輕地端硬體與維修負擔，也為導入 AI 智慧醫療工具鋪路 [[36. 衛生福利部]](#ref-36)。做診所 HIS 的廠商，雲端架構與電子處方、通訊診療的介接會是基本需求。

<a id="hl-logistics"></a>
### 運輸物流

- **FAA 首批數位塔台在佛州與阿拉斯加啟用，管制員透過攝影機與螢幕取得 360 度視野。** FAA 11 月 6 日宣布，全美首批數位塔台已在佛羅里達州 Bartow Executive Airport 與阿拉斯加州 Kenai Municipal Airport 啟用，以先進攝影機與數位顯示器提供跑道、滑行道與周邊空域連續 360 度的視野；FAA 強調管制員仍負責管理空域，新技術是提供更多資訊。另有五座無塔台機場即將取得系統，FAA 已在 William J. Hughes Technical Center 等地測試多年，並選定 Frequentis 的系統部署 [[37. U.S. FAA]](#ref-37)。
- **FAA 開始以 E-IDS 汰換空管使用的軟碟，計畫 2028 年底前安裝到 435 個站點。** 美國運輸部長 Duffy 11 月 5 日宣布，FAA 將以 Enterprise – Information Display System（E-IDS）取代 1980 年代起使用、分布在 400 多個設施的四套系統，提供單一的系統讓管制員更快取得天氣等資訊，並改善 PIREPs 與 NOTAMs 的蒐集與發布。首批升級的設施包括大西洋城、納許維爾、羅徹斯特機場，以及亞特蘭大與鹽湖城的資料處理中心 [[38. U.S. FAA]](#ref-38)。四套舊系統併成一套，是典型的遺留系統整併。
- **Waymo 說明冬季營運：天候超出安全框架驗證的條件時，就縮小服務範圍或暫停，可能持續數小時到數天。** Waymo 11 月 5 日的部落格指出，每輛車都像移動氣象站，向整個車隊回傳道路與天氣資料，也參考地方官員與道路維護資訊。第六代 Waymo Driver 使用相機、雷達與光達，內建加熱器與微型雨刷保持感測器清潔，並即時量測各輪牽引力調整轉向、煞車與加速，冬季車隊也配雪胎。Waymo 說已在紐約州北部、密西根上半島與內華達山脈累積數萬英里實測，今年冬天會在阿拉斯加做封閉場地評估與大雪資料蒐集，並以模擬重現黑冰與白茫茫的天氣 [[39. Waymo]](#ref-39)。自動化系統的營運邊界與降級策略，是這篇的重點。
- **Zipline 募資 15 億美元、估值 215 億美元，與 Walmart 簽約在美國新增 300 個無人機配送站點。** 據 TechCrunch 報導，Zipline 與 Walmart 達成新的多年期協議，新增 300 個站點，雙方目前共有 21 個營運中站點；這輪募資由 Paradigm、WCM Investment Management 與 Layer Global 領投，Fidelity、Uber、J.P. Morgan 等參與 [[40. TechCrunch]](#ref-40)。站點數從二十幾個要擴到三百多個，航線規劃與站點調度的規模會跟著放大。
- **公路局擴大以無人機加 3D 建模與 AI 影像辨識巡檢橋梁與邊坡，AI 辨識準確率 8 成以上，仍須工程人員複查。** 據 iThome 報導，副局長周廷彰表示，公路局已把定期拍攝的影像建成 3D 模型比對不同時間的變化；報導指出目前已在基隆工務段轄管的台 2 線部分邊坡持續監測。中區養護工程分局以超過 2 萬張橋梁影像訓練模型，辨識裂縫、混凝土剝落、鋼筋裸露等缺失，目前針對 14 座橋梁驗證，預計明年起逐步推廣；公路局規畫 2026 至 2028 年投入約 1,170 萬元採購設備、培訓飛手，無人機由 45 架增加到 2028 年的 201 架 [[41. iThome]](#ref-41)。8 成以上準確率加人工複查，是政府端電腦視覺落地的實際樣貌。

<a id="hl-proptech"></a>
### 房地產與室內外裝潢

- **MIT 用縫製的布料模具澆置拓撲最佳化混凝土梁，混凝土用量約為傳統梁的三分之一、鋼筋約一半。** MIT 11 月 6 日發布的研究（刊於《Journal of Building Engineering》）以自動化流程把 3D 形體展開成可裁縫的版型，製作 3 公尺測試梁，實測反應與電腦模型預測相差約 2%；三種模具分別用 36、56、76 片布料，以 56 片的平衡最佳。成本比較顯示，在材料相對昂貴的南方國家，布模梁便宜約 10 至 20%；在人工昂貴的北方國家則貴約 16 至 55% [[42. MIT News]](#ref-42)。文中也指出，在人工昂貴的地區，重複性的矩形梁用傳統可重複使用的模具仍較經濟。
- **竹中工務店把拆除產生的廢混凝土做成「循環混凝土」，強度提高到 24N／平方毫米並首度用於結構基礎。** 據 ITmedia BUILT 報導，竹中工務店 10 月 23 日發表，以回收再生骨材搭配低碳水泥，按質量計約 8 成為再利用材，在維持與一般混凝土同等強度基準與耐久性下，CO2 排放量約減 6 成；首度用於 2027 年國際園藝博覽會的展示設施，作為獨立基礎的結構體。一般再生骨材混凝土多用於 18N／平方毫米以下的低強度用途；廢料來自橫濱市旭區一所高中的拆除工程，回收、製造、使用地點相近以降低運輸排碳 [[43. ITmedia BUILT]](#ref-43)。減碳數字為竹中自述。
- **SWCC 以市售相機的影像建立既設變電所的 3D 基底模型，用在新電纜路徑的設計上。** 據 ITmedia BUILT 報導，SWCC 10 月 29 日發表，已把東京電力 Power Grid 的既設變電所做成 3D 基底模型，這是 SWCC 自行提倡的 PIM（Picture Information Modeling）概念首度實際用於工事計畫。做法是以 Regana 事業的「ADitor」把一般相機拍的影像還原成 3D 模型，可量測尺寸，也能與 3D CAD 模型疊合；報導指出既設基礎設施多以 2D 圖面管理，老舊設備甚至只有紙本 [[44. ITmedia BUILT]](#ref-44)。不用專用量測設備就能建模，門檻低很多。
- **Toridoll 把 BIM 用在連鎖餐飲店舖的開發與維運，建立全生命週期共用的資料基盤。** 據 ITmedia BUILT 報導，Toridoll Holdings 10 月 23 日發表，已開始在店舖開發與建設業務導入 BIM，與 transcosmos 合作負責建模、規則制定與人才培育；自有的「TORIDOLL BIM Ecosystem」讓 3D 模型從土地探勘、設計、施工、營運到改裝、閉店共用資訊。公司同時開放設計與建設公司報名「BIM 習得計畫」，並開發 BIM 結合 AI 的運用，目標在 2030 年建立連結不動產、設計、施工、設備與店舖營運的資料生態系 [[45. ITmedia BUILT]](#ref-45)。這些多為「今後」「目標」，屬計畫階段。

<a id="hl-arts"></a>
### 現場表演藝術

- **FTC 堅持 Live Nation 的 BOTS Act 案件進入完整陪審團審理。** 據 Digital Music News 報導，Live Nation 聲請駁回失敗後，雙方就證據開示與時程出現爭議。此案由加州中區聯邦法院受理，與司法部和各州在紐約的反托拉斯訴訟分開，另有七州檢察長參與；起訴書指稱 2019 至 2024 年間轉售票費用達 37 億美元，FTC 與各州尋求永久禁制令、民事罰款與金錢救濟。Live Nation 主張 BOTS Act 針對的是轉售市場的機器人，不應用來對付主要售票平台 [[46. Digital Music News]](#ref-46)。防搶票的法律責任落在平台還是轉售商，會影響售票系統的風控設計。
- **Easol 取得 3,000 萬美元 A 輪延伸融資，推出給活動與體驗業者用的 AI 代理 Teammates。** 據 Digital Music News 報導，總部在倫敦的 Easol 為活動主辦方處理從網站設計、付款到訂位的流程，其中 2,000 萬美元為股權資金、1,000 萬美元為 Viola Credit 的債務額度。Easol 網站稱 Teammates 以客戶資料訓練，用於客服、銷售等，已向平台上所有創作者開放；報導引述 Easol 網站說法，Afro Nation 使用後營收增加 430 萬美元 [[47. Digital Music News]](#ref-47)。營收數字是公司網站說法，沒有獨立驗證。
- **One Arena 納入加拿大 SOCAN，現場演出版稅追蹤網路首度擴展到歐洲以外。** 據 Digital Music News 報導，由德國 GEMA 創立的 One Arena 讓權利人看到國際現場演出能賺多少、何時獲付款、版稅如何計算：網路會列出即將舉行的演唱會、產出版稅預測、把歌單提交給相關集管組織，並追蹤授權與付款狀態；成員有 SUISA、AKM、Buma-Stemra、KODA、TONO、OSA、SOCAN 與 GEMA [[48. Digital Music News]](#ref-48)。授權與付款責任仍由各地集管組織依各自規則負責，One Arena 處理的是跨組織的資料交換。

<a id="hl-entertainment"></a>
### 影視音樂

- **《魔戒》特效公司 Wētā FX 與文策院簽署 MOU，首要合作是投資台灣的夢想動畫。** 中央社報導，TCCF 創意內容大會 11 月 6 日開幕，Wētā FX 與文化內容策進院簽署合作備忘錄，期盼共同打造亞洲內容產業 AI 中心。Wētā FX 執行長謝安說明，首要合作是投資台灣的「夢想動畫」，也期望成立合製品牌、投資台灣影視作品並投入技術；另一重點是人才培育，讓台灣年輕電影人能透過專案到 Wētā FX 交流或合作 [[49. 中央社]](#ref-49)。報導沒有寫投資金額。
- **ElevenLabs 成為第一家加入 DDEX 的 AI 公司。** 據 Digital Music News 報導，制定音樂產業資料交換標準的非營利組織 DDEX 宣布，AI 音訊公司 ElevenLabs 以正式會員加入；DDEX 會員超過 150 家，其中 AI 內容歸屬（attribution）公司越來越多。ElevenLabs 的 Gabriella Heybourne 表示，希望參與全體會議與工作小組，協助制定音樂與 AI 相關資訊如何傳遞的做法 [[50. Digital Music News]](#ref-50)。報導也提到 AI 工作小組的 GAI-D 標準委員會草案已完成會員意見徵詢，預計 2027 年初發布，但沒有說明草案內容；串接音樂發行系統的人可以留意 AI 標示欄位的動向。
- **Suno 聲請駁回 Jason Isbell 等人的姓名肖像權集體訴訟，主張用藝人名字描述曲風受第一修正案保護。** 據 Digital Music News 報導，原告指控 Suno 讓使用者透過提示詞擷取並複製音樂人的身分，涉及姓名、形象與肖像（NIL）權；Suno 主張以藝人名字描述曲風是通用的簡稱，且美國著作權法不保護一般曲風與類型。報導另指出，Suno 會把直接輸入藝人名字的提示轉成描述性風格標籤，例如把「Pantera」轉成「aggressive metal」，原告則主張這個機制容易被繞過 [[51. Digital Music News]](#ref-51)。這只是聲請，法院尚未裁定。
- **Adobe 與 UMG、華納音樂簽約，Premiere 行動版將內建最長 60 秒的授權音樂片段。** 據 Digital Music News 報導，創作者可從空白專案或搭配音樂的範本開始，完成後發布到 YouTube Shorts、Instagram Reels 等已授權的社群平台，也能使用 Adobe Firefly 驅動的 AI 功能。兩家唱片公司的音樂「即將」上線，曲目授權只限個人非商業用途，需要商用授權的專案仍用 Adobe Stock Audio [[52. Digital Music News]](#ref-52)。授權範圍寫死在產品裡，是創作工具處理版權風險的一種做法。
- **Spotify 個人帳號可以在聯合航空 Starlink 機隊的座椅螢幕登入：用手機掃 QR code 配對，航程結束自動登出。** Spotify 11 月 5 日宣布，乘客連上機上 Wi‑Fi、在座椅螢幕點 Spotify 圖示並用手機掃 QR code 確認配對，就能取用個人化首頁、播放清單與資料庫；帳號資料不在座椅螢幕輸入。免費與 Premium 使用者皆可使用，功能依方案與市場而異，2027 年間會陸續擴及更多機型 [[53. Spotify Newsroom]](#ref-53)。公用螢幕不輸入密碼、用手機授權的配對流程，是值得參考的登入設計。

<a id="hl-others"></a>
### 其他領域科技應用突破

- **NASA 揭曉載人實驗機 X-70 Fractal，飛控可快速重新配置，可載最多 2,000 磅實驗酬載。** NASA 11 月 4 日在甘迺迪太空中心的 UP.Summit 公布 X-70，定位為加速先進航空技術開發與測試的研究平台。起飛重量 10,000 磅、設計巡航速度 Mach 0.75、最高高度 45,000 英尺、航程超過約 1,726 英里；NASA 署長 Jared Isaacman 表示，預期它在 NASA 名下的首飛會在未來兩年內 [[54. NASA]](#ref-54)。還沒飛，頁面上的機體圖也是電腦生成的示意圖。
- **MIT 與美國農業部開發蠶絲蛋白微針，可在水下為 1 至 2 公克的魚苗施打疫苗，傳統針頭約要等魚長到 30 公克。** MIT 11 月 2 日發布的研究（刊於《ACS Nano》）以蟲膠薄層替蠶絲蛋白微針防水，微針輕刺並附著在魚皮上、之後分解；團隊展示可把疫苗釋放時間從 15 分鐘調到 10 或 24 小時，DNA 質體在乾燥環境儲存四週後仍保留一半結構，有助於免冷鏈。現行最有效的金屬針注射要先麻醉魚、上輸送帶，勞力密集且對魚與工人都有風險 [[55. MIT News]](#ref-55)。研究者表示，要大規模用在養殖場還有工作要做。
- **Nature 搶先版研究：中國若納入氫與其衍生物，碳中和轉型成本可比「再生能源加電氣化」路徑少 10.7 兆美元。** 《Nature》11 月 5 日刊出的搶先版研究，模型納入高解析度再生能源布建、29 個省級區域的逐小時電力系統運作、逾 46,000 條氫衍生物的鐵路、公路、海運與管線轉運路徑，以及各終端部門的燃料採用策略；結果顯示可達到負的減排成本（每噸 -6.15 美元），並消除石油進口支出 [[56. Nature]](#ref-56)。這是模型推估，結論取決於假設；逐小時調度加路徑規劃的規模，本身就是大型最佳化問題。
- **NASA 模擬火星任務 CHAPEA 的第二批 4 名組員，結束 378 天隔離走出模擬艙。** 中央社綜合外電報導，組員 2025 年 10 月 19 日進入詹森太空中心以 3D 列印建造、約 158 平方公尺的隔離艙，任務包括在模擬火星土壤種植作物，以及模擬星際通訊的訊息延遲；接下來要做兩週的任務後評估。這是 NASA 第 2 次執行 CHAPEA [[57. 中央社]](#ref-57)。

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技

- **資安能力強的模型，先給受審查的少數客戶。** GPT-6 Cyber 初期只給部分 Daybreak Red 客戶，OpenAI 也把資安能力風險列為 Critical [[1. iThome]](#ref-1)。同一家公司的模型，資安專用版的開放節奏和一般版分開處理。
- **「回應是不是來自我付錢的那個模型」開始有技術解法。** FlashProve 用密碼學證明推論來源 [[3. Anthropic]](#ref-3)，雖然成本仍是直接推論的數十倍，但 API 轉接與模型路由越來越多，這類驗證之後可能成為採購條件之一。
- **記憶與個人化仍是代理的弱點。** LifeVal 中，資訊放進歷史對話後達標率明顯下降 [[6. iThome]](#ref-6)；Anthropic 的實測則認為給強模型判斷自由比規則有效 [[4. Anthropic]](#ref-4)。兩篇都提醒：記憶寫進去了，不代表之後找得到、用得上。
- **網站對 AI 訓練的授權，正在從各家規則走向共通標記。** robots.txt 的 __usage_ai-training 由四家業者支援，但仍是 Internet-Draft，各家上線時間不同 [[5. iThome]](#ref-5)；過渡期間，網站要同時維護新舊兩套設定。

<a id="tr-software"></a>
### 軟體工程

- **CI／CD 的預設值往安全那邊收。** GitHub 預設封鎖公開儲存庫的 pull_request_target [[8. GitHub Changelog]](#ref-8)；Claude Code 在閘道後的 auto mode 無法檢查時改為詢問或拒絕，claude -p 的結束碼也跟著改 [[10. GitHub Releases]](#ref-10)。過去「沒擋就是允許」的流程，升級後可能直接失敗。
- **程式碼代理的公司往下游的儲存與審查延伸。** OpenAI 收購 Pierre、同週發表自建 Git 後端 Pando [[7. iThome]](#ref-7)；代理並行改程式變多後，Git 本身的效能與審查流程成了新的瓶頸。
- **給代理看的文件，開始跟著套件版本走。** .NET 團隊把 Agent Skills 放進 NuGet 套件 [[12. .NET Blog]](#ref-12)，VS Code 的 Agents 視窗也繼續加強遠端預覽與排程 [[11. Visual Studio Code]](#ref-11)。套件作者除了 API 文件，可能還要維護一份給代理讀的技能說明。
- **語言標準函式庫仍在補舊債。** Go 的 json/v2 修正 v1 接受無效 UTF-8、重複成員名稱與缺乏串流的問題 [[9. Go Blog]](#ref-9)；要拿到最高 10 倍的效益，自訂序列化程式碼得配合改寫。

<a id="tr-security"></a>
### 軟硬體資訊安全

- **開發者的電腦與工具鏈，是本期最常見的入口。** Binance 的入口是變造的安裝程式與假面試作業 [[28. iThome]](#ref-28)，Cursor 市集的擴充套件被植入 SSH 後門 [[15. iThome]](#ref-15)。工程師機器上的權杖與部署權限，價值等同正式環境。
- **更新與供應鏈管道本身被拿來攻擊。** cPGuard 的更新金鑰被偷後，防護軟體自己的自動更新成了派送惡意程式的通道 [[14. iThome]](#ref-14)；XCPE 則是製造商在韌體預載後門 [[22. iThome]](#ref-22)。以 root 執行的更新元件，簽章金鑰的保管要比照最高權限。
- **修補不完整與組合條件，讓舊漏洞換個名字回來。** Zyxel 的前次修補把檢查放在複製之後 [[18. iThome]](#ref-18)；SSHole 則是三個專案各自解決不同問題的調整組合成可利用條件 [[13. iThome]](#ref-13)。測試修補時要驗證的是攻擊路徑真的斷了，不只是原本的 PoC 失效。
- **台灣本期有兩則與上游系統信任相關的事件。** 永豐銀行的異常轉帳出自外國供應商系統的設定漏洞 [[16. iThome]](#ref-16)，TWCA 則是憑證序號的亂數不足、屬合規問題 [[17. iThome]](#ref-17)。兩者都牽涉到外包或上游系統，委託方仍須自行驗證。

<a id="tr-hardware"></a>
### 硬體或軟硬整合

- **代理工作負載讓 CPU 重新被重視。** NVIDIA 以代理沙箱與工具呼叫的數據推 Vera CPU [[19. NVIDIA Blog]](#ref-19)；代理不只吃 GPU，CPU 端的啟動速度與每瓦容量也算進成本。
- **AI 資料中心的競爭延伸到光通訊。** Marvell 收購 Lumentum，要整合 AI 晶片、交換與光學互連 [[20. iThome]](#ref-20)；互連與功耗成為機櫃設計的限制，共封裝光學會影響之後的雲端網路規格。
- **終端裝置的 AI 算力持續往小尺寸機型下放。** iPad mini 的 A20 Pro 每個 GPU 核心都有 Neural Accelerator [[21. Apple Newsroom]](#ref-21)；不過最高規格的 Neural Engine 只在 512GB 組態，端側 AI App 仍要考慮不同組態的差距。

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎

- **套件與核心漏洞沿著基礎元件擴散。** APT 的驗證繞過影響 Debian 12、Ubuntu 22.04 以後的預設設定 [[23. iThome]](#ref-23)，Linux 核心 TCP 漏洞則延燒到 NetApp 儲存設備的管理介面 [[25. iThome]](#ref-25)。「用 HTTPS 套件來源」「管理介面放在隔離網路」這類基本設定，這週又被證明有用。
- **大型設定同步系統，從全量重建改為可證明的增量建置。** Cloudflare 讓事件帶有變更內容，再算出最小的安全建置 [[24. Cloudflare Blog]](#ref-24)；多租戶設定系統規模變大後，全量重建的成本會先撞上記憶體上限。
- **算力供給的瓶頸在實體建置。** IREN 的交付延遲源於微軟要求變更網路設計，營收目標延後另涉供應商交期 [[26. 中央社]](#ref-26)；租用 neocloud 算力的團隊，合約時程要預留緩衝。

<a id="tr-fintech"></a>
### 金融科技

- **穩定幣監理在台灣進入條文階段。** 金管會的草案定了發行人資格、資本額、準備資產與洗錢防制 [[27. 金融監督管理委員會]](#ref-27)，試辦要點也明定 60 日內完成審查 [[32. 金融監督管理委員會]](#ref-32)。系統要做的身分確認、準備資產查核與限制移轉，都可以從草案條文先拆出需求。
- **監理機關把 AI 放進既有框架，而不是另立一套。** OCC 的框架明確表示檢查人員不應把 SI 當獨立風險類別 [[29. OCC]](#ref-29)；銀行的 AI 治理文件，要能對回既有的風險分類。
- **代理購物的評測，從「能不能買」轉向「該不該買」。** Visa 的基準要求模型在沒有合適商品時選擇不買，失敗的測試中卻有約 54% 仍完成購買 [[30. Visa]](#ref-30)；Claude Personal Finance 則只給唯讀權限 [[31. iThome]](#ref-31)。碰到錢的代理，權限邊界是第一個設計決策。
- **加密資產平台的風險在工程流程。** Binance 的攻擊鏈經過開發機、內部 AI 工具與容器部署權限 [[28. iThome]](#ref-28)；MPC 熱錢包也因為無法立即撤銷授權，讓止血變慢。

<a id="tr-healthtech"></a>
### 醫療科技

- **基礎模型擴展到新的感測資料。** 步態模型用單一深度攝影機的動作資料預測多系統表型 [[33. Nature Medicine]](#ref-33)；資料來源從影像、文字延伸到動作，被動式量測可能成為新的臨床指標。
- **醫院端的 LLM 走向嵌入既有系統。** Mayo 的方案直接放進 EHR 工作流程，並自動引用文獻 [[34. HIT Consultant]](#ref-34)；台灣則仍在基層院所系統上雲的階段 [[36. 衛生福利部]](#ref-36)。兩邊的差距，在於 AI 工具要先有可介接的系統。
- **法規面持續細化製程與品質要求。** FDA 的效價保證指引建議從開發到上市後都納入效價考量 [[35. U.S. FDA]](#ref-35)，品質資料的追溯期間跟著拉長。

<a id="tr-logistics"></a>
### 運輸物流

- **航空管制的現代化集中在遺留系統汰換。** 數位塔台以攝影機與螢幕提供 360 度視野 [[37. U.S. FAA]](#ref-37)，E-IDS 把四套舊系統併成一套 [[38. U.S. FAA]](#ref-38)；兩者都需要長時間測試與分階段上線。
- **自動化系統的營運邊界要能隨條件收縮。** Waymo 在天候超出驗證條件時縮小服務或暫停 [[39. Waymo]](#ref-39)；定義「何時不服務」和定義「怎麼服務」一樣重要。
- **無人機開始規畫規模部署。** Zipline 與 Walmart 要新增 300 個站點 [[40. TechCrunch]](#ref-40)，公路局則規畫 2028 年把無人機增至 201 架 [[41. iThome]](#ref-41)；機隊變大後，影像資料管理與人工複查的人力會是新的瓶頸。

<a id="tr-proptech"></a>
### 房地產與室內外裝潢

- **計算設計開始直接影響施工方式。** MIT 的布模把最佳化形體展開成可裁縫的版型 [[42. MIT News]](#ref-42)，但成本優勢只在材料貴、人工便宜的地區成立。
- **既有設施的數位化門檻下降。** SWCC 用一般相機影像建 3D 模型 [[44. ITmedia BUILT]](#ref-44)，Toridoll 則把 BIM 當成店舖全生命週期的資料基盤 [[45. ITmedia BUILT]](#ref-45)；建築資訊從單案的設計檔，變成企業持續維護的資料。
- **減碳數據進入結構用途。** 竹中的循環混凝土把再生骨材用到結構基礎 [[43. ITmedia BUILT]](#ref-43)；材料的再利用率與碳排，可能成為建築資料模型的新欄位。

<a id="tr-arts"></a>
### 現場表演藝術

- **票務的法律攻防，影響的是系統設計。** FTC 的 BOTS Act 案爭的是售票平台本身要不要為轉售負責 [[46. Digital Music News]](#ref-46)。
- **活動產業的 SaaS 與版稅資料都在整合。** Easol 把 AI 代理做進活動平台 [[47. Digital Music News]](#ref-47)，One Arena 則讓各國集管組織共享演出與付款資料 [[48. Digital Music News]](#ref-48)。本期這類題材以產業合作為主，窗內沒有找到台灣場館的科技應用新聞。

<a id="tr-entertainment"></a>
### 影視音樂

- **AI 與音樂產業從對抗走向簽約與標準。** ElevenLabs 加入 DDEX [[50. Digital Music News]](#ref-50)，Adobe 與兩大唱片公司簽授權 [[52. Digital Music News]](#ref-52)；但 Suno 仍在法庭上為提示詞中的藝人名字辯護 [[51. Digital Music News]](#ref-51)，兩條路線並行。
- **台灣影視以合作吸引國際技術。** Wētā FX 與文策院的 MOU 以投資與人才交流為主 [[49. 中央社]](#ref-49)，實際投資規模要等後續公布。
- **串流登入延伸到公用螢幕。** Spotify 用手機配對登入座椅螢幕 [[53. Spotify Newsroom]](#ref-53)；裝置分離式登入的需求，會隨機上、車上等共用螢幕增加。

<a id="tr-others"></a>
### 其他領域科技應用突破

- **研究平台走向可重新配置。** X-70 的飛控與酬載都可快速換裝 [[54. NASA]](#ref-54)，讓同一架機器跑多種實驗，類似軟體定義硬體的思路。
- **大型能源系統的規劃仰賴最佳化模型。** 氫衍生物路徑的研究結合逐小時電力調度與數萬條轉運路徑 [[56. Nature]](#ref-56)，結論的可信度取決於模型假設。
- **農業與長期任務的研究仍在早期。** 魚苗微針在虹鱒上測試 [[55. MIT News]](#ref-55)，CHAPEA 則完成第二次 378 天模擬 [[57. 中央社]](#ref-57)；兩者都離實際部署還有距離。

<a id="references"></a>
## 參考資料

| 編號 | 文章標題與搜尋連結 | 一句話繁體中文結論或亮點 | 發布日期 | 來源資料網址與名稱 | 分類 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ref-1"></a>1 | [OpenAI發表GPT-6 Cyber，找出Firefox 81個未知高風險漏洞](https://www.google.com/search?q=GPT-6+Cyber+Firefox+81+iThome) | GPT-6 Cyber 在 Firefox 找出 81 個未知高風險漏洞，初期只給部分 Daybreak Red 客戶。 | 2026-11-06 | [iThome](https://www.ithome.com.tw/news/180285) | AI 科技 |
| <a id="ref-2"></a>2 | [Gemini Omni 1.2 Flash: Fast and cost-effective with longer clips](https://www.google.com/search?q=Gemini+Omni+1.2+Flash+15-second) | Gemini Omni 1.2 Flash 正式開放，支援 15 秒影片，價格較 1.1 降 30%。 | 2026-11-05 | [Google Blog](https://blog.google/innovation-and-ai/technology/developers-tools/introducing-gemini-omni-1-2-flash/) | AI 科技 |
| <a id="ref-3"></a>3 | [Progress on provable inference for large language models](https://www.google.com/search?q=Anthropic+provable+inference+FlashProve) | FlashProve 以 zkSNARK 證明回應來自宣稱的模型，程式碼以 Apache 2.0 釋出。 | 2026-11-02 | [Anthropic](https://www.anthropic.com/research/provable-inference) | AI 科技 |
| <a id="ref-4"></a>4 | [The components of agent memory](https://www.google.com/search?q=Anthropic+components+of+agent+memory) | Anthropic 以實測說明代理記憶的組成，強模型給予判斷自由比固定規則有效。 | 2026-11-06 | [Anthropic](https://www.anthropic.com/research/components-of-agent-memory) | AI 科技 |
| <a id="ref-5"></a>5 | [4大AI業者支援共通AI訓練偏好訊號，網站將可透過robots.txt統一設定](https://www.google.com/search?q=__usage_ai-training+robots.txt+iThome) | 四家 AI 業者將支援 robots.txt 共通 AI 訓練偏好標記，提案尚未成為正式標準。 | 2026-11-02 | [iThome](https://www.ithome.com.tw/news/180132) | AI 科技 |
| <a id="ref-6"></a>6 | [OpenAI揭露AI助理個人化瓶頸，模型仍難善用過往對話](https://www.google.com/search?q=OpenAI+LifeVal+iThome) | LifeVal 顯示需從歷史對話取資訊的評分條件平均只達標 33.33%。 | 2026-11-05 | [iThome](https://www.ithome.com.tw/news/180267) | AI 科技 |
| <a id="ref-7"></a>7 | [OpenAI收購Pierre，擴充Codex程式碼管理與審查能力](https://www.google.com/search?q=OpenAI+%E6%94%B6%E8%B3%BC+Pierre+Codex+iThome) | OpenAI 收購 Pierre，把 Git 儲存與程式碼審查技術整合進 Codex。 | 2026-11-05 | [iThome](https://www.ithome.com.tw/news/180257) | 軟體工程 |
| <a id="ref-8"></a>8 | [pull_request_target blocked by default December 2](https://www.google.com/search?q=pull_request_target+blocked+by+default+December+2) | GitHub Actions 12 月 2 日起預設封鎖公開儲存庫的 pull_request_target。 | 2026-11-02 | [GitHub Changelog](https://github.blog/changelog/2026-11-02-pull_request_target-blocked-by-default-december-2) | 軟體工程 |
| <a id="ref-9"></a>9 | [A new Go API for JSON](https://www.google.com/search?q=A+new+Go+API+for+JSON+encoding%2Fjson%2Fv2) | encoding/json/v2 在 Go 1.27 正式可用，Unmarshal 基準最高快 10 倍。 | 2026-11-04 | [Go Blog](https://go.dev/blog/jsonv2) | 軟體工程 |
| <a id="ref-10"></a>10 | [v2.1.319](https://www.google.com/search?q=Claude+Code+v2.1.319+release) | Claude Code v2.1.319 改變 LLM 閘道後的 auto mode 行為，新增 MCP task 背景執行。 | 2026-11-06 | [GitHub Releases](https://github.com/anthropics/claude-code/releases/tag/v2.1.319) | 軟體工程 |
| <a id="ref-11"></a>11 | [Visual Studio Code 1.145](https://www.google.com/search?q=Visual+Studio+Code+1.145+release+notes) | VS Code 1.145 讓遠端代理工作階段可預覽應用程式，Automations 支援 cron。 | 2026-11-04 | [Visual Studio Code](https://code.visualstudio.com/updates/v1_145) | 軟體工程 |
| <a id="ref-12"></a>12 | [Delivering Skills in NuGet packages](https://www.google.com/search?q=Delivering+Skills+in+NuGet+packages) | .NET 團隊實驗把 Agent Skills 隨 NuGet 套件版本一起發布。 | 2026-11-03 | [.NET Blog](https://devblogs.microsoft.com/dotnet/delivering-skills-in-nuget-packages/) | 軟體工程 |
| <a id="ref-13"></a>13 | [OpenSSH發布緊急更新，修補可利用長密碼繞過身分驗證的資安漏洞SSHole](https://www.google.com/search?q=OpenSSH+SSHole+CVE-2026-123158+iThome) | OpenSSH 10.6p2 修補 musl 系統上以長密碼繞過驗證的 SSHole。 | 2026-11-06 | [iThome](https://www.ithome.com.tw/news/180281) | 軟硬體資訊安全 |
| <a id="ref-14"></a>14 | [cPGuard更新通道遭到入侵，近3千臺伺服器被植入惡意程式](https://www.google.com/search?q=cPGuard+%E6%9B%B4%E6%96%B0%E9%80%9A%E9%81%93+%E5%85%A5%E4%BE%B5+iThome) | cPGuard 更新金鑰遭竊，約 2,950 臺伺服器執行了遭竄改的更新。 | 2026-11-04 | [iThome](https://www.ithome.com.tw/news/180217) | 軟硬體資訊安全 |
| <a id="ref-15"></a>15 | [Cursor市集出現惡意Claude Code擴充套件，攻擊者企圖建立SSH後門](https://www.google.com/search?q=Cursor+%E6%83%A1%E6%84%8F+Claude+Code+%E6%93%B4%E5%85%85%E5%A5%97%E4%BB%B6+SSH+iThome) | Cursor 市集的 Claude Code 擴充套件 2.1.312、2.1.313 被植入 SSH 後門程式。 | 2026-11-02 | [iThome](https://www.ithome.com.tw/news/180119) | 軟硬體資訊安全 |
| <a id="ref-16"></a>16 | [永豐銀行異常轉帳確認為駭客攻擊，供應商安全設定漏洞遭利用](https://www.google.com/search?q=%E6%B0%B8%E8%B1%90%E9%8A%80%E8%A1%8C+%E7%95%B0%E5%B8%B8%E8%BD%89%E5%B8%B3+%E9%A7%AD%E5%AE%A2+%E4%BE%9B%E6%87%89%E5%95%86+iThome) | 永豐銀行確認異常轉帳是駭客利用新網銀系統供應商的安全設定漏洞。 | 2026-11-04 | [iThome](https://www.ithome.com.tw/news/180233) | 軟硬體資訊安全 |
| <a id="ref-17"></a>17 | [TWCA CA憑證序號亂數不足遭Mozilla揭露，數發部要求換發並啟動第三方檢測](https://www.google.com/search?q=TWCA+%E6%86%91%E8%AD%89%E5%BA%8F%E8%99%9F+%E4%BA%82%E6%95%B8%E4%B8%8D%E8%B6%B3+Mozilla+iThome) | TWCA 部分 CA 憑證序號亂數只有約 24 bits，數發部要求換發。 | 2026-11-03 | [iThome](https://www.ithome.com.tw/news/180167) | 軟硬體資訊安全 |
| <a id="ref-18"></a>18 | [中國駭客利用Zyxel GS1900系列交換器零時差漏洞並竊得敏感資料](https://www.google.com/search?q=Zyxel+GS1900+Binarly+CVE-2026-107441+iThome) | Binarly 揭露 Zyxel GS1900 前次修補不完整，新漏洞另登記為 CVE-2026-107441。 | 2026-11-05 | [iThome](https://www.ithome.com.tw/news/180254) | 軟硬體資訊安全 |
| <a id="ref-19"></a>19 | [Vera Delivers the Best of Both Worlds: Highest Throughput and Fastest Agents](https://www.google.com/search?q=NVIDIA+Vera+CPU+highest+throughput+fastest+agents) | NVIDIA 自評 Vera CPU 每瓦可跑的代理數為最快 x86 的 1.6 倍。 | 2026-11-05 | [NVIDIA Blog](https://blogs.nvidia.com/blog/vera-cpu-highest-throughput-fastest-agents/) | 硬體或軟硬整合 |
| <a id="ref-20"></a>20 | [Marvell砸1,150億美元收購Lumentum，整合AI晶片與光通訊技術](https://www.google.com/search?q=Marvell+Lumentum+1%2C150%E5%84%84%E7%BE%8E%E5%85%83+iThome) | Marvell 擬以全股票收購 Lumentum，企業價值約 1,150 億美元。 | 2026-11-03 | [iThome](https://www.ithome.com.tw/news/180171) | 硬體或軟硬整合 |
| <a id="ref-21"></a>21 | [Apple gives iPad mini its biggest update ever](https://www.google.com/search?q=Apple+gives+iPad+mini+its+biggest+update+ever) | iPad mini 改用 8.5 吋 OLED、A20 Pro 與 IP67，11 月 6 日開賣。 | 2026-10-26 | [Apple Newsroom](https://www.apple.com/newsroom/2026/10/apple-gives-ipad-mini-its-biggest-update-ever/) | 硬體或軟硬整合 |
| <a id="ref-22"></a>22 | [XCPE殭屍網路控制逾130萬臺機上盒，Google指控Android裝置製造商刻意預載後門](https://www.google.com/search?q=XCPE+%E6%AE%AD%E5%B1%8D%E7%B6%B2%E8%B7%AF+Videostrong+iThome) | Google 指控 Videostrong 在韌體預載後門，XCPE 控制逾 130 萬臺機上盒。 | 2026-11-04 | [iThome](https://www.ithome.com.tw/news/180161) | 硬體或軟硬整合 |
| <a id="ref-23"></a>23 | [Debian、Ubuntu修補高風險APT套件漏洞，中間人可替換套件取得root權限](https://www.google.com/search?q=APT+CVE-2026-109518+Debian+Ubuntu+iThome) | APT 下載重試時可能被中間人替換已驗證套件，Debian、Ubuntu 已修補。 | 2026-11-05 | [iThome](https://www.ithome.com.tw/news/180262) | 網路/伺服器等基礎 |
| <a id="ref-24"></a>24 | [How we halved DNS build delay and cut memory use by 85%](https://www.google.com/search?q=Cloudflare+halved+DNS+build+delay+memory+85%25) | Cloudflare 以目標建置規劃讓 DNS 建置延遲減半、尖峰記憶體降 85%。 | 2026-11-02 | [Cloudflare Blog](https://blog.cloudflare.com/dns-targeted-zone-builds/) | 網路/伺服器等基礎 |
| <a id="ref-25"></a>25 | [NetApp揭露旗下多款儲存產品受Linux核心TCP漏洞影響](https://www.google.com/search?q=NetApp+Linux+TCP+CVE-2026-98432+iThome) | NetApp 多款儲存設備的 BMC 等元件受 Linux 核心 TCP 漏洞影響。 | 2026-11-04 | [iThome](https://www.ithome.com.tw/news/180208) | 網路/伺服器等基礎 |
| <a id="ref-26"></a>26 | [IREN延後交付微軟AI基礎設施　宣布追加150億美元投資](https://www.google.com/search?q=IREN+%E5%BB%B6%E5%BE%8C%E4%BA%A4%E4%BB%98+%E5%BE%AE%E8%BB%9F+150%E5%84%84%E7%BE%8E%E5%85%83+%E4%B8%AD%E5%A4%AE%E7%A4%BE) | IREN 延後交付部分微軟 AI 基礎設施，並提出約 150 億美元投資計畫。 | 2026-11-06 | [中央社](https://www.cna.com.tw/news/ait/202611060121.aspx) | 網路/伺服器等基礎 |
| <a id="ref-27"></a>27 | [金管會預告「穩定幣發行許可及管理辦法」草案及修正金融機構洗錢防制相關規定](https://www.google.com/search?q=%E7%A9%A9%E5%AE%9A%E5%B9%A3%E7%99%BC%E8%A1%8C%E8%A8%B1%E5%8F%AF%E5%8F%8A%E7%AE%A1%E7%90%86%E8%BE%A6%E6%B3%95+%E8%8D%89%E6%A1%88+%E9%87%91%E7%AE%A1%E6%9C%83) | 金管會預告穩定幣發行許可及管理辦法草案，非銀行發行人資本額至少 3 億元。 | 2026-11-03 | [金融監督管理委員會](https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202611030002&dtable=News) | 金融科技 |
| <a id="ref-28"></a>28 | [Binance揭露63億美元竊案攻擊鏈，駭客以假面試誘使工程師執行惡意程式](https://www.google.com/search?q=Binance+63%E5%84%84%E7%BE%8E%E5%85%83+%E7%AB%8A%E6%A1%88+%E6%94%BB%E6%93%8A%E9%8F%88+iThome) | Binance 竊案始於假面試與變造的安裝程式，駭客再取得容器部署權限。 | 2026-11-04 | [iThome](https://www.ithome.com.tw/news/180203) | 金融科技 |
| <a id="ref-29"></a>29 | [OCC Issues Supervisory Framework on Bank Use of Super Intelligence](https://www.google.com/search?q=OCC+Supervisory+Framework+Bank+Use+of+Super+Intelligence) | OCC 發布檢查銀行使用 SI 的框架，不把 SI 視為獨立風險類別。 | 2026-11-04 | [OCC](https://www.occ.gov/news-issuances/news-releases/2026/nr-occ-2026-97.html) | 金融科技 |
| <a id="ref-30"></a>30 | [Visa Releases First-of-Its-Kind Industry Benchmark for AI Shopping; Almost Half of Test Runs Fail](https://www.google.com/search?q=Visa+Agentic+Commerce+Benchmark) | Visa 的 AI 購物基準中，22 個模型整體通過率 57.2%。 | 2026-11-05 | [Visa](https://usa.visa.com/about-visa/newsroom/press-releases.releaseId.22936.html) | 金融科技 |
| <a id="ref-31"></a>31 | [Anthropic推出Claude個人理財功能，可連結銀行帳戶分析收支](https://www.google.com/search?q=Claude+Personal+Finance+Plaid+iThome) | Claude Personal Finance 透過 Plaid 以唯讀權限分析收支，先在美國測試。 | 2026-11-06 | [iThome](https://www.ithome.com.tw/news/180268) | 金融科技 |
| <a id="ref-32"></a>32 | [金管會修正「金融業申請業務試辦作業要點」－優化試辦機制、提升金融創新彈性](https://www.google.com/search?q=%E9%87%91%E8%9E%8D%E6%A5%AD%E7%94%B3%E8%AB%8B%E6%A5%AD%E5%8B%99%E8%A9%A6%E8%BE%A6%E4%BD%9C%E6%A5%AD%E8%A6%81%E9%BB%9E+%E4%BF%AE%E6%AD%A3+%E9%87%91%E7%AE%A1%E6%9C%83) | 金管會修正業務試辦要點，明定 60 日內完成審查。 | 2026-11-05 | [金融監督管理委員會](https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202611050002&dtable=News) | 金融科技 |
| <a id="ref-33"></a>33 | [A gait foundation model for prediction of multisystem health phenotypes from 3D skeletal motion](https://www.google.com/search?q=gait+foundation+model+3D+skeletal+motion+Nature+Medicine) | 單一深度攝影機的步態基礎模型，可預測 3,210 項表型中的 1,887 項。 | 2026-11-06 | [Nature Medicine](https://www.nature.com/articles/s41591-026-04724-9) | 醫療科技 |
| <a id="ref-34"></a>34 | [Mayo Clinic Platform Unveils EHR-Integrated Clinical Decision Support Engine Across 35+ Subspecialties](https://www.google.com/search?q=Mayo+Clinic+Platform+Clinical+Decision+Support+Engine) | Mayo Clinic Platform 推出嵌入 EHR、涵蓋 35 個以上次專科的 AI 臨床決策支援。 | 2026-11-03 | [HIT Consultant](https://hitconsultant.net/?p=98484) | 醫療科技 |
| <a id="ref-35"></a>35 | [FDA Provides Clarity to Support Cell and Gene Therapy Development and Quality](https://www.google.com/search?q=FDA+Potency+Assurance+Cellular+Gene+Therapy+final+guidance) | FDA 發布細胞與基因治療效價保證最終指引，取代 2011 年指引。 | 2026-11-02 | [U.S. FDA](https://www.fda.gov/news-events/press-announcements/fda-provides-clarity-support-cell-and-gene-therapy-development-and-quality) | 醫療科技 |
| <a id="ref-36"></a>36 | [健保數位轉型 智慧醫療扎根中台灣！ 攜手產官學引領基層院所迎向數位新紀元](https://www.google.com/search?q=%E5%9F%BA%E5%B1%A4%E9%86%AB%E7%99%82%E9%99%A2%E6%89%80%E8%B3%87%E8%A8%8A%E6%9C%8D%E5%8B%99%E7%B3%BB%E7%B5%B1%E9%9B%B2%E7%AB%AF%E8%BD%89%E5%9E%8B+771%E5%AE%B6) | 健保署雲端轉型補助計畫首年已有 771 家基層院所完成導入。 | 2026-11-01 | [衛生福利部](https://www.mohw.gov.tw/cp-16-88338-1.html) | 醫療科技 |
| <a id="ref-37"></a>37 | [FAA Deploys First Digital Air Traffic Control Towers in Florida and Alaska, Equipping Controllers With Better Technology](https://www.google.com/search?q=FAA+first+digital+air+traffic+control+towers+Bartow+Kenai) | FAA 首批數位塔台在 Bartow 與 Kenai 機場啟用。 | 2026-11-06 | [U.S. FAA](https://www.faa.gov/newsroom/faa-deploys-first-digital-air-traffic-control-towers-florida-and-alaska-equipping) | 運輸物流 |
| <a id="ref-38"></a>38 | [Trump’s Transportation Secretary Sean P. Duffy Begins Retiring Decades Old Floppy Disks from Air Traffic Control as Part of Ongoing Modernization Effort](https://www.google.com/search?q=FAA+E-IDS+retiring+floppy+disks+air+traffic+control) | FAA 以 E-IDS 取代空管使用的軟碟系統，計畫 2028 年底前裝到 435 個站點。 | 2026-11-05 | [U.S. FAA](https://www.faa.gov/newsroom/trumps-transportation-secretary-sean-p-duffy-begins-retiring-decades-old-floppy-disks-air) | 運輸物流 |
| <a id="ref-39"></a>39 | [How the Waymo Driver Manages Severe Winter Weather](https://www.google.com/search?q=How+the+Waymo+Driver+Manages+Severe+Winter+Weather) | Waymo 天候超出驗證條件時縮小服務範圍或暫停，今冬到阿拉斯加測試。 | 2026-11-05 | [Waymo](https://waymo.com/blog/2026/11/winter-weather-preparedness) | 運輸物流 |
| <a id="ref-40"></a>40 | [Zipline hits $21.5B valuation as Walmart expands bet on drone delivery](https://www.google.com/search?q=Zipline+21.5B+valuation+Walmart+drone+delivery) | Zipline 募資 15 億美元，與 Walmart 簽約新增 300 個無人機配送站點。 | 2026-11-05 | [TechCrunch](https://techcrunch.com/2026/11/05/zipline-hits-21-5b-valuation-as-walmart-expands-bet-on-drone-delivery/) | 運輸物流 |
| <a id="ref-41"></a>41 | [公路局擬擴大推動無人機AI巡檢，結合3D建模、AI影像辨識提升橋梁與邊坡養護效率](https://www.google.com/search?q=%E5%85%AC%E8%B7%AF%E5%B1%80+%E7%84%A1%E4%BA%BA%E6%A9%9F+AI%E5%B7%A1%E6%AA%A2+3D%E5%BB%BA%E6%A8%A1+iThome) | 公路局以逾 2 萬張橋梁影像訓練模型，AI 辨識準確率 8 成以上仍須人工複查。 | 2026-11-05 | [iThome](https://www.ithome.com.tw/news/180263) | 運輸物流 |
| <a id="ref-42"></a>42 | [Fabric molds could bring material-saving concrete beams within reach](https://www.google.com/search?q=MIT+fabric+molds+concrete+beams) | MIT 布模澆置的最佳化混凝土梁，混凝土用量約為傳統梁三分之一。 | 2026-11-06 | [MIT News](https://news.mit.edu/2026/fabric-molds-could-bring-material-saving-concrete-beams-within-reach-1106) | 房地產與室內外裝潢 |
| <a id="ref-43"></a>43 | [竹中工務店、横浜園芸博の展示施設に「サーキュラーコンクリート」適用：サーキュラーエコノミー](https://www.google.com/search?q=%E7%AB%B9%E4%B8%AD%E5%B7%A5%E5%8B%99%E5%BA%97+%E3%82%B5%E3%83%BC%E3%82%AD%E3%83%A5%E3%83%A9%E3%83%BC%E3%82%B3%E3%83%B3%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%88+%E6%A8%AA%E6%B5%9C%E5%9C%92%E8%8A%B8%E5%8D%9A) | 竹中工務店的循環混凝土約 8 成為再利用材，首度用於結構基礎。 | 2026-11-05 | [ITmedia BUILT](https://built.itmedia.co.jp/bt/articles/2611/05/news088.html) | 房地產與室內外裝潢 |
| <a id="ref-44"></a>44 | [東京電力PGの既設変電所を3Dベースモデル化、PIMを実際の工事計画に初適用　SWCC：導入事例](https://www.google.com/search?q=SWCC+PIM+ADitor+%E6%9D%B1%E4%BA%AC%E9%9B%BB%E5%8A%9B%E3%83%91%E3%83%AF%E3%83%BC%E3%82%B0%E3%83%AA%E3%83%83%E3%83%89+%E5%A4%89%E9%9B%BB%E6%89%80) | SWCC 以市售相機影像建立既設變電所 3D 模型，用於電纜路徑設計。 | 2026-11-04 | [ITmedia BUILT](https://built.itmedia.co.jp/bt/articles/2611/04/news058.html) | 房地產與室內外裝潢 |
| <a id="ref-45"></a>45 | [トリドールHDが店舗開発／維持管理にBIM活用、トランスコスモスと連携：BIM](https://www.google.com/search?q=%E3%83%88%E3%83%AA%E3%83%89%E3%83%BC%E3%83%AB+BIM+%E3%83%88%E3%83%A9%E3%83%B3%E3%82%B9%E3%82%B3%E3%82%B9%E3%83%A2%E3%82%B9) | Toridoll 建立店舖全生命週期共用的 BIM 資料基盤。 | 2026-11-06 | [ITmedia BUILT](https://built.itmedia.co.jp/bt/articles/2611/06/news086.html) | 房地產與室內外裝潢 |
| <a id="ref-46"></a>46 | [Federal Trade Commission Demands Full Jury Trial Against Live Nation Over BOTS Act Violations, Unlawful Resales, and Deceptive Trade Practices](https://www.google.com/search?q=FTC+jury+trial+Live+Nation+BOTS+Act) | FTC 堅持 Live Nation 的 BOTS Act 案件進入完整陪審團審理。 | 2026-10-29 | [Digital Music News](https://www.digitalmusicnews.com/2026/10/29/ftc-demands-jury-trial-live-nation/) | 現場表演藝術 |
| <a id="ref-47"></a>47 | [AI-Powered Experience-Management Platform Easol Announces $30 Million Raise, Debuts Agentic Product ‘Teammates’](https://www.google.com/search?q=Easol+30+million+Teammates) | Easol 取得 3,000 萬美元 A 輪延伸融資，推出活動業者用的 AI 代理。 | 2026-10-28 | [Digital Music News](https://www.digitalmusicnews.com/2026/10/28/easol-series-a-extension/) | 現場表演藝術 |
| <a id="ref-48"></a>48 | [GEMA Hooks Canada’s SOCAN Into Its Growing One Arena Live Collective](https://www.google.com/search?q=GEMA+SOCAN+One+Arena) | One Arena 納入加拿大 SOCAN，現場演出版稅追蹤網路首度擴展到歐洲以外。 | 2026-11-02 | [Digital Music News](https://www.digitalmusicnews.com/2026/11/02/gema-socan-one-arena-live-collective/) | 現場表演藝術 |
| <a id="ref-49"></a>49 | [「魔戒」特效公司Wētā FX 攜手文策院推培育台灣人才合作](https://www.google.com/search?q=W%C4%93t%C4%81+FX+%E6%96%87%E7%AD%96%E9%99%A2+TCCF+%E4%B8%AD%E5%A4%AE%E7%A4%BE) | Wētā FX 與文策院簽 MOU，首要合作是投資台灣的夢想動畫。 | 2026-11-06 | [中央社](https://www.cna.com.tw/news/acul/202611060169.aspx) | 影視音樂 |
| <a id="ref-50"></a>50 | [DDEX Announces ElevenLabs as First AI Company to Join Its Ranks](https://www.google.com/search?q=DDEX+ElevenLabs+first+AI+company) | ElevenLabs 成為第一家加入 DDEX 的 AI 公司。 | 2026-11-06 | [Digital Music News](https://www.digitalmusicnews.com/2026/11/05/ddex-elevenlabs-first-ai-company/) | 影視音樂 |
| <a id="ref-51"></a>51 | [Nothing Illegal Here: Suno Moves to Dismiss Jason Isbell’s Class Action Lawsuit on First Amendment and US Copyright Law Grounds](https://www.google.com/search?q=Suno+motion+to+dismiss+Jason+Isbell+class+action) | Suno 聲請駁回 Isbell 等人的 NIL 集體訴訟，主張受第一修正案保護。 | 2026-11-04 | [Digital Music News](https://www.digitalmusicnews.com/2026/11/03/suno-moves-to-dismiss-isbell-class-action-lawsuit/) | 影視音樂 |
| <a id="ref-52"></a>52 | [No Litigation for These Guys: Adobe Successfully Licenses Tracks from UMG and WMG in Major Music Partnership](https://www.google.com/search?q=Adobe+Premiere+mobile+UMG+WMG) | Adobe Premiere 行動版將內建 UMG、華納的授權音樂片段，限個人非商業用途。 | 2026-11-03 | [Digital Music News](https://www.digitalmusicnews.com/2026/11/03/adobe-premiere-mobile-umg-wmg-partnership/) | 影視音樂 |
| <a id="ref-53"></a>53 | [Log In to Spotify. Take Off With United.](https://www.google.com/search?q=Spotify+United+Airlines+seatback+log+in) | Spotify 個人帳號可在聯合航空 Starlink 機隊的座椅螢幕以 QR code 登入。 | 2026-11-05 | [Spotify Newsroom](https://newsroom.spotify.com/2026-11-05/united-airlines-partnership-update/) | 影視音樂 |
| <a id="ref-54"></a>54 | [NASA Announces X-70 Experimental Aircraft to Advance Flight Research](https://www.google.com/search?q=NASA+X-70+Fractal+experimental+aircraft) | NASA 揭曉可快速重新配置飛控的載人實驗機 X-70 Fractal。 | 2026-11-04 | [NASA](https://www.nasa.gov/news-release/nasa-announces-x-70-experimental-aircraft-to-advance-flight-research/) | 其他領域科技應用突破 |
| <a id="ref-55"></a>55 | [MIT engineers design a safer, more efficient vaccination system for farmed fish](https://www.google.com/search?q=MIT+microneedle+vaccination+farmed+fish) | MIT 與 USDA 的蠶絲蛋白微針可在水下為 1 至 2 公克的魚苗施打疫苗。 | 2026-11-02 | [MIT News](https://news.mit.edu/2026/mit-engineers-design-safer-more-efficient-vaccination-system-farmed-fish-1102) | 其他領域科技應用突破 |
| <a id="ref-56"></a>56 | [Hydrogen Derivatives Enable Cost-Effective Carbon Neutrality in China](https://www.google.com/search?q=Hydrogen+Derivatives+Enable+Cost-Effective+Carbon+Neutrality+in+China) | 模型推估納入氫衍生物，中國碳中和轉型成本可比再生能源加電氣化路徑少 10.7 兆美元。 | 2026-11-05 | [Nature](https://www.nature.com/articles/s41586-026-11351-4) | 其他領域科技應用突破 |
| <a id="ref-57"></a>57 | [助攻未來火星任務　NASA太空人隔離378天後首踏出模擬艙](https://www.google.com/search?q=CHAPEA+378%E5%A4%A9+%E6%A8%A1%E6%93%AC%E8%89%99+%E4%B8%AD%E5%A4%AE%E7%A4%BE) | CHAPEA 第二批 4 名組員結束 378 天模擬火星隔離。 | 2026-11-02 | [中央社](https://www.cna.com.tw/news/ait/202611020047.aspx) | 其他領域科技應用突破 |

<a id="notes"></a>
## 報告說明

本期報告的時間範圍為 2026-10-24 至 2026-11-07（今天起往前 15 天，含首尾）。來源優先序為官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載；中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。本期共蒐集候選來源 103 筆，採用 57 筆為正式參考資料、淘汰 46 筆，筆數以 `source.md` 的條目數為準。正式來源逐筆以原頁核對標題、發布日期、來源網站名稱與報告引用的數字；原頁無法取得或日期無法確認者淘汰。Codex 第二輪查核重抓 57 筆原頁、驗證 559 個來源詞並重新補搜 12 類；正式與淘汰來源不變。

本期窗期與上一期（2026-10-31，窗期 2026-10-17 至 2026-10-31）重疊八天，與 2026-10-24 期重疊一天，篩選前先比對兩期的 `references.md` 與上一期的淘汰清單。上一期事件的後續若有新的實質進展仍可收，例如 Linux 核心 TCP 漏洞延燒到 NetApp 儲存設備（上一期收的是漏洞本身與發行版修補），以及 TCCF 的 Wētā FX 簽約（上一期收的是活動預告）。正式來源集中在窗期後半（11 月 1 日至 6 日），前半的事件多半已被上一期收錄。

<a id="limitations"></a>
### 資料限制與判讀提醒

- **非一手來源的使用。** GPT-6 Cyber、AI 訓練偏好標記、LifeVal、Pierre、OpenSSH、cPGuard、Cursor 擴充套件、永豐銀行、TWCA、Zyxel、Marvell、XCPE、APT、NetApp、Binance、Claude Personal Finance 與公路局以 iThome 為來源 [[1. iThome]](#ref-1) [[5. iThome]](#ref-5) [[6. iThome]](#ref-6) [[7. iThome]](#ref-7) [[13. iThome]](#ref-13) [[14. iThome]](#ref-14) [[15. iThome]](#ref-15) [[16. iThome]](#ref-16) [[17. iThome]](#ref-17) [[18. iThome]](#ref-18) [[20. iThome]](#ref-20) [[22. iThome]](#ref-22) [[23. iThome]](#ref-23) [[25. iThome]](#ref-25) [[28. iThome]](#ref-28) [[31. iThome]](#ref-31) [[41. iThome]](#ref-41)，其中 openai.com 擋抓取，OpenAI 三則的數字以 iThome 引述為準；IREN 與 CHAPEA 為中央社綜合外電 [[26. 中央社]](#ref-26) [[57. 中央社]](#ref-57)；Mayo Clinic 的方案以 HIT Consultant 為來源，Mayo 官方站對抓取回 403 [[34. HIT Consultant]](#ref-34)；Zipline 以 TechCrunch 為來源 [[40. TechCrunch]](#ref-40)；日本營建三則為 ITmedia BUILT 對企業發表的報導 [[43. ITmedia BUILT]](#ref-43) [[44. ITmedia BUILT]](#ref-44) [[45. ITmedia BUILT]](#ref-45)；現場表演藝術三則與影視音樂五則中的三則以 Digital Music News 為來源 [[46. Digital Music News]](#ref-46) [[47. Digital Music News]](#ref-47) [[48. Digital Music News]](#ref-48) [[50. Digital Music News]](#ref-50) [[51. Digital Music News]](#ref-51) [[52. Digital Music News]](#ref-52)。
- **供應商自評數字未經第三方驗證。** GPT-6 Cyber 的漏洞數與基準為 OpenAI 公布 [[1. iThome]](#ref-1)；Gemini Omni 的價格與規格 [[2. Google Blog]](#ref-2)、FlashProve 的效能數字 [[3. Anthropic]](#ref-3)、Anthropic 的記憶評測 [[4. Anthropic]](#ref-4)、LifeVal 的成績 [[6. iThome]](#ref-6)、Go json/v2 的基準 [[9. Go Blog]](#ref-9)、NVIDIA Vera 與合作夥伴的比較 [[19. NVIDIA Blog]](#ref-19)、Marvell 的市場規模與綜效預估 [[20. iThome]](#ref-20)、Apple 的亮度與頻寬倍數 [[21. Apple Newsroom]](#ref-21)、Cloudflare 的建置數字 [[24. Cloudflare Blog]](#ref-24)、Visa 的基準結果 [[30. Visa]](#ref-30)、竹中的減碳比例 [[43. ITmedia BUILT]](#ref-43)、Easol 的營收增幅 [[47. Digital Music News]](#ref-47)，皆屬公司自行揭露，本報告照原文引用並標明出處。Live Nation 案的指控與 Suno 案的主張為訴訟雙方說法，未經法院認定 [[46. Digital Music News]](#ref-46) [[51. Digital Music News]](#ref-51)。
- **稀疏分類的來源組成。** 房地產與室內外裝潢經 8 輪補搜，4 筆皆為日本與美國的營建科技，窗內找不到台灣政府或業者的科技題；現場表演藝術只有 3 筆，皆來自 Digital Music News，偏訴訟與產業合作；醫療科技經 9 輪補搜，4 筆中 1 筆只讀到論文摘要 [[33. Nature Medicine]](#ref-33)。
- **未來事件與已發生事件的區別。** GPT-6 Cyber 尚未全面開放 [[1. iThome]](#ref-1)；robots.txt 共通標記仍是 Internet-Draft，各家支援時程分散到 2027 年 [[5. iThome]](#ref-5)；pull_request_target 的封鎖 12 月 2 日才生效 [[8. GitHub Changelog]](#ref-8)；VS Code 多項新功能仍為 Preview 或 Experimental [[11. Visual Studio Code]](#ref-11)；Marvell 收購預計 2028 年上半年完成 [[20. iThome]](#ref-20)；NetApp 尚未列出修補版本 [[25. iThome]](#ref-25)；IREN 的進度可能再延 [[26. 中央社]](#ref-26)；穩定幣辦法為預告草案，虛擬資產服務法施行日期未定 [[27. 金融監督管理委員會]](#ref-27)；Binance 的調查仍在進行 [[28. iThome]](#ref-28)；Visa 基準的延伸測試為計畫 [[30. Visa]](#ref-30)；Claude Personal Finance 為美國測試版 [[31. iThome]](#ref-31)；五座數位塔台與 E-IDS 的全面安裝仍待完成 [[37. U.S. FAA]](#ref-37) [[38. U.S. FAA]](#ref-38)；Waymo 的阿拉斯加測試在今年冬天 [[39. Waymo]](#ref-39)；Zipline 的 300 個站點為新協議 [[40. TechCrunch]](#ref-40)；公路局的 AI 巡檢預計明年起推廣 [[41. iThome]](#ref-41)；Toridoll 的資料生態系目標在 2030 年 [[45. ITmedia BUILT]](#ref-45)；Live Nation 案是否開庭大半取決於證據開示 [[46. Digital Music News]](#ref-46)；Wētā FX 的合作為 MOU [[49. 中央社]](#ref-49)；Suno 的駁回聲請尚未裁定 [[51. Digital Music News]](#ref-51)；Adobe 的授權音樂「即將」上線 [[52. Digital Music News]](#ref-52)；X-70 預期兩年內首飛 [[54. NASA]](#ref-54)；魚苗微針與氫衍生物路徑仍屬研究與模型推估 [[55. MIT News]](#ref-55) [[56. Nature]](#ref-56)。本報告引用的是窗內的公告或報導，並非已完成的事實。
- **日期判定的特例。** Claude Code v2.1.319 的發布時間為 UTC 11 月 6 日 17:04 [[10. GitHub Releases]](#ref-10)；NVIDIA Vera 一文為 UTC 11 月 5 日 20:00（台灣時間 11 月 6 日清晨），取 UTC 日期 [[19. NVIDIA Blog]](#ref-19)；iThome 各則取頁面的發表日期，事件日多早於報導日，例如 OpenSSH 10.6p2 發布於 11 月 5 日、報導為 11 月 6 日 [[13. iThome]](#ref-13)，Cursor 的惡意版本出現在 10 月 29 日、報導為 11 月 2 日 [[15. iThome]](#ref-15)；VS Code 1.145 頁面的 JSON-LD 日期為 2021 年的模板值，改取頁面的 Release date 並與官方 feed 交叉確認 [[11. Visual Studio Code]](#ref-11)；FAA 兩則沒有 datePublished，取頁面日期列 [[37. U.S. FAA]](#ref-37) [[38. U.S. FAA]](#ref-38)；健保署新聞稿取建檔日期 115 年 11 月 1 日 [[36. 衛生福利部]](#ref-36)；ITmedia BUILT 三則的企業原始發表日為 10 月 23 日至 29 日，皆在窗內 [[43. ITmedia BUILT]](#ref-43) [[44. ITmedia BUILT]](#ref-44) [[45. ITmedia BUILT]](#ref-45)；DDEX 與 Suno 兩則的網址日期比 datePublished 早一天，取 datePublished [[50. Digital Music News]](#ref-50) [[51. Digital Music News]](#ref-51)。
- **原頁未提供的資訊一律不補。** Nature Medicine 與 Nature 兩篇只讀到摘要，方法與限制未讀全文 [[33. Nature Medicine]](#ref-33) [[56. Nature]](#ref-56)；OpenAI 收購 Pierre 的金額未公開 [[7. iThome]](#ref-7)；永豐銀行未說明轉帳手法與限額 [[16. iThome]](#ref-16)；Wētā FX 的投資金額報導未提 [[49. 中央社]](#ref-49)；DDEX 未說明 GAI-D 草案內容 [[50. Digital Music News]](#ref-50)。以上皆不以其他報導的數字替代原頁內容。

<a id="disclaimer"></a>
## 免責聲明

本報告由 AI 工具彙整公開資訊而成，內容僅供參考，不構成投資、法律、醫療或任何專業建議。所有數據與敘述均以參考資料所列來源為準，讀者應自行回溯原始來源確認。報告中涉及的產品規格、價格、時程與政策內容可能隨時變動，實際情形請以各官方公告為準。
