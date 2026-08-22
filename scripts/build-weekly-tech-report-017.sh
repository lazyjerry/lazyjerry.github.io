#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TASK="$ROOT/docs/tech-report-research/weekly-tech-report-017"

mkdir -p "$TASK"

cat > "$TASK/source.md" <<'EOF'
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
EOF

cat > "$TASK/notes.md" <<'EOF'
# 筆記：科技服務資訊週記

--- [2026-08-22] 第 1 次更新筆記 ---

## 任務摘要
- 報告日期 2026-08-22，時間範圍 2026-08-07 至 2026-08-22（含首尾）。
- 目標：12 個必要分類各至少 1 筆窗內正式來源，四段式報告，交付到 `tech/2026-08-22/`。
- 使用工具：Claude Code、Codex。

## 知識庫查閱
- 共用知識庫 `~/.knowledge-skill/knowledge/index.md`：掃過分類目錄，無與科技週報撰寫直接相關的項目，記為「知識庫無相關項目」。
- 專案知識庫 `docs/tech-report-research/knowledge/index.md`：5 份全部命中並讀取。
  - `source-priority.md`：中國與社群來源優先替換，台灣媒體優先。
  - `taiwan-media-landscape.md`：台灣媒體權重座標。
  - `date-citation-rules.md`：15 天窗、`*未知時間`、引用格式 `[[數字. 來源名稱]](#ref-數字)`、HTML 錨點。
  - `report-format.md`：四段式、H2/H3、粗體專有名詞、表格參考資料。
  - `fetch-gotchas.md`：iThome 內文 403；趨勢型文章易落窗外，需逐篇查核日期。
- 專案施工筆記：`docs/working-notes-skill/notes/index.md` 不存在，本專案尚無施工筆記。

## 搜集過程與判斷

### 一手來源優先
- Cloudflare、Anthropic、Spotify、GitHub 四家的官方頁面都能以 WebFetch 取得完整內容與發布日期，優先採用。
- Cloudflare 部落格首頁可一次列出窗內全部貼文與日期，是本期效率最高的日期查核方式。

### fetch-gotchas 再次成立
- `https://www.ithome.com.tw/security` 以 WebFetch 直接抓取回 HTTP 403，與知識檔記載一致，改以其他來源補齊資安分類。
- 醫療科技、房地產、現場表演藝術三個分類，第一輪搜尋回傳的多是年度趨勢文或展期橫跨數月的活動頁，逐篇查核後多數落在時間窗外，與 `fetch-gotchas.md` 的記載相符。

### 逐篇查核後剔除的來源
- 兩廳院 AR 導覽《廳院顯影》：搜尋摘要看起來像近期消息，實際發布日 2026-04-13。
- ETtoday 房產雲 AI 室內設計：2026-05-15。
- Edinburgh Fringe 的 DeepFake 沉浸式演出：報導日 2026-07-28，檔期雖在窗內但找不到窗內原始報導。
- 屋頂光電新制：2026-08-04，差三天落在窗外。
- C-LAB 晴空季相關：2026-08-05，且上期已引用同系列。

### 避免與上期重複
- Cloudflare「Secure all your internal vibe-coded applications」（2026-08-14）與 GitHub「Agent Plugins 1.0」（2026-08-12）日期都符合，但 2026-08-15 那期已列為正式參考資料，本期改採其他窗內事件。

### 分類補搜紀錄
- 醫療科技：前兩輪搜尋只找到中國平台與年度展望文，第三輪改查衛福部相關活動，找到中央社 2026-08-18 的國家數位健康互通性實驗室啟動報導。
- 金融科技：台灣本地窗內找不到夠份量的新制或產品事件，改採國際的 Agentic Payments Alliance（2026-08-18）。
- 房地產與室內外裝潢：窗內只找到業者發布性質的 Cleora 3D 列印社區消息（權重 5/10），已在來源備註與報告中標示為公司主張。
- 現場表演藝術：改從中央社文化線的窗內清單逐條掃描，找到 2026-08-18 的鐵道博物館互動式劇場報導。

## 綜合發現

### 治理與標示成為本期主軸
- Anthropic 的文字浮水印、Spotify 的 AI Persona 標籤、Cloudflare 的 Bot Preference Sync，三者處理的是同一件事：AI 產出與 AI 流量在別人的平台上要怎麼被辨識與宣告。
- 三者也都不是「已完成」：偵測 API 未推出、標籤 9 月中才上線、爬蟲遵循度取決於對方。

### 基礎設施的信任來自對方是否照做
- RFC 9234 的 OTC 屬性被兩家 Tier-1 網路刪掉，機制就失效；Bot Preference Sync 也要爬蟲營運者符合透明度才算數。
- 兩件事的共同結構：協定寫得再好，跨組織的落地率仍需實測。

### 效能與隔離的取捨回到硬體層
- Cloudflare 的 Spectre 研究顯示，偵測型防護（DyPrIs）會被「持續執行 + 大量 I/O」的樣態繞過。V8 沙箱與 MPK 能阻斷特定 gadget 或縮小洩漏面，但仍非完整的 Spectre 防護。

## 待確認限制
- 來源 5、9、12 含公司自述或第三方預估，報告中已與已發生事實分開描述。
- 來源 4 的 CVSS 評分外部說法不一致，報告不引用單一分數。

--- [2026-08-22] 第 2 次更新筆記 ---

## 內容與來源稽核
- 逐筆取得 15 筆正式來源的原始頁面或可驗證摘要，發布日期全部位於 2026-08-07 至 2026-08-22。
- 來源 3：改寫 V8 沙箱與 MPK 的作用，避免把它們誤寫成完整的 Spectre 防護。
- 來源 6：補齊原報導標題，保留市場規模與 2027 年成長預估的限定語。
- 來源 10：依原文改為「藥物編碼、檢驗編碼、醫學術語編碼」與「驗測與認證」。
- 來源 11：合作方更正為「新樂飛無人機」，並核對配送件數、飛行時數與里程。
- 來源 13：更正蕭淳嫻、何昀庭、洪子晏、曾冠瑜、陳柏毓、謝香臺等人名，並分清互動式劇場與既有電樞檢修展演。
- 來源 15：以 EPFL 官方研究發布取代二手科技媒體，補上《Science Advances》論文、150 微克原型與每分鐘 13,000 轉等可核對細節。

## 權重重新校準
- 來源 9 由 7/10 調為 6/10：PYMNTS 主要轉述 Rain 新聞稿。
- 來源 10 由 9/10 調為 8/10：中央社為官方活動現場報導。
- 來源 11 由 8/10 調為 7/10：中央社主要引用中華電信公告與業者數據。
- 來源 12 由 6/10 調為 5/10：ManufacturingTomorrow 刊載的是 RIC Robotics 業者新聞稿。
- 來源 14 由 9/10 調為 8/10：Spotify 官方產品公告屬直接來源，但尚待功能上線後驗證實際影響。
- 來源 15 由 7/10 調為 9/10：改採 EPFL 官方研究發布與論文線索。

## 交叉查核與文字校訂
- 來源 4 直接頁面受 Cloudflare 阻擋，改以 SecurityWeek 可搜尋的 AMP 頁面、Fortinet 公告與 NVD 資料交叉確認漏洞編號與受影響條件。
- 來源 9 以 Rain 的一手新聞稿交叉確認聯盟有超過 25 家創始成員；報告保留「約二十多家」的審慎描述。
- 重寫語意過度、人物關係混淆與長句，並移除中文破折號，保留原有引用與錨點結構。

--- [2026-08-22] 第 3 次更新筆記 ---

## 稽核方式
- 逐筆重新開啟 17 筆正式來源的原始網址，核對 H1／metadata、發布日期、媒體名稱與內文主張，不以搜尋結果排序代替發布日期。
- 對第 2 次稽核所做的改動全部獨立回查，未直接採信既有敘述。

## 第 2 次稽核改動的複驗結果（全部成立）
- 來源 15：EPFL 官方頁面 H1 為 "These tiny drones are powered by sound"，發布日 2026-08-14，論文為《Science Advances》Vol. 12, eaef5620，DOI 10.1126/sciadv.aef5620；150 微克原型與每分鐘 13,000 轉均可核對。
- 來源 13：中央社原文的節目名為《噓！這是火車精靈的秘密》，編導為蕭淳嫻，演出者為何昀庭、洪子晏、曾冠瑜、陳柏毓、謝香臺；夜間開放期間另有「柴電機車的運作」與「電樞的檢修與保養」展演，與互動式劇場確為不同節目。
- 來源 3：原文為 "a leakage rate of up to 12 bit/s with an accuracy of more than 99%"，並明確寫出 "The V8 sandbox is not a complete Spectre mitigation" 與 "MPK is not a complete answer to remediate Spectre, but it strictly reduces the leakage surface"。
- 來源 5：矽光子市場規模的出處確為市調機構 Yole，原文並寫明「今年 7 月旋即宣布與新加坡客戶 SILITH 完成首批量產」。
- 來源 6：原始 H1 確為「中國人型機器人迎量產！今年市場規模達 150 億人民幣，估 2027 年至少成長 60%」。
- 來源 11：合作方確為點點全球、金屬工業研究發展中心、新樂飛無人機、中華系統整合。

## 補搜缺漏後新增的來源
- 來源 16（OpenAI，2026-08-18）：AI 分類原本只有浮水印一則，補上 OpenAI 因 Astra 可能達網路安全 Critical 門檻而暫停部分 RL 訓練的官方說明，權重與影響皆高於既有選材。
- 來源 17（The Hacker News，2026-08-17）：資安分類原有兩則皆無實際遭利用情形，補上 VMware vCenter CVE-2026-59310 在修補五天後即遭利用、已知 361 個受害 IP 橫跨 47 國並投放 Babuk 衍生勒索軟體的事件。

## 原站阻擋時的交叉查核
- `https://openai.com/index/pacing-model-development-cyber-capabilities/` 對 WebFetch 回 HTTP 403。改以 the-decoder（2026-08-18）的報導交叉核對發布日期、兩週 RL 暫停、Astra 的 Critical 門檻、30 分鐘警示目標與約兩成受監督推論算力等數字，全部一致；參考資料仍指向官方原文。
- 此為 `knowledge/fetch-gotchas.md` 所記模式的再次出現，本次新增 openai.com 為已知會阻擋擷取的站點。

## 其他修正
- 免責聲明依 2026-08-01 至 2026-08-15 三期的既有慣例統一措辭。
- 報告說明更新候選與正式來源筆數（27／17／10），並補上 ref-16、ref-17 的限制說明。
- 總結補上兩則新增事件，維持在 300 字以內。
- 更正第 2 次稽核筆記中的人名錯字（蕭淳嫣 → 蕭淳嫻）。

## 未處理的外部變更
- `docs/working-notes-skill/` 為本次任務外由其他流程建立的未追蹤目錄，內容描述本期稽核決策；未修改也未刪除。
EOF

cat > "$TASK/report.md" <<'EOF'
# 2026-08-22 科技服務資訊週記

**作者：Claude Code、Codex　報告日期：2026-08-22**

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
本期有兩條清楚的主線。第一條是**標示與治理**：Anthropic 公開文字浮水印機制，Spotify 為 AI 生成的藝人身分加上標籤，Cloudflare 則把爬蟲政策同步寫入 `robots.txt`，讓 AI 產出與流量更容易辨識 [[1. Anthropic]](#ref-1) [[14. Spotify Newsroom]](#ref-14) [[8. Cloudflare]](#ref-8)。第二條是**機制的實際落地**：RFC 9234 的 OTC 屬性會被兩家 Tier-1 網路移除；Cloudflare 的遠端 Spectre 研究也證明，偵測型隔離仍須搭配 V8 沙箱、MPK 與持續改良的行為偵測 [[7. Cloudflare]](#ref-7) [[3. Cloudflare]](#ref-3)。實體應用方面，台灣啟動數位健康認證實驗室與嘉義無人機物流驗證，聯電也切入 12 吋矽光子量產 [[10. 中央社 CNA]](#ref-10) [[11. 中央社 CNA]](#ref-11) [[5. TechNews 科技新報]](#ref-5)。OpenAI 因能力風險暫停部分訓練，vCenter 漏洞修補五天後即遭利用 [[16. OpenAI]](#ref-16) [[17. The Hacker News]](#ref-17)。

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技
- **AI 產出的辨識問題，被搬到取樣器裡解決。** Anthropic 說明 **Claude** 的文字浮水印如何運作：模型在挑選同樣合理的下一個詞時，把亂數來源換成「金鑰 + 前文」決定的偽隨機值。讀起來沒有差別，但持金鑰者可以驗證。作法沿用 Google DeepMind 發表於《自然》的 **SynthID-Text**，源頭可追到 2022 年的提案。範圍上，未來模型的文字全面套用；圖片與檔案改用 **C2PA** 內容憑證寫進中繼資料；程式碼因為輸出必須精確，只在註解等處做最小標記。值得注意的是限制被寫在同一篇裡：無法分辨「Claude 寫的」與「Claude 大幅改過的」、短樣本效果差、不含任何使用者身分，而偵測 API 還在規劃 [[1. Anthropic]](#ref-1)。

- **前沿實驗室第一次把「暫停」寫成可執行的動作。** OpenAI 公開說明放慢模型開發節奏的理由：先前的 OpenAI–Hugging Face 資安事件，加上初步證據顯示即將推出的 **Astra** 可能達到自家 Preparedness Framework 中網路安全能力的 **Critical** 門檻——這是 OpenAI 首度把模型標到這個等級。動作是具體的：預計部署的最新模型暫停強化學習訓練兩週，規模最大的前沿 RL 訓練仍在暫停中；研究環境加上新的隔離要求與更嚴格的沙箱；多階段監控以 30 分鐘內發出警示為目標，代價是約兩成的受監督推論算力。門檻判定與暫停時長都是 OpenAI 自述，沒有外部稽核，但把安全成本寫成算力比例，比宣示性的承諾容易查核 [[16. OpenAI]](#ref-16)。

<a id="hl-software"></a>
### 軟體工程
- **開發代理正在往「同事待的地方」移動，而不是等你打開 IDE。** GitHub 讓 **Copilot** 進入 Slack 並開放公開預覽：在頻道裡 @GitHub 就能問程式碼與專案動態、分類臭蟲，也能讓代理在雲端沙箱裡調查失敗、實作修改、自我驗證，最後開出 pull request 並附上對話連結。它還能開專屬程式碼頻道，讓團隊追蹤計畫、看 diff、預覽 HTML 輸出。權限邊界寫得很明確：代理產生的 issue 與 PR 掛在 Copilot 應用身分下，仍受既有 GitHub 權限約束，管理者可要求代理的 PR 需額外核准才能合併。這比較像把實習生放進團隊群組，而不是給他一把萬能鑰匙 [[2. GitHub Changelog]](#ref-2)。

<a id="hl-security"></a>
### 軟硬體資訊安全
- **偵測型隔離會被「看起來很忙」的攻擊騙過。** Cloudflare 公布在自家生產環境實作出的遠端 **Spectre** 攻擊，速度可達每秒 12 位元，準確率逾 99%。攻擊以推測式型別混淆從 JavaScript heap 洩漏 64 位元指標，用樹狀 PLRU 快取替換策略放大訊號，再透過 WebSocket 與 **Durable Objects** 維持長時間執行。原本的動態行程隔離要等單次執行結束才判斷；WebSocket 保活讓攻擊先完成，大量 I/O 又壓低偵測比率。Cloudflare 因此改良 DyPrIs，並整合 **V8 沙箱**與**記憶體保護金鑰（MPK）**。原文也明確提醒，V8 沙箱與 MPK 都不是完整解法，只能阻斷特定 gadget 或縮小洩漏面 [[3. Cloudflare]](#ref-3)。
- **預設關閉的選項，一旦被打開就是完整管理權。** Fortinet 修補 **FortiWeb** 的 CVE-2026-26035：當管理者帳號設為遠端 RADIUS 驗證且開啟 wildcard（預設關閉）時，遠端未經驗證的攻擊者可用任意帳號密碼登入 GUI 與 CLI，直接拿到這台 Web 應用防火牆的管理權限。修補版本為 8.0.3、7.6.7、7.4.12、7.2.13，暫時解法是關掉 wildcard。同批還修了 **FortiManager** 可冒充受管 FortiGate 裝置的 CVE-2026-70468，以及 **FortiClient** Windows 可經偽造 DNS 回應執行任意程式碼的 CVE-2026-70465。Fortinet 表示尚無遭實際利用的跡象 [[4. SecurityWeek]](#ref-4)。

- **修補發布五天後就被打，「有沒有修」已經不是唯一問題。** Broadcom 在 2026-07-29 修補 VMware vCenter 的 **CVE-2026-59310**（CVSS 9.8，Syslog 元件的目錄遍歷，可遠端執行任意程式碼），德國事件應變公司 **QUIRSO** 觀察到攻擊在公開後第五天就展開，鎖定可從網際網路存取的 vCenter。已知 361 個受害 IP、橫跨 47 個國家，德國 55、美國 41、土耳其 38 居前。攻擊鏈是典型的虛擬化平台打法：在 vCenter 與 ESXi 建立未授權管理者帳號、用竊得的 VMware Directory Service 憑證提權，最後在 ESXi 投放 Babuk 衍生勒索軟體，副檔名 .babyk。研究者認為勒索未必是主要目的，可能只是掩護。受害規模是單一廠商的觀測值，不是全球普查 [[17. The Hacker News]](#ref-17)。

<a id="hl-hardware"></a>
### 硬體或軟硬整合
- **AI 資料中心的頻寬瓶頸，把矽光子推成代工新戰場。** 聯電向比利時 **imec** 取得 12 吋光子積體電路（PIC）平台授權，2026 年 7 月與新加坡客戶 SILITH 完成首批量產。聯電執行長王石表示，目標是三年內把 AI 相關代工營收從約 3 億美元推到 10 億美元以上；財務長稱初步數據顯示自家矽光子表現與競爭者相當甚至更好，關鍵是 12 吋產能。這兩點都是公司自述，尚未經獨立驗證。Yole 預估全球矽光子市場將從 2024 年 2.78 億美元成長到 2030 年 27 億美元；高塔半導體市占估逾五成，格羅方德則靠併購新加坡 AMF 補上製造 IP 與客戶 [[5. TechNews 科技新報]](#ref-5)。
- **人型機器人的出貨量開始有意義，但用途仍集中在展示。** TrendForce 估中國人型機器人市場 2026 年達人民幣 150 億元、2027 年至少再成長六成；Counterpoint 則指 2026 上半年全球出貨超過 2.2 萬台、年增近 300%，前五大廠合計市占 86%，智元機器人以 9,700 台居首。真正該看的是用途分布：娛樂與資料採集仍占逾六成，工業製造 13%、倉儲物流 5%。換句話說，多數機器人現在的工作是「被看」與「產生訓練資料」，而不是頂替產線上的人。以上皆為研究機構估算 [[6. TechNews 科技新報]](#ref-6)。

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎
- **把防呆寫進協定，比要每個人寫對過濾規則實際。** **RFC 9234** 要求建立 BGP 連線的兩端先對彼此的關係達成一致，並新增 **Only to Customer（OTC）** 路徑屬性，標記不該傳出客戶網路之外的路由。這等於把「這條路由不應該出現在這裡」的判斷從人工政策移進協定本身。Cloudflare 利用自身全球對接位置，觀察哪些對接網路實際送出 OTC，藉此追蹤採用率。結果指出一個關鍵阻礙：有兩家主要 Tier-1 網路會把轉發路由上的 OTC 屬性刪掉，讓機制在其基礎設施上失效；Cloudflare 表示已與對方接觸。一條防呆規則只要中途被抹掉一次，後面就全部白做 [[7. Cloudflare]](#ref-7)。
- **站方的爬蟲政策，終於不用維護兩份。** Cloudflare 推出 **Bot Preference Sync**，把儀表板上針對 Search、Agent、Training 三類爬蟲的設定自動同步寫進 `robots.txt`，採前置寫入以保留既有的 Disallow。Training 選 Disallow 時，會擋掉訓練用途但仍允許合規的混合用途爬蟲做搜尋索引；Search 與 Agent 可選允許、僅在含廣告頁面阻擋、或全站阻擋。功能對 Free 到 Enterprise 全開放。對爬蟲營運者則設了門檻：要享有「善意推定」需遵守 robots.txt、提供退出機制與 URL 層級的使用可見性，不透明的爬蟲在站方禁止訓練時一律照擋 [[8. Cloudflare]](#ref-8)。

<a id="hl-fintech"></a>
### 金融科技
- **AI 代理要能付錢之前，得先有人決定「誰能代表你」。** 穩定幣支付基礎設施商 **Rain** 發起 **Agentic Payments Alliance（APA）**，創始成員包含 Visa、Mastercard、Fiserv、Circle、Solana 與 Remitly，另有約二十多家業者加入。聯盟目標是為代理身分與授權建立新興標準，共同研究詐欺偵測、紅利點數整合等基礎設施缺口，並處理監管問題。Rain 執行長 Farooq Malik 說，趁這個領域還在成形時就把相關方拉到同一張桌子，是成立聯盟的動機。報導引用 McKinsey 預估，代理式 AI 商務到 2030 年全球規模可達 3 兆至 5 兆美元。這是預測，不是既成事實；目前聯盟也還沒有上線的共通規格 [[9. PYMNTS]](#ref-9)。

<a id="hl-healthtech"></a>
### 醫療科技
- **智慧醫療的瓶頸不在模型，在兩套系統能不能對話。** 衛福部成立**國家數位健康互通性與效能認證實驗室**，建立國家級的醫療資訊驗測與認證機制。部長石崇良指出，智慧醫療取決於高品質資料、安全與資料互通性；衛福部先前已完成資料標準化、藥物編碼、檢驗編碼與醫學術語編碼等基礎。配套的 **FHIR Box** 平台讓醫院不必整套更換資訊系統也能交換資料，規劃年底前推廣到所有醫學中心。實驗室預計建立軟體、硬體與整體解決方案廠商三類認證。認證制度與全面推廣目前都仍是後續規劃 [[10. 中央社 CNA]](#ref-10)。

<a id="hl-logistics"></a>
### 運輸物流
- **無人機物流從單次試飛走向固定配送。** 中華電信與點點全球、金屬工業研究發展中心、新樂飛無人機及中華系統整合合作，在嘉義縣太保市與朴子市建立無人機物流商業化驗證場域，並在嘉義縣無人機日首度展示送餐服務。計畫整合 5G 通訊、智慧物流平台、空中廊道管理與 AI，並建置台灣首條 5G 空中廊道。中華電信表示，此案強調每日固定配送與持續營運，是全台首例在非偏鄉地區常態化運作的示範場域；目前已完成近 1,200 件配送任務、約 120 小時飛行時數與 1,100 公里飛行里程。這些數字均為業者自述，計畫仍屬商業化驗證，尚非全面商轉 [[11. 中央社 CNA]](#ref-11)。

<a id="hl-proptech"></a>
### 房地產與室內外裝潢
- **營建機器人開始以「社區」為單位部署，而不是單棟示範屋。** 美國科羅拉多州 Salida 的 **Cleora** 開發案占地 55 英畝、規劃 106 戶，目前已完成 7 戶，工地有兩套 **RIC Robotics** 自主列印系統運作，預計 65 戶以上採用該技術。參與方包含開發商 Cleora、3D 列印總承包商 True North 與技術供應商 RIC Robotics；案件同時建立該地區第一個 3D 列印計畫區，配套公用設施與水處理，並與 Colorado Mountain College 合作培訓相關人力。過去 3D 列印住宅多是單棟樣品屋，難以驗證重複性與供應鏈；把規模拉到上百戶才會真正暴露排程、養護與驗收問題。「全球規模最大」與缺工改善效果均為開發方主張，尚無獨立查證 [[12. ManufacturingTomorrow]](#ref-12)。

<a id="hl-arts"></a>
### 現場表演藝術
- **夜間開放、互動式劇場與既有展演，讓柴電工場有了多層次的觀看方式。** 國家鐵道博物館的柴電工場於 8 月 22 至 23 日首度開放夜間參觀，延長開放至晚間 8 時，並推出互動式劇場《噓！這是火車精靈的秘密》。蕭淳嫻擔任編劇、導演及肢體設計，何昀庭、洪子晏、曾冠瑜、陳柏毓與謝香臺等青年演員與創作者共同演出。夜間開放期間，原有的「柴電機車的運作」及「電樞的檢修與保養」展演也會繼續，後者包含虛實整合的沉浸式劇場。報導所指的互動式劇場與既有檢修展演是不同節目，不能混為同一場演出 [[13. 中央社 CNA]](#ref-13)。

<a id="hl-entertainment"></a>
### 影視音樂
- **平台選擇標示身分，而不是判斷作品好壞。** Spotify 推出 **AI Persona** 標籤，標示那些代表 AI 生成身分、而非真人的藝人檔案，標籤會出現在藝人頁、相關搜尋結果與播放清單的曲目列，9 月中旬開始推出，藝人即刻起可透過 Spotify for Artists 自我揭露。判定走兩條路：藝人主動揭露，以及審核團隊辨識以擬真 AI 形象呈現且達一定聽眾門檻的檔案；被標記者會收到通知，可申訴或改為自行揭露。推薦端預設不納入任何編輯或演算法推薦，除非聽眾主動追蹤。界線劃得很清楚：用 AI 工具作曲、混音或做視覺設計的真人，不會因此被歸為 AI Persona [[14. Spotify Newsroom]](#ref-14)。

<a id="hl-others"></a>
### 其他領域科技應用突破
- **把致動器留在機外，改由聲場提供推力。** 瑞士洛桑聯邦理工學院（EPFL）的 **MicroBioRobotic Systems Laboratory（MICROBS）** 以 3D 列印製作中空共振腔。特定頻率使腔內空氣振動，再由噴口形成集中氣流。公分尺度的微型船可用不同可聞頻率分別啟動三個共振腔，進行轉向與自動導航；3D 奈米列印的 microflier 則使用超音波。一款 150 微克原型可直接向上推進，另一款的微型葉片最高轉速達每分鐘 13,000 轉，能產生穩定升力。研究已刊登於《Science Advances》，目前仍是實驗室原型 [[15. EPFL]](#ref-15)。

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技
供應商正把「這是不是 AI 產出」的判斷責任往自己這邊挪，但同時公開承認判斷力有限。文字浮水印做在取樣器層，不改變詞的合理性，只換掉亂數來源；代價是短樣本測不準、也分不出「AI 寫的」與「AI 改的」。對開發者的實際影響有兩點：一是程式碼因為要求精確輸出，只在註解等處做最小標記，代表拿浮水印當程式碼來源判定並不可靠；二是偵測 API 尚未推出，短期內外部系統無法直接接上。把浮水印當成「可查證的簽名」比較準確，把它當成「AI 偵測器」則會失望 [[1. Anthropic]](#ref-1)。

另一條線是能力成長本身被當成風險來管。OpenAI 以「可能達到網路安全 Critical 門檻」為由暫停部分訓練，並把監控成本量化成約兩成的受監督推論算力，等於承認安全措施會直接吃掉產能。這兩件事合起來看，供應商正在把「事後辨識產出」與「事前限制能力」當成兩道並行的閥門；對下游團隊的意義是，模型的可得性與發布時程未來可能因為安全評估而變動，排程假設不該只看廠商的路線圖 [[16. OpenAI]](#ref-16)。

<a id="tr-software"></a>
### 軟體工程
代理的部署位置正從編輯器往協作工具擴散，這改變的不是能力而是治理面。當代理能從 Slack 被指派、非同步跑完、直接開 PR，審查就成了唯一的閘門。所以官方一併給了三道約束：行為歸屬到應用身分、受既有 GitHub 權限限制、管理者可要求代理 PR 需額外核准。這個組合值得抄：任何把代理接進團隊流程的專案，都該先確認「它以誰的身分行動」「它能碰哪些資源」「誰負責放行」，而不是先比較它寫得多快。目前功能仍是公開預覽，且限 Business 與 Enterprise 方案 [[2. GitHub Changelog]](#ref-2)。

<a id="tr-security"></a>
### 軟硬體資訊安全
兩則新聞指向同一個判斷方式：風險取決於防護假設能否被繞過。Spectre 案例中，DyPrIs 要等執行結束才隔離，攻擊者便用 WebSocket 保活延長單次執行，再以大量 I/O 壓低偵測比率。Cloudflare 後來整合 V8 沙箱與 MPK，並改良偵測，但原文仍強調兩種隔離都不是完整的 Spectre 解法。Fortinet 案例則顯示，wildcard 雖預設關閉，只要管理者為了遠端 RADIUS 驗證而啟用，FortiWeb 本身就會成為入口。設定稽核除了比對版本，也應掃描「預設安全但可被打開」的高風險選項 [[3. Cloudflare]](#ref-3) [[4. SecurityWeek]](#ref-4)。

vCenter 事件則補上第三種假設失效：修補已經發布，但修補與套用之間的窗口成了攻擊面。漏洞公開後第五天就出現實際利用，受害集中在可從網際網路存取的管理介面，攻擊鏈最後落在 ESXi 的勒索軟體。虛擬化管理平面一旦失守，上面的所有工作負載都跟著陷落，這類系統的修補窗口不能比一般應用寬鬆。可行的收斂順序是：先把管理介面移出公開網路，再談修補節奏 [[17. The Hacker News]](#ref-17)。

<a id="tr-hardware"></a>
### 硬體或軟硬整合
AI 的瓶頸正從算力往互連移動，這讓製程優勢的定義跟著改變。矽光子的競爭點不是線寬，而是能不能用 12 吋產線把光學元件當一般晶片量產。聯電押的就是這點，高塔靠既有市占、格羅方德靠併購補製造 IP，三方同時打市場與專利。另一邊的人型機器人則提醒不要只看出貨曲線：出貨年增近 300%，但娛樂與資料採集仍占逾六成，工業製造只有 13%。訂單成長與產線替代是兩件事，中間隔著可靠度、安全規範與維護成本。以上市場數字皆為公司自述或研究機構估算 [[5. TechNews 科技新報]](#ref-5) [[6. TechNews 科技新報]](#ref-6)。

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎
網路治理的難處從來不是設計，而是跨組織的遵循率，這兩則案例把同一個結構講了兩次。RFC 9234 把路由洩漏的防護寫進協定，理論上不必再依賴人工過濾政策；實測卻發現有兩家 Tier-1 網路會刪掉 OTC 屬性，鏈條中間斷一節，整條就失效。Bot Preference Sync 同理：站方可以一鍵把政策同步到 `robots.txt`，但真正的效果取決於爬蟲營運者願不願意遵守，所以 Cloudflare 把「透明度」設成享有善意推定的前提，不合格者照擋。兩者都說明：可觀測性應該和機制一起設計，否則沒人知道規則有沒有真的生效 [[7. Cloudflare]](#ref-7) [[8. Cloudflare]](#ref-8)。

<a id="tr-fintech"></a>
### 金融科技
代理商務目前缺的不是支付管道，而是身分與授權的共通語彙。卡組織、支付處理商、穩定幣發行方與公鏈坐上同一張桌子，本身就說明沒有任何一方能單獨定義「代理代表誰、能花多少、出事算誰的」。值得留意的是聯盟現階段產出僅止於研究與框架，沒有可實作的規格；對工程團隊而言，短期能做的是把授權邊界、額度上限與稽核軌跡先設計成可替換的介面，等標準明朗再接。至於兆元級市場預估，是用來說明關注度，不宜當成需求量的依據 [[9. PYMNTS]](#ref-9)。

<a id="tr-healthtech"></a>
### 醫療科技
台灣的智慧醫療政策重心明顯放在互通性而非模型能力，這是務實的順序。FHIR Box 的設計思路是「不換系統也能交換資料」，避開了醫院最抗拒的一次性大改；認證實驗室則補上另一半：當軟體模組、硬體裝置與導入廠商都有共同驗收標準，採購方才有辦法比較。這對供應鏈的影響是雙面的：小廠商多了一條可被信任的門票，但也要負擔認證成本。要提醒的是三類認證與 FHIR Box 全面推廣目前都還在時程上，實際效果要等醫學中心陸續接上後才看得出來 [[10. 中央社 CNA]](#ref-10)。

<a id="tr-logistics"></a>
### 運輸物流
無人機物流的觀察指標正在從單次載重與航程，轉向每日班次與累計時數。嘉義這案選在非偏鄉地區做常態化驗證，未來須直接面對配送成本、排程、天候與空域管理等問題。業者公布的近 1,200 件配送任務、約 120 小時與 1,100 公里，至少提供了比單次試飛更完整的營運紀錄，但尚不足以證明商業可行性。5G 空中廊道也顯示，除了飛行器本身，即時影像、飛航控制與遠端監管同樣是擴大營運的前提 [[11. 中央社 CNA]](#ref-11)。

<a id="tr-proptech"></a>
### 房地產與室內外裝潢
營建 3D 列印的驗證重點正從「印得出來」轉向「印得完一整區」。單棟示範屋可以靠現場調校完成，上百戶則會逼出重複性、養護時間、設備稼動率與人力調度的問題，也需要配套的公用設施與計畫區行政程序。Cleora 同時與在地學院合作培訓，反映出這類技術的真實瓶頸往往不是機器而是會操作的人。要保守看待的是宣稱：規模第一與缺工改善都出自開發方，尚無第三方查證；對台灣讀者而言，法規、地震需求與工班結構也不同，直接類比意義有限 [[12. ManufacturingTomorrow]](#ref-12)。

<a id="tr-arts"></a>
### 現場表演藝術
場館可藉夜間時段與既有展演，重新組合觀眾的參觀路徑。鐵道博物館這次同時安排夜間開放、互動式劇場，以及原有的機車運作與電樞檢修展演，讓同一座柴電工場容納導覽、戲劇與沉浸式展示。這種策展方式的優勢是直接運用場館空間與既有內容，不必把技術規格本身當成主角。活動目前只有兩天，後續若要常態化，仍需觀察導覽動線、觀眾承載量與文物安全如何協調 [[13. 中央社 CNA]](#ref-13)。

<a id="tr-entertainment"></a>
### 影視音樂
串流平台把爭議焦點從「AI 音樂能否存在」移到「聽眾是否知道藝人身分」。標籤針對公開身分，不以音樂製作工具判定；影響較大的措施是預設排除於編輯與演算法推薦之外，在不下架作品的前提下改變曝光條件。9 月中旬上線後，可持續觀察 Spotify 對擬真 AI 身分的判定準確度、申訴情況與實際標示覆蓋率。現階段只能確認政策設計，不能把宣布推出視為已全面生效 [[14. Spotify Newsroom]](#ref-14)。

<a id="tr-others"></a>
### 其他領域科技應用突破
微型載具若能把馬達、齒輪與電子零件留在機外，結構就能進一步縮小。EPFL 的方法讓裝置只保留共振腔，外部聲場同時提供能量與控制訊號；代價是載具必須留在可精準調控的聲場內。研究團隊提出的下一步，是在柔性裝置中整合多個對不同頻率有反應的結構，使指定部位能移動、彎曲或振動。這仍是原型研究，後續驗證重點會是縮小尺度、載重能力，以及多個共振結構同時運作時的控制精度 [[15. EPFL]](#ref-15)。

<a id="references"></a>
## 參考資料

| 編號 | 文章標題與搜尋連結 | 一句話繁體中文結論或亮點 | 發布日期 | 來源資料網址與名稱 | 分類 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ref-1"></a>1 | [How Claude's text watermark works](https://www.google.com/search?q=Anthropic+How+Claude%27s+text+watermark+works) | 浮水印改的是取樣時的亂數來源，可驗證但分不出「寫的」與「改的」，偵測 API 尚未推出。 | 2026-08-14 | [Anthropic](https://www.anthropic.com/news/claude-text-watermark) | AI 科技 |
| <a id="ref-2"></a>2 | [The new GitHub Copilot experience in Slack](https://www.google.com/search?q=The+new+GitHub+Copilot+experience+in+Slack) | Copilot 可從 Slack 被指派並自行開 PR，行為歸屬應用身分且受既有權限與核准控制。 | 2026-08-21 | [GitHub Changelog](https://github.blog/changelog/2026-08-21-the-new-github-copilot-experience-in-slack/) | 軟體工程 |
| <a id="ref-3"></a>3 | [A revisit of remote Spectre attacks on Cloudflare Workers](https://www.google.com/search?q=Cloudflare+A+revisit+of+remote+Spectre+attacks+on+Workers) | 遠端 Spectre 在生產環境可達每秒 12 位元，偵測型隔離被繞過後改以 V8 沙箱與 MPK 補強。 | 2026-08-19 | [Cloudflare](https://blog.cloudflare.com/revisiting-spectre-attacks-on-workers/) | 軟硬體資訊安全 |
| <a id="ref-4"></a>4 | [Fortinet Patches Authentication Flaws in FortiWeb and FortiManager](https://www.google.com/search?q=Fortinet+Patches+Authentication+Flaws+in+FortiWeb+and+FortiManager) | FortiWeb 在 RADIUS wildcard 開啟時可被任意帳密登入，同批另修 FortiManager 與 FortiClient 缺陷。 | 2026-08-13 | [SecurityWeek](https://www.securityweek.com/fortinet-patches-authentication-flaws-in-fortiweb-and-fortimanager/) | 軟硬體資訊安全 |
| <a id="ref-5"></a>5 | [AI 推升 PIC 代工狂潮，聯電挾 12 吋量產優勢決戰高塔、格羅方德](https://www.google.com/search?q=聯電+PIC+代工+矽光子+高塔+格羅方德) | 聯電取得 imec 12 吋 PIC 平台授權切入矽光子代工，營收目標與效能比較均屬公司自述。 | 2026-08-22 | [TechNews 科技新報](https://finance.technews.tw/2026/08/22/umc-joins-battle-competing-tower-globalfoundries/) | 硬體或軟硬整合 |
| <a id="ref-6"></a>6 | [中國人型機器人迎量產！今年市場規模達 150 億人民幣，估 2027 年至少成長 60%](https://www.google.com/search?q=TrendForce+Counterpoint+人型機器人+2026+出貨) | 上半年全球出貨逾 2.2 萬台、年增近 300%，但娛樂與資料採集仍占逾六成用途。 | 2026-08-21 | [TechNews 科技新報](https://technews.tw/2026/08/21/trendforce-counterpoint-see-2026-ai-human-robot/) | 硬體或軟硬整合 |
| <a id="ref-7"></a>7 | [BGP Role model: tracking the adoption of RFC 9234](https://www.google.com/search?q=Cloudflare+BGP+Role+model+RFC+9234+adoption) | OTC 屬性可從協定層防路由洩漏，但兩家主要 Tier-1 網路會刪除該屬性導致機制失效。 | 2026-08-18 | [Cloudflare](https://blog.cloudflare.com/rfc9234-bgp-role-model/) | 網路/伺服器等基礎 |
| <a id="ref-8"></a>8 | [Say it once: introducing Bot Preference Sync](https://www.google.com/search?q=Cloudflare+Bot+Preference+Sync+robots.txt) | 儀表板上的爬蟲政策可自動同步寫入 robots.txt，不具透明度的爬蟲不享善意推定。 | 2026-08-21 | [Cloudflare](https://blog.cloudflare.com/bot-preference-sync/) | 網路/伺服器等基礎 |
| <a id="ref-9"></a>9 | [Visa and Mastercard Join Rain's Agentic Commerce Coalition](https://www.google.com/search?q=Agentic+Payments+Alliance+Rain+Visa+Mastercard) | Rain 發起代理支付聯盟，Visa、Mastercard、Circle 等共同制定代理身分與授權標準。 | 2026-08-18 | [PYMNTS](https://www.pymnts.com/news/artificial-intelligence/2026/visa-and-mastercard-join-rains-agentic-commerce-coalition/) | 金融科技 |
| <a id="ref-10"></a>10 | [國家數位健康互通性實驗室啟動　助軟硬體測試認證](https://www.google.com/search?q=國家數位健康互通性與效能認證實驗室+衛福部) | 衛福部成立認證實驗室並推 FHIR Box，規劃軟體、硬體與供應商三類認證。 | 2026-08-18 | [中央社 CNA](https://www.cna.com.tw/news/ahel/202608180253.aspx) | 醫療科技 |
| <a id="ref-11"></a>11 | [中華電打造無人機物流商業化驗證場域　送餐服務亮相](https://www.google.com/search?q=中華電信+嘉義+無人機物流+商業化驗證場域) | 嘉義太保與朴子建立非偏鄉常態化無人機物流場域，已累積近 1,200 趟配送。 | 2026-08-10 | [中央社 CNA](https://www.cna.com.tw/news/afe/202608100309.aspx) | 運輸物流 |
| <a id="ref-12"></a>12 | [Robotics Advances Construction at the World’s Largest Planned 3D-Printed Township](https://www.google.com/search?q=Cleora+Salida+Colorado+3D+printed+township+RIC+Robotics) | 科羅拉多 Cleora 案規劃 106 戶、已完成 7 戶，以兩套自主列印系統推進，規模宣稱未經獨立查證。 | 2026-08-13 | [ManufacturingTomorrow](https://www.manufacturingtomorrow.com/news/2026/08/13/robotics-advances-construction-at-the-worlds-largest-planned-3d-printed-township/28040/) | 房地產與室內外裝潢 |
| <a id="ref-13"></a>13 | [鐵道博物館柴電工場首度夜間開放　互動式劇場同步登場](https://www.google.com/search?q=國家鐵道博物館+柴電工場+夜間開放+互動式劇場) | 柴電工場首度夜間開放並推出互動式劇場，既有機車運作與電樞檢修展演也同步進行。 | 2026-08-18 | [中央社 CNA](https://www.cna.com.tw/news/acul/202608180232.aspx) | 現場表演藝術 |
| <a id="ref-14"></a>14 | [Introducing a New Label for AI-Generated Artist Identities on Spotify](https://www.google.com/search?q=Spotify+AI+Persona+label+AI-generated+artist+identities) | AI Persona 標籤 9 月中旬推出，預設不進編輯與演算法推薦，但不影響使用 AI 工具的真人。 | 2026-08-11 | [Spotify Newsroom](https://newsroom.spotify.com/2026-08-11/ai-persona-badges-transparency/) | 影視音樂 |
| <a id="ref-15"></a>15 | [These tiny drones are powered by sound](https://www.google.com/search?q=EPFL+These+tiny+drones+are+powered+by+sound) | EPFL 以聲波驅動 3D 列印共振腔，150 微克原型可向上推進，葉片轉速最高達 13,000 RPM。 | 2026-08-14 | [EPFL](https://actus.epfl.ch/news/these-tiny-drones-are-powered-by-sound-2/) | 其他領域科技應用突破 |
| <a id="ref-16"></a>16 | [Pacing model development in an era of cyber-critical capabilities](https://www.google.com/search?q=OpenAI+Pacing+model+development+in+an+era+of+cyber-critical+capabilities) | OpenAI 因 Astra 可能達網路安全 Critical 門檻，暫停部分 RL 訓練並加強隔離與監控。 | 2026-08-18 | [OpenAI](https://openai.com/index/pacing-model-development-cyber-capabilities/) | AI 科技 |
| <a id="ref-17"></a>17 | [Suspected China-Nexus Actor Exploits VMware vCenter Flaw, Deploys Babuk-Derived Ransomware](https://www.google.com/search?q=Suspected+China-Nexus+Actor+Exploits+VMware+vCenter+Flaw+Babuk) | CVE-2026-59310 修補後五天即遭利用，已知 361 個受害 IP、47 國，最終在 ESXi 投放勒索軟體。 | 2026-08-17 | [The Hacker News](https://thehackernews.com/2026/08/suspected-china-nexus-actor-exploits.html) | 軟硬體資訊安全 |

<a id="notes"></a>
## 報告說明
本報告由 Claude Code、Codex 於 2026-08-22 彙整近 15 天內（2026-08-07 至 2026-08-22）的全球科技新聞與官方公告，再依程式設計師與科技讀者較常關注的主題整理成分類摘要與趨勢觀察。來源以官方公告與一手技術部落格優先，其次為權威科技媒體與台灣主流媒體；候選來源與淘汰判斷依據保留在同一任務資料夾的 `source.md`。本期共蒐集 27 筆候選來源，正式採用 17 筆，淘汰 10 筆，淘汰原因以「發布日期落在時間窗外」與「上一期已引用」為主。交付前已逐筆重新開啟原始網址，核對標題、發布日期、媒體名稱與內文主張。

需特別區分的部分：ref-5 的營收目標與效能比較、ref-9 的兆元級市場預估、ref-12 的「全球規模最大」與缺工改善效果，皆為公司自述或第三方預測，非已驗證結果；ref-6 的出貨量與市場規模、ref-5 的矽光子市場規模為研究機構（Counterpoint、TrendForce、Yole）估算。ref-1 的偵測 API、ref-10 的認證制度與 FHIR Box 全面推廣、ref-14 的標籤上線，都是已宣布但尚未完成的時程。ref-2 的 Slack 整合為公開預覽，非正式上線。ref-4 的漏洞可利用條件限於非預設設定，且原廠表示尚無遭實際利用跡象。ref-16 的門檻判定與暫停時長為 OpenAI 自述，未經外部稽核；openai.com 對本次擷取回 HTTP 403，日期與數字改以第三方報導交叉核對，引用仍指向官方原文。ref-17 的 361 個受害 IP、47 國為單一事件應變廠商的觀測值，非全球普查。ref-15 已改用 EPFL 官方研究發布並附《Science Advances》出處，取代原先的二手整理。

<a id="disclaimer"></a>
## 免責聲明
本報告內容僅供資訊參考，不構成投資、法律、醫療或其他專業建議。新聞事件與相關資訊可能持續更新，請以原始來源及官方公告為準。
EOF

cat > "$TASK/task_plan.md" <<'EOF'
# 任務計劃：科技服務資訊週記

## 目標
完成報告日期 2026-08-22、時間範圍 2026-08-07 至 2026-08-22 的科技服務資訊週記，保留研究判斷、候選與正式來源，並完成 `tech/2026-08-22/` 交付。

## 執行模式
一次完成

## 階段
- [x] 階段 1：確認日期範圍與 12 個必要分類
  - [x] 讀取 skill 規格、模板、共用知識庫索引與五項專案知識
  - [x] 撰寫 prompt.md 與 task_plan.md，並通過 validate-task-files.sh
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 2：蒐集來源並整理 `source.md`
  - [x] 依 12 分類逐項搜尋，逐筆以原始頁面查核發布日期
  - [x] 保留 15 筆正式來源與 10 筆淘汰來源的判斷依據
  - [x] ✅ 階段檢核：更新 notes.md → source.md → task_plan.md
- [x] 階段 3：依權重篩選正式參考資料
  - [x] 官方公告與一手技術部落格優先，其次為權威科技媒體與台灣主流媒體
  - [x] 公司宣稱、二手轉載與研究機構估算均在來源備註標明限制
  - [x] ✅ 階段檢核：更新 notes.md → source.md → task_plan.md
- [x] 階段 4：檢查各分類是否缺漏
  - [x] 12 個必要分類皆有正式來源；資安、硬體、網路基礎各 2 筆
  - [x] ✅ 階段檢核：更新 notes.md → source.md → task_plan.md
- [x] 階段 5：撰寫總結、亮點、趨勢分析
  - [x] 12 個亮點分類與 12 個趨勢分類完成，每段標註來源編號
  - [x] ✅ 階段檢核：更新 notes.md → report.md → task_plan.md
- [x] 階段 6：整理參考資料表與引用
  - [x] 內文引用、HTML 錨點與參考資料表編號一致（ref-1 至 ref-17）
  - [x] ✅ 階段檢核：更新 notes.md → report.md → task_plan.md
- [x] 階段 7：完成前第二次稽核
  - [x] 逐筆核對來源標題、日期、網站名稱、網址與內容主張
  - [x] 檢查分類完整性、資訊權重、搜尋時間範圍、引用一致性與錯誤修正狀態
  - [x] ✅ 階段檢核：更新 notes.md → source.md／report.md → task_plan.md
- [x] 階段 8：依模板完成 `report.md`
  - [x] 保留目錄、錨點、四大段落、報告說明與免責聲明
  - [x] ✅ 階段檢核：更新 notes.md → report.md → task_plan.md
- [x] 階段 9：複製交付物到 `tech/2026-08-22/`
  - [x] 透過 `scripts/deliver-weekly-tech-report.sh` 同步五份交付物
  - [x] 執行 validate-task-files.sh、validate-task-completion.sh 與引用一致性驗證
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md

## 關鍵問題與答案
1. 哪些分類資料不足需補搜？醫療科技、金融科技、房地產與室內外裝潢、現場表演藝術四類皆需二至三輪補搜；前三類最終各以窗內事件補齊，房地產僅能找到權重 5/10 的業者發布資訊。
2. 哪些來源因日期或可信度排除？共 10 筆，主因是發布日落在 2026-08-07 之前（兩廳院 AR 導覽、ETtoday 室內設計、Edinburgh Fringe、屋頂光電新制、C-LAB），以及上一期已引用（Cloudflare Access for Workers、GitHub Agent Plugins 1.0）。
3. 內文引用與參考資料編號是否一致？是，ref-1 至 ref-17 全部在內文出現且編號對應。

## 已做決策
- 任務資料夾：`weekly-tech-report-017`
- 報告作者欄位：Claude Code、Codex
- 時間窗採含首尾：2026-08-07 至 2026-08-22
- 以 `scripts/build-weekly-tech-report-017.sh` 作為本期內容唯一來源
- 交付沿用既有腳本 `scripts/deliver-weekly-tech-report.sh`，未新增交付腳本
- 稽核後：資安 3 筆，AI、硬體、網路基礎各 2 筆，其餘 8 類各 1 筆，合計 17 筆
- 來源 15 改採 EPFL 官方研究發布，不再使用二手科技媒體報導

## 遇到的錯誤與修正
- `https://www.ithome.com.tw/security` WebFetch 回 HTTP 403，與 `knowledge/fetch-gotchas.md` 記載一致；改由其他來源補齊資安分類。
- 第一輪搜尋在醫療、房地產、表演藝術三類回傳大量年度趨勢文與長檔期活動頁，逐篇查核後多數落在窗外，已全部記入 `source.md` 淘汰區。
- Fortinet 漏洞的 CVSS 分數外部說法（9.8）與 SecurityWeek 標示的嚴重度不一致，改為不引用單一評分數字，只描述可利用條件與影響。
- Spotify 事件原先命中台灣二手報導（udn／台灣醒報，2026-08-16），依來源優先序改採 Spotify 官方原文（2026-08-11）。
- 第二次稽核發現總結超過 300 字、`source.md` 標題格式無法被共用驗證器辨識，且部分正式來源被誤判為無發布日期；已縮寫總結並統一改為 `### 數字. 標題`。
- 第二次稽核更正來源 11 合作方、來源 13 人名與節目關係，並重新校準 6 筆來源權重。

- [x] 階段 10：2026-08-22 第 3 次來源稽核
  - [x] 逐筆重新開啟 17 筆正式來源原文，複驗第 2 次稽核的全部改動
  - [x] 補搜後新增 ref-16（OpenAI 放慢模型開發節奏）與 ref-17（VMware vCenter 遭利用）
  - [x] openai.com 回 403，改以第三方報導交叉核對後採用官方引用
  - [x] 免責聲明改採前幾期既有慣例措辭
  - [x] ✅ 階段檢核：更新 notes.md → source.md／report.md → 同步 tech/2026-08-22/ → 重新驗證

## 狀態
**已完成**：研究、報告、交付同步與驗證均通過。作者：Claude Code、Codex。
EOF

if [ -f "$TASK/prompt.md" ]; then
  sed 's/作者：Claude Code　報告日期/作者：Claude Code、Codex　報告日期/g' "$TASK/prompt.md" > "$TASK/prompt.md.tmp"
  mv "$TASK/prompt.md.tmp" "$TASK/prompt.md"
fi

echo "已建立 weekly-tech-report-017 完整研究與報告"
