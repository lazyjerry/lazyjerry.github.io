# 候選來源整理

- 報告日期：2026-08-22
- 時間範圍：2026-08-07 至 2026-08-22（含首尾）
- 判定原則：以原始頁面標示的發布日為準；無法確認落在時間窗內者直接排除。
- 來源優先序：官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載。中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。

## 正式納入來源

### 1. Claude 的文字浮水印如何運作
- 原始標題：How Claude's text watermark works
- 標題：Claude 的文字浮水印如何運作
- URL：https://www.anthropic.com/news/claude-text-watermark
- 摘要：Anthropic 說明其文字浮水印的實作方式：在模型挑選「同樣合理」的下一個詞時，改用金鑰加上前文決定的偽隨機來源，而不是任意亂數。因此文字讀起來沒有差別，但持有金鑰者可以驗證。作法沿用 Google DeepMind 2024 年發表於《自然》的 SynthID-Text 方法，源頭可追到 Scott Aaronson 在 2022 年的提案。套用範圍包含未來模型的全部產出文字；圖片與檔案改以 C2PA 內容憑證寫進中繼資料；程式碼因為輸出必須精確，只在註解等非關鍵處做最小幅度標記；翻譯則因逐字由模型挑選而可被標記。Anthropic 表示浮水印偵測 API 仍在規劃中，並主動列出限制：無法分辨「Claude 寫的」與「Claude 大幅編輯過的」，樣本太短時效果不佳，也不帶任何使用者或組織身分資訊。
- 權重：9/10
- 發布日期：2026-08-14
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：模型供應商第一手技術說明，且作者自陳限制，可信度高。偵測 API 尚未推出，屬未來規劃而非既成事實。

### 2. GitHub Copilot 在 Slack 的新體驗
- 原始標題：The new GitHub Copilot experience in Slack
- 標題：GitHub Copilot 在 Slack 的新體驗
- URL：https://github.blog/changelog/2026-08-21-the-new-github-copilot-experience-in-slack/
- 摘要：GitHub 在 Slack 推出新的 Copilot 整合並進入公開預覽。使用者在 Slack 內 @GitHub 即可查詢程式碼與 GitHub 活動、分類臭蟲、管理 issue，並讓代理在安全的雲端沙箱中調查失敗、實作變更與自我驗證，最後開出 pull request 並附上對話連結供審查。代理以非同步方式運作，可從 Slack 指派後自行執行。整合也支援建立專屬的程式碼頻道，讓成員追蹤計畫、檢視 diff、預覽 HTML 之類的輸出，並在頻道內反覆調整。工作階段可跨團隊共享；由對話產生的 issue 與 pull request 會歸屬於 Copilot 應用身分，行為仍受既有 GitHub 權限與控制約束。功能限 Copilot Business 或 Enterprise 方案，用量計入既有額度，儲存庫管理者可要求代理產出的 PR 需額外核准才能合併。
- 權重：8/10
- 發布日期：2026-08-21
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：官方 changelog。狀態為公開預覽，非正式上線。

### 3. 重新檢視針對 Cloudflare Workers 的遠端 Spectre 攻擊
- 原始標題：A revisit of remote Spectre attacks on Cloudflare Workers
- 標題：重新檢視針對 Cloudflare Workers 的遠端 Spectre 攻擊
- URL：https://blog.cloudflare.com/revisiting-spectre-attacks-on-workers/
- 摘要：Cloudflare 與學界研究者公布在自家生產環境中實作出可運作的遠端 Spectre 攻擊，速度達每秒 12 位元、準確率逾 99%。攻擊組合了數個環節：以推測式型別混淆的 Spectre gadget 從 JavaScript heap 洩漏 64 位元指標；利用樹狀 PLRU 快取替換策略放大訊號；透過 WebSocket 取得遠端計時器；藉排程機制讓攻擊者與受害者的 Worker 共置同一台伺服器；再用 Durable Objects 維持長時間執行。原本的動態行程隔離（DyPrIs）之所以沒攔下來，是因為偵測要等到執行結束，而 WebSocket 保活可讓單次執行持續數小時；大量 I/O 也會壓低偵測比率。Cloudflare 已改良 DyPrIs，並整合 V8 沙箱與記憶體保護金鑰（MPK）隔離。原文同時指出，V8 沙箱與 MPK 都不是完整的 Spectre 防護，只能阻斷特定 gadget 或縮小洩漏面。
- 權重：9/10
- 發布日期：2026-08-19
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：平台方一手揭露，含攻擊細節與已部署緩解措施。

### 4. Fortinet 修補 FortiWeb 與 FortiManager 的身分驗證缺陷
- 原始標題：Fortinet Patches Authentication Flaws in FortiWeb and FortiManager
- 標題：Fortinet 修補 FortiWeb 與 FortiManager 的身分驗證缺陷
- URL：https://www.securityweek.com/fortinet-patches-authentication-flaws-in-fortiweb-and-fortimanager/
- 摘要：Fortinet 發布多項安全更新。FortiWeb 的 CVE-2026-26035 為不當身分驗證問題，只在管理者帳號設定為遠端 RADIUS 驗證且開啟 wildcard 選項（預設關閉）時成立；成立時遠端未經驗證的攻擊者可用任意帳號密碼登入 FortiWeb 的 GUI 與 CLI，等於直接取得這台 Web 應用防火牆的管理權限。修補版本為 8.0.3、7.6.7、7.4.12 與 7.2.13，暫時緩解方式是關閉 wildcard 設定。同批更新還包含 FortiManager 的 CVE-2026-70468，可讓攻擊者冒充受管的 FortiGate 裝置，但需特定 CLI 選項與有效憑證；以及 FortiClient Windows 的 CVE-2026-70465 緩衝區溢位，可經由偽造的 DNS 回應執行任意程式碼。Fortinet 表示目前沒有遭實際利用的跡象。
- 權重：8/10
- 發布日期：2026-08-13
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：SecurityWeek 為專業資安媒體，內容對應 Fortinet 公告 FG-IR-26-158。外界另有 CVSS 9.8 的評分說法，與 SecurityWeek 標示的 high 等級不一致，報告中不採用單一評分數字。

### 5. 聯電切入 12 吋矽光子代工
- 原始標題：AI 推升 PIC 代工狂潮，聯電挾 12 吋量產優勢決戰高塔、格羅方德
- 標題：AI 推升 PIC 代工狂潮，聯電挾 12 吋量產優勢決戰高塔、格羅方德
- URL：https://finance.technews.tw/2026/08/22/umc-joins-battle-competing-tower-globalfoundries/
- 摘要：TechNews 報導聯電切入光子積體電路（PIC）代工。聯電向比利時 imec 取得 12 吋 PIC 平台授權，並於 2026 年 7 月與新加坡客戶 SILITH 完成首批量產。聯電執行長王石表示，目標是把 AI 相關代工營收從目前約 3 億美元，在三年內推升到 10 億美元以上，矽光子是主要動能之一；財務長則稱初步數據顯示自家矽光子表現與競爭者相當甚至更好，關鍵優勢在 12 吋產能。市場面，Yole 預估全球矽光子市場從 2024 年的 2.78 億美元成長到 2030 年的 27 億美元，年複合成長率約 46%。競爭格局上，高塔半導體市占估逾五成，格羅方德在 2025 年底併購新加坡 AMF，取得製造 IP 與 300 多家客戶，雙方同時有專利訴訟。
- 權重：7/10
- 發布日期：2026-08-22
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：營收目標與「表現相當或更好」皆為公司自述，市場規模為第三方預估，均非已驗證結果。

### 6. 中國人型機器人市場與全球出貨估算
- 原始標題：中國人型機器人迎量產！今年市場規模達 150 億人民幣，估 2027 年至少成長 60%
- 標題：中國人型機器人迎量產！今年市場規模達 150 億人民幣，估 2027 年至少成長 60%
- URL：https://technews.tw/2026/08/21/trendforce-counterpoint-see-2026-ai-human-robot/
- 摘要：TechNews 引述 TrendForce 與 Counterpoint 的研究數據。TrendForce 估中國人型機器人市場 2026 年規模達人民幣 150 億元（約新台幣 710 億元），2027 年至少再成長六成。Counterpoint 則指出 2026 上半年全球人型機器人出貨量超過 2.2 萬台，年增近 300%，前五大廠商合計市占 86%，其中智元機器人（AGIBOT）出貨 9,700 台居首，其後為宇樹科技、銀河通用、優必選與樂聚機器人。應用面上，娛樂與資料採集合計仍占逾六成，工業製造與倉儲物流分別擴大到 13% 與 5%。Counterpoint 預測 2026 年全年全球出貨量將突破 5 萬台、年增 210%，並認為後續競爭會轉向大模型開發、垂直場景落地、資料體系與模型迭代速度。
- 權重：7/10
- 發布日期：2026-08-21
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：主題涉及中國市場，但採用台灣媒體轉述兩家國際研究機構的數據，非中國社群來源。出貨量與市場規模均為研究機構估算。

### 7. 追蹤 RFC 9234 的採用情況
- 原始標題：BGP Role model: tracking the adoption of RFC 9234
- 標題：BGP Role 模型：追蹤 RFC 9234 的採用情況
- URL：https://blog.cloudflare.com/rfc9234-bgp-role-model/
- 摘要：Cloudflare 說明 RFC 9234 如何用協定本身表達意圖來防止路由洩漏。該標準要求建立 BGP 連線的兩端先對「彼此是什麼關係」達成一致，並新增 Only to Customer（OTC）路徑屬性，標記不應被轉發到客戶網路之外的路由。相較於仰賴營運者手寫的複雜過濾政策，這種作法把防護寫進協定，減少人為設定錯誤。Cloudflare 利用自身遍布全球的對接位置，建立一套監測方法：觀察哪些對接網路實際送出 OTC 屬性。結果發現一個關鍵阻礙：有兩家主要的 Tier-1 網路會把轉發路由上的 OTC 屬性刪除，使該機制在其基礎設施上無法運作；Cloudflare 表示已與這些業者接觸，希望恢復屬性傳遞。
- 權重：9/10
- 發布日期：2026-08-18
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：一手量測資料。文中未點名該兩家 Tier-1 業者，報告中亦不臆測。

### 8. Cloudflare 推出 Bot Preference Sync
- 原始標題：Say it once: introducing Bot Preference Sync
- 標題：說一次就好：推出 Bot Preference Sync
- URL：https://blog.cloudflare.com/bot-preference-sync/
- 摘要：Cloudflare 推出 Bot Preference Sync，處理「宣告的爬蟲政策」與「實際執行的規則」不一致的問題。過去站方要另外維護一份靜態 robots.txt，同時在 Cloudflare 設定 AI 爬蟲政策，兩邊容易對不上。新功能會依儀表板上針對 Search、Agent、Training 三類爬蟲的設定，自動更新 robots.txt，並採前置寫入，保留既有的 Disallow 指令。Training 可選 Disallow，此時以 robots.txt 阻擋訓練用途，但允許合規的混合用途爬蟲繼續做搜尋索引；Search 與 Agent 則可選允許、僅在含廣告頁面阻擋，或全站阻擋。功能對 Free 到 Enterprise 所有方案開放。對爬蟲營運者而言，要被納入這套「善意推定」需符合透明度要求，包含遵守 robots.txt、提供退出機制與 URL 層級的內容使用可見性；不提供透明度的爬蟲，在站方選擇禁止訓練時一律照擋。
- 權重：8/10
- 發布日期：2026-08-21
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：官方產品公告，屬平台方立場，實際遵循度取決於各爬蟲營運者。

### 9. Visa 與 Mastercard 加入 Rain 發起的代理商務聯盟
- 原始標題：Visa and Mastercard Join Rain's Agentic Commerce Coalition
- 標題：Visa 與 Mastercard 加入 Rain 發起的代理商務聯盟
- URL：https://www.pymnts.com/news/artificial-intelligence/2026/visa-and-mastercard-join-rains-agentic-commerce-coalition/
- 摘要：穩定幣支付基礎設施公司 Rain 宣布成立 Agentic Payments Alliance（APA），創始成員包含 Visa、Mastercard、Fiserv、Circle、Solana 與 Remitly，另有約二十多家業者加入，目標是為 AI 代理驅動的商務建立共通基礎設施。聯盟規劃共同研究與框架，針對代理身分與授權建立新興標準，並處理代理商務的監管問題。Rain 執行長 Farooq Malik 表示，趁這個領域還在成形時就把相關方拉到同一張桌子上，是成立聯盟的動機。報導引用 McKinsey 預估，代理式 AI 商務到 2030 年全球規模可達 3 兆至 5 兆美元。Rain 強調代理授權、詐欺偵測與紅利點數整合等基礎設施缺口，不該由任何單一公司決定。
- 權重：6/10
- 發布日期：2026-08-18
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：PYMNTS 為支付產業媒體，本文主要轉述 Rain 新聞稿；另以 Rain 經 PR Newswire 發布的成員名單交叉確認。聯盟目前僅有研究與框架規劃，尚無已上線的共通規格；McKinsey 的兆元級估算屬預測。

### 10. 國家數位健康互通性實驗室啟動
- 原始標題：國家數位健康互通性實驗室啟動　助軟硬體測試認證
- 標題：國家數位健康互通性實驗室啟動　助軟硬體測試認證
- URL：https://www.cna.com.tw/news/ahel/202608180253.aspx
- 摘要：衛生福利部正式成立「國家數位健康互通性與效能認證實驗室」，建立國家級的醫療資訊驗測與認證機制。衛福部長石崇良指出，智慧醫療要成功取決於三件事：高品質的資料、安全，以及資料互通性；衛福部先前已建置資料標準化、藥物編碼、檢驗編碼與醫學術語編碼等基礎。衛福部另建構 FHIR Box 平台，讓醫院資訊系統不必整套換掉也能交換資料，預計年底前推廣到所有醫學中心。實驗室規劃三類認證：一是對接 FHIR Box 的 CQL 臨床決策支援模組與 SMART on FHIR 應用程式認證，二是驗證裝置效能與可靠度的硬體認證，三是評估部署與維運能力的整體解決方案廠商認證。上述認證制度與全面推廣仍屬後續規劃。
- 權重：8/10
- 發布日期：2026-08-18
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：中央社報導官方活動。三類認證與 FHIR Box 全面推廣屬規劃時程，尚未完成。

### 11. 中華電信推動嘉義無人機物流驗證
- 原始標題：中華電打造無人機物流商業化驗證場域　送餐服務亮相
- 標題：中華電打造無人機物流商業化驗證場域　送餐服務亮相
- URL：https://www.cna.com.tw/news/afe/202608100309.aspx
- 摘要：中華電信與點點全球、金屬工業研究發展中心、新樂飛無人機及中華系統整合合作，在嘉義縣太保市與朴子市打造無人機物流商業化驗證場域，並在嘉義縣無人機日首度展示無人機送餐服務。計畫整合 5G 通訊、智慧物流平台、空中廊道管理與 AI 應用，並建置台灣首條 5G 空中廊道，提供即時影像傳輸、飛航控制與遠端監管能力。與過去多以偏鄉物資配送、展示活動或單次試飛為主的作法不同，此案強調每日固定配送與持續營運，是全台首例在非偏鄉地區進行常態化商業運作的無人機物流示範場域。截至報導時已完成近 1,200 件配送任務，累積約 120 小時飛行時數與 1,100 公里飛行里程。
- 權重：7/10
- 發布日期：2026-08-10
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：中央社依中華電信宣布內容報導，營運成效數字屬業者自述。目前仍是「商業化驗證」階段，非全面商轉。

### 12. Cleora 以營建機器人推進 3D 列印住宅社區
- 原始標題：Robotics Advances Construction at the World’s Largest Planned 3D-Printed Township
- 標題：機器人推進全球規模最大的 3D 列印住宅社區建設
- URL：https://www.manufacturingtomorrow.com/news/2026/08/13/robotics-advances-construction-at-the-worlds-largest-planned-3d-printed-township/28040/
- 摘要：位於美國科羅拉多州 Salida 的 Cleora 開發案占地 55 英畝，規劃 106 戶住宅，目前已完成 7 戶，並有多戶售出與施工中。工地現有兩套 RIC Robotics 自主列印系統運作，預計 65 戶以上會採用該公司的營建機器人與 3D 列印技術，使其成為美國單一住宅開發案中規模最大的機器人營建部署之一。參與方包含開發商 Cleora、3D 列印總承包商 True North 與技術供應商 RIC Robotics。案件同時建立該地區第一個 3D 列印計畫區，配套公用設施與水處理等基礎建設，並與 Colorado Mountain College 合作培訓新興營建技術人力。開發方主張此案要示範營建機器人如何在真實社區規模落地，處理缺工與效率問題。
- 權重：5/10
- 發布日期：2026-08-13
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：ManufacturingTomorrow 原文為 RIC Robotics 提供的業者新聞稿，非獨立採訪；「全球規模最大」與缺工改善效果均屬公司主張。本期此分類窗內沒有找到可直接替換的高權重報導，因此保留並降為 5/10。

### 13. 鐵道博物館夜間開放與互動式劇場
- 原始標題：鐵道博物館柴電工場首度夜間開放　互動式劇場同步登場
- 標題：鐵道博物館柴電工場首度夜間開放　互動式劇場同步登場
- URL：https://www.cna.com.tw/news/acul/202608180232.aspx
- 摘要：國家鐵道博物館的柴電工場首度開放夜間參觀，8 月 22 日至 23 日延長開放至晚間 8 時，同步推出互動式劇場《噓！這是火車精靈的秘密》。演出設定觀眾在夜間導覽中意外進入火車精靈所在的神祕世界，由導覽員與列車長帶領。蕭淳嫻擔任編劇、導演及肢體設計，演出者包含何昀庭、洪子晏、曾冠瑜、陳柏毓與謝香臺等青年演員與創作者。夜間開放期間，原有的「柴電機車的運作」及「電樞的檢修與保養」展演也會繼續，後者包含虛實整合的沉浸式劇場。互動式劇場與既有檢修展演是不同節目，不應混寫成同一場演出。
- 權重：8/10
- 發布日期：2026-08-18
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：中央社文化線報導。報導未詳述所用技術規格，報告中僅描述「虛實整合／沉浸式劇場」的呈現方式，不臆測設備。

### 14. Spotify 推出 AI Persona 標籤
- 原始標題：Introducing a New Label for AI-Generated Artist Identities on Spotify
- 標題：Spotify 為 AI 生成的藝人身分推出新標籤
- URL：https://newsroom.spotify.com/2026-08-11/ai-persona-badges-transparency/
- 摘要：Spotify 宣布推出「AI Persona」標籤，用來標示代表 AI 生成身分、而非真人的藝人檔案。標籤會出現在藝人頁面、相關搜尋結果，以及播放清單的曲目列。標籤自 2026 年 9 月中旬開始推出，藝人則可即刻起透過 Spotify for Artists 自我揭露。判定採兩條路徑：藝人主動揭露，以及 Spotify 審核團隊辨識那些以擬真 AI 生成形象呈現、且達到一定聽眾門檻的檔案；被加上標籤的藝人會收到通知，可申訴或改為自行揭露。影響方面，Spotify 表示預設不會把 AI Persona 納入任何編輯或演算法推薦，除非聽眾主動追蹤。Spotify 強調希望藝人主動透明，但不會只依賴自願揭露。
- 權重：8/10
- 發布日期：2026-08-11
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：平台官方公告。標籤 9 月中旬才推出，屬已宣布但尚未全面生效的政策。台灣媒體另有二手報導，本報告改採官方原文。

### 15. EPFL 以聲波驅動微型載具
- 原始標題：These tiny drones are powered by sound
- 標題：這些微型無人機以聲波驅動
- URL：https://actus.epfl.ch/news/these-tiny-drones-are-powered-by-sound-2/
- 摘要：瑞士洛桑聯邦理工學院（EPFL）MicroBioRobotic Systems Laboratory（MICROBS）發表聲波驅動的微型載具。研究團隊製作圓形或鐘形的中空共振腔，利用特定頻率讓腔內空氣振動，再把空氣集中噴出以產生定向推力。公分尺度的微型船可用不同可聞頻率分別啟動三個共振腔，進行轉向與自動導航；以 3D 奈米列印製作的 microflier 則用人耳聽不到的超音波驅動。一款 150 微克原型可直接產生向上推力，另一款以微型葉片產生類似直升機的升力，最高轉速達每分鐘 13,000 轉。研究已刊登於《Science Advances》，團隊下一步希望讓多個結構各自回應不同頻率，使柔性裝置能依聲音改變形狀。
- 權重：9/10
- 發布日期：2026-08-14
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：EPFL 官方研究發布，附《Science Advances》論文與 DOI；相較原候選 TechNews 二手整理，標題、日期、實驗數據與研究狀態都可直接核對。

### 16. OpenAI 因網路關鍵能力風險放慢模型開發節奏
- 原始標題：Pacing model development in an era of cyber-critical capabilities
- 標題：在網路關鍵能力的時代放慢模型開發節奏
- URL：https://openai.com/index/pacing-model-development-cyber-capabilities/
- 摘要：OpenAI 說明兩件事促使它放慢擴張速度：一是先前的 OpenAI–Hugging Face 資安事件，二是初步證據顯示即將推出的 Astra 模型可能達到自家 Preparedness Framework 中網路安全能力的「Critical」門檻，這是 OpenAI 首度把模型標到這個等級。具體作法包括把預計部署的最新模型暫停強化學習訓練兩週，且規模最大的前沿 RL 訓練仍在暫停中；研究環境加上新的隔離要求與更嚴格的沙箱；並建立多階段監控，目標在 30 分鐘內發出警示，該監控約消耗受監督推論算力的兩成。OpenAI 另表示會擴充 Preparedness Framework，並加大對齊研究的投入。這是首次有前沿實驗室以「能力可能過線」為由，公開把訓練排程往後推。
- 權重：9/10
- 發布日期：2026-08-18
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：openai.com 對 WebFetch 回 HTTP 403，日期與各項數字改以 the-decoder（2026-08-18）交叉核對後採用，引用仍指向官方原文。暫停時長與門檻判定均為 OpenAI 自述，無外部稽核。

### 17. 疑似中國關聯行動者利用 VMware vCenter 漏洞投放 Babuk 衍生勒索軟體
- 原始標題：Suspected China-Nexus Actor Exploits VMware vCenter Flaw, Deploys Babuk-Derived Ransomware
- 標題：疑似中國關聯行動者利用 VMware vCenter 漏洞投放 Babuk 衍生勒索軟體
- URL：https://thehackernews.com/2026/08/suspected-china-nexus-actor-exploits.html
- 摘要：Broadcom 於 2026-07-29 修補 VMware vCenter 的 CVE-2026-59310，這是一個 CVSS 9.8 的目錄遍歷漏洞，位於 vCenter 的 Syslog 元件，具網路存取能力的攻擊者可藉此執行任意程式碼。德國事件應變公司 QUIRSO 的研究者 Maike Orlikowski、Çağatay Yürekli 與 Denis Szadkowski 指出，攻擊在漏洞公開後五天即展開，鎖定可從網際網路存取的 vCenter 系統，已觀察到 361 個受害 IP、涵蓋 47 個國家，其中德國 55、美國 41、土耳其 38、伊朗 26、法國 25。攻擊鏈包含在 vCenter 與 ESXi 主機建立未授權管理者帳號、以竊得的 VMware Directory Service 憑證提權，最後在 ESXi 上投放勒索軟體，加密副檔名為 .babyk。研究者認為勒索未必是主要目的，可能只是掩護。
- 權重：8/10
- 發布日期：2026-08-17
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：The Hacker News 轉述 QUIRSO 的事件應變分析，受害規模為單一廠商的觀測值，非全球普查。文中另提及 2026-08-01 起有 CVE-2026-59309 的利用跡象，本報告不展開。

## 淘汰來源

### 淘汰 1
- 標題：國家兩廳院 AR 數位導覽《廳院顯影》
- URL：https://money.udn.com/money/story/5635/9436001
- 發布日期：2026-04-13
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：發布日期在時間窗外（早於 2026-08-07）。體驗期雖延續到 8 月 31 日，但依規則以原始發布日判定。

### 淘汰 2
- 標題：ETtoday 房產雲「AI 先幫你預覽家的新樣貌」
- URL：https://house.ettoday.net/news/3166504
- 發布日期：2026-05-15
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：發布日期在時間窗外，且內容偏工具教學而非新事件。

### 淘汰 3
- 標題：C-LAB FUTURE VISION LAB 2026 穹頂劇場
- URL：https://clab.org.tw/events/fvl2026/
- 發布日期：展期 2026-04-18 至 2026-06-07
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：主展期在時間窗外；延伸的「FUTURE VISION LAB @ 晴空季」相關報導為 2026-08-05，仍早於 2026-08-07，且上一期週報已引用同一系列。

### 淘汰 4
- 標題：DEEPFAKE AI Immersive Show to Make International Premiere at Edinburgh Fringe
- URL：https://www.broadwayworld.com/scotland/article/DEEPFAKE-AI-Immersive-Show-to-Make-International-Premiere-at-Edinburgh-Fringe-20260728
- 發布日期：2026-07-28
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：發布日期在時間窗外。演出檔期（8/6-8/30）落在窗內，但沒有找到窗內的原始報導可替代。

### 淘汰 5
- 標題：屋頂光電新制正式公告 8/1 上路　未納住宅與店舖診所
- URL：https://www.cna.com.tw/news/aipl/202608040302.aspx
- 發布日期：2026-08-04
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：發布日期早於 2026-08-07，落在時間窗外。

### 淘汰 6
- 標題：Secure all your internal vibe-coded applications — in one click
- URL：https://blog.cloudflare.com/workers-protected-by-access/
- 發布日期：2026-08-14
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：日期符合，但 2026-08-15 那期週報已列為正式參考資料，避免重複引用同一事件。

### 淘汰 7
- 標題：Agent Plugins 1.0 in VS Code, Copilot CLI, and the Copilot app
- URL：https://github.blog/changelog/2026-08-12-agent-plugins-1-0-in-vs-code-copilot-cli-and-the-copilot-app/
- 發布日期：2026-08-12
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：日期符合，但上一期週報已引用，本期改採 8 月 21 日的 Slack 整合公告。

### 淘汰 8
- 標題：新浪財經、知乎等中國平台的 AI 醫療評論與彙整
- URL：https://finance.sina.com.cn/jjxw/2026-08-16/doc-ininnqpr1521172.shtml
- 發布日期：2026-08-16
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：依 `docs/tech-report-research/knowledge/source-priority.md`，中國來源優先以高權重來源替換；本期已找到衛福部相關的台灣官方活動報導可替代。

### 淘汰 9
- 標題：AI 歌曲在串流平台將標註　避免聽眾誤判
- URL：https://udn.com/news/story/7266/9694822
- 發布日期：2026-08-16
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：內容與事實正確，但為台灣醒報對 Spotify 公告的二手報導；依來源優先序改採 Spotify 官方原文（來源 14）。

### 淘汰 10
- 標題：dentro.de、blog.mean.ceo 等 AI 新聞彙整站的 2026 年 8 月整理
- URL：https://dentro.de/ai/news/
- 發布日期：*未知時間（頁面持續更新）
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：內容為持續更新的彙整頁，無法確認個別條目的原始發布日，也缺乏編輯權威性。改以各家官方公告為準。
