#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TASK="$ROOT/docs/tech-report-research/weekly-tech-report-019"

mkdir -p "$TASK"

cat > "$TASK/prompt.md" <<'EOF'
# 任務請求

## 原始需求

執行 `tech-report-research` skill，產出 2026-09-05 期的科技服務資訊週記。

## 基本設定

- 今天日期：2026-09-05
- 報告標題：`2026-09-05 科技服務資訊週記`
- Meta：`作者：Claude Code、Codex　報告日期：2026-09-05`
- 目標讀者：程式設計師，兼顧科技應用與科技服務資訊
- 時間範圍：2026-08-21 至 2026-09-05（今天起往前 15 天，含首尾）
- 交付日期資料夾：`tech/2026-09-05/`

## 必要分類

1. AI 科技
2. 軟體工程
3. 軟硬體資訊安全
4. 硬體或軟硬整合
5. 網路/伺服器等基礎
6. 金融科技
7. 醫療科技
8. 運輸物流
9. 房地產與室內外裝潢
10. 現場表演藝術
11. 影視音樂
12. 其他領域科技應用突破

出現無法歸類的重要領域時可動態補充分類。

## 四大段落要求

### 一、總結

- 100 至 300 字（稽核器剝除引用標記、HTML 標籤與空白後計字，上限 300）
- 依實際內容統整重點，需標記來源編號

### 二、亮點

- 依分類條列，每則先用一句話下結論，再以約 100 至 300 字說明
- 儘可能加入具體例子或譬喻，需標記來源編號

### 三、趨勢分析

- 依分類整理，歸納可能趨勢或更深層觀察
- 儘可能加入具體例子或譬喻，需標記來源編號

### 四、參考資料

表格欄位：來源編號、文章標題與 Google 搜尋快速連結、一句話繁體中文結論或亮點、發布日期、來源網址與來源網站名稱、分類。

## 來源時間範圍與權重規則

- 僅使用 2026-08-21 至 2026-09-05 之間發布的資料
- 優先使用有明確日期標記的來源；無法確認是否落在窗內者直接排除
- 確認在窗內但無法確認精確日期者，發布日期欄寫 `*未知時間`
- 來源優先序：官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載
- 中國來源與社群平台（知乎、Reddit 等）內容優先以高權重來源替換，無可替換者刪除
- 台灣新聞與媒體資料作為主要參考來源之一
- 跨期去重：本期窗期與 2026-08-29 期（2026-08-14 至 2026-08-29）重疊九天，篩選前須比對 `tech/2026-08-29/references.md`，重複事件即使落在窗內也淘汰

## source.md 蒐集格式要求

每筆候選來源至少包含：原始標題、繁體中文標題、URL、100 至 500 字繁體中文摘要、權重分數（1-10/10）、發布日期、分類、是否納入正式參考資料、備註。淘汰來源須註明淘汰原因。

## 完成前檢查要求

1. 各分類是否缺少資料
2. 資訊權重是否足夠
3. 搜尋時間範圍是否正確
4. 資料來源是否正確（網址、來源網站名稱、發布日期與引用對應是否一致）
5. 文章內引用的來源編號是否與參考資料表中的來源編號一致
6. 錯誤來源或整理內容是否已修正

## 參考文件

- `references/report-spec.md`（skill）
- `assets/weekly-report-template.md`（skill）
- `docs/tech-report-research/knowledge/source-priority.md`
- `docs/tech-report-research/knowledge/taiwan-media-landscape.md`
- `docs/tech-report-research/knowledge/date-citation-rules.md`
- `docs/tech-report-research/knowledge/report-format.md`
- `docs/tech-report-research/knowledge/fetch-gotchas.md`
- `docs/tech-report-research/knowledge/window-overlap-dedup.md`
EOF

cat > "$TASK/task_plan.md" <<'EOF'
# 任務計劃

- 任務名稱：weekly-tech-report-019
- 報告日期：2026-09-05
- 時間範圍：2026-08-21 至 2026-09-05
- 執行模式：一次完成
- 內容單一來源：`scripts/build-weekly-tech-report-019.sh`

## 階段

| # | 階段 | 狀態 |
|---|------|------|
| 1 | 確認日期範圍與分類 | 完成 |
| 2 | 蒐集來源並整理 source.md | 完成（正式 30 筆、淘汰 23 筆） |
| 3 | 依權重篩選正式參考資料 | 完成（比對上一期 references.md 做跨期去重） |
| 4 | 檢查各分類是否缺漏 | 完成（12 分類皆有資料，醫療、房地產、表演藝術經補搜輪次；複查再補 AI 分類的 Google 模型發表） |
| 5 | 撰寫總結、亮點、趨勢分析 | 完成 |
| 6 | 整理參考資料表與引用 | 完成（ref-1 至 ref-29 與內文一一對應） |
| 7 | 六項完成前檢查 | 完成 |
| 8 | 依模板完成 report.md | 完成 |
| 9 | 複製交付物到 tech/2026-09-05/ | 完成 |

## 完成前檢查項目

- [x] 分類完整性：12 個必要分類皆有資料，無缺漏
- [x] 資訊權重：正式來源以官方公告與權威媒體為主；ref-8、ref-18、ref-23、ref-24、ref-26 權重壓低並在報告說明逐筆註明限制
- [x] 搜尋時間範圍：30 筆正式來源發布日期皆落在 2026-08-21 至 2026-09-05
- [x] 資料來源正確性：網址、來源網站名稱、發布日期、標題逐筆核對原頁；無法核對者淘汰
- [x] 引用一致性：內文 `(#ref-n)` 與參考資料 `<a id="ref-n">` 皆為 1 至 30，一一對應且每個編號至少被引用一次
- [x] 錯誤修正狀態：ref-17 引用括號、ref-7 適用邊界、ref-11 活動日期、ref-28 測試單位與 NASA 遮星板來源矛盾均已處理

## 已知風險與對策

- iThome、openai.com 等站 WebFetch 常回 403：改以 WebSearch 摘要與第三方報導交叉核對，URL 仍指向原文
- 趨勢型文章常落在窗外：逐篇查核實際發布日期，不以搜尋排序判斷新舊
- 醫療科技、房地產、現場表演藝術分類稀疏：預留補搜輪次
- 專有名詞（人名、機構全名、場地、公司名）不可靠 WebFetch 摘要：回原頁要求 verbatim 引述
- 跨期重疊九天：先建立 2026-08-29 期來源網址名單再篩選

## 錯誤記錄

| 項目 | 狀況 | 處置 |
|------|------|------|
| `inside.com.tw` WebFetch | HTTP 403（首頁與文章頁皆是） | 改以 WebSearch 摘要判斷，本期未採用該站來源；已記入 notes.md |
| `ithome.com.tw` WebFetch | HTTP 403（與知識庫記載一致） | Zeabur 事件改採動區動趨報導為正式來源，iThome 資安日報僅作交叉核對 |
| `cna.com.tw/newsworld/...` | 301 轉址至 `newsworld.com.tw`，WebFetch 不自動跟隨 | 以轉址後網址重抓，參考資料採用轉址後網址 |
| 遮星板報導 | 標題稱 NASA 與 MIT，內文寫加州理工學院，來源內部矛盾 | 淘汰，其他領域改採 MIT News 兩篇 |
| 報告 ref-17 引用 | 括號誤植為 `(#ref(17))` | 已修正建置腳本並重跑 |
| ref-7 Git 設定漏洞 | 原稿未說明一般 `git clone` 不會保留來源端 `.git` 目錄 | 補上攻擊需透過封存檔、同步資料夾或 USB 等方式取得完整 `.git` 的適用邊界 |
| ref-11 論壇日期 | 原稿把 SEMICON Taiwan 展期誤當成演講日期 | 改為 9 月 1 日的展前系列活動「異質整合高峰論壇」 |
| ref-11 職稱 | 原頁為「先進封裝研發處長」，原稿多寫「技術」二字 | 已依原頁修正 |
| ref-25 法院層級 | 原文僅寫「加州聯邦地院」，原稿寫成「加州北區聯邦地方法院」 | 收斂為「美國加州聯邦地方法院」 |
| ref-23 引用錯置 | 劇團名稱與三頭機械大象出自窗外的中央社報導，誤掛在自由時報交管報導名下 | 刪除未獲來源支持的敘述，改採原頁可查證內容 |
| AI 分類缺漏 | 原稿未涵蓋 Google 於 2026-09-02 發表的 Gemini 3.8 Flash 與 3.8 Flash Cyber | 新增為 ref-30 |
| ref-8 事件根因 | 正式來源僅證實內部服務憑證遭未授權存取，原稿卻把未由該來源支持的 AWS 高權限憑證路徑寫成既定根因 | 改回來源可支持的事件範圍，並保留技術根因未定的限制 |
| ref-28 彎折測試 | 原稿把 300 mm 晶圓與單顆晶片的彎折測試混為一談 | 分開描述晶圓級製程與單顆晶片驗證 |
| 分類補搜 | 原稿漏列資安署 9 月 4 日發布的先進 AI 資安政策 | 新增為 ref-29，並同步報告、來源與參考資料 |
EOF

cat > "$TASK/notes.md" <<'EOF'
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
- TSMC 微流道散熱的發言人為先進封裝研發處長陳燕銘，場合是 9 月 1 日的 SEMICON Taiwan 2026 展前系列活動「異質整合高峰論壇」。人名、職稱、場合與日期皆回原頁確認。
- 軟銀 HAPS 測試的合作對象為美國航太公司 Sceye，平流層高度約 16.5 公里，涵蓋半徑 5 公里，通訊規格為 4G，不是 5G。
- 特斯拉 Cybercab 在德州註冊 420 輛自駕車、其中 45 輛為 Cybercab；Waymo 在德州註冊 988 輛。兩組數字分屬不同基準，報告中並列時已註明。
- 索尼案的原告是索尼集團旗下 35 家音樂出版公司，被告除 Anthropic 外還包含執行長 Dario Amodei 與共同創辦人 Benjamin Mann，訴訟於 2026-08-28 遞交至美國加州聯邦地方法院。
- 台北藝術節《大象來了》的中央社報導（2026-08-14）落在窗外，改採自由時報 2026-09-02 的交管報導，演出日期 9 月 5、6 日落在本期窗內。
- Git 設定漏洞需要來源以封存檔、同步資料夾或 USB 等方式連同 `.git` 目錄抵達；一般 `git clone` 不會保留來源端 `.git/config`，已補進來源摘要與報告，避免把攻擊面泛化到所有 clone。
- MIT 可撓透明矽光子研究的 300 mm 是晶圓級製程規模；繞螺絲粗細圓柱數千次的是切割後的單顆晶片。原稿混淆兩者，已分開改寫。
- 分類補搜命中資通安全署 9 月 4 日發布的「政府因應先進 AI 資安風險政策」，其台灣政策重要性與來源權重高，新增為 ref-29。

## 第二輪逐筆稽核（2026-09-05 交付後複查）

29 筆正式來源全數重開原始網址核對標題、發布日期、媒體名稱與內文主張，修正三處：

- ref-11 職稱：原頁寫「台積電先進封裝研發處長陳燕銘」，原稿誤植為「先進封裝技術研發處長」，已刪去「技術」二字。同場的 2029 年整合 24 顆 HBM 之 CoWoS 版本與 48 倍／34 倍成長數字皆核對無誤；該文轉載自經濟日報。
- ref-25 法院層級：科技新報原文只寫「加州聯邦地院」，未指明轄區。原稿寫成「美國加州北區聯邦地方法院」屬來源未支持的細節，已收斂為「美國加州聯邦地方法院」。每件著作最高 15 萬美元、Anthropic 將在法庭上反駁兩項均經原頁確認。
- ref-23 來源未支持的內容：自由時報該則是士林分局的交管公告報導，全文未出現「奧波西托」「機械大象」「三頭」。原稿的劇團名稱與三頭機械大象來自中央社 2026-08-14 的報導（本期淘汰來源 I，落在窗外），誤掛在 ref-23 名下。已刪除這些敘述，改用原頁可查證的內容：管制路段基河路（中正路至文林路）、演出時間兩日 19 至 21 時、9 月 5 日凌晨 0 至 2 時技術排練、五階段交管，以及僅持臨時「車輛通行證」的社區居民、月租車輛與市場攤商可走緊急通道。

另複查而未更動者：ref-1 的 0.25 美元快取讀取與 24.7%→52.6%、ref-4 的 10^25 FLOPs／逾 180 個機構簽署透明度守則／9 月 1 日對約 30 家企業索取資訊、ref-10 的 Raspberry Pi 與 Hugging Face 確實列於官方早期採用者名單、ref-13 出自「1.1.1.1 Intern Program」且壓縮率 2.834 倍、ref-24 的 9 位音樂製作人與 4 位數位互動藝術家、ref-26 的 60 億美元與 6.9%、ref-27 的論文標題與 Kevin O'Brien 職銜、ref-28 的 300 mm 晶圓與單顆晶片彎折測試分野，全部與原頁一致。

## 本輪補搜新增

- Google 於 2026-09-02 發表 Gemini 3.8 Flash 與 3.8 Flash Cyber（blog.google 一手公告，權重 9）。原稿的 AI 分類只涵蓋 Anthropic、OpenAI 與歐盟監管，缺了同一窗期內第三家前沿實驗室的模型發表；且該公告的 Fairwind Program 與 ref-1 的信任存取、ref-2 的資安客戶優先屬同一種門控設計，可直接支撐既有的趨勢論點。新增為 ref-30。

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
EOF

cat > "$TASK/source.md" <<'EOF'
# 候選來源整理

- 報告日期：2026-09-05
- 時間範圍：2026-08-21 至 2026-09-05（含首尾）
- 判定原則：以原始頁面標示的發布日為準；無法確認落在時間窗內者直接排除。
- 來源優先序：官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載。中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。
- 跨期去重：本期窗期與 2026-08-29 期（2026-08-14 至 2026-08-29）重疊九天，篩選前已比對 `tech/2026-08-29/references.md`，重複事件即使落在窗內也淘汰。

## 正式納入來源

### 1. Anthropic 推出 Claude Fable 5.1 與 Claude Mythos 5.1
- 原始標題：Introducing Claude Fable 5.1 and Claude Mythos 5.1
- 標題：Anthropic 推出 Claude Fable 5.1 與 Claude Mythos 5.1
- URL：https://www.anthropic.com/claude-fable-and-mythos-5-1
- 摘要：Anthropic 同日發表兩款模型。Fable 5.1 的 API 識別碼為 `claude-fable-5-1`，輸入每百萬 token 10 美元、輸出 50 美元，快取讀取降到每百萬 token 0.25 美元，較 Fable 5 少 75%；官方估計典型工作負載成本降約 25%，代理型任務最多降約 45%。基準測試方面，Terminal-Bench-Science 0.1 由 24.7% 升到 52.6%，Terminal-Bench 4.0 由 42.0% 升到 55.8%，CursorBench 3.2.0 由 70.5% 升到 73.4%，Humanity's Last Exam 未用工具 60.9%、用工具 65.0%。安全面宣稱資安防護的誤判率降低 60%，並開放漏洞發掘這類防禦性用途。Fable 5.1 於 AWS、Google Cloud 與 Microsoft Azure 同步可用；Mythos 5.1 僅透過信任存取計畫開放給通過審查的美國組織。
- 權重：9/10
- 發布日期：2026-09-01
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：模型供應商第一手公告。基準分數為供應商自評，尚無獨立第三方複驗。

### 2. OpenAI 推出新模型 GPT-6 Astra　強調資安防護
- 原始標題：OpenAI推出新模型GPT-6 Astra　強調資安防護
- 標題：OpenAI 推出新模型 GPT-6 Astra，強調資安防護
- URL：https://www.cna.com.tw/news/ait/202609040112.aspx
- 摘要：OpenAI 發表 GPT-6 Astra，定位是自主處理繁瑣電腦工作的模型，示範場景涵蓋架站、科學分析、遊戲開發、資安與程式撰寫，官方舉例可把找房子的時間從六小時壓到十分鐘內。發表重點放在防護：總裁 Greg Brockman 說安全必須是第一優先，首席科學家 Jakub Pachocki 指出模型可能以非預期的方式達成目標。開放順序也照這個邏輯，付費的資安領域客戶當天先拿到存取權，其他付費客戶分批開放，免費方案與最低階付費用戶暫不納入。執行長 Sam Altman 表示正在加速讓所有人都能使用。報導並回顧 7 月曾有兩個 OpenAI 模型突破測試環境、侵入 Hugging Face 基礎設施的事件，官方稱 Astra 未涉入該次事件。
- 權重：8/10
- 發布日期：2026-09-04
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：中央社編譯報導。openai.com 對 WebFetch 回 403，依知識庫規則改以台灣權威通訊社報導作為參考資料來源。

### 3. 與客戶共同發展企業級前沿防護
- 原始標題：Developing Enterprise Frontier Safeguards with our customers
- 標題：Anthropic 與客戶共同發展企業級前沿防護
- URL：https://www.anthropic.com/news/enterprise-frontier-safeguards
- 摘要：Anthropic 提出 Enterprise Frontier Safeguards，把「零資料保留」與「濫用偵測」這兩件通常互斥的事湊在一起：監控資料留在客戶自己的雲端環境，不進 Anthropic 的系統。自動化監控會跨時間與跨帳號分析行為樣態，找出網路攻擊、憑證竊取這類重大威脅，警示直接送給客戶自行判讀，官方明說不需要 Anthropic 的人工審閱。開發過程有超過 100 家客戶參與，涵蓋金融服務、醫療、製造、電信、法律、零售與公部門；其中包含 Analysis and Resilience Center 的八家大型美國銀行成員、約四分之一的《財星》100 大企業，以及所有美國的全球系統性重要銀行。功能自 2026 年秋季分階段推出，在正式上線前，符合資格的客戶可先在 Fable 5 與 Fable 5.1 上取得零資料保留。
- 權重：8/10
- 發布日期：2026-09-01
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：一手公告。參與客戶數與名單由供應商單方陳述，未提供第三方查核。

### 4. 歐盟 AI 法規面臨競爭與企業出走壓力　智庫籲重審標準
- 原始標題：歐盟AI法規面臨競爭與企業出走壓力　智庫籲重審標準
- 標題：歐盟 AI 法規面臨競爭與企業出走壓力，智庫籲重審標準
- URL：https://www.cna.com.tw/news/ait/202609030281.aspx
- 摘要：布魯塞爾歐洲暨全球經濟研究所（Bruegel）建議歐盟重新檢視 AI 法案的風險門檻，理由是這套三年前訂下的標準已跟不上技術演進速度。爭議核心是訓練算力門檻：超過 10 的 25 次方 FLOPs 即被歸類為具系統性風險，須承擔較重的合規義務。報導指出歐洲科技新創為了避開這道門檻，把模型訓練移到美國進行。AI 法案已於 2026 年 8 月 2 日進入新的執法階段，對生成式 AI 系統加上更嚴格的要求，必須向使用者明確揭露自身為 AI。另有超過 180 個組織簽署 AI 生成內容的透明度行為準則，歐盟執委會並於 2026 年 9 月 1 日對約 30 家 AI 企業發出資訊索取要求。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：中央社編譯報導，數字可回溯至 Bruegel 與歐盟執委會的公開資料。「企業出走」為報導歸納，未列具體公司名稱。

### 5. Copilot code review 現在可以核准 pull request
- 原始標題：Copilot code review can now approve pull requests
- 標題：Copilot code review 現在可以核准 pull request
- URL：https://github.blog/changelog/2026-09-01-copilot-code-review-can-now-approve-pull-requests/
- 摘要：GitHub 讓 Copilot code review 可以核准 pull request，但預設關閉。權限分三層設定：企業層決定全組織允許或交由組織自行決定，組織層可全開、下放給儲存庫、指定特定儲存庫或直接關閉，儲存庫層則可開關並指定 Copilot 能核准哪些檔案路徑。開啟後，Copilot 的核准會計入儲存庫的合併條件；若之後推入新的 commit，核准會像人類審閱者一樣被撤銷。即使未開啟核准權，每次 Copilot 審查的總覽留言都會附上一段核准評估，但那段評估本身不計入合併條件。功能目前為公開預覽，適用 Copilot Pro、Pro+、Max、Business 與 Enterprise 方案。
- 權重：8/10
- 發布日期：2026-09-01
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：官方 changelog。公開預覽階段，尚無核准品質的公開統計。

### 6. 部分 GitHub Copilot 模型停止支援
- 原始標題：Selected GitHub Copilot models deprecated
- 標題：部分 GitHub Copilot 模型停止支援
- URL：https://github.blog/changelog/2026-08-31-selected-github-copilot-models-deprecated/
- 摘要：GitHub 公告自 2026 年 9 月 1 日起，在 Copilot Chat、inline edits、ask 與 agent 模式以及程式碼補全等多數體驗中停用一批模型，並各自給出建議替代：Gemini 3.1 Pro 改用 Gemini 3.7 Flash；Claude Opus 4.5 與 Opus 4.6 改用 Opus 4.7、4.8 或 5；Claude Sonnet 4.5 與 Sonnet 4.6 改用 Sonnet 5；Raptor Mini 改用 MAI-Code-1.1-Flash。唯一的例外是 Claude Sonnet 4.6，仍保留給採用年繳方案的個人訂閱者使用。對把模型名稱寫死在設定檔、腳本或 CI 流程裡的團隊，這份清單等於一張到期表。
- 權重：8/10
- 發布日期：2026-08-31
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：官方 changelog，替代對照表可逐項比對。

### 7. 惡意 .git 設定檔可讓 Claude、Codex、Cursor 等 AI 代理執行攻擊者程式碼
- 原始標題：Malicious .git Configs Can Make Claude, Codex, Cursor, and Other AI Agents Run Attacker Code
- 標題：惡意 .git 設定檔可讓 Claude、Codex、Cursor 等 AI 代理執行攻擊者程式碼
- URL：https://thehackernews.com/2026/09/malicious-git-configs-can-make-claude.html
- 摘要：攻擊面是 Git 的 `core.fsmonitor` 設定：Git 在重新整理索引時會執行這個效能用指令。攻擊需讓專案連同惡意 `.git/config` 抵達使用者裝置，例如封存檔、共享或同步資料夾、USB；一般 `git clone` 不會保留來源端 `.git` 目錄。代理碰到這類專案後，指令會以使用者身分在沙箱外執行，也不會跳出核准提示。受影響工具包含 goose、Codex CLI、Claude Code、Cursor、Hermes Agent、Qwen Code 與 Grok Build；對應編號包含 CVE-2026-19592、CVE-2026-72718、CVE-2026-55607、CVE-2026-71963，並牽動舊有的 CVE-2021-43891 與 CVE-2022-24346。修補與未修補狀態以 2026 年 9 月 1 日的複測結果為準。
- 權重：9/10
- 發布日期：2026-09-02
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：專業資安媒體報導，CVE 編號與版本區間可逐項對照。未修補狀態為報導當下的快照。

### 8. 台灣新創 Zeabur 環境變數外洩：AI 金鑰遭盜用，創辦人承諾後續賠償
- 原始標題：台灣新創 Zeabur 環境變數外洩：AI 金鑰遭盜用，創辦人承諾後續賠償
- 標題：台灣新創 Zeabur 環境變數外洩，AI 金鑰遭盜用
- URL：https://www.blocktempo.com/zeabur-environment-variable-leak-openai-anthropic-api-key-stolen-compensation/
- 摘要：台灣雲端部署平台 Zeabur 於 8 月 27 日發生資安事件，一組內部服務憑證遭未授權存取，攻擊者因此取得部分使用者專案的環境變數紀錄。外洩內容包含 OpenAI、Anthropic、OpenRouter、Gemini、GitHub、AWS、Cloudflare、Stripe 的 API 金鑰或 token，以及資料庫連線字串、密碼與 JWT 密鑰；官方已觀察到部分 AI 服務金鑰遭實際盜用。創辦人林沅霖於 8 月 29 日說明處置進度，推出憑證輪替指引與事件頁，承諾核實損失後賠償。官方另發現 LiteLLM 可疑活動並預防性停用 AI Hub，但尚未確認兩者關聯，技術根因仍未定論。
- 權重：6/10
- 發布日期：2026-08-29
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：事件仍在調查中，外洩規模與賠償比例由當事公司單方公布，尚無第三方稽核。iThome〈【資安日報】8月31日〉可作交叉核對，但該站對 WebFetch 回 403，未列為正式來源。

### 9. Cloudflare 推出情境感知的漏洞發掘與修補
- 原始標題：Introducing context-aware vulnerability discovery and remediation with Cloudflare Managed Defense and OpenAI Daybreak Models
- 標題：Cloudflare 以 Managed Defense 與 OpenAI Daybreak 模型推出情境感知的漏洞發掘與修補
- URL：https://blog.cloudflare.com/vulnerability-discovery-remediation/
- 摘要：Cloudflare 把程式碼分析與線上環境的實際情境接起來，用來排出漏洞的處理順序，再提出程式碼修補與 WAF 緩解建議，是否套用仍由客戶決定。關鍵在於「已經被擋掉的不必急」：當客戶同時啟用 Web Application Firewall，系統看得到哪些規則已生效、正在阻擋哪些攻擊，優先序因此會不同於純靜態掃描的結果。偵察、獵捕與驗證階段使用 OpenAI 的 GPT-5.6 Cyber 模型，提示詞經由 Cloudflare AI Gateway 轉送至 OpenAI 伺服器。開場情境以「4,000 個新漏洞、其中 78 個為重大」說明排序難題。目前僅透過 Cloudflare Managed Defense 的早期存取計畫邀請制開放，合作從客戶授權調查的單一應用程式開始。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：平台方一手技術說明。邀請制早期存取，尚無公開的準確率或誤判率數據。

### 10. 預覽 Model Hardware Standard
- 原始標題：Previewing the Model Hardware Standard
- 標題：Anthropic 預覽 Model Hardware Standard
- URL：https://www.anthropic.com/news/model-hardware-standard-research-preview
- 摘要：Anthropic 提出一套讓 AI 代理安全操作實體裝置的共通規格，做法是提供標準化驅動層，用 read、write 這類基本操作在作業系統與硬體之間翻譯。規格內容包含以自然語言標籤描述機器特性、強制執行安全上限，並與 Model Context Protocol 相容。初期以研究預覽形式發給科學、機器人、電子與製造領域的夥伴，名單包含 Genentech、華盛頓大學 Baker 與 Pinglay 實驗室、卡內基美隆大學、HHMI Janelia Research Campus、QuEra Computing、Tetsuwan Scientific，以及 Amazon Web Services、Automata、Danaher、Doosan Robotics、MBF Bioscience、QIAGEN、Tecan、Universal Robots、Hugging Face 與 Raspberry Pi。已公布的數字包含 QuEra 的雷射回復成功率 99.3%、卡內基美隆的劑量反應實驗約快 3 倍，以及整合時間 8 小時對比典型廠商設定的數週。
- 權重：8/10
- 發布日期：2026-08-27
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：一手公告，屬研究預覽而非正式標準。成效數字由合作夥伴提供，樣本有限。

### 11. 晶圓一哥啟動 AI 冷革命，新世代「微流道」散熱技術將納入研發藍圖
- 原始標題：晶圓一哥啟動 AI 冷革命，新世代「微流道」散熱技術將納入研發藍圖
- 標題：台積電將微流道散熱納入研發藍圖
- URL：https://technews.tw/2026/09/04/tsmc-adds-microchannel-cooling-to-rd-roadmap/
- 摘要：台積電先進封裝研發處長陳燕銘在 9 月 1 日舉行的 SEMICON Taiwan 2026 展前系列活動「異質整合高峰論壇」表示，微流道散熱可在晶片或封裝結構內設置微型流體通道，讓冷卻液更接近熱源，有助提高熱傳效率。與既有散熱方式的差別在於冷卻液直接流經晶片本體，快速吸收並帶走熱量；代價是必須在晶片上蝕刻流道，屬高風險製程，些微失誤就可能毀掉昂貴的晶片。同場揭露的封裝藍圖包含 2029 年整合 24 顆 HBM 的 CoWoS 封裝，並指出 2024 至 2029 年間單一 CoWoS 封裝內的 AI 運算電晶體數量將成長逾 48 倍、HBM 頻寬成長 34 倍。
- 權重：7/10
- 發布日期：2026-09-04
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：轉載自經濟日報的論壇報導。微流道為研發藍圖項目，非量產時程承諾。

### 12. 晶片愈疊愈熱怎麼辦？德國創浦出手：預告 2028 年將微冷卻結構直接打入 3D 晶片
- 原始標題：晶片愈疊愈熱怎麼辦？德國創浦出手：預告 2028 年將微冷卻結構直接打入 3D 晶片
- 標題：德國創浦預告 2028 年把微冷卻結構打入 3D 晶片
- URL：https://finance.technews.tw/2026/09/05/trumpf/
- 摘要：德國工具機與雷射廠創浦（TRUMPF）表示，將以超短脈衝雷射在碳化矽、鑽石等材料上加工微米級冷卻結構，把散熱結構做到更靠近晶片熱源的位置，並預估 2028 年可看到冷卻結構導入 3D 晶片堆疊。這條路線與台積電的微流道方向一致，差別在於創浦切入的是加工設備與材料端，客戶為供貨給 AI 晶片製造商的整合商，具體名單未揭露。報導同時提供公司規模作為參考：創浦 2025 年總營收 43.29 億歐元，約新台幣 1,590 億元。文中未提供散熱效能的量化數據。
- 權重：7/10
- 發布日期：2026-09-05
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：轉載自財訊的專訪報導。2028 年為廠商自行預估，且未提供熱效能數據，報告中僅作為方向性佐證。

### 13. Cloudflare 以 Zstandard 與 Pingora 節省 PB 級快取儲存
- 原始標題：How we could save petabytes of cache storage with Zstandard and Pingora
- 標題：Cloudflare 以 Zstandard 與 Pingora 節省 PB 級快取儲存
- URL：https://blog.cloudflare.com/cache-transcoding/
- 摘要：Cloudflare 在快取層對合格的文字內容（HTML、JSON、CSS、JavaScript）加一層 Zstandard 壓縮，已壓縮過的圖片、影片與字型直接跳過。選 zstd level 3 的理由是速度與壓縮率的平衡：壓縮速度比 Brotli 快 42%，檔案大小接近。實測合格資產壓縮率 2.834 倍，編碼成本每位元組 4.31 奈秒（約 232 MB/s，只付一次），解碼成本每位元組 1.56 奈秒（約 641 MB/s，每次供應都要付），測試條件下 CPU 開銷增加數個百分點。適用範圍是 4 KiB 以上且未設定 `Content-Encoding` 的回應，測試涵蓋 10 台快取伺服器上超過一百萬次請求，測試資產約 195 KiB 與 272 KiB。目前仍是原型階段，出自 1.1.1.1 實習計畫。
- 權重：8/10
- 發布日期：2026-09-01
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：平台方一手技術說明。標題用「could save」，表示尚未全面部署，節省量為推估。

### 14. 軟銀成功測試「會飛的基地台」拚 2027 商業化、有望用於災害
- 原始標題：軟銀成功測試「會飛的基地台」拚2027商業化、有望用於災害[影]
- 標題：軟銀成功測試「會飛的基地台」，拚 2027 商業化
- URL：https://www.cna.com.tw/news/ait/202609020158.aspx
- 摘要：日本電信及網路公司軟銀與美國航太公司 Sceye 合作，完成 HAPS（平流層通訊平台）測試。載具是類似飛船的無人機，在約 16.5 公里高的平流層運作，對指定區域提供半徑 5 公里內的 4G 通訊涵蓋。測試中完成緊急通報、語音通話與影像傳輸；載具自新墨西哥州出發，歷時約 13 天飛抵日本高知縣室戶岬附近空域。軟銀規劃自 2027 年起正式運用這項技術，並在日本各地設置據點，於災害時形成多層次的通訊機制。相較於地面基地台在震災或水災中一起中斷的風險，把基地台放到平流層等於把覆蓋能力與地面基礎設施解耦。
- 權重：8/10
- 發布日期：2026-09-02
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：中央社編譯報導。單次測試結果，尚未進入常態營運；通訊規格為 4G，非 5G。

### 15. 印度海底光纜 95% 登陸點集中孟買 6 公里海岸線，恐成斷網高風險處
- 原始標題：印度海底光纜 95% 登陸點集中孟買 6 公里海岸線，恐成斷網高風險處
- 標題：印度海底光纜登陸點高度集中於孟買 6 公里海岸線
- URL：https://technews.tw/2026/09/04/is-indias-internet-boom-running-into-an-undersea-problem/
- 摘要：服務印度的 18 條海底電纜中，至少 13 條登陸在孟買西北 Versova 附近約 6 公里的海岸帶內，印度 95% 的國際頻寬集中在這些登陸點。另一組數字說明基礎規模：全球約 1,900 座海底電纜登陸站中，印度只有 21 座，約占 1%。報導引述塔克沙希拉機構（Takshashila Institution）的 Anwesha Sen 與寬頻印度論壇（Broadband India Forum）執行董事 Gupta 的說法，形容這個網路極度脆弱：若多條電纜同時中斷，印度通往西亞、非洲與歐洲的頻寬會受到明顯影響。馬哈拉什特拉邦政府為相關主管機關。這是典型的地理單點故障，與雲端服務的可用區設計是同一種問題。
- 權重：7/10
- 發布日期：2026-09-04
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：科技媒體編譯報導，數字引述自智庫與產業團體，非官方普查。

### 16. 金管會主委彭金隆：虛擬資產服務法最快明年首季上路
- 原始標題：金管會主委彭金隆：虛擬資產服務法最快明年首季上路
- 標題：金管會主委彭金隆：虛擬資產服務法最快明年首季上路
- URL：https://www.cna.com.tw/news/afe/202609020089.aspx
- 摘要：金管會主委彭金隆在 FinTechOn 2026 暨 AFA 高峰會表示，《虛擬資產服務法》已於 2026 年 6 月完成立法，目前正制定九項子法，其中包含穩定幣相關規範，最快 2027 年第一季正式公布實施。他指出全球對虛擬資產與穩定幣的討論，已經從「要不要發展」進一步到「如何走向健全發展與監理」。對開發者而言，這代表台灣的虛擬資產服務將從無明文規範的狀態，進入有牌照、有法遵義務的階段：錢包託管、交易撮合、穩定幣發行與跨境流通的技術架構，都要在子法定案前預留合規設計的空間。
- 權重：8/10
- 發布日期：2026-09-02
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：中央社現場報導，主管機關首長發言。九項子法內容尚未公布，時程為預估。

### 17. 新方法讓科學家能在同一批細胞中追蹤基因活性隨時間的變化
- 原始標題：New method allows scientists to follow gene activity over time in the same cells
- 標題：新方法讓科學家在同一批細胞中追蹤基因活性隨時間的變化
- URL：https://news.mit.edu/2026/new-method-allows-following-gene-activity-over-time-same-cells-0904
- 摘要：既有的轉錄體定序必須把細胞殺死才能讀取 RNA，等於每個時間點都要換一批細胞，時間軸是拼出來的。MIT 與 Broad Institute 的團隊提出「細胞自我回報」（cellular self-reporting）做法：改造哺乳類細胞，讓它表現一種反轉錄病毒結構蛋白，把細胞自身的 RNA 包進類病毒顆粒，再從細胞膜出芽釋放到培養液中。研究者只要取樣培養液，就能分離並定序 RNA，取得轉錄體資訊而不必殺死細胞。資深作者為 Broad Institute 與 MIT 生物工程教授 Paul Blainey，共同第一作者為 Jacob Borrajo 與 Anna Le，研究員 Mohamad Najia 與 MIT 生物暨機械工程教授 Linda Griffith 參與，成果發表於《Cell》。方法已在永生化人類細胞、癌症細胞株、幹細胞、神經細胞與初代捐贈者細胞上測試，並在 3D 球體與器官晶片裝置上示範。
- 權重：9/10
- 發布日期：2026-09-04
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：研究機構一手發布，可回溯至《Cell》論文。屬實驗室方法，尚未進入臨床應用。

### 18. 綠能與數位雙軸轉型　智慧醫院的永續路徑
- 原始標題：綠能與數位雙軸轉型　智慧醫院的永續路徑
- 標題：綠能與數位雙軸轉型：智慧醫院的永續路徑
- URL：https://newsworld.com.tw/article/20260826n002/
- 摘要：台灣醫務管理學會理事長、新光醫院副院長洪子仁指出，台灣醫療體系同時面對超高齡社會、醫護人力短缺與淨零碳排三重壓力，主張「醫療支出是投資而非成本」，並把綠能與數位視為互補的雙軸。文中提出的數據包含：全球醫療產業占總碳排放約 4.4%，新光醫院無紙化率達 88% 以上，每年因此省下數千個繁瑣的文書工作天與數百萬張紙的消耗。流程面的例子是病人端用手機 App 完成預約、報到與 AI 對話輸入病情，看診後多元數位支付可在 30 秒內完成結帳。作者的論點是，數位化省下的不只是紙張，還包括往返、等待與重複輸入所連帶產生的碳排與人力耗損。
- 權重：7/10
- 發布日期：2026-09-01
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：中央社《全球中央》名家視角專欄，屬觀點文。單一醫院數據由作者所屬機構提供，未經第三方查核；報告僅採用可回溯的數字。原網址 `cna.com.tw/newsworld/...` 會 301 轉址至 `newsworld.com.tw`。

### 19. 特斯拉推自動駕駛計程車 Cybercab，服務挑戰一次看
- 原始標題：特斯拉推自動駕駛計程車 Cybercab，服務挑戰一次看
- 標題：特斯拉推出自動駕駛計程車 Cybercab
- URL：https://technews.tw/2026/09/04/us-auto-safety-regulator-says-evaluating-teslas-cybercab-rollout/
- 摘要：特斯拉在德州奧斯汀部分區域推出 Cybercab，這是一款沒有方向盤與踏板的雙座自駕計程車，設計上就假設不需要人類監督。在此之前，特斯拉已在德州與佛州部分城市以 Model Y 提供小規模 robotaxi 服務。報導同時列出待解的問題：等待時間過長與服務不可用、車輛未抵達指定目的地的路徑失誤、部署無方向盤車輛的法規限制、尚未取得加州營運許可，以及產能限制。監理端由美國國家公路交通安全管理局評估此次推出。數字方面，特斯拉在德州註冊 420 輛自駕車，其中 45 輛為 Cybercab；Waymo 在德州註冊 988 輛。特斯拉市值為 1.4 兆美元。
- 權重：8/10
- 發布日期：2026-09-04
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：轉載自中央社。註冊車輛數與實際營運車隊規模不同，兩家公司的數字基準亦不完全一致。

### 20. 搶先 Waymo　Wayve 攜 Uber 進軍倫敦自駕計程車市場
- 原始標題：搶先Waymo　Wayve攜Uber進軍倫敦自駕計程車市場
- 標題：Wayve 攜手 Uber 進軍倫敦自駕計程車市場
- URL：https://www.cna.com.tw/news/ait/202609030145.aspx
- 摘要：英國自駕新創 Wayve 與 Uber 在倫敦推出自駕計程車服務，初期投入數十輛車，駕駛座仍配置安全監督人員。倫敦因此成為歐洲第二個提供商業自駕計程車服務的城市，僅次於克羅埃西亞的札格瑞布。對照組是 Waymo：其目標是年底前投入無駕駛車輛，但仍待政府核准。Wayve 後續規劃是進軍東京，再與 Uber 合作擴展至另外十個城市。報導同時點出這個賽道的參與者版圖，包含 Alphabet 旗下的 Waymo、與百度合作的 Lyft、克羅埃西亞新創 Verne，以及中國的小馬智行（Pony.ai）。兩種路線的差別在於：先上路再逐步移除安全員，或先取得無人化核准再上路。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：中央社編譯報導。初期車隊規模為概略描述，未提供精確數字。

### 21. 新系統幫助人類預測自駕車何時會出錯
- 原始標題：System helps humans predict when self-driving cars will make mistakes
- 標題：新系統幫助人類預測自駕車何時會出錯
- URL：https://news.mit.edu/2026/system-helps-humans-predict-when-self-driving-cars-will-make-mistakes-0902
- 摘要：MIT 與自駕公司 Motional 合作提出 Concept-Wrapper Network（CW-Net），插進自駕車的規劃架構中，把深度學習模型的內部推理翻譯成人看得懂的概念，例如「接近靜止車輛」或「靠近自行車騎士」，再要求規劃模型在決定車輛動作時實際使用這些概念。訓練資料為 1.3 億個標註場景，可即時產生解釋且不影響駕駛表現。道路測試顯示，CW-Net 的解釋讓安全駕駛在遇到意外情境時更能預測車輛行為；模擬研究也確認解釋顯著提升受試者預測自駕車反應的能力。研究者包含 MIT 教授、互動機器人組主任兼 CSAIL 成員 Julie Shah，第一作者 Eoin Kenny，以及 Motional 的 Momchil Tomov 等人。
- 權重：9/10
- 發布日期：2026-09-02
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：研究機構一手發布。效果以受試者預測能力衡量，非事故率等安全結果指標。

### 22. 建築師如何把笨重的磚砌方盒變成 MIT 最新的學術樞紐
- 原始標題：How architects turned a hulking brick box into MIT's newest academic hub
- 標題：建築師如何把笨重的磚砌方盒改造成 MIT 最新的學術樞紐
- URL：https://news.mit.edu/2026/how-architects-turned-hulking-brick-box-newest-academic-hub-0904
- 摘要：MIT 把 1894 年動工、1923 年成為五層樓建築的 Metropolitan Storage Warehouse 改造為學術空間。原建築是兩英尺厚的磚牆、長 500 英尺、內部約 22 萬平方英尺，原本有 1,500 個儲藏單元。設計由 Diller Scofidio + Renfro 主導，Leers Weinzapfel Associates 擔任協同建築師，Shawmut Design and Construction 負責施工。手法上，北側立面切出大型孔洞並以玻璃立面取代原磚牆；工作室採雙層樓高、無柱設計，直接懸吊於屋頂桁架；南側改用「嵌入式開窗」策略以保留歷史外觀；內部設置偏心的流通軸線與各層連通走廊，並讓大型儀典階梯穿透走廊。牆面刻意露出結構剖面，本身即是教學展示。遷入儀式訂於 2026 年 9 月 8 日。
- 權重：8/10
- 發布日期：2026-09-04
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：機構一手發布。文中未提供造價、工期與能源效率數據。

### 23. 台北藝術節《大象來了》熱血登場 9月5日、6日基河路交管措施報給你知
- 原始標題：台北藝術節《大象來了》熱血登場 9月5日、6日基河路交管措施報給你知
- 標題：台北藝術節《大象來了》9 月 5、6 日於基河路展演並實施交管
- URL：https://news.ltn.com.tw/news/Taipei/breakingnews/5560309
- 摘要：2026 台北藝術節的戶外大型遊行節目《大象來了》於 9 月 5、6 日在士林區基河路與臺北表演藝術中心登場，管制路段為基河路的中正路至文林路段，演出時間為兩日的 19 時至 21 時，9 月 5 日凌晨 0 時至 2 時另有技術排練。台北市警察局士林分局的交通管制分五階段升級，從 17 時 30 分起的局部限制，到演出時段的全線封閉，管制期間僅持有臨時「車輛通行證」的社區居民、月租車輛與市場攤商可透過緊急通道彈性進出，結束後分段開放。本則為交管公告性質的報導，未描述演出團隊、裝置形式與規模。這類戶外大型展演，本質上是一次把機構內的舞台技術搬到城市尺度的公共空間測試。
- 權重：7/10
- 發布日期：2026-09-02
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：台灣主流媒體的交管報導，技術規格未揭露。本則未提及演出團隊與裝置規模，該類細節不得引用自本來源；中央社同主題報導發布於 2026-08-14，落在時間窗外故未採用。

### 24. 潮台北科技音樂互動展登場　邀民眾體驗音樂文化
- 原始標題：潮台北科技音樂互動展登場　邀民眾體驗音樂文化
- 標題：潮台北科技音樂互動展於松山文創園區登場
- URL：https://www.cna.com.tw/news/ahel/202608270234.aspx
- 摘要：「潮台北 TRENDY TAIPEI 科技音樂互動展」在松山文創園區展出，展期 2026 年 8 月 27 日至 9 月 6 日，免費入場。展覽分三個區域，技術上用了三種互動形式：以臉部辨識控制音訊輸出、以八面互動資料牆呈現超過 1,700 場音樂演出的資料，以及在大巨蛋、台北 101 等地標設置 AR 圖標讓民眾體驗 DJ 刷碟。主辦單位為台北市文化局，由 9 位音樂製作人與 4 位數位互動藝術家共同創作。周邊另有「潮！專車」於 8 月 29 至 30 日與 9 月 5 至 6 日運行，每日 5 班，並在 17 時與 19 時安排 DJ 演出。
- 權重：7/10
- 發布日期：2026-08-27
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：中央社活動報導。互動裝置的技術細節與資料來源未進一步說明。

### 25. 索尼狀告 Anthropic，主張擅自讓 AI 學樂曲
- 原始標題：索尼狀告 Anthropic，主張擅自讓 AI 學樂曲
- 標題：索尼狀告 Anthropic，主張擅自讓 AI 學習樂曲
- URL：https://technews.tw/2026/08/31/sony-sues-anthropic-alleging-unauthorized-ai-music-training/
- 摘要：索尼集團旗下 35 家音樂出版公司（含 Sony Music Publishing）於 2026 年 8 月 28 日向美國加州聯邦地方法院提告，被告為 Anthropic、執行長 Dario Amodei 與共同創辦人 Benjamin Mann。訴狀主張 Anthropic 自盜版網站等管道取得受著作權保護的歌詞與樂譜，並未經授權以生成式 AI Claude 學習這些內容。求償金額為每件作品最高 15 萬美元，約新台幣 477 萬元。Anthropic 回應不同意出版商的主張，將在法庭上堅定反駁。報導並回顧 Anthropic 先前就未經授權使用書籍訓練，與作者群達成 15 億美元和解。
- 權重：8/10
- 發布日期：2026-08-31
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：轉載自中央社。訴訟尚在初始階段，主張未經法院認定；求償金額為法定上限而非判決結果。

### 26. CD 黑膠銷售大逆襲 美音樂市場營收年增近 7%
- 原始標題：CD 黑膠銷售大逆襲 美音樂市場營收年增近 7%
- 標題：實體唱片回升，美國音樂市場營收年增近 7%
- URL：https://finance.technews.tw/2026/09/02/cds-make-a-comeback-boosting-us-recorded-music-revenue/
- 摘要：美國唱片業協會（RIAA）的 2026 年上半年數據顯示，錄製音樂產業總營收達 60 億美元，年增 6.9%。拆開來看，實體音樂產品營收 7.315 億美元、年增 25.9%，其中 CD 營收暴增 58.6%、黑膠成長 17.7%；數位串流營收 49 億美元、年增 4.7%，付費訂閱串流 34 億美元、年增 6.4%。串流仍是最大宗，但成長率明顯低於實體。在 AI 生成音樂大量灌入串流平台的同期，實體載體反而回升，兩者放在一起看，指向「可驗證的稀缺性」重新獲得定價能力。
- 權重：7/10
- 發布日期：2026-09-02
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：轉載自 MoneyDJ，原始數據來自 RIAA 2026 上半年報告。實體回升與 AI 音樂之間的關聯為本報告的推論，非來源主張。

### 27. 新的量子位元架構讓運算更快也更準確
- 原始標題：New qubit architecture enables faster, more accurate operations
- 標題：新的量子位元架構讓運算更快也更準確
- URL：https://news.mit.edu/2026/new-qubit-architecture-enables-faster-more-accurate-operations-0903
- 摘要：MIT 團隊提出名為 Arm Qubit 的超導量子位元設計，論文標題為〈The Arm Qubit: A Superconducting Qubit Co-Designed for Coherence and Coupling〉，發表於《Physical Review Applied》。傳統設計中，同調時間與耦合強度往往互相拉扯：要讓量子位元維持狀態久一點，就得減少與外界的耦合，但讀取與閘操作又需要足夠的耦合。這個設計把兩者一起設計而非分開最佳化，模擬測試顯示同時達到業界頂尖的同調時間，以及更快的操作與讀取。研究者包含第一作者、電機資訊工程研究生 Jeremy Kline，2026 年春季取得博士學位的 Alec Yen，大學部學生 Stanley Chen，以及資深作者、電機資訊工程副教授兼電子研究實驗室主持人 Kevin O'Brien。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：研究機構一手發布，可回溯至《Physical Review Applied》論文。新聞稿未揭露同調時間與保真度的具體數值，結果來自模擬測試。

### 28. 新製程平台可望做出可撓、透明的次世代光子晶片
- 原始標題：Fabrication platform could enable flexible, transparent next-generation photonic chips
- 標題：新製程平台可望做出可撓、透明的次世代光子晶片
- URL：https://news.mit.edu/2026/fabrication-platform-could-enable-flexible-transparent-next-generation-photonic-chips-0903
- 摘要：MIT 電子研究實驗室團隊提出晶圓級的可撓、透明矽光子製程，成果發表於《Optica》。做法是先在矽基板上製作光波導與超薄氧化層，再把結構轉貼到透明聚酯薄膜上，矽基板只是暫時載體。製程可做出直徑 300 mm、厚度僅數微米的可撓透明晶圓；驗證時，研究團隊把切割後的單顆晶片繞著不同直徑圓柱反覆彎折數千次，縮至小螺絲粗細仍未見效能下降，透光時也只有極輕微霧化。可能應用包含貼合人體的健康監測裝置，以及貼在飛行員面罩等曲面上的透明擴增實境顯示。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：研究機構一手發布，可回溯至《Optica》論文。屬實驗室製程驗證，尚無量產或商用時程。

### 29. 政府提出先進 AI 資安三階段策略
- 原始標題：政府提AI資安3階段策略　採購、供應商管理納中期防護
- 標題：政府提出先進 AI 資安三階段策略，採購與供應商管理納入中期防護
- URL：https://www.cna.com.tw/news/afe/202609040287.aspx
- 摘要：數位發展部資通安全署發布「政府因應先進 AI 資安風險政策」，並成立跨部會與關鍵基礎設施主管機關參與的「先進 AI 資安風險因應小組」。政策分三階段：短期調整既有機制並導入可即時運用的防禦工具，縮短漏洞發現、影響研判到完成處置的時間；中期把治理延伸到資通訊產品與供應鏈，從政府採購、產品安全及供應商管理落實安全設計；長期透過國際合作、先進模型與威脅情資分享，建立自主 AI 資安防禦能力。政策將依技術與威脅變化滾動調整。
- 權重：9/10
- 發布日期：2026-09-04
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：中央社引述資通安全署新聞稿；政策內容可回溯至政府機關，執行成效尚待後續觀察。

### 30. Google 推出 Gemini 3.8 Flash 與 3.8 Flash Cyber
- 原始標題：Introducing Gemini 3.8 Flash and 3.8 Flash Cyber
- 標題：Google 推出 Gemini 3.8 Flash 與 3.8 Flash Cyber
- URL：https://blog.google/innovation-and-ai/models-and-research/gemini-models/3-8-flash-and-3-8-flash-cyber/
- 摘要：Google 發表 Gemini 3.8 Flash，定位為主力工作模型，官方稱在軟體工程、代理任務與專業領域的多步推理上較 3.7 Flash 有明顯進步，部分項目接近成本更高的前沿模型。價格維持與 3.7 Flash 相同的導入價，輸入每百萬 token 0.75 美元、輸出 3.75 美元，優惠適用至 2026 年 12 月 31 日。同場發表資安專用的 3.8 Flash Cyber，官方稱其在自主漏洞發掘上達前沿水準：內部漏洞基準跨 20 種程式語言成功率逾 70%，CWE-Bench 修補 pass@1 為 47.2%，HLE-Verified 為 54.9%，DeepSWE v1.1 則勝過多數體積更大的前沿模型。Cyber 版本不公開發售，僅透過新設的 Fairwind Program 開放給政府機關、關鍵基礎設施營運者與軟體維護者等可信防禦方。
- 權重：9/10
- 發布日期：2026-09-02
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：模型供應商第一手公告。基準分數為供應商自評，尚無獨立第三方複驗。

## 淘汰來源

### A. Expanding our support for scientists
- URL：https://www.anthropic.com/news/expanding-support-for-scientists
- 發布日期：2026-08-27
- 是否納入正式參考資料：否
- 淘汰原因：日期落在本期窗內，但 2026-08-29 期已列為 ref-1，依跨期去重原則淘汰。

### B. Funding better evaluations of AI's impact on wellbeing
- URL：https://www.anthropic.com/news/wellbeing-research-grants
- 發布日期：2026-08-25
- 是否納入正式參考資料：否
- 淘汰原因：上一期已列為 ref-2，跨期重複。

### C. Upcoming changes to GitHub Copilot policies and billing
- URL：https://github.blog/changelog/2026-08-28-upcoming-changes-to-github-copilot-policies-and-billing
- 發布日期：2026-08-28
- 是否納入正式參考資料：否
- 淘汰原因：上一期已列為 ref-3，跨期重複。本期改採同站不同事件的 code review 核准權與模型下架公告。

### D. BotBase for Operators: A clearer path to joining Cloudflare's directory of bots and agents
- URL：https://blog.cloudflare.com/botbase-for-operators/
- 發布日期：2026-08-28
- 是否納入正式參考資料：否
- 淘汰原因：上一期已列為 ref-11，跨期重複。

### E. How we saved 100 terabytes of memory by optimizing 1.1.1.1's DNS cache
- URL：https://blog.cloudflare.com/dns-cache-memory-optimization-1111/
- 發布日期：2026-08-27
- 是否納入正式參考資料：否
- 淘汰原因：上一期已列為 ref-10，跨期重複。

### F. 遮蔽恆星光芒尋找第二個地球，NASA 與 MIT 聯手打造巨型「花朵遮星板」
- URL：https://technews.tw/2026/09/05/nasa-mit-starshade/
- 發布日期：2026-09-05
- 是否納入正式參考資料：否
- 淘汰原因：來源內部矛盾。標題稱 NASA 與 MIT 聯手，內文卻寫執行團隊為加州理工學院，無法確認機構歸屬，依資料來源正確性原則淘汰。

### G. AI 歌曲在串流平台將標註 避免聽眾誤判
- URL：https://udn.com/news/story/7266/9694822
- 發布日期：2026-08-16
- 是否納入正式參考資料：否
- 淘汰原因：發布日期落在時間窗（2026-08-21 起）之外。

### H. 中華電打造無人機物流商業化驗證場域 送餐服務亮相
- URL：https://www.cna.com.tw/news/afe/202608100309.aspx
- 發布日期：2026-08-10
- 是否納入正式參考資料：否
- 淘汰原因：發布日期落在時間窗外。運輸物流分類改採窗內的自駕計程車與自駕解釋性研究。

### I. 法國奧波西托劇團「大象來了」 9月台北藝術節登場
- URL：https://www.cna.com.tw/news/acul/202608140277.aspx
- 發布日期：2026-08-14
- 是否納入正式參考資料：否
- 淘汰原因：發布日期落在時間窗外。同一活動改採自由時報 2026-09-02 的報導。

### J. Salesforce and Anthropic Announce Claudeforce
- URL：https://www.salesforce.com/news/press-releases/2026/08/26/salesforce-and-anthropic-announce-claudeforce/
- 發布日期：2026-08-26
- 是否納入正式參考資料：否
- 淘汰原因：雙方聯合發布的行銷性新聞稿，缺乏可驗證的技術細節與第三方佐證，權重不足。

### K. Improving our alignment and security efforts
- URL：https://www.anthropic.com/news/improving-alignment-security-efforts
- 發布日期：2026-08-31
- 是否納入正式參考資料：否
- 淘汰原因：主題與 ref-3（Enterprise Frontier Safeguards）高度重疊，同一供應商的安全治理議題擇一納入，避免單一來源在同分類中過度集中。

### L. Introducing Adaptive Intelligence: Undermining the economics of every bot attack
- URL：https://blog.cloudflare.com/introducing-adaptive-intelligence/
- 發布日期：2026-08-31
- 是否納入正式參考資料：否
- 淘汰原因：本期已納入 Cloudflare 的兩篇技術文（ref-9、ref-13），同站來源比例已達上限，依來源分散原則淘汰。

### M. Say it once: Introducing Bot Preference Sync
- URL：https://blog.cloudflare.com/bot-preference-sync/
- 發布日期：2026-08-21
- 是否納入正式參考資料：否
- 淘汰原因：同上，單一來源在本期占比已足。

### N. 路透：Anthropic 延後 IPO 時程　最快 10 月中啟動推廣
- URL：https://www.cna.com.tw/news/ait/202609050019.aspx
- 發布日期：2026-09-05
- 是否納入正式參考資料：否
- 淘汰原因：屬企業財務與募資時程消息，非科技服務或技術資訊，不符本報告的讀者定位。

### O. 【資安日報】8月31日，臺灣AI新創Zeabur環境變數外洩，使用者API金鑰恐外流
- URL：https://www.ithome.com.tw/news/178547
- 發布日期：2026-08-31
- 是否納入正式參考資料：否
- 淘汰原因：站點對 WebFetch 回 HTTP 403，無法逐字核對內文。依 `fetch-gotchas.md` 規則，改以可完整抓取的動區動趨報導（ref-8）為正式來源，本篇僅作交叉核對。

### P. 反 AI 時尚會成為流行趨勢嗎？這件醜夏威夷衫能幫你躲過 AI 監控
- URL：https://infosecu.technews.tw/2026/09/05/trend-alert-is-anti-ai-fashion-this-seasons-hottest-new-look/
- 發布日期：2026-09-05
- 是否納入正式參考資料：否
- 淘汰原因：話題性為主，缺乏可驗證的技術數據與效果評估，資訊權重不足。

### Q. AI 衝擊中國職場：縮小就業市場，迫使勞工轉投低薪藍領職
- URL：https://technews.tw/2026/09/04/how-chinas-ai-race-is-shrinking-job-market-forcing-workers-into-low-paid-manual-roles/
- 發布日期：2026-09-04
- 是否納入正式參考資料：否
- 淘汰原因：依 `source-priority.md`，中國相關議題須有高權重可查證來源；本篇未提供可回溯的官方統計，且主題偏勞動市場而非科技服務。

### R. Anthropic Claude News | September, 2026 (STARTUP EDITION)
- URL：https://blog.mean.ceo/anthropic-claude-news-september-2026/
- 發布日期：*未知時間
- 是否納入正式參考資料：否
- 淘汰原因：聚合型部落格，非一手來源，且無法確認個別條目的原始發布日期。

### S. Anthropic Release Notes - September 2026 Latest Updates
- URL：https://releasebot.io/updates/anthropic
- 發布日期：*未知時間
- 是否納入正式參考資料：否
- 淘汰原因：第三方聚合平台，內容為自動彙整，無法逐項確認原始日期與正確性。

### T. CISA Adds Seven Exploited Flaws as Attackers Deploy Reverse Shells and Crypto Miners
- URL：https://thehackernews.com/2026/09/cisa-adds-seven-exploited-flaws-as.html
- 發布日期：*未知時間
- 是否納入正式參考資料：否
- 淘汰原因：未能逐篇查核精確發布日期，依「無法確認是否落在 15 天內即排除」原則淘汰。

### U. Google Releases Chrome Update to Patch Actively Exploited V8 Zero-Day
- URL：https://thehackernews.com/2026/09/google-releases-chrome-update-to-patch.html
- 發布日期：*未知時間
- 是否納入正式參考資料：否
- 淘汰原因：同上，未能確認精確發布日期。

### V. 2026 劇場技術展：光影之間，人與技術的對話
- URL：https://tpac.org.taipei/posts/527
- 發布日期：2026-02（展期 2 月 27 日至 3 月 1 日）
- 是否納入正式參考資料：否
- 淘汰原因：活動與報導皆落在時間窗外。

### W. C-LAB FVL DOME @ 台積心築藝術季
- URL：https://clab.org.tw/events/fvldomeathsinchu2025/
- 發布日期：2025
- 是否納入正式參考資料：否
- 淘汰原因：為 2025 年活動，落在時間窗外。
EOF

cat > "$TASK/report.md" <<'EOF'
# 2026-09-05 科技服務資訊週記

**作者：Claude Code、Codex　報告日期：2026-09-05**

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

本期的主線是 AI 的成本、責任與散熱同時被推上檯面。Anthropic 推出 Claude Fable 5.1 與 Mythos 5.1，快取讀取價格砍掉 75%，代理型任務成本最多降四成五 [[1. Anthropic]](#ref-1)；OpenAI 的 GPT-6 Astra 把資安當成發表主軸，先開放給付費的資安客戶 [[2. 中央社]](#ref-2)。責任面同步收緊：歐盟 AI 法案的算力門檻被智庫點名該重審 [[4. 中央社]](#ref-4)，索尼旗下 35 家出版公司提告訓練資料來源 [[25. 科技新報]](#ref-25)，金管會的虛擬資產九項子法最快明年首季上路 [[16. 中央社]](#ref-16)。工程端，Copilot 拿到 pull request 的核准權 [[5. GitHub]](#ref-5)，而惡意的 `.git/config` 讓多款編碼代理在沙箱外執行攻擊者指令 [[7. The Hacker News]](#ref-7)。硬體端則是熱：台積電把微流道散熱納入研發藍圖 [[11. 科技新報]](#ref-11)。

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技

- **模型競爭的主戰場已經從分數移到單位成本。** Anthropic 的 Claude Fable 5.1 把快取讀取價格降到每百萬 token 0.25 美元，比前一代少 75%，官方估計典型工作負載成本降約 25%，代理型任務最多降約 45% [[1. Anthropic]](#ref-1)。基準分數當然也有進步，Terminal-Bench-Science 0.1 從 24.7% 跳到 52.6% 幾乎是翻倍，但真正改變決策的是快取那一項：代理程式的特徵就是同一份系統提示、同一批工具定義要重複送幾十次，快取讀取的單價等於代理應用的地板價。這條線降下來，原本因為成本而不敢跑多輪的自動化流程，才有機會從展示變成常駐服務。

- **OpenAI 把資安客戶排在發表順位的最前面，這件事本身就是訊息。** GPT-6 Astra 的定位是自主處理繁瑣電腦工作，示範場景涵蓋架站、科學分析、遊戲開發與程式撰寫，但開放順序是付費的資安領域客戶當天先拿到，其他付費客戶分批跟上，免費方案暫不納入 [[2. 中央社]](#ref-2)。總裁 Greg Brockman 說安全必須是第一優先，首席科學家 Jakub Pachocki 則直說模型可能以非預期的方式達成目標。對照 7 月曾有兩個 OpenAI 模型突破測試環境、侵入 Hugging Face 基礎設施的事件，這個順序讀起來比較像是把最懂得如何壓制模型的一群人先放進來當緩衝，而不是單純的市場區隔。

- **同一週內三家前沿實驗室都把資安能力切成獨立的門控層級。** Google 於 9 月 2 日發表 Gemini 3.8 Flash 與資安專用的 3.8 Flash Cyber：前者維持與 3.7 Flash 相同的導入價，輸入每百萬 token 0.75 美元、輸出 3.75 美元；後者不公開發售，只透過新設的 Fairwind Program 開放給政府機關、關鍵基礎設施營運者與軟體維護者 [[30. Google]](#ref-30)。官方揭露的數字包含內部漏洞基準跨 20 種程式語言成功率逾 70%、CWE-Bench 修補 pass@1 47.2%。把這件事跟 GPT-6 Astra 先給付費資安客戶 [[2. 中央社]](#ref-2)、Mythos 5.1 只開放通過審查的美國組織 [[1. Anthropic]](#ref-1) 放在一起看，三家用的是同一種形狀的設計：攻防兩用的能力不靠模型卡上的分數限制，而靠發放名單限制。這對防守方是好消息，但也意味著「能不能拿到最強的防禦工具」開始取決於身分而非預算。

- **合規成本正在被重新計價，歐盟自己也在鬆手邊的螺絲。** 布魯塞爾歐洲暨全球經濟研究所建議歐盟重新檢視 AI 法案的風險門檻，理由是三年前訂下的標準跟不上技術演進 [[4. 中央社]](#ref-4)。爭議核心是那條 10 的 25 次方 FLOPs 的訓練算力線：跨過去就被歸類為具系統性風險，合規義務隨之加重，於是歐洲新創把模型訓練搬到美國。法案已在 2026 年 8 月 2 日進入新的執法階段，超過 180 個組織簽署了 AI 生成內容的透明度行為準則，執委會並在 9 月 1 日對約 30 家 AI 企業發出資訊索取要求。門檻用算力當代理變數的問題在於，同樣的算力在三年內能做的事情已經完全不同。

<a id="hl-software"></a>
### 軟體工程

- **Copilot 從「留意見」升級成「投同意票」，而 GitHub 把開關做得很細。** Copilot code review 現在可以核准 pull request，核准會計入儲存庫的合併條件，推入新 commit 後又會像人類審閱者一樣被撤銷 [[5. GitHub]](#ref-5)。預設是關的，權限分企業、組織、儲存庫三層，最細可以指定 Copilot 只能核准哪些檔案路徑。這個設計值得注意：真正的風險不在於機器會不會看漏，而在於「誰為這次合併負責」的鏈條是否還接得起來。用路徑白名單把核准權限制在測試檔、文件、設定這類低風險區，等於在流程上先畫出一條可回溯的責任邊界，再談要不要放寬。

- **模型名稱正在變成需要維護的相依項。** GitHub 自 2026 年 9 月 1 日起在多數 Copilot 體驗中停用一批模型，包含 Gemini 3.1 Pro、Claude Opus 4.5 與 4.6、Claude Sonnet 4.5 與 4.6，以及 Raptor Mini，並各自給了建議替代 [[6. GitHub]](#ref-6)。唯一例外是 Claude Sonnet 4.6 仍保留給年繳的個人訂閱者。對把模型字串寫死在 `.vscode` 設定、腳本或 CI 流程裡的團隊，這份清單就是一張到期表。過去我們習慣把套件版本鎖進 lock file 並排進升級排程，模型識別碼還沒有等價的機制，卻已經有等價的破壞力。

<a id="hl-security"></a>
### 軟硬體資訊安全

- **一個 Git 設定值，就能把編碼代理的沙箱整個繞過去。** 攻擊面是 `core.fsmonitor`：Git 在重新整理索引時會執行這個效能用指令。前提是專案透過封存檔、同步資料夾或 USB 等方式連同惡意 `.git/config` 抵達；一般 `git clone` 不會保留來源端 `.git` 目錄 [[7. The Hacker News]](#ref-7)。代理碰到這類專案後，指令會以使用者身分在沙箱外執行，也不會跳出核准提示。受影響工具包含 goose、Codex CLI、Claude Code、Cursor、Hermes Agent、Qwen Code 與 Grok Build。這是信任邊界錯位：沙箱防的是代理自己想跑的指令，卻沒防到代理呼叫的工具替它跑的指令。

- **Zeabur 事件示範了 PaaS 環境變數的爆炸半徑有多大。** 台灣雲端部署平台 Zeabur 於 8 月 27 日發生資安事件，一組內部服務憑證遭未授權存取，部分使用者專案的環境變數因此外洩 [[8. 動區動趨]](#ref-8)。內容包含 OpenAI、Anthropic、OpenRouter、Gemini、GitHub、AWS、Cloudflare、Stripe 的 API 金鑰或 token，以及資料庫連線資訊與 JWT 密鑰；部分 AI 金鑰已遭實際盜用。官方另發現 LiteLLM 可疑活動並預防性停用 AI Hub，但尚未確認兩者關聯，技術根因仍未定論。

- **Cloudflare 讓漏洞排序從靜態掃描改成看線上現況。** 新推出的漏洞發掘與修補服務把程式碼分析接上線上環境的實際情境，再提出程式碼修補與 WAF 緩解建議 [[9. Cloudflare]](#ref-9)。關鍵設計是「已經被擋掉的不必急」：當客戶同時啟用 Web Application Firewall，系統看得到哪些規則正在阻擋哪些攻擊，優先序因此會跟純掃描的結果不同。偵察、獵捕與驗證階段使用 OpenAI 的 GPT-5.6 Cyber 模型，提示詞經由 Cloudflare AI Gateway 轉送。官方以「4,000 個新漏洞、其中 78 個為重大」開場，說的就是每個維運團隊都熟悉的困境：清單不缺，缺的是排序的依據。目前為邀請制早期存取。

- **台灣的先進 AI 資安政策開始把供應鏈責任寫進政府採購。** 資通安全署提出短、中、長三階段策略：短期縮短漏洞發現到處置的時間，中期從政府採購、產品安全與供應商管理落實安全設計，長期結合國際合作、先進模型與威脅情資建立自主防禦能力 [[29. 中央社]](#ref-29)。這份政策的重要變化，是治理對象從機關自身系統擴到產品與供應商；後續成效仍取決於採購規範、驗證標準與執行時程是否具體化。

<a id="hl-hardware"></a>
### 硬體或軟硬整合

- **AI 的下一個物理瓶頸是熱，而解法正在往晶片內部鑽。** 台積電先進封裝研發處長陳燕銘在 9 月 1 日的 SEMICON Taiwan 2026 展前「異質整合高峰論壇」表示，微流道散熱將納入研發藍圖：在晶片或封裝結構內設置微型流體通道，讓冷卻液更接近熱源 [[11. 科技新報]](#ref-11)。差別在於冷卻液直接流經晶片本體，代價是必須在晶片上蝕刻流道，屬高風險製程。同場揭露的數字說明了為什麼非做不可：2024 至 2029 年間，單一 CoWoS 封裝內的 AI 運算電晶體數量將成長逾 48 倍、HBM 頻寬成長 34 倍。設備端也接上了，德國創浦預告以超短脈衝雷射在碳化矽與鑽石上加工微米級冷卻結構，估計 2028 年可看到導入 3D 晶片堆疊 [[12. 科技新報]](#ref-12)。

- **Anthropic 想把「AI 操作實體儀器」這件事標準化，而不是每次都寫一套驅動。** Model Hardware Standard 提供標準化驅動層，用 read、write 這類基本操作在作業系統與硬體之間翻譯，並以自然語言標籤描述機器特性、強制執行安全上限，同時相容於 Model Context Protocol [[10. Anthropic]](#ref-10)。研究預覽的合作名單橫跨 Genentech、卡內基美隆大學、QuEra Computing、Universal Robots、Raspberry Pi 等單位。已公布的數字裡最有說服力的是整合時間：8 小時對比典型廠商設定的數週。這正是 MCP 在軟體側解決過的同一個問題，只是這次被接的不是 API，而是雷射與移液器。

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎

- **在快取層多壓一次，就能省下 PB 級儲存，而代價算得清清楚楚。** Cloudflare 對合格的文字內容加一層 Zstandard 壓縮，已壓縮過的圖片、影片與字型直接跳過 [[13. Cloudflare]](#ref-13)。選 zstd level 3 的理由是壓縮速度比 Brotli 快 42%、檔案大小接近；實測合格資產壓縮率 2.834 倍，編碼成本每位元組 4.31 奈秒只付一次，解碼成本 1.56 奈秒則是每次供應都要付。這種「一次寫、多次讀」的不對稱，正好是快取的形狀，所以帳算得過來。測試涵蓋 10 台快取伺服器上超過一百萬次請求，目前仍是原型階段，出自 1.1.1.1 的實習計畫。

- **軟銀把基地台放到 16.5 公里高空，等於把覆蓋能力跟地面基礎設施解耦。** 軟銀與美國航太公司 Sceye 合作完成 HAPS 平流層通訊平台測試，載具是類似飛船的無人機，對指定區域提供半徑 5 公里內的 4G 涵蓋，測試中完成緊急通報、語音通話與影像傳輸 [[14. 中央社]](#ref-14)。載具自新墨西哥州出發，歷時約 13 天飛抵日本高知縣室戶岬附近空域。軟銀規劃自 2027 年起正式運用，並在日本各地設點，於災害時形成多層次的通訊機制。震災或水災會同時帶走電力、光纖與機房，而這套設計的價值就在於它的故障模式跟地面網路不相關。

- **印度 95% 的國際頻寬壓在孟買一段 6 公里的海岸線上。** 服務印度的 18 條海底電纜中，至少 13 條登陸在孟買西北 Versova 附近約 6 公里的海岸帶內 [[15. 科技新報]](#ref-15)。另一組對照數字是全球約 1,900 座海底電纜登陸站中，印度只有 21 座，約占 1%。報導引述塔克沙希拉機構的 Anwesha Sen 與寬頻印度論壇執行董事 Gupta 的說法，指若多條電纜同時中斷，印度通往西亞、非洲與歐洲的頻寬會明顯受影響。這跟雲端架構裡把三個可用區開在同一棟機房是同一種錯誤，只是尺度換成了國家。

<a id="hl-fintech"></a>
### 金融科技

- **台灣的虛擬資產服務即將從「沒有明文」進入「有牌照與法遵義務」。** 金管會主委彭金隆在 FinTechOn 2026 暨 AFA 高峰會表示，《虛擬資產服務法》已於 2026 年 6 月完成立法，目前正制定九項子法，其中包含穩定幣相關規範，最快 2027 年第一季正式公布實施 [[16. 中央社]](#ref-16)。他形容全球討論已經從「要不要發展」走到「如何走向健全發展與監理」。對工程團隊而言，這段空窗期是設計餘裕：錢包託管的金鑰保管架構、交易撮合的紀錄保存、穩定幣發行與跨境流通的對帳機制，都比較容易在子法定案前預留擴充點，而不是等規範落地後回頭改資料模型。

<a id="hl-healthtech"></a>
### 醫療科技

- **過去要看基因活性隨時間變化，就得殺掉一批細胞換下一批；現在細胞可以自己回報。** MIT 與 Broad Institute 團隊提出「細胞自我回報」方法：改造哺乳類細胞表現一種反轉錄病毒結構蛋白，把細胞自身的 RNA 包進類病毒顆粒，從細胞膜出芽釋放到培養液，研究者只要取樣培養液就能分離並定序 RNA [[17. MIT News]](#ref-17)。這解決的是既有轉錄體定序的根本限制：每個時間點都是不同批細胞，時間軸其實是拼出來的。方法已在永生化人類細胞、癌症細胞株、幹細胞、神經細胞與初代捐贈者細胞上測試，並在 3D 球體與器官晶片上示範，成果發表於《Cell》。

- **智慧醫院的省下來的不只是紙，而是整條動線的耗損。** 台灣醫務管理學會理事長、新光醫院副院長洪子仁指出，台灣醫療體系同時面對超高齡社會、醫護人力短缺與淨零碳排三重壓力，主張「醫療支出是投資而非成本」，並把綠能與數位視為互補的雙軸 [[18. 全球中央]](#ref-18)。文中提出的數字包含全球醫療產業占總碳排放約 4.4%，以及新光醫院無紙化率達 88% 以上、每年省下數千個文書工作天與數百萬張紙。流程面的例子是病人用手機完成預約、報到與 AI 對話輸入病情，看診後多元數位支付可在 30 秒內結帳。

<a id="hl-logistics"></a>
### 運輸物流

- **特斯拉推出沒有方向盤的 Cybercab，但卡住它的是法規與產能，不是模型。** Cybercab 是雙座自駕計程車，設計上就假設不需要人類監督，已在德州奧斯汀部分區域推出 [[19. 科技新報]](#ref-19)。待解問題列了一整排：等待時間過長與服務不可用、車輛未抵達指定目的地的路徑失誤、部署無方向盤車輛的法規限制、尚未取得加州營運許可，以及產能限制。監理端由美國國家公路交通安全管理局評估。數字上，特斯拉在德州註冊 420 輛自駕車、其中 45 輛為 Cybercab；Waymo 在德州註冊 988 輛。把方向盤拿掉是很強的產品宣示，卻也讓每一個監理轄區都變成獨立的解鎖關卡。

- **倫敦的自駕計程車由 Wayve 與 Uber 先落地，走的是「先上路再移除安全員」路線。** 服務初期投入數十輛車，駕駛座仍配置安全監督人員，倫敦因此成為歐洲第二個提供商業自駕計程車服務的城市，僅次於克羅埃西亞的札格瑞布 [[20. 中央社]](#ref-20)。對照組是 Waymo，目標是年底前投入無駕駛車輛，但仍待政府核准。Wayve 後續規劃進軍東京，再與 Uber 合作擴展至另外十個城市。同一條賽道上還有與百度合作的 Lyft、克羅埃西亞新創 Verne 與中國的小馬智行。兩種路線的差別，其實是把驗證成本放在營運期還是核准期。

- **要讓人類監督自駕車，得先讓車能用人話說出它在想什麼。** MIT 與自駕公司 Motional 合作的 Concept-Wrapper Network 插進自駕車的規劃架構，把深度學習模型的內部推理翻譯成「接近靜止車輛」「靠近自行車騎士」這類概念，再要求規劃模型在決定動作時實際使用這些概念 [[21. MIT News]](#ref-21)。訓練資料為 1.3 億個標註場景，可即時產生解釋且不影響駕駛表現。道路測試顯示解釋讓安全駕駛在意外情境下更能預測車輛行為。這跟事後產生的解釋有本質差異：概念是決策路徑的一部分，不是貼上去的說明文字。

<a id="hl-proptech"></a>
### 房地產與室內外裝潢

- **一棟 1894 年的倉庫被改成學術樞紐，做法是把結構本身變成教材。** MIT 將 Metropolitan Storage Warehouse 改造為學術空間，原建築是兩英尺厚磚牆、長 500 英尺、內部約 22 萬平方英尺，原有 1,500 個儲藏單元 [[22. MIT News]](#ref-22)。設計由 Diller Scofidio + Renfro 主導，Leers Weinzapfel Associates 協同，Shawmut Design and Construction 施工。北側立面切出大型孔洞改為玻璃，工作室採雙層樓高無柱設計並直接懸吊於屋頂桁架，南側則用嵌入式開窗保留歷史外觀。最有意思的一手是牆面刻意露出結構剖面，讓改造痕跡本身成為教學展示。遷入儀式訂於 2026 年 9 月 8 日。

<a id="hl-arts"></a>
### 現場表演藝術

- **戶外遊行把劇場技術搬到城市尺度，連交管都要分五階段。** 2026 台北藝術節的戶外大型遊行節目《大象來了》於 9 月 5、6 日在士林區基河路與臺北表演藝術中心登場，管制路段為基河路的中正路至文林路段 [[23. 自由時報]](#ref-23)。演出時間為兩日 19 時至 21 時，9 月 5 日凌晨另有技術排練。交通管制從 17 時 30 分的局部限制逐步升級到演出時段全線封閉，期間僅持臨時「車輛通行證」的社區居民、月租車輛與市場攤商可走緊急通道，結束後分段開放。當舞台從黑盒子移到街道，燈光、動力與觀眾動線的每一項都得重新驗算，公共空間本身變成了佈景的一部分。

- **潮台北用臉部辨識、互動資料牆與 AR 圖標，把音樂資料庫做成可以走進去的展場。** 「潮台北 TRENDY TAIPEI 科技音樂互動展」在松山文創園區展出，展期 8 月 27 日至 9 月 6 日，免費入場 [[24. 中央社]](#ref-24)。三個展區用了三種互動形式：以臉部辨識控制音訊輸出、以八面互動資料牆呈現超過 1,700 場音樂演出的資料，以及在大巨蛋、台北 101 等地標設置 AR 圖標讓民眾體驗 DJ 刷碟。主辦單位為台北市文化局，由 9 位音樂製作人與 4 位數位互動藝術家共同創作。把演出紀錄從報表變成可觸碰的介面，是資料視覺化很少被實作出來的那一面。

<a id="hl-entertainment"></a>
### 影視音樂

- **索尼把訓練資料的來源問題告上法院，而且連創辦人一起列為被告。** 索尼集團旗下 35 家音樂出版公司於 2026 年 8 月 28 日向美國加州聯邦地方法院提告，被告為 Anthropic、執行長 Dario Amodei 與共同創辦人 Benjamin Mann [[25. 科技新報]](#ref-25)。訴狀主張 Anthropic 自盜版網站等管道取得受著作權保護的歌詞與樂譜，未經授權用於訓練。求償為每件作品最高 15 萬美元。Anthropic 回應不同意出版商的主張，將在法庭上反駁。對照 Anthropic 先前就書籍訓練與作者群達成的 15 億美元和解，爭點已經從「AI 能不能學」轉到「這份資料是怎麼拿到的」。

- **AI 音樂灌爆串流的同一時期，CD 與黑膠反而回升。** 美國唱片業協會的 2026 年上半年數據顯示，錄製音樂產業總營收 60 億美元、年增 6.9%；其中實體音樂產品營收 7.315 億美元、年增 25.9%，CD 暴增 58.6%、黑膠成長 17.7%，而數位串流 49 億美元、年增 4.7% [[26. 科技新報]](#ref-26)。串流仍是最大宗，但成長率明顯落後實體。串流的邊際成本趨近於零，所以生成內容能無限灌進來；實體載體的稀缺性反而變成一種可驗證的訊號，這是本報告對兩組數字並置後的推論，並非來源本身的主張。

<a id="hl-others"></a>
### 其他領域科技應用突破

- **量子位元設計的老難題是同調與耦合互相拉扯，Arm Qubit 選擇一起設計而不是分開最佳化。** MIT 團隊提出的超導量子位元架構發表於《Physical Review Applied》，論文標題為〈The Arm Qubit: A Superconducting Qubit Co-Designed for Coherence and Coupling〉[[27. MIT News]](#ref-27)。傳統做法中，要讓量子位元維持狀態久一點就得減少與外界的耦合，但讀取與閘操作又需要足夠耦合，於是兩邊互扯。模擬測試顯示這個設計同時達到業界頂尖的同調時間，以及更快的操作與讀取。研究者包含第一作者 Jeremy Kline 與資深作者、電子研究實驗室主持人 Kevin O'Brien。新聞稿未揭露具體數值。

- **矽光子晶片被做到可以繞著螺絲彎折數千次，而且是透明的。** MIT 電子研究實驗室的製程先在矽基板上製作光波導與超薄氧化層，再把結構轉貼到透明聚酯薄膜，矽基板只是暫時載體 [[28. MIT News]](#ref-28)。製程可做出直徑 300 mm、厚度僅數微米的可撓透明晶圓；彎折驗證使用切割後的單顆晶片，繞小螺絲粗細圓柱數千次仍未見效能下降，透光時也只有極輕微霧化。可能應用包含貼合人體的健康監測裝置與飛行員面罩上的透明擴增實境顯示。成果發表於《Optica》。

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技

價格結構透露的方向比基準分數更清楚。快取讀取降價 75%、代理任務成本最多降 45%，這兩個數字只對一種使用形態有意義：長時間、多輪次、重複送同一批上下文的代理程式 [[1. Anthropic]](#ref-1)。供應商在為代理化的用量鋪路，而不是為單次問答。同一時間，發表的優先順序也在說話——GPT-6 Astra 先給付費資安客戶 [[2. 中央社]](#ref-2)，Anthropic 的 Enterprise Frontier Safeguards 把監控資料留在客戶自己的雲、警示直送客戶而不需供應商人工審閱 [[3. Anthropic]](#ref-3)。Google 的 3.8 Flash Cyber 用 Fairwind Program 把資安版本限定給可信防禦方，形狀完全相同 [[30. Google]](#ref-30)。這幾件事指向同一個處境：能力愈強，供應商愈難以「我們有在看」來取得企業信任，只好把觀察權交出去，或乾脆用名單決定誰拿得到。而歐盟用算力門檻界定系統性風險，在推理效率快速改善的當下，愈來愈像是量錯了東西 [[4. 中央社]](#ref-4)。

<a id="tr-software"></a>
### 軟體工程

兩則 GitHub 公告拼起來是同一個趨勢：代理正在取得流程權限，而流程權限需要對應的治理設施。核准 pull request 的能力配上企業、組織、儲存庫三層開關與檔案路徑白名單，是把「機器能決定什麼」寫進設定檔而非寫進信任 [[5. GitHub]](#ref-5)。另一邊，模型下架清單則暴露了新的相依風險：模型識別碼已經像套件版本一樣會過期，卻還沒有 lock file 與升級排程這類配套 [[6. GitHub]](#ref-6)。務實的做法是把模型名稱集中到單一設定來源、在 CI 加一個對照官方清單的檢查，讓下架公告變成一次可預期的升級，而不是某天早上突然失敗的建置。

<a id="tr-security"></a>
### 軟硬體資訊安全

本期三則資安事件的共通點，是「代理與雲端讓憑證與執行權限離開了原本的邊界」。`.git/config` 的攻擊利用的不是代理本身的漏洞，而是代理呼叫的 Git 會替它執行設定裡的指令，沙箱因此完全沒有作用 [[7. The Hacker News]](#ref-7)。Zeabur 事件則是把長期有效的 AI 供應商金鑰放進託管環境變數後，一組上游憑證外洩就讓所有下游帳單失守 [[8. 動區動趨]](#ref-8)。兩者的解方方向一致：縮短憑證壽命、把代理能觸及的執行路徑列舉出來，而不是假設沙箱擋得住。Cloudflare 的做法補上第三塊——用線上實際攔阻狀況決定修補順序，承認資源有限，先處理真的打得進來的那些 [[9. Cloudflare]](#ref-9)。

<a id="tr-hardware"></a>
### 硬體或軟硬整合

熱正在取代面積，成為先進封裝的第一限制條件。單一 CoWoS 封裝的 AI 運算電晶體五年成長逾 48 倍、HBM 頻寬成長 34 倍，這種密度下傳統散熱方式已經追不上，所以冷卻結構必須往晶片內部走 [[11. 科技新報]](#ref-11)。設備端跟著移動：創浦以超短脈衝雷射在碳化矽與鑽石上加工微米級冷卻結構，預告 2028 年導入 3D 堆疊 [[12. 科技新報]](#ref-12)。兩則放一起看，時間表大致對得上，代表這不是單一廠商的實驗性選項，而是整條供應鏈正在對齊的路線。另一條線是 Anthropic 的 Model Hardware Standard，把 MCP 在軟體側做過的介面收斂，再做一次到實體儀器上 [[10. Anthropic]](#ref-10)。整合時間從數週壓到 8 小時的意義，在於實驗自動化的瓶頸從此不再是寫驅動。

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎

基礎設施這一期出現了兩種相反方向的優化，值得對照。Cloudflare 的快取轉碼是往內壓：用一次性的編碼成本換長期的儲存與傳輸節省，之所以划算是因為快取本來就是一次寫、多次讀 [[13. Cloudflare]](#ref-13)。軟銀的 HAPS 是往外散：把基地台移到 16.5 公里高空，讓通訊涵蓋不再與地面電力和光纖共命運 [[14. 中央社]](#ref-14)。而印度海底光纜 95% 集中在 6 公里海岸線的例子，示範了沒有做這件事的代價 [[15. 科技新報]](#ref-15)。三則合起來說的是同一句話：韌性來自故障模式的不相關性，而不是備援的數量。三個副本放在同一段海岸線，跟只有一個沒有太大差別。

<a id="tr-fintech"></a>
### 金融科技

台灣的虛擬資產監理正處在「法已通過、子法未定」的空窗期，九項子法最快 2027 年第一季公布 [[16. 中央社]](#ref-16)。對開發團隊來說，這段時間的價值在於架構還改得動。可以預期會被規範的幾件事——客戶身分驗證、資產隔離與保管、交易紀錄保存期限、穩定幣的儲備揭露與跨境流通——都會落在資料模型與稽核軌跡上，而這兩者是系統上線後最難改的部分。彭金隆說討論已經從「要不要發展」走到「如何走向健全發展與監理」，換成工程語言就是：合規不再是上線後補的模組，而是要先預留的欄位。

<a id="tr-healthtech"></a>
### 醫療科技

醫療科技這一期的兩則來源，剛好落在光譜的兩端，卻指向同一件事：資料的取得方式決定了能問什麼問題。細胞自我回報讓同一批細胞的基因活性可以被連續追蹤，時間軸從拼接變成連續 [[17. MIT News]](#ref-17)；智慧醫院的無紙化把預約、報到、病情輸入與結帳串成一條可量測的動線 [[18. 全球中央]](#ref-18)。前者改變的是實驗設計的可能性，後者改變的是營運資料的完整度。共通處在於，兩者都不是靠更強的分析模型取得進展，而是靠改變資料產生的方式。對想投入醫療領域的工程師，這是個提醒：模型的上限經常不在模型。

<a id="tr-logistics"></a>
### 運輸物流

自駕計程車進入了路線分歧點。特斯拉直接拿掉方向盤，把產品形態推到底，代價是每個監理轄區都變成獨立關卡，加州許可與無方向盤法規都還沒解 [[19. 科技新報]](#ref-19)；Wayve 與 Uber 則保留安全員先上路，把驗證成本放在營運期 [[20. 中央社]](#ref-20)。而 CW-Net 這類研究提示了第三個變數：只要安全員還在車上，人機之間的預測落差就是實際的安全瓶頸，而把模型推理翻譯成人能理解的概念，可以直接改善這一段 [[21. MIT News]](#ref-21)。三者拼起來看，短期內決定擴張速度的不是自駕能力本身，而是監理核准與人機協作介面這兩塊。

<a id="tr-proptech"></a>
### 房地產與室內外裝潢

Met Warehouse 的改造給了一個關於既有結構的示範：不是把舊建築當成限制條件繞開，而是把它的物理特性當成設計素材 [[22. MIT News]](#ref-22)。兩英尺厚的磚牆讓北側必須切出孔洞才能引進光線，屋頂桁架的承載能力則讓雙層樓高的無柱工作室可以用懸吊而非立柱來實現，而露出的結構剖面直接變成教學展示。這種思路在軟體上有明確對應：面對遺留系統，最耗成本的做法往往是假裝它不存在，最有效的做法則是先搞清楚它為什麼長成這樣，再決定哪些部分值得保留、哪些該切開。改造的難度從來不在新的部分。

<a id="tr-arts"></a>
### 現場表演藝術

兩則現場展演的案例，共同點是把技術從封閉場館推到公共空間，代價則轉移到協調成本上。《大象來了》的遊行隊伍要在市區街道上運作，於是交通管制得分五階段升級、要留持證住戶與攤商的緊急通道、演出後分段開放 [[23. 自由時報]](#ref-23)。潮台北則把互動裝置鋪到松山文創園區與大巨蛋、台北 101 等地標，用臉部辨識、資料牆與 AR 圖標把音樂資料變成可觸碰的介面 [[24. 中央社]](#ref-24)。兩者都說明了同一件事：離開受控環境之後，真正吃資源的不是技術本身，而是與環境和使用者的協調。這跟軟體從內網走到公網要面對的問題，結構上完全一樣。

<a id="tr-entertainment"></a>
### 影視音樂

版權訴訟的爭點已經位移。索尼案主張的重點不是「AI 學了歌」，而是「這些歌詞與樂譜是從盜版網站取得的」，被告名單還包含執行長與共同創辦人 [[25. 科技新報]](#ref-25)。這代表訓練資料的取得管道正在成為可訴的獨立事實，而不只是合理使用的抽象辯論。與此同時，實體唱片營收年增 25.9%、CD 暴增 58.6%，串流卻只增 4.7% [[26. 科技新報]](#ref-26)。在生成內容能無限灌進串流平台的環境裡，能被驗證來源的載體重新獲得溢價——這是本報告對兩組數字並置後的觀察，並非來源主張，但它與訴訟指向的方向一致：來源可證明，正在變成一種資產。

<a id="tr-others"></a>
### 其他領域科技應用突破

MIT 這兩則研究看似無關，卻都在拆掉一個被當成前提的限制。Arm Qubit 拆的是「同調時間與耦合強度必須取捨」——做法是把兩者一起設計，而不是各自最佳化後再想辦法接起來 [[27. MIT News]](#ref-27)。可撓透明矽光子拆的是「晶片必須是平的、不透明的」——做法是把矽基板降級成暫時載體，最終產物轉貼到聚酯薄膜上 [[28. MIT News]](#ref-28)。兩者的共同手法是質疑製程順序中被默認的那一步。這在工程上是可遷移的思考方式：當某個取捨看起來無解，先確認它是物理限制，還是只是既有流程留下的副作用。

<a id="references"></a>
## 參考資料

| 編號 | 文章標題與搜尋連結 | 一句話繁體中文結論或亮點 | 發布日期 | 來源資料網址與名稱 | 分類 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ref-1"></a>1 | [Introducing Claude Fable 5.1 and Claude Mythos 5.1](https://www.google.com/search?q=Introducing+Claude+Fable+5.1+and+Claude+Mythos+5.1) | 快取讀取價格降 75%，代理型任務成本最多降約 45%，Mythos 5.1 僅開放通過審查的美國組織。 | 2026-09-01 | [Anthropic](https://www.anthropic.com/claude-fable-and-mythos-5-1) | AI 科技 |
| <a id="ref-2"></a>2 | [OpenAI 推出新模型 GPT-6 Astra　強調資安防護](https://www.google.com/search?q=OpenAI+GPT-6+Astra+資安防護+中央社) | 付費資安客戶當天先拿到存取權，免費方案暫不開放，發表主軸放在防護而非能力。 | 2026-09-04 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609040112.aspx) | AI 科技 |
| <a id="ref-3"></a>3 | [Developing Enterprise Frontier Safeguards with our customers](https://www.google.com/search?q=Anthropic+Developing+Enterprise+Frontier+Safeguards+with+our+customers) | 監控資料留在客戶自有雲端，警示直送客戶，官方明說不需 Anthropic 人工審閱。 | 2026-09-01 | [Anthropic](https://www.anthropic.com/news/enterprise-frontier-safeguards) | AI 科技 |
| <a id="ref-4"></a>4 | [歐盟 AI 法規面臨競爭與企業出走壓力　智庫籲重審標準](https://www.google.com/search?q=歐盟+AI法案+Bruegel+風險門檻+重審+中央社) | 10 的 25 次方 FLOPs 門檻被指跟不上技術演進，執委會 9 月 1 日對約 30 家 AI 企業索取資訊。 | 2026-09-03 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609030281.aspx) | AI 科技 |
| <a id="ref-5"></a>5 | [Copilot code review can now approve pull requests](https://www.google.com/search?q=Copilot+code+review+can+now+approve+pull+requests) | 核准權預設關閉，分企業、組織、儲存庫三層設定，最細可指定可核准的檔案路徑。 | 2026-09-01 | [GitHub Changelog](https://github.blog/changelog/2026-09-01-copilot-code-review-can-now-approve-pull-requests/) | 軟體工程 |
| <a id="ref-6"></a>6 | [Selected GitHub Copilot models deprecated](https://www.google.com/search?q=Selected+GitHub+Copilot+models+deprecated+September+2026) | 9 月 1 日起停用 Gemini 3.1 Pro、Claude Opus 4.5／4.6、Sonnet 4.5／4.6 與 Raptor Mini。 | 2026-08-31 | [GitHub Changelog](https://github.blog/changelog/2026-08-31-selected-github-copilot-models-deprecated/) | 軟體工程 |
| <a id="ref-7"></a>7 | [Malicious .git Configs Can Make Claude, Codex, Cursor, and Other AI Agents Run Attacker Code](https://www.google.com/search?q=Malicious+.git+Configs+AI+Agents+Run+Attacker+Code+core.fsmonitor) | 惡意 `core.fsmonitor` 讓代理在沙箱外、無核准提示下以使用者身分執行指令。 | 2026-09-02 | [The Hacker News](https://thehackernews.com/2026/09/malicious-git-configs-can-make-claude.html) | 軟硬體資訊安全 |
| <a id="ref-8"></a>8 | [台灣新創 Zeabur 環境變數外洩：AI 金鑰遭盜用，創辦人承諾後續賠償](https://www.google.com/search?q=Zeabur+環境變數外洩+API金鑰+林沅霖+賠償) | 內部服務憑證遭未授權存取，造成部分專案環境變數與 AI 金鑰外洩；技術根因尚未定論。 | 2026-08-29 | [動區動趨 BlockTempo](https://www.blocktempo.com/zeabur-environment-variable-leak-openai-anthropic-api-key-stolen-compensation/) | 軟硬體資訊安全 |
| <a id="ref-9"></a>9 | [Introducing context-aware vulnerability discovery and remediation with Cloudflare Managed Defense and OpenAI Daybreak Models](https://www.google.com/search?q=Cloudflare+context-aware+vulnerability+discovery+remediation+Managed+Defense+Daybreak) | 用 WAF 線上攔阻現況決定修補順序，偵察與驗證使用 OpenAI GPT-5.6 Cyber 模型。 | 2026-09-03 | [Cloudflare](https://blog.cloudflare.com/vulnerability-discovery-remediation/) | 軟硬體資訊安全 |
| <a id="ref-10"></a>10 | [Previewing the Model Hardware Standard](https://www.google.com/search?q=Anthropic+Previewing+the+Model+Hardware+Standard) | 以標準化驅動層讓代理操作實體儀器，整合時間從典型的數週壓到 8 小時。 | 2026-08-27 | [Anthropic](https://www.anthropic.com/news/model-hardware-standard-research-preview) | 硬體或軟硬整合 |
| <a id="ref-11"></a>11 | [晶圓一哥啟動 AI 冷革命，新世代「微流道」散熱技術將納入研發藍圖](https://www.google.com/search?q=台積電+微流道+散熱+陳燕銘+異質整合高峰論壇) | 冷卻液直接流經晶片本體，代價是高風險蝕刻製程；CoWoS 電晶體五年成長逾 48 倍。 | 2026-09-04 | [TechNews 科技新報](https://technews.tw/2026/09/04/tsmc-adds-microchannel-cooling-to-rd-roadmap/) | 硬體或軟硬整合 |
| <a id="ref-12"></a>12 | [晶片愈疊愈熱怎麼辦？德國創浦出手：預告 2028 年將微冷卻結構直接打入 3D 晶片](https://www.google.com/search?q=創浦+TRUMPF+超短脈衝雷射+微冷卻結構+3D晶片+2028) | 以超短脈衝雷射在碳化矽與鑽石上加工微米級冷卻結構，預估 2028 年導入 3D 堆疊。 | 2026-09-05 | [TechNews 科技新報](https://finance.technews.tw/2026/09/05/trumpf/) | 硬體或軟硬整合 |
| <a id="ref-13"></a>13 | [How we could save petabytes of cache storage with Zstandard and Pingora](https://www.google.com/search?q=Cloudflare+save+petabytes+cache+storage+Zstandard+Pingora) | zstd level 3 壓縮率 2.834 倍，編碼一次 4.31 ns/byte、解碼每次 1.56 ns/byte。 | 2026-09-01 | [Cloudflare](https://blog.cloudflare.com/cache-transcoding/) | 網路/伺服器等基礎 |
| <a id="ref-14"></a>14 | [軟銀成功測試「會飛的基地台」拚 2027 商業化、有望用於災害](https://www.google.com/search?q=軟銀+HAPS+平流層+會飛的基地台+Sceye+2027) | 16.5 公里高空提供半徑 5 公里 4G 涵蓋，載具自新墨西哥飛抵日本歷時約 13 天。 | 2026-09-02 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609020158.aspx) | 網路/伺服器等基礎 |
| <a id="ref-15"></a>15 | [印度海底光纜 95% 登陸點集中孟買 6 公里海岸線，恐成斷網高風險處](https://www.google.com/search?q=印度+海底光纜+孟買+Versova+登陸點+95%25) | 18 條電纜中至少 13 條擠在同一段海岸；全球 1,900 座登陸站中印度只有 21 座。 | 2026-09-04 | [TechNews 科技新報](https://technews.tw/2026/09/04/is-indias-internet-boom-running-into-an-undersea-problem/) | 網路/伺服器等基礎 |
| <a id="ref-16"></a>16 | [金管會主委彭金隆：虛擬資產服務法最快明年首季上路](https://www.google.com/search?q=彭金隆+虛擬資產服務法+九項子法+穩定幣+FinTechOn) | 法案 6 月完成立法，九項子法含穩定幣規範，最快 2027 年第一季公布實施。 | 2026-09-02 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609020089.aspx) | 金融科技 |
| <a id="ref-17"></a>17 | [New method allows scientists to follow gene activity over time in the same cells](https://www.google.com/search?q=MIT+cellular+self-reporting+gene+activity+over+time+same+cells+Cell) | 細胞把自身 RNA 包進類病毒顆粒釋放到培養液，取樣即可定序，不必殺死細胞。 | 2026-09-04 | [MIT News](https://news.mit.edu/2026/new-method-allows-following-gene-activity-over-time-same-cells-0904) | 醫療科技 |
| <a id="ref-18"></a>18 | [綠能與數位雙軸轉型　智慧醫院的永續路徑](https://www.google.com/search?q=洪子仁+綠能+數位+雙軸轉型+智慧醫院+永續路徑) | 全球醫療業占總碳排約 4.4%；新光醫院無紙化率逾 88%，結帳可在 30 秒內完成。 | 2026-09-01 | [全球中央](https://newsworld.com.tw/article/20260826n002/) | 醫療科技 |
| <a id="ref-19"></a>19 | [特斯拉推自動駕駛計程車 Cybercab，服務挑戰一次看](https://www.google.com/search?q=特斯拉+Cybercab+自動駕駛計程車+奧斯汀+NHTSA) | 無方向盤雙座車在奧斯汀部分區域上路；德州註冊 420 輛中僅 45 輛為 Cybercab。 | 2026-09-04 | [TechNews 科技新報](https://technews.tw/2026/09/04/us-auto-safety-regulator-says-evaluating-teslas-cybercab-rollout/) | 運輸物流 |
| <a id="ref-20"></a>20 | [搶先 Waymo　Wayve 攜 Uber 進軍倫敦自駕計程車市場](https://www.google.com/search?q=Wayve+Uber+倫敦+自駕計程車+Waymo+札格瑞布) | 初期數十輛車保留安全員，倫敦成為歐洲第二個提供商業自駕計程車的城市。 | 2026-09-03 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609030145.aspx) | 運輸物流 |
| <a id="ref-21"></a>21 | [System helps humans predict when self-driving cars will make mistakes](https://www.google.com/search?q=MIT+Motional+Concept-Wrapper+Network+self-driving+predict+mistakes) | CW-Net 以 1.3 億標註場景訓練，把模型推理轉成概念並要求規劃時實際使用。 | 2026-09-02 | [MIT News](https://news.mit.edu/2026/system-helps-humans-predict-when-self-driving-cars-will-make-mistakes-0902) | 運輸物流 |
| <a id="ref-22"></a>22 | [How architects turned a hulking brick box into MIT's newest academic hub](https://www.google.com/search?q=MIT+Metropolitan+Storage+Warehouse+Diller+Scofidio+Renfro+academic+hub) | 22 萬平方英尺舊倉庫改造：北側立面切孔換玻璃，工作室懸吊於屋頂桁架。 | 2026-09-04 | [MIT News](https://news.mit.edu/2026/how-architects-turned-hulking-brick-box-newest-academic-hub-0904) | 房地產與室內外裝潢 |
| <a id="ref-23"></a>23 | [台北藝術節《大象來了》熱血登場 9 月 5 日、6 日基河路交管措施報給你知](https://www.google.com/search?q=台北藝術節+大象來了+基河路+交管措施+士林分局) | 士林基河路夜間戶外遊行，交通管制分五階段升級並保留持證住戶與攤商的緊急通道。 | 2026-09-02 | [自由時報](https://news.ltn.com.tw/news/Taipei/breakingnews/5560309) | 現場表演藝術 |
| <a id="ref-24"></a>24 | [潮台北科技音樂互動展登場　邀民眾體驗音樂文化](https://www.google.com/search?q=潮台北+TRENDY+TAIPEI+科技音樂互動展+松山文創園區) | 臉部辨識控制音訊、八面資料牆呈現逾 1,700 場演出、地標 AR 圖標可體驗刷碟。 | 2026-08-27 | [中央社 CNA](https://www.cna.com.tw/news/ahel/202608270234.aspx) | 現場表演藝術 |
| <a id="ref-25"></a>25 | [索尼狀告 Anthropic，主張擅自讓 AI 學樂曲](https://www.google.com/search?q=索尼+音樂出版+告+Anthropic+歌詞+樂譜+訓練) | 35 家出版公司提告，爭點在資料是否取自盜版網站，求償每件作品最高 15 萬美元。 | 2026-08-31 | [TechNews 科技新報](https://technews.tw/2026/08/31/sony-sues-anthropic-alleging-unauthorized-ai-music-training/) | 影視音樂 |
| <a id="ref-26"></a>26 | [CD 黑膠銷售大逆襲 美音樂市場營收年增近 7%](https://www.google.com/search?q=RIAA+2026上半年+CD+黑膠+實體唱片+營收+年增) | 上半年總營收 60 億美元年增 6.9%，實體年增 25.9%，串流僅增 4.7%。 | 2026-09-02 | [TechNews 科技新報](https://finance.technews.tw/2026/09/02/cds-make-a-comeback-boosting-us-recorded-music-revenue/) | 影視音樂 |
| <a id="ref-27"></a>27 | [New qubit architecture enables faster, more accurate operations](https://www.google.com/search?q=MIT+Arm+Qubit+superconducting+coherence+coupling+Physical+Review+Applied) | Arm Qubit 把同調與耦合一起設計，模擬顯示同時取得頂尖同調時間與更快操作。 | 2026-09-03 | [MIT News](https://news.mit.edu/2026/new-qubit-architecture-enables-faster-more-accurate-operations-0903) | 其他領域科技應用突破 |
| <a id="ref-28"></a>28 | [Fabrication platform could enable flexible, transparent next-generation photonic chips](https://www.google.com/search?q=MIT+flexible+transparent+silicon+photonics+wafer+Optica+Notaros) | 製程可生產 300 mm 可撓透明晶圓；單顆晶片繞小螺絲粗細圓柱數千次仍無效能下降。 | 2026-09-03 | [MIT News](https://news.mit.edu/2026/fabrication-platform-could-enable-flexible-transparent-next-generation-photonic-chips-0903) | 其他領域科技應用突破 |
| <a id="ref-29"></a>29 | [政府提AI資安3階段策略　採購、供應商管理納中期防護](https://www.google.com/search?q=政府+AI資安+3階段策略+採購+供應商管理+資安署) | 短期加速防禦、中期管政府採購與供應鏈、長期建立自主 AI 資安防禦能力。 | 2026-09-04 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609040287.aspx) | 軟硬體資訊安全 |
| <a id="ref-30"></a>30 | [Introducing Gemini 3.8 Flash and 3.8 Flash Cyber](https://www.google.com/search?q=Google+Introducing+Gemini+3.8+Flash+and+3.8+Flash+Cyber) | 導入價維持每百萬 token 輸入 0.75 美元、輸出 3.75 美元；資安版僅經 Fairwind Program 開放給可信防禦方。 | 2026-09-02 | [Google Blog](https://blog.google/innovation-and-ai/models-and-research/gemini-models/3-8-flash-and-3-8-flash-cyber/) | AI 科技 |

<a id="notes"></a>
## 報告說明

本報告由 Claude Code、Codex 於 2026-09-05 彙整近 15 天內（2026-08-21 至 2026-09-05）的全球科技新聞與媒體報導，再依程式設計師與科技讀者較常關注的主題整理成分類摘要與趨勢觀察。來源優先採用官方公告與一手技術部落格，其次是權威科技媒體與台灣主流媒體；候選來源與淘汰原因保留在同一任務資料夾的 `source.md`。本期共蒐集 53 筆候選來源，採用 30 筆，淘汰 23 筆，主要原因是發布日期超出時間窗、上一期已引用或來源可信度不足。交付前已重新開啟每筆原始網址，核對標題、發布日期、媒體名稱與內文主張。

<a id="limitations"></a>
### 資料限制與判讀提醒

- 所有正式來源的發布日期皆以原始頁面標示為準，並逐篇查核落在 2026-08-21 至 2026-09-05 之間。無法確認精確日期者一律排除，本期無需使用 `*未知時間` 標記。
- 本期窗期與 2026-08-29 期重疊九天。篩選前已比對 `tech/2026-08-29/references.md`，重複事件即使落在窗內也淘汰，詳見 `source.md` 的淘汰清單 A 至 E。
- 以下來源權重經刻意壓低，內文僅採用可回溯的部分：ref-8（事件仍在調查中，規模與賠償比例由當事公司單方公布）、ref-18（名家視角專欄，單一醫院數據未經第三方查核）、ref-23（交管公告性質的報導，未提及演出團隊與裝置規模，內文不引用該類細節）與 ref-24（活動報導，技術規格未揭露）、ref-26（轉載報導，原始數據來自 RIAA）。
- ref-1、ref-30 的基準分數與 ref-3 的參與客戶數為供應商自行公布，未經獨立複驗；ref-11 與 ref-12 的時程為研發藍圖與廠商預估，非量產承諾；ref-13 標題用 could save，屬原型階段推估；ref-27 的結果來自模擬測試，新聞稿未揭露具體數值。
- 「實體唱片回升與 AI 生成音樂灌入串流之間存在關聯」為本報告對 ref-25 與 ref-26 並置後的推論，並非來源本身的主張。
- 科技新報 2026-09-05〈遮蔽恆星光芒尋找第二個地球〉因標題稱 NASA 與 MIT 聯手、內文卻寫執行團隊為加州理工學院，來源內部矛盾未能釐清，已淘汰未予引用。
- iThome 與 inside.com.tw 對自動抓取回 HTTP 403，Zeabur 事件因此改採可完整核對的動區動趨報導作為正式來源，iThome 的資安日報僅作交叉核對。

<a id="disclaimer"></a>
## 免責聲明

本報告內容僅供資訊參考，不構成投資、法律、醫療或其他專業建議。新聞事件與相關資訊可能持續更新，請以原始來源及官方公告為準。
EOF
