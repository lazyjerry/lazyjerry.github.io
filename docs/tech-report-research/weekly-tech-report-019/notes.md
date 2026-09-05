# 研究筆記

- 任務：weekly-tech-report-019
- 報告日期：2026-09-05
- 時間範圍：2026-08-21 至 2026-09-05
- 使用工具：Claude Code（Opus 5）、Codex

## 知識庫查閱

任務開始前已讀取 `docs/tech-report-research/knowledge/index.md` 與全部六份知識檔案：

- `source-priority.md`：中國來源與社群平台內容優先以高權重來源替換，台灣媒體為主要參考來源之一
- `taiwan-media-landscape.md`：台灣媒體分類座標，用於評估中央社、自由時報、科技新報的定位
- `date-citation-rules.md`：引用格式 `[[{數字}. {資料來源名稱}]](#ref-{數字})`、錨點規則、`*未知時間` 用法
- `report-format.md`：四段式結構、H2/H3 階層、參考資料表格、完成前檢查
- `fetch-gotchas.md`：iThome、openai.com 等站 WebFetch 回 403；趨勢型文章常落窗外須逐篇查核日期
- `window-overlap-dedup.md`：15 天窗與上一期重疊，篩選前先比對上一期 `references.md`

另讀取施工筆記索引 `docs/working-notes-skill/notes/index.md`，命中並開啟 `2026-09_01_週記中文排版校對改建置腳本.md`，確認本期同樣以 `scripts/build-weekly-tech-report-019.sh` 作為五份檔案的唯一內容來源。

## 跨期去重

本期窗期（2026-08-21 至 2026-09-05）與上一期（2026-08-14 至 2026-08-29）重疊九天。篩選前已讀取 `tech/2026-08-29/references.md`，建立 21 筆已引用網址名單，以下候選因此淘汰：

- Anthropic「Expanding our support for scientists」（2026-08-27，上期 ref-1）
- Anthropic「Funding better evaluations of AI's impact on wellbeing」（2026-08-25，上期 ref-2）
- GitHub「Upcoming changes to GitHub Copilot policies and billing」（2026-08-28，上期 ref-3）
- Cloudflare「BotBase for Operators」（2026-08-28，上期 ref-11）
- Cloudflare「How we saved 100 terabytes of memory by optimizing 1.1.1.1's DNS cache」（2026-08-27，上期 ref-10）

同站不同事件不算重複：Cloudflare 本期採用 2026-09-01 的 `cache-transcoding` 與 2026-09-03 的 `vulnerability-discovery-remediation`，與上期兩篇是不同產品與不同技術主題。GitHub 本期採用 2026-09-01 的 code review 核准權與 2026-08-31 的模型下架，與上期的計費政策變更是不同事件。

## 抓取踩坑（本期新增）

- `www.inside.com.tw` 對 WebFetch 回 HTTP 403，含首頁與文章頁。改以 WebSearch 摘要判斷，本期最終未採用該站來源。
- `www.ithome.com.tw` 維持 403（與 `fetch-gotchas.md` 記載一致）。Zeabur 事件因此改採動區動趨（BlockTempo）2026-08-29 的報導作為正式來源，iThome 的〈【資安日報】8月31日〉僅作交叉核對。
- `www.cna.com.tw/newsworld/article/...` 會 301 轉址到 `newsworld.com.tw`，WebFetch 不自動跟隨，需以轉址後網址重抓；參考資料網址採用轉址後的 `newsworld.com.tw`。

## 逐筆查核與修正

- 「遮蔽恆星光芒尋找第二個地球，NASA 與 MIT 聯手打造巨型『花朵遮星板』」（科技新報 2026-09-05）標題稱 MIT，內文卻寫執行團隊為加州理工學院，來源內部矛盾未能釐清，直接淘汰。其他領域科技應用突破改採 MIT News 的 Arm Qubit 與可撓透明矽光子兩篇。
- Zeabur 正式來源記載事件發生於 8 月 27 日，採用原頁日期。該來源僅證實一組內部服務憑證遭未授權存取，並明說技術根因尚未定論；稽核後刪除未由正式來源支持的 AWS 高權限憑證與主資料庫入侵路徑。
- TSMC 微流道散熱的發言人為先進封裝技術研發處長陳燕銘，場合是 9 月 1 日的 SEMICON Taiwan 2026 展前系列活動「異質整合高峰論壇」。人名、職稱、場合與日期皆回原頁確認。
- 軟銀 HAPS 測試的合作對象為美國航太公司 Sceye，平流層高度約 16.5 公里，涵蓋半徑 5 公里，通訊規格為 4G，不是 5G。
- 特斯拉 Cybercab 在德州註冊 420 輛自駕車、其中 45 輛為 Cybercab；Waymo 在德州註冊 988 輛。兩組數字分屬不同基準，報告中並列時已註明。
- 索尼案的原告是索尼集團旗下 35 家音樂出版公司，被告除 Anthropic 外還包含執行長 Dario Amodei 與共同創辦人 Benjamin Mann，訴訟於 2026-08-28 遞交至美國加州北區聯邦地方法院。
- 台北藝術節《大象來了》的中央社報導（2026-08-14）落在窗外，改採自由時報 2026-09-02 的交管報導，演出日期 9 月 5、6 日落在本期窗內。
- Git 設定漏洞需要來源以封存檔、同步資料夾或 USB 等方式連同 `.git` 目錄抵達；一般 `git clone` 不會保留來源端 `.git/config`，已補進來源摘要與報告，避免把攻擊面泛化到所有 clone。
- MIT 可撓透明矽光子研究的 300 mm 是晶圓級製程規模；繞螺絲粗細圓柱數千次的是切割後的單顆晶片。原稿混淆兩者，已分開改寫。
- 分類補搜命中資通安全署 9 月 4 日發布的「政府因應先進 AI 資安風險政策」，其台灣政策重要性與來源權重高，新增為 ref-29。

## 權重壓低而非排除

- ref-8（Zeabur）權重 6：事件仍在調查中，賠償比例與外洩規模由當事公司自行公布，尚無第三方稽核報告。
- ref-18（智慧醫院永續路徑）權重 7：屬中央社《全球中央》名家視角專欄，作者為台灣醫務管理學會理事長洪子仁，觀點文性質，僅採用文中可回溯的數據。
- ref-23、ref-24（現場表演藝術）權重 7：以活動報導為主，技術細節有限，報告中只寫可查證的規模與形式。
- ref-26（CD 黑膠）權重 7：轉載自 MoneyDJ，原始數據來自 RIAA 2026 上半年報告。

## 分類補搜

醫療科技、房地產與室內外裝潢、現場表演藝術三個分類在第一輪搜尋皆不足，補搜輪次如下：

- 醫療科技：台灣端補到中央社《全球中央》9 月 1 日專欄；國際端補到 MIT News 9 月 4 日的活細胞轉錄體方法。
- 房地產與室內外裝潢：台灣端窗內僅有房市統計類報導，技術含量不足；改採 MIT News 9 月 4 日的 Metropolitan Storage Warehouse 改造報導，屬既有建築的結構性改造與室內空間重組。
- 現場表演藝術：補到台北藝術節《大象來了》機械象街頭展演與潮台北科技音樂互動展兩則，皆落在窗內。
- 軟硬體資訊安全：稽核時補搜到資通安全署的先進 AI 資安三階段策略，涵蓋短期加速防禦、中期政府採購與供應商管理、長期自主 AI 防禦能力，納入正式來源。
