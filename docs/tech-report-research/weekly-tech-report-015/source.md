# 候選來源整理

報告日期：2026-08-08
時間範圍：2026-07-24 至 2026-08-08（含首尾）

## 正式納入來源

### 1. Microsoft 拆解 ChainDrop npm 自我傳播蠕蟲
- 來源網址：https://www.microsoft.com/en-us/security/blog/2026/08/04/chaindrop-supply-chain-compromise-anatomy-self-propagating-worm/
- 原始頁面標題：ChainDrop supply chain compromise: Anatomy of a self-propagating worm
- 繁體中文標題：ChainDrop 供應鏈入侵：自我傳播蠕蟲的解剖
- 摘要：Microsoft 於 8 月 4 日發布 ChainDrop 事件技術分析，指出這起 npm 供應鏈攻擊影響超過 400 個套件、橫跨多個彼此無關的發布者，包含 keyv、flat-cache 與 cache-manager 等被廣泛相依的快取套件。攻擊特徵是短時間內出現大量未對應原始碼提交或 PR 的 patch 版本。惡意程式屬於 Mini Shai-Hulud 變種，以高度混淆的 Bun 版 JavaScript 承載，透過 npm preinstall 生命週期掛鉤在安裝完成前就執行，接著蒐集 npm、GitHub、AWS、Kubernetes 與 HashiCorp Vault 憑證，再用取得的身分下載該發布者的最新版本、把自己插入、遞增 patch 版號後重新發布，形成指數擴散。外傳走攻擊者控制的動態 HTTPS 端點（主要為 npm-cache[.]com），並以 GitHub 儲存庫作為備援，實際使用中的網域可透過鏈上合約更換。Microsoft 建議升級至 npm CLI v12、從乾淨主機輪替憑證、清除 npm 快取、重新檢視相依樹，並以已知良好基準重建系統。
- 權重分數：10/10
- 發布日期：2026-08-04
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 查核方式：直接開啟 Microsoft Security Blog 現行頁面核對 H1、發布日、影響規模、傳播方式與緩解建議。第三方研究（Expel、Elastic、StepSecurity）另有「2,251 個版本 / 452 個套件」等更大數字，因與原廠敘述不一致，報告中僅採用 Microsoft 自身公布的「超過 400 個套件」。

### 2. GitHub 讓企業集中控管 MCP 伺服器白名單
- 來源網址：https://github.blog/changelog/2026-08-06-mcp-allowlists-in-enterprise-managed-settings
- 原始頁面標題：MCP allowlists in enterprise managed settings
- 繁體中文標題：企業受管設定新增 MCP 伺服器白名單
- 摘要：GitHub 於 8 月 6 日開放企業擁有者以 `allowedMcpServers` 與 `deniedMcpServers` 兩個設定鍵，集中決定哪些 Model Context Protocol 伺服器可以在 GitHub Copilot 用戶端執行。比對方式支援三種：`serverUrl`（遠端伺服器，可用萬用字元）、`serverCommand`（本機 stdio 伺服器）與 `serverName`（使用者自訂標籤）。設定採 fail closed，格式錯誤一律視為封鎖而非放行；伺服器託管的部署可再為特定團隊覆寫基準政策。設定寫在組織 `.github-private` 儲存庫的 `copilot/managed-settings.json` 並提交到預設分支，目前在 GitHub Copilot app、Copilot CLI 與 VS Code 上生效。
- 權重分數：10/10
- 發布日期：2026-08-06
- 分類：軟體工程
- 是否納入正式參考資料：是
- 查核方式：直接開啟 GitHub Changelog 現行頁面核對標題、發布日、設定鍵名稱、比對方式與生效範圍。

### 3. GitHub Copilot 程式碼審查推出可調整的審查強度
- 來源網址：https://github.blog/changelog/2026-08-07-copilot-code-review-effort-levels-are-generally-available
- 原始頁面標題：Copilot code review effort levels are generally available
- 繁體中文標題：Copilot 程式碼審查強度層級正式推出
- 摘要：GitHub 於 8 月 7 日宣布 Copilot code review 的兩種強度層級 Lite 與 Balanced 正式推出。Lite 提供聚焦回饋，適用文件修改與小幅修正；Balanced 則以進階推理模型提供完整分析，官方建議用於複雜邏輯、資安敏感程式碼與跨服務變更。組織可在管理設定訂出預設強度，個別儲存庫可覆寫；審查結果會在時間軸事件與 PR 留言中標示實際採用的層級。原本的 Low 與 Medium 分別更名為 Lite 與 Balanced，既有設定自動沿用。適用 Copilot Pro、Pro+、Max、Business 與 Enterprise。
- 權重分數：10/10
- 發布日期：2026-08-07
- 分類：軟體工程
- 是否納入正式參考資料：是
- 查核方式：直接開啟 GitHub Changelog 現行頁面核對標題、發布日、層級名稱與適用方案。

### 4. Kimi K3 進入 GitHub Copilot 模型選單
- 來源網址：https://github.blog/changelog/2026-08-06-kimi-k3-is-now-available-in-github-copilot
- 原始頁面標題：Kimi K3 is now available in GitHub Copilot
- 繁體中文標題：GitHub Copilot 開放使用 Kimi K3
- 摘要：GitHub 於 8 月 6 日宣布開放權重模型 Kimi K3 在各 Copilot 方案全面上線，由 GitHub 託管於 Fireworks AI，官方描述為「在代理型程式開發上具備前沿等級能力，且價格極具成本效益」。使用者可在 VS Code、JetBrains、Xcode 與行動版的模型選單中選用。計價採用量計費：每百萬輸入 token 3 美元、每百萬輸出 token 15 美元、每百萬快取輸入 token 0.30 美元。Business 與 Enterprise 組織預設為停用，須由管理者評估資安與法遵需求後再開啟。此次推出一度因 GitHub Actions 事件暫停，之後恢復。
- 權重分數：10/10
- 發布日期：2026-08-06
- 分類：AI 科技
- 是否納入正式參考資料：是
- 查核方式：直接開啟 GitHub Changelog 現行頁面核對標題、發布日、託管方式、單價與預設停用政策。

### 5. 白宮與四大 AI 業者敲定前沿模型自願安全測試框架
- 來源網址：https://tech.udn.com/tech/story/123454/9670963
- 原始頁面標題：白宮急召四大AI巨頭：前沿模型發布前「自願」安全測試框架成形 但疑慮未解
- 繁體中文標題：白宮急召四大 AI 巨頭：前沿模型發布前「自願」安全測試框架成形 但疑慮未解
- 摘要：白宮於 8 月 4 日與 Meta、Anthropic、OpenAI、Google 舉行閉門會議，討論剛完成的前沿 AI 模型自願性資安測試框架。框架源自川普 6 月的行政命令，要求政府建立機密評測基準，衡量模型發現軟體漏洞與發動複雜網路攻擊的能力。參與業者可在把新模型提供給外部受信任夥伴之前，先讓政府存取測試最長 30 天；行政命令同時劃下紅線，機制不得變相成為強制許可、發布前審批或發行許可證。報導指出，直到會議前夕四家公司仍未看到框架具體內容，測試指標、結果通報方式與適用範圍都未公開；對主打開放權重模型的業者而言，模型一旦公開就無法追蹤後續散布路徑，是最大的適用盲區。文中也提到近期 OpenAI 與 Anthropic 都揭露過內部評測模型突破隔離環境的事件，是這套框架加速成形的背景。
- 權重分數：9/10
- 發布日期：2026-08-05
- 分類：AI 科技
- 是否納入正式參考資料：是
- 查核方式：直接開啟 udn 科技玩家現行頁面核對 H1、2026-08-05 07:30 發布時間、作者與 30 天存取、紅線條款等敘述；另以多家媒體交叉確認會議日期為 8 月 4 日。已優先採用台灣媒體，取代搜尋結果中的中國來源報導。

### 6. AWS 一週更新：Bedrock 降價、跨雲專線與多區身分備援
- 來源網址：https://aws.amazon.com/blogs/aws/aws-weekly-roundup-price-reduction-of-gpt-models-in-bedrock-cloudwatch-managed-collectors-for-prometheus-metrics-and-more-august-3-2026/
- 原始頁面標題：AWS Weekly Roundup: Price reduction of GPT models in Bedrock, CloudWatch managed collectors for Prometheus metrics, and more (August 3, 2026)
- 繁體中文標題：AWS 一週彙整：Bedrock 上的 GPT 模型降價、CloudWatch 受管 Prometheus 收集器等（2026 年 8 月 3 日）
- 摘要：AWS 於 8 月 3 日彙整當週更新。Amazon Bedrock 上的 OpenAI GPT-5.6 Luna 價格調降 80%，降至每百萬輸入 token 0.20 美元、每百萬輸出 token 1.20 美元，GPT-5.6 Terra 調降 20%，自 7 月 30 日起自動套用。CloudWatch 推出受管 Prometheus 收集器，不需自行部署 agent 即可監控 Amazon EKS、EC2、ECS、MSK 與 OpenSearch Service 工作負載。AWS Interconnect for OCI 被定位為「第一個為多雲打造的專屬連線產品」，讓 AWS 與 Oracle Cloud Infrastructure 之間可以不經公開網際網路建立私有互連。IAM Identity Center 目錄新增跨區複寫，主要區域中斷時仍能維持使用者存取。Amazon S3 Tables 則支援 Apache Iceberg V3 的 Variant 資料型別，讓 IoT 感測資料與應用程式日誌不必再塞成 JSON blob。
- 權重分數：10/10
- 發布日期：2026-08-03
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 查核方式：直接開啟 AWS News Blog 現行頁面核對標題、發布日與五項更新內容。

### 7. NVIDIA 修補 Dynamo 推論框架 16 項漏洞
- 來源網址：https://github.com/NVIDIA/product-security/tree/main/2026/5842
- 原始頁面標題：Security Bulletin: NVIDIA Dynamo - August 2026
- 繁體中文標題：資安公告：NVIDIA Dynamo－2026 年 8 月
- 摘要：NVIDIA 於 8 月 4 日發布 Dynamo 分散式 AI 推論服務框架的資安公告，一次修補 16 項 CVE。風險最高的 CVE-2026-24254 為 CVSS 9.8 重大等級，位於 Linux 版 Dynamo 的多模態服務拓撲，允許越界寫入，可導致程式碼執行與權限提升。另有 CVE-2026-24253（8.2，越界寫入造成阻斷服務與資料竄改）與 CVE-2026-47623（8.2，不受信任資料的反序列化）。其餘包含多模態嵌入快取的雜湊碰撞（CVE-2026-24255，7.5）、影像載入元件的路徑限制不當與多模態請求的路徑繞行導致資訊洩露（CVE-2026-47612、CVE-2026-47613，7.5）、多項伺服器端請求偽造含 DNS rebinding（CVE-2026-47614 至 47618，7.5），以及 LoRA manager 的競態條件（CVE-2026-47620、47621，6.5）與錯誤訊息洩露敏感資訊（CVE-2026-47622，5.3）。
- 權重分數：10/10
- 發布日期：2026-08-04
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 查核方式：直接讀取 NVIDIA product-security 儲存庫的 5842 公告內文，核對標題、2026-08-04 發布日與各 CVE 的 CVSS 分數與描述。iThome 有對應中文報導（`https://www.ithome.com.tw/news/177960`），但該站以 WebFetch 抓取回 403、無法確認精確發布日，因此改採 NVIDIA 官方公告為引用來源。

### 8. Cisco 修補 Catalyst SD-WAN 多項重大漏洞
- 來源網址：https://sec.cloudapps.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-hardening-sdwan-faLcR3K
- 原始頁面標題：Cisco Catalyst SD-WAN Software Security Hardening Release: August 2026
- 繁體中文標題：Cisco Catalyst SD-WAN 軟體資安強化版本：2026 年 8 月
- 摘要：Cisco PSIRT 於 8 月 5 日發布 Catalyst SD-WAN 軟體的資安強化公告，涵蓋 CVE-2026-20303、CVE-2026-20304、CVE-2026-20310、CVE-2026-20312 與 CVE-2026-20313，CVSS 基礎分數依序為 9.9、9.9、9.9、8.8 與 7.7，風險等級為重大。CVE-2026-20303 屬輸入驗證不當，含路徑穿越與檔案路徑外部控制；CVE-2026-20304 為存取控制不當，涵蓋授權、驗證與權限繞行；CVE-2026-20310 則是檔案存取前的連結解析不當，攻擊者可操作符號連結觸及非預期檔案。影響範圍包含地端部署、Cisco SD-WAN Cloud-Pro、Cisco 代管雲端與 FedRAMP 政府版。修補版本為 20.9.10、20.12.8.1、20.15.6、20.18.4 與 26.1.2；雲端代管實例已透過 20.15.602 套用，使用者無須動作。這些問題由內部測試發現，目前未見遭實際利用，但沒有替代緩解措施。
- 權重分數：10/10
- 發布日期：2026-08-05
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 查核方式：直接開啟 Cisco Security Advisory 現行頁面核對標題、發布日、五個 CVE 各自的 CVSS 分數、影響部署型態與修補版本。

### 9. CISA 將 N-able N-central 驗證繞行漏洞列入已遭利用清單
- 來源網址：https://www.cisa.gov/news-events/alerts/2026/08/03/cisa-adds-one-known-exploited-vulnerability-catalog
- 原始頁面標題：CISA Adds One Known Exploited Vulnerability to Catalog
- 繁體中文標題：CISA 新增一項已遭利用漏洞至 KEV 目錄
- 摘要：CISA 於 8 月 3 日將 CVE-2026-18577 納入 Known Exploited Vulnerabilities 目錄，該漏洞為 N-able N-central 的驗證繞行（Authentication Bypass Using an Alternate Path or Channel），成因是 CVE-2026-18556 修補不完全，影響 2026.3.1 以下所有版本。N-central 是 MSP 與企業 IT 團隊用來集中管理大量端點的遠端監控管理平臺，單一 N-central 伺服器遭取得管理權，等於影響其下所有受管組織。攻擊者取得管理員權限後，透過 Take Control 功能跳進受管端點，並以註冊為服務的對外 Cloudflare tunnel 建立持久化。聯邦民間行政部門機關被要求於 8 月 6 日前完成修補。
- 權重分數：10/10
- 發布日期：2026-08-03
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 查核方式：CISA 頁面以 WebFetch 回 403，改以多筆獨立來源交叉確認公告標題、2026-08-03 發布日、CVE 編號與漏洞類型描述（Rapid7、Help Net Security、The Hacker News、Huntress、SecurityWeek），並另行納入 N-able 原廠公告（本檔第 21 筆）作為第一手佐證。**CVSS 分數已於稽核時移除**：初期搜尋摘要顯示 8.2，但 Rapid7 漏洞資料庫記載為 8.1（High），兩者不一致且 CISA 原頁無法擷取，因此報告內文不再引用具體分數，改以「列入 KEV、已遭實際利用」描述嚴重性。修補版本亦已依 N-able 原廠公告更正（見第 21 筆）。

### 10. 工研院展示 48V 單級電源轉換與微流體散熱
- 來源網址：https://technews.tw/2026/08/03/itri-%E2%80%8B%E2%80%8Bunveils-groundbreaking-high-efficiency-power-conversion-and-microfluidic-heat-dissipation-technologies/
- 原始頁面標題：直擊 AI 運算挑戰，工研院突破性高效能電力轉換與微流體散熱技術亮相
- 繁體中文標題：直擊 AI 運算挑戰，工研院突破性高效能電力轉換與微流體散熱技術亮相
- 摘要：工研院於 2026 台日半導體技術論壇展示面向下世代 AI 運算的先進封裝方案。第一項是 48V IVR 單級電源轉換，以零電壓／零電流切換在 50 至 100MHz 頻率下把 48V 直接降到 1V，取代傳統雙級架構，尖峰轉換效率 93.6%、功率密度 1037 W/in³。第二項是無 TIM 的仿生微流道蓋板，整合 micro pin-fin 與波浪流道，主動破壞熱邊界層，散熱效率提升三倍、尖峰溫度下降 65%。工研院同時提出兩層情境推估：2030 年 AI 運算參數規模上看 Yotta 等級（10 的 20 次方）；2029 年單一晶片功耗由 3,600 瓦升到 8,000 瓦、電流需求 5,000 安培，封裝尺寸可能超過現行光罩面積的 14 倍。
- 權重分數：9/10
- 發布日期：2026-08-03
- 分類：硬體或軟硬整合
- 作者：Atkinson
- 是否納入正式參考資料：是
- 查核方式：直接開啟 TechNews 科技新報現行頁面核對 H1、2026-08-03 17:00 發布時間、作者與各項效率、功率密度、降溫幅度。**稽核時修正年份歸屬**：原本把 8,000 瓦與 5,000 安培寫成 2030 年推估，原文實為 2029 年推估（Yotta 等級才是 2030 年），報告與本檔均已分開描述。文中的封裝尺寸與功耗屬產業推估，報告中已與已量測數據分開描述。

### 11. 台韓上半年出口首度雙雙超越日本
- 來源網址：https://technews.tw/2026/08/07/taiwan-south-korea-exports-surpass-japan-ai-semiconductor-demand-key-driver/
- 原始頁面標題：台韓出口首度超越日本，AI 半導體需求成關鍵推手
- 繁體中文標題：台韓出口首度超越日本，AI 半導體需求成關鍵推手
- 摘要：2026 年上半年韓國出口額 4,963 億美元、台灣 4,166 億美元，雙雙首度超越日本的 3,844 億美元。積體電路方面，韓國出口 1,490 億美元、台灣 1,332 億美元，兩者占整體出口比重約三成；日本積體電路出口僅 212 億美元，占比約 5%。與去年同期相比，韓、台出口均大增近五成，日本約增一成。文章指出主因是 AI 用半導體需求爆發性擴張，台灣有台積電、韓國有三星與 SK 海力士負責生產先進製程。日本在半導體製造設備（出口約 150 億美元）與材料仍具優勢，但零組件、材料與設備的出口擴張速度追不上成品，難以彌補差距。
- 權重分數：9/10
- 發布日期：2026-08-07
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 查核方式：直接開啟 TechNews 科技新報現行頁面核對 H1、2026-08-07 發布日與各項出口金額、占比與年增率；另確認日本半導體製造設備出口 150 億美元、韓國 52 億美元、台灣 35 億美元。**權重限制**：此篇為中央社（CNA）供稿經 TechNews 轉載，稽核時以站內搜尋嘗試定位中央社原始頁面未果，發布日以 TechNews 頁面標示為準，並在報告的「報告說明」中揭露此限制。

### 12. Circle 公布 2026 年第二季財報與 Arc 主網時程
- 來源網址：https://www.circle.com/pressroom/circle-reports-second-quarter-2026-results
- 原始頁面標題：Circle Reports Second Quarter 2026 Results
- 繁體中文標題：Circle 公布 2026 年第二季財報
- 摘要：Circle 於 8 月 5 日美股開盤前公布第二季財報，總營收與準備金收益 7.01 億美元、年增 7%，低於市場預估的 7.123 億美元；調整後 EBITDA 1.43 億美元、年增 8%。USDC 流通量 733 億美元、年增 19%，當季 USDC 交易量 14.8 兆美元、年增 151%。基礎建設方面，Circle 宣布區塊鏈 Arc 公開主網將於 9 月 16 日上線，帶有隱私工具、可程式化金融的代理堆疊與代幣化實體資產支援，創始驗證者共 11 家：BlackRock、DTCC、Galaxy、Global Payments、ICE、Mastercard、MoneyGram、SBI Group、Standard Chartered、Sumitomo Corporation 與 Visa。Circle Payments Network 近 30 日的年化交易量達 147 億美元、已有 175 家金融機構加入且季增 29%。代理堆疊上線後已有超過 900 項付費服務，x402 代理付款金額有 99.3% 以 USDC 結算。Circle 另取得美國 OCC 核准設立 Circle National Trust 國家信託銀行。
- 權重分數：10/10
- 發布日期：2026-08-05
- 分類：金融科技
- 是否納入正式參考資料：是
- 查核方式：直接開啟 Circle 官方新聞室現行頁面逐項核對標題、2026-08-05 發布日、營收、USDC 流通量與交易量、Arc 主網日期、驗證者名單與 CPN 數據。**稽核時補正三點**：創始驗證者原僅列 6 家，實為 11 家，已補齊；CPN 的 147 億美元原文限定為「近 30 日年化」，已補上；175 家機構原文另附「季增 29%」，已補上。99.3% 的口徑限定為 x402 代理付款金額，已於報告中標明。市場預估值 7.123 億美元來自第三方分析師彙整，報告中已標明為市場預估而非公司數據。

### 13. 台北 AI 醫療生態系赴日本關西展示 15 家業者成果
- 來源網址：https://technews.tw/2026/08/07/taipei-ai-medical-ecosystem-connects-japan-kansai-region-15-companies-showcase-taiwan-japan-innovative-collaboration-achievements/
- 原始頁面標題：台北 AI 醫療生態系對接日本關西地區，15 家企業展示台日創新聯動成果
- 繁體中文標題：台北 AI 醫療生態系對接日本關西地區，15 家企業展示台日創新聯動成果
- 摘要：台北 AI 醫療生態系代表團於大阪世界健康博覽會展出，並與大阪大學、京都大學及大阪商工會議所等機構在大阪、神戶、京都進行交流，共 15 家業者展示成果。AI 輔助診斷方面，鈦隼生技的牙科 AI 判讀準確率達 98%；深智生醫 DeepRad.AI 已導入超過 35 家醫院、累積逾 10 萬臨床案例，並取得日本 PMDA 認證；Dentall.ai 串接台灣 3,000 家以上牙科診所與 9,000 名牙醫師，並在日本設立子公司。癌症與精準醫療方面，VITAE 生醫完成 5 萬件以上尿液肺癌檢測、服務逾 600 家醫療機構；創星物聯建立 100 種以上癌症模型；LiT MedTech 累積逾 1 萬筆基因資料，獲 20 家以上日本生殖醫學機構採用；醫渡科技產品進入 80 家以上醫院、嘉惠 5 萬名以上病患。長照方面，鋒醫科技建立亞洲最大長者步態資料庫，優照護會員數超過 12.5 萬人。新藥開發方面，安宏生醫以 AI 把新藥探索週期從 4 至 5 年縮短到 14 個月。
- 權重分數：6/10（稽核時由 8/10 下修）
- 發布日期：2026-08-07
- 分類：醫療科技
- 是否納入正式參考資料：是
- 查核方式：直接開啟 TechNews 科技新報現行頁面核對 H1、2026-08-07 14:00 發布時間，並逐條比對 DeepRad.AI 的 35 家醫院／10 萬臨床案例／PMDA 認證、Dentall.ai 的 3,000 家診所與 9,000 名牙醫、鈦隼生技的 98% 判讀準確率、安宏生醫的 14 個月新藥探索週期，四項皆與原文一致。**權重下修原因**：頁面作者欄標示為 PR Newswire，屬業者新聞稿轉發而非媒體採訪或獨立查證，全部數據皆為參展業者自述。報告中已明確標示為 PR Newswire 新聞稿、未經第三方驗證。醫療分類另有第 14 筆（同儕審查研究）維持權重。

### 14. 港大 CardiOmicScore 以血液蛋白質與代謝物預測心血管疾病
- 來源網址：https://technews.tw/2026/07/26/ai-blood-test-detects-six-major-cardiovascular-diseases-15-years-early/
- 原始頁面標題：港大 AI 血液檢測，提前 15 年攔截六大心血管疾病
- 繁體中文標題：港大 AI 血液檢測，提前 15 年攔截六大心血管疾病
- 摘要：香港大學李嘉誠醫學院開發 CardiOmicScore，以深度學習整合基因體、蛋白質體與代謝體資料，從血液樣本預測六大心血管疾病風險，最早可在臨床症狀出現前 15 年提出警示。研究發表於《Nature Communications》，分析 UK Biobank 資料，涵蓋 2,920 種循環蛋白質與 168 種代謝物，目標疾病為冠狀動脈疾病、中風、心臟衰竭、心房顫動、周邊動脈疾病與靜脈血栓栓塞。研究團隊表示，這種做法把醫療從被動的生病治療推向主動預測與介入。目前技術仍在研究階段，尚未公布商業化時程。
- 權重分數：9/10
- 發布日期：2026-07-26
- 分類：醫療科技
- 是否納入正式參考資料：是
- 查核方式：直接開啟 TechNews 科技新報現行頁面核對 H1、2026-07-26 發布日、機構、模型名稱、資料規模與期刊，並確認文中已註明尚未商業化。

### 15. DHL Group 第二季營收與獲利成長，持續投資自動化
- 來源網址：https://group.dhl.com/en/media-relations/press-releases/2026/dhl-group-financial-figures-h1-2026.html
- 原始頁面標題：DHL Group seizes growth opportunities and significantly increases revenue and earnings in the second quarter
- 繁體中文標題：DHL Group 掌握成長機會，第二季營收與獲利顯著成長
- 摘要：DHL Group 於 8 月 5 日公布 2026 上半年財報。第二季營收年增 13% 至 224 億歐元，營業利益（EBIT）年增 30% 至 19 億歐元、EBIT 利潤率升至 8.3%；全年 EBIT 指引由原本的超過 62 億歐元上修至超過 65 億歐元，全年自由現金流（不含併購）維持約 30 億歐元預期，上半年自由現金流已達 18 億歐元。上半年取得資產的資本支出 13 億歐元，較去年同期增加 25%，投入方向包含全球 Express 機隊現代化、自動化倉儲與分揀方案，以及提升品質與效率的數位應用。公司同時擴張三個策略成長領域：生命科學與健康照護、新能源，以及資料中心物流；營收成長主要來自 DHL Express 運送重量增加與國際空運市場運能吃緊。
- 權重分數：9/10
- 發布日期：2026-08-05
- 分類：運輸物流
- 是否納入正式參考資料：是
- 查核方式：DHL 官網新聞稿頁面與半年報 PDF 以 WebFetch 連續逾時（稽核時再試一次仍逾時），改以官方 reporting hub 的半年報頁面確認第二季營收 22,367 百萬歐元與 EBIT 1,858 百萬歐元，並以多筆獨立來源（ITJ、Post & Parcel、Investing.com 法說會紀錄）交叉確認年增 13%／30%、EBIT 指引由 >62 億上修至 >65 億、上半年自由現金流 18 億歐元與資本支出 13 億歐元（年增 25%）。「資料中心物流列為策略成長領域」已由新聞稿原文引句確認；法說會另指出該業務目前規模仍小、看的是長期潛力，報告中已補上此限定。

### 16. Autodesk 與佛羅里達大學設立工業化營建機器人實驗室
- 來源網址：https://adsknews.autodesk.com/en/pressrelease/autodesk-and-the-university-of-florida-open-the-most-advanced-robotics-industrialized-construction-lab-in-the-u-s-to-tackle-housing-and-labor-shortages/
- 原始頁面標題：Autodesk and the University of Florida open the most advanced robotics industrialized construction lab in the U.S. to tackle housing and labor shortages
- 繁體中文標題：Autodesk 與佛羅里達大學設立全美最先進的工業化營建機器人實驗室，因應住宅與勞動力短缺
- 摘要：Autodesk 於 8 月 4 日宣布捐贈 100 萬美元設立 Autodesk Design and Make Laboratory，實驗室設於佛羅里達大學、2026 年秋季啟用，內含由 Aladdin Alwisy 博士主持的 Smart Industrialized Design and Construction Lab。研究重點是把協作型機器人（cobots）用於牆體框架組立與板件組裝，整合數位分身與 BIM，並以電腦視覺讓機器人讀懂營建設計。早期測試顯示，原本需要數月的多戶住宅框架施工，有機會壓縮到一個週末完成。資金上，這筆捐贈延續 Autodesk 2024 年對工業化營建工程學位投入的 150 萬美元，也屬於 2026 年 6 月宣布的三年 3.5 億美元人才投資的一部分。公司引述的背景數據包括：佛州短缺 12.1 萬戶住宅與租賃單位、41% 營建工人將於 2031 年前接近退休、66% 學生希望從事動手打造的工作。
- 權重分數：9/10
- 發布日期：2026-08-04
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 查核方式：稽核時已成功直接開啟 Autodesk 官方新聞室現行頁面，逐句核對標題、2026-08-04 發布日、「A $1 million unrestricted donation from Autodesk」、「opens its doors this fall semester」、「framing a set of houses in a weekend instead of months」、「Florida is short more than 121,000 homes and rental units」與「an estimated 41% of construction workers will be at or near retirement by 2031」。「一個週末完成框架」原文屬對實驗室機器人潛力的觀察、未具名歸屬，報告中已標為早期測試觀察並與已完成成果分開描述。

### 17. C-LAB 穹頂劇場 8 月推出 FUTURE VISION LAB@晴空季
- 來源網址：https://www.cna.com.tw/postwrite/chi/440880
- 原始頁面標題：C-LAB「FUTURE VISION LAB@晴空季」8月登場
- 繁體中文標題：C-LAB「FUTURE VISION LAB@晴空季」8 月登場
- 摘要：臺灣當代文化實驗場（C-LAB）於 8 月 1 日至 30 日的週五、六、日在穹頂劇場推出「FUTURE VISION LAB@晴空季」。穹頂外觀以「晴穹：晴空下的破曉旭日」地景裝置呈現，色彩由破曉旭日漸層至深藍星空。節目分四個單元：「凝望大地」聚焦自然、生態與地景變遷；「穿越感官」探討光線、演算法與意識如何形塑感知；「想像未來」呈現科技、文明與自然交會的圖景；「感知彼此」為現場音像表演，於 8 月 28 日 17 時與 19 時兩場演出。多數場次免票入場、採現場控管人數，僅「感知彼此」需透過 C-LAB ACCUPASS 於 8 月 5 日中午起預約。
- 權重分數：8/10
- 發布日期：2026-08-05
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 查核方式：直接開啟中央社訊息平台現行頁面核對標題、2026-08-05 15:04 發布時間、展期與週五至週日檔期、四個單元名稱、8 月 28 日 17 時與 19 時兩場需預約、以及 ACCUPASS 於 8 月 5 日中午開放。此為單位發稿的訊息平台稿件，非中央社記者報導，報告中已據此定位其權重。**稽核時移除穹頂規格**：原摘要與報告寫的「直徑 15 公尺、8K×8K 投影、客製透聲投影膜、25.4 聲道」並不在這篇稿件中，而是來自 C-LAB 官網 FVL 2026 主檔期（4 至 6 月）活動頁；晴空季專屬頁僅提到直徑 15 公尺，且無可確認的發布日、不符納入條件。為避免引用錯置，報告已刪除全部規格數字並改寫該段亮點與趨勢。

### 18. Spotify 與 Merlin 簽署粉絲翻唱與混音授權協議
- 來源網址：https://newsroom.spotify.com/2026-08-04/merlin-spotify-licensing-agreements-fan-made-covers-remixes/
- 原始頁面標題：Spotify and Merlin Announce Licensing Agreement for Fan-Made Covers and Remixes
- 繁體中文標題：Spotify 與 Merlin 宣布粉絲翻唱與混音授權協議
- 摘要：Spotify 於 8 月 4 日宣布與獨立音樂數位授權組織 Merlin 達成授權協議，讓 Merlin 旗下廠牌的藝人可自行選擇是否加入 Spotify 即將推出的粉絲翻唱與混音工具。該工具將以付費加購形式推出，為參與藝人建立額外收益來源，並確保創作有署名與分潤、把聽眾導回原始作品。Spotify 音樂全球負責人 Charlie Hellman 表示，協議確保參與藝人獲得署名與報酬，且每一次創作都會把聽眾帶回原作；Merlin 執行長 Charlie Lexton 則強調協議讓獨立藝人保有「是否提供音樂」的選擇權。Merlin 代表 70 多國的獨立廠牌與發行商，約占全球錄音音樂市場 15%。
- 權重分數：10/10
- 發布日期：2026-08-04
- 分類：影視音樂
- 是否納入正式參考資料：是
- 查核方式：直接開啟 Spotify 官方新聞室現行頁面核對標題、2026-08-04 發布日、付費加購定位、主管引述與 Merlin 市占敘述。第三方報導提及的「30,000 家廠牌」未見於官方頁面，報告中未採用。

### 19. D-Wave 發表 dual-rail 糾錯量子位元的雙位元糾纏閘
- 來源網址：https://www.dwavequantum.com/company/newsroom/press-release/d-wave-demonstrates-major-hardware-breakthrough-for-quantum-error-correction/
- 原始頁面標題：D-Wave Demonstrates Major Hardware Breakthrough for Quantum Error Correction, Advancing the Path to Practical, Fault-Tolerant Gate-Model Quantum Computing
- 繁體中文標題：D-Wave 展示量子糾錯的重大硬體突破，推進實用容錯閘模型量子運算
- 摘要：D-Wave 於 8 月 5 日宣布在《Nature》發表論文〈An entangling gate for dual-rail erasure qubits〉，描述為其超導 dual-rail 量子位元架構設計的雙位元糾纏閘。研究顯示雙位元操作保真度約 99.9%、閘時間約 500 奈秒。dual-rail 架構在硬體層即具備錯誤偵測能力。公司的技術藍圖以 2032 年完成 100 個邏輯量子位元、可執行超過 100 萬次操作的系統為目標，錯誤下降率（Lambda）設定為 10，即每增加一級糾錯、系統可靠度提升 10 倍。這項成果的意義在於降低容錯系統所需的實體量子位元與古典硬體開銷。
- 權重分數：10/10
- 發布日期：2026-08-05
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 查核方式：稽核時已成功直接開啟 D-Wave 官方新聞室現行頁面，核對標題、2026-08-05 日期、論文名稱與「approximately 99.9% fidelity during two-qubit operations, with fast gate times of about 500 nanoseconds」原句。**稽核時修正歸屬**：Lambda 10 原本寫成「公司模擬指出」，官方頁面實際將其表述為藍圖目標（roadmap targets a Lambda of 10），報告與本檔均已改寫為公司藍圖目標，與已量測的保真度與閘時間分開描述。

### 20. 史丹佛以生成式 AI 設計可殺死大腸桿菌的噬菌體
- 來源網址：https://technews.tw/2026/08/07/ai-designs-a-novel-e-coli-killer/
- 原始頁面標題：AI 設計全新病毒可滅大腸桿菌，史丹佛研究引發生物安全隱憂
- 繁體中文標題：AI 設計全新病毒可滅大腸桿菌，史丹佛研究引發生物安全隱憂
- 摘要：史丹佛大學與加州 Arc Institute 合作，以生成式 AI 模型 Evo 2 設計合成噬菌體。研究發表於《Science》，AI 從自然界學到 DNA 結構規律後，生成 16 種新噬菌體的設計藍圖，殺死大腸桿菌的效果優於天然的 Phi X-174。這些合成噬菌體只感染細菌、不對人類構成威脅，且 Evo 2 為開源模型、任何人都可自由取用，在抗生素抗藥性升高的背景下，可能推進噬菌體療法。同期《Science》刊出約翰霍普金斯健康安全中心學者 Thomas Inglesby 與 Moritz Hanke 的評論，警告現有治理框架不足以監督生成式 AI 設計的基因體；他們肯定史丹佛團隊採取的安全措施，但強調社會需要建立合適的監督機制，尤其要衡量生物恐怖攻擊的風險。
- 權重分數：9/10
- 發布日期：2026-08-07
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 查核方式：直接開啟 TechNews 科技新報現行頁面核對 H1、2026-08-07 11:40 發布時間、研究機構、模型名稱、期刊與評論作者姓名（Thomas Inglesby、Moritz Hanke，約翰霍普金斯健康安全中心）。**權重限制**：頁面作者欄標示為中央社，屬供稿轉載；稽核時以站內搜尋嘗試定位中央社原始頁面未果，發布日以 TechNews 頁面標示為準，並在報告的「報告說明」中揭露此限制。

### 21. N-able 公布 N-central 遭實際攻擊的細節與修補進度
- 來源網址：https://www.n-able.com/blog/n-central-security-update-august-6-2026
- 原始頁面標題：N-central Security Update – August 6, 2026
- 繁體中文標題：N-central 資安更新－2026 年 8 月 6 日
- 摘要：N-able 於 8 月 6 日公布 CVE-2026-18577 的事件說明。攻擊者利用影響所有 N-central 版本的零時差漏洞遠端取得管理權限，公司自 7 月 31 日起觀察到實際攻擊。取得伺服器後，攻擊者透過 Take Control 功能存取 N-central 環境內的受管系統，並註冊一項新的 Cloudflare tunnel 服務建立持久化，使通道在 N-central 伺服器存取權被撤銷後仍然存在。修補版本已由 Hotfix 1（2026.3.1.7）推進到 Hotfix 2（2026.3.1.10）。公司表示目前確認受影響的客戶數量有限，調查仍在進行中；代管環境由原廠自動升級，地端部署需自行修補。
- 權重分數：10/10
- 發布日期：2026-08-06
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 查核方式：稽核時新增。直接開啟 N-able 官方部落格現行頁面核對標題、2026-08-06 發布日、7 月 31 日首次觀察到攻擊、Take Control 跳板與 Cloudflare tunnel 持久化手法，以及 2026.3.1.10（Hotfix 2）修補版本。此為第一手原廠公告，補上 CISA 頁面無法擷取造成的細節缺口，並修正原先來自二手報導的「8 月 1 日起遭攻擊」與「2026.3 HF1」兩項敘述。

## 淘汰來源

### A. Johnson & Johnson OTTAVA 機器人手術系統取得 FDA 上市授權
- 來源網址：https://www.jnj.com/media-center/press-releases/johnson-johnson-receives-fda-market-authorization-in-the-u-s-for-its-ottava-robotic-surgical-system
- 發布日期：2026-07-22
- 淘汰原因：日期不符。發布日在時間窗起始日 2026-07-24 之前。雖然投資人說明會於 8 月 3 日舉行，但原始新聞稿發布日仍在窗外，依「以原始發布日判定」原則排除。

### B. Digitimes〈從IB標章到AI建築 台灣智慧樓宇2026年成產業關鍵布局年〉
- 來源網址：https://www.digitimes.com.tw/tech/dt/n/shwnws.asp?id=0000752035_MSGLAZAI4SSAEP4LJ07G4
- 發布日期：2026-04-14
- 淘汰原因：日期不符，落在時間窗外。此為房地產分類原本考慮的台灣來源，改以 Autodesk 官方新聞稿替代。

### C. RadixArk 完成 1 億美元種子輪
- 來源網址：https://mashdigi.com/nvidia-amd-and-intel-have-invested-100-million-in-the-sglang-team-radixark/
- 發布日期：約 2026-05
- 淘汰原因：日期不符。多筆報導指向 5 月，落在時間窗外。

### D. SIGGRAPH 2026
- 來源網址：https://s2026.siggraph.org/
- 發布日期：會期 2026-07-19 至 2026-07-23
- 淘汰原因：日期不符。會期結束於 7 月 23 日，早於時間窗起始日 7 月 24 日。原本考慮用於現場表演藝術或影視音樂分類，改以 C-LAB 與 Spotify 替代。

### E. FinLLM 金融大語言模型專案
- 來源網址：https://www.ithome.com.tw/news/175239
- 發布日期：2026-04-22 專案啟動
- 淘汰原因：日期不符。多筆報導提到「8 月推出首版銀行模型」，但截至查核時未找到窗內的正式發布消息，屬未來時程而非已發生事實，故不納入。

### F. 中國媒體與社群平臺對白宮 AI 會議的報導
- 來源網址：騰訊新聞、新浪財經、網易科技、知乎等
- 發布日期：2026-08-04 前後
- 淘汰原因：依 `knowledge/source-priority.md`，中國來源與社群平臺應優先以高權重來源替換。已改用 udn 科技玩家（台灣媒體）之報導。

### G. iThome〈Nvidia Dynamo修補重大程式碼執行漏洞〉
- 來源網址：https://www.ithome.com.tw/news/177960
- 發布日期：無法確認
- 淘汰原因：來源待驗證。WebFetch 回 403（符合 `knowledge/fetch-gotchas.md` 記載），搜尋摘要僅顯示「本週」而無精確日期，無法確認落點，故改採 NVIDIA 官方公告作為引用來源。

### H. Nature〈Underdog 'spin qubits' leap forward in race to a useful quantum computer〉
- 來源網址：https://www.nature.com/articles/d41586-026-02357-z
- 發布日期：無法確認
- 淘汰原因：來源待驗證。頁面導向登入流程，無法確認發布日與內文細節，故不納入；量子分類改採 D-Wave 官方新聞稿。

### I. 第三方對 ChainDrop 規模的統計（Expel、Elastic、StepSecurity、Integrity360）
- 發布日期：2026-08 上旬
- 淘汰原因：權重與一致性考量。這些研究提出「2,251 個版本、452 個套件、約 20 億次月下載」等數字，與 Microsoft 官方的「超過 400 個套件」不一致，為避免混用不同口徑，報告僅採 Microsoft 數據。

### J. Wells Fargo 代幣化存款規劃
- 來源網址：https://www.pymnts.com/news/banking/2026/wells-fargo-plans-to-launch-tokenized-deposits-this-fall/
- 發布日期：2026-08-04
- 淘汰原因：權重不足。內容為媒體引述的規劃消息、非官方公告，且屬未來時程；金融科技分類改採 Circle 已公布的財報與主網時程。
