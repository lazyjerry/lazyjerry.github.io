# 來源抓取踩坑

## 觸發時機

- 以 WebFetch 抓取特定新聞內文時
- 需要查核文章發布日期是否落在 15 天範圍時

## 內容

### iThome、openai.com 等站 WebFetch 常回 403

- iThome 內文頁（`ithome.com.tw/news/...`）以 WebFetch 直接抓取常回 HTTP 403。
- 解法：改用 WebSearch 的結果摘要與標題確認重點，URL 仍指向原文；必要時以多個搜尋結果交叉確認日期與事實。
- 已確認會擋的站點：`ithome.com.tw/news/...`、`www.ithome.com.tw/security`、`openai.com/index/...`、`openai.com/news/`。
- 官方頁被擋時，仍以官方 URL 作為參考資料，改用權威第三方報導交叉核對日期與數字，並在 `notes.md` 記錄交叉查核的來源與比對項目。

### inside.com.tw 全站對 WebFetch 回 403

- `www.inside.com.tw` 首頁與文章頁皆回 HTTP 403，無法用列表頁盤點窗內文章。
- 解法：改以 WebSearch 的結果摘要判斷是否值得追，並找同事件的其他媒體（中央社、科技新報）作為正式來源。

### 中央社《全球中央》會 301 轉址到 newsworld.com.tw

- `www.cna.com.tw/newsworld/article/{編號}/` 會 301 轉址到 `newsworld.com.tw/article/{編號}/`，WebFetch 不自動跟隨跨網域轉址，要以轉址後網址重抓。
- 參考資料表的來源網址採用轉址後的 `newsworld.com.tw`，來源名稱寫「全球中央」。
- 該站的 URL 編號帶日期（例如 `20260826n002`），但那不一定是發布日；本期該篇網址為 08-26、內文標示 2026.09.01。**日期一律以內文標示為準，不要從 URL 推。**

### 標題與內文互相矛盾時直接淘汰

- 科技新報 2026-09-05〈遮蔽恆星光芒尋找第二個地球，NASA 與 MIT 聯手打造巨型「花朵遮星板」〉標題寫 MIT，內文寫執行團隊為加州理工學院。
- 這類來源內部矛盾無法靠再查一次原頁解決（矛盾就在同一頁），依「資料來源正確性」原則直接淘汰，不要挑一邊採信。

### 趨勢型文章常落在 15 天範圍外

- 搜尋「2026 趨勢／展望／生態地圖」類關鍵字，回傳的多為年初或前一年的綜述（如 1 月、去年 12 月），易誤判為近期。
- 解法：每一筆候選來源都要逐篇查核「實際發布日期」（WebFetch 或內文標示），而非以搜尋出現順序判斷新舊；窗外即剔除並記錄於 `source.md`。
- 對醫療科技、運輸物流等分類尤其常見窗內專題不足，需提早補搜或明確註記缺漏。

### technews.tw 文章頁 301 轉址到 cdn.technews.tw

- `technews.tw/2026/...` 與 `finance.technews.tw/...` 的文章頁會 301 轉址到 `cdn.technews.tw/2026/...`，WebFetch 不跟隨跨網域轉址，需以轉址後網址重抓。
- 參考資料表仍採用 `technews.tw` 正式網址，不要寫 `cdn.` 版本。
- `technews.tw/2026/09/13/` 這類日期歸檔頁只回傳部分文章（實測 3 篇），首頁同日卻列出 9 篇。要盤點單日文章不能只靠歸檔頁，需搭配首頁與 WebSearch 取得完整 URL。
- 子站的轉址網域各不相同：`finance.technews.tw` 轉到 `cdnfinance.technews.tw`，`infosecu.technews.tw` 轉到 `cdninfosecu.technews.tw`，不是 `cdn.technews.tw`。

### WebFetch 的摘要會改寫時間詞、補出原文沒有的日期

- 實測：中央社原文的「今天」被寫成「昨日」；Digital Music News 原文只寫「last year」，摘要卻補成「November 2025」。
- **發布日期與關鍵數字不能只信 WebFetch 摘要。** 改用 `curl` 取原頁 HTML，讀 JSON-LD 的 `datePublished`／`articleBody` 或 `<meta property="article:published_time">` 核對。
- 中央社列表頁 `cna.com.tw/list/{ait|amov|acul}.aspx` 可用 curl 抽出「標題＋網址」盤點窗內新聞；MIT News 的 `news.mit.edu/rss/feed` 附 pubDate。
- iThome 對 WebFetch 回 403，但 `curl` 帶瀏覽器 User-Agent 可拿到 200，發布日在 `class="created"`；inside.com.tw 連帶 UA 的 curl 也回 403。

### 原頁沒有日期列、或日期是資料期間

- `anthropic.com/institute/...` 路徑的文章沒有日期列，頁面上的「August 2026」是資料期間而非發布日；發布日要看 `anthropic.com/news` 列表。
- OpenAI 的 `alignment.openai.com/misalignment-reports/` 只列各則通報日期，不顯示框架公告本身的發布日，需以媒體報導交叉確認。
- 中文轉述常與原頁數字不一致（例：科技新報寫「從 3 月約 1%」，Anthropic 原頁是「2 月不到 1%」），數字一律回原頁。

### blog.cloudflare.com 的 slug 無法從標題推測

- 依標題直譯的 slug 全回 404。實際對應：〈1.1.1.1 now supports post-quantum DNSSEC〉是 `post-quantum-dnssec-1111`、〈Automatic Key Exchange…〉是 `automatic-key-exchange-for-origins`、〈Introducing automatic remediation policies with Cloudflare CASB〉是 `casb-policies`。
- 解法：先用 `WebSearch` 限定 `allowed_domains: ["blog.cloudflare.com"]` 取得正確網址，再 WebFetch。
- `anthropic.com` 同類：〈Improving our alignment and security efforts〉的 slug 為 `improving-alignment-security-efforts`；該站的威脅情資報告頁本身不顯示發布日期，日期需回 `anthropic.com/news` 列表頁取得。

### 活動預告類來源的發布日常落在窗外

- 表演藝術與影視音樂的窗內來源特別稀疏，因為大型活動的新聞稿多在開幕前一至兩個月發出。實測落在窗外的有：兩廳院秋天藝術節（發布 07-27、活動 10-22）、高雄電影節 XR 片單（08-18、活動 10-09）、FUTUREMODE（08-13）、Spotify AI Persona 官方公告（08-11，標籤 9 月中旬才上線）。
- **活動的實施日落在窗內，不能拿來當發布日。** 判定一律以新聞稿或報導的發布日為準。
- 可用的補救方向：找窗內發出的「開幕前置報導」（例如大會規模與展區公布、演出前的交管公告），而非活動主新聞稿。

### openai.com 連 curl 帶各種 UA 也回 403

- `openai.com/index/...` 對 curl 的 Chrome UA、curl 預設 UA 與 Googlebot UA 一律回 403，無法在原頁確認發布日。
- 解法：同事件改以可核對日期的台灣媒體（iThome 的 `class="created"`）或 GitHub Changelog 的同日上架公告為來源，在 `source.md` 備註官方頁無法取得；報告說明列為非一手來源。

### sec.gov 對瀏覽器 UA 回 403「Request Rate Threshold Exceeded」

- SEC 新聞稿頁對一般瀏覽器 UA 回 403，改用宣告式 UA（含應用名稱與聯絡 email）後回 200。
- 頁面沒有 `datePublished` meta，日期取頁面日期列（例如「Sept. 17, 2026」）。
- 同類：`cadence.com`、`mastercard.com` 對 curl 與 WebFetch 皆 403；`bleepingcomputer.com` 首頁與 RSS 會被 Cloudflare 的「Just a moment」擋下。無法核對原頁者淘汰。

### 政府與廠商頁面的「更新日期」不是發布日

- `fsc.gov.tw` 新聞稿頁尾的「更新日期」是網站更新時間，發布日以正文「今日（22 日）」與列表頁的 `dataserno`（如 `202609220001`）為準。
- `mediatek.com` 新聞室列表頁顯示的日期與文章頁不一致，以文章頁的日期列為準。
- `mohw.gov.tw` 與 `abri.gov.tw` 的日期欄用民國年（如 `115-09-17`），換算後記錄。

### 沒有日期 meta 的一手來源

- `anthropic.com` 的模型發表頁與 `/news/`、`nasa.gov/news-release/`、`waymo.com/blog/shorts/`、臺鐵官網內文頁都沒有 JSON-LD 或 `article:published_time`。
- 分別以頁面正文日期列、`<title>` 或 H1 內的日期、官網列表頁日期為準，並在 `source.md` 備註出處。

### blog.google 用 curl 抽到的是 CSS

- `blog.google` 文章頁以 curl 取回的 HTML 去標籤後幾乎只剩樣式表，正文要改用 WebFetch 抽取，再用 `grep` 對原始 HTML 驗證關鍵詞與數字是否真的在原頁。
- 實測 Project Suncatcher 頁面不含二手媒體寫的發射日期、衛星名稱與 TPU 數量，這些一律不寫入摘要。

### 前端框架渲染的新聞稿頁，正文在另一個端點

- `qualcomm.com/news/releases/...` 是 React app，curl 取回的 HTML 只有 JSON-LD（含 `datePublished`），正文要抓同網址加 `.model.json`，再從 JSON 的 `text` 欄位讀。
- `apple.com/newsroom` 的 H1 常比 `og:title` 長（多了 brand-new 之類的修飾語），參考資料表採 H1；日期取 JSON-LD `datePublished`，頁面標示 UPDATE 時另有 `dateModified`，不可當發布日。
- `corp.helpfeel.com` 公告頁有兩個日期 meta，較晚的是更新時間；發布日以正文「as of September 16, 2026」與頁面日期列為準。

## 來源

- 來自 weekly-tech-report-005（2026-05-30）任務的實作經驗
- inside.com.tw、全球中央轉址、標題內文矛盾三項來自 weekly-tech-report-019（2026-09-05）任務
- technews.tw 轉址與歸檔頁不全、blog.cloudflare.com／anthropic.com slug 不可推測、活動預告發布日落窗外三項來自 weekly-tech-report-020（2026-09-13）任務
- technews 子站轉址網域、WebFetch 改寫日期與 curl 核對法、原頁無日期列三項來自 weekly-tech-report-021（2026-09-19）任務
- openai.com 全 UA 403、sec.gov 宣告式 UA、更新日期不是發布日、無日期 meta 的一手來源、blog.google 抽到 CSS 五項來自 weekly-tech-report-022（2026-09-26）任務
- qualcomm.com 的 `.model.json`、apple.com/newsroom 的 H1 與 og:title 差異、helpfeel.com 雙日期 meta 三項來自 weekly-tech-report-022 第三輪稽核
