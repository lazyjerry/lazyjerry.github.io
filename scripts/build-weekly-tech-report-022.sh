#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TASK="$ROOT/docs/tech-report-research/weekly-tech-report-022"

mkdir -p "$TASK"

cat > "$TASK/prompt.md" <<'EOF'
# 任務請求

## 原始需求

執行 `tech-report-research` skill，產出 2026-09-26 期的科技服務資訊週記。

## 基本設定

- 今天日期：2026-09-26
- 報告標題：`2026-09-26 科技服務資訊週記`
- Meta：`作者：Claude Code、Codex　報告日期：2026-09-26`
- 目標讀者：程式設計師，兼顧科技應用與科技服務資訊
- 時間範圍：2026-09-11 至 2026-09-26（今天起往前 15 天，含首尾）
- 交付日期資料夾：`tech/2026-09-26/`

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

- 僅使用 2026-09-11 至 2026-09-26 之間發布的資料
- 優先使用有明確日期標記的來源；無法確認是否落在窗內者直接排除
- 確認在窗內但無法確認精確日期者，發布日期欄寫 `*未知時間`
- 來源優先序：官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載
- 中國來源與社群平台（知乎、Reddit 等）內容優先以高權重來源替換，無可替換者刪除
- 台灣新聞與媒體資料作為主要參考來源之一
- 跨期去重：本期窗期與 2026-09-19 期（2026-09-04 至 2026-09-19）重疊九天、與 2026-09-13 期（2026-08-30 至 2026-09-13）重疊三天，篩選前須比對 `tech/2026-09-19/references.md` 與 `tech/2026-09-13/references.md`，重複事件即使落在窗內也淘汰；系列活動上期已引用其中一場者，本期不再引用同系列其他場次

## source.md 蒐集格式要求

每筆候選來源至少包含：原始標題、繁體中文標題、URL、100 至 500 字繁體中文摘要、權重分數（1-10/10）、發布日期、分類、是否納入正式參考資料、備註。淘汰來源須註明淘汰原因。摘要只寫該來源原頁可查證的內容，其他媒體的細節不掛在該來源名下。

## 完成前檢查要求

1. 各分類是否缺少資料
2. 資訊權重是否足夠
3. 搜尋時間範圍是否正確
4. 資料來源是否正確（網址、來源網站名稱、發布日期與引用對應是否一致）
5. 文章內引用的來源編號是否與參考資料表中的來源編號一致
6. 錯誤來源或整理內容是否已修正

## 參考文件

- `references/report-spec.md`（skill）
- `references/rules.md`、`references/file-structure.md`、`references/knowledge-base.md`（skill）
- `assets/weekly-report-template.md`（skill）
- `docs/tech-report-research/knowledge/index.md` 與其列出的六份知識檔
- `docs/working-notes-skill/notes/index.md` 命中的兩份施工筆記（weekly-tech-report-021 平行蒐集、週記中文排版校對改建置腳本）
EOF

cat > "$TASK/task_plan.md" <<'EOF'
# 任務計劃

- 任務名稱：weekly-tech-report-022
- 報告日期：2026-09-26
- 時間範圍：2026-09-11 至 2026-09-26
- 執行模式：一次完成
- 內容單一來源：`scripts/build-weekly-tech-report-022.sh`

## 階段

| # | 階段 | 狀態 |
|---|------|------|
| 1 | 確認日期範圍與分類 | 完成 |
| 2 | 蒐集來源並整理 source.md | 完成（四組研究代理平行蒐集後再補搜，候選 141 筆：正式 64 筆、淘汰 77 筆） |
| 3 | 依權重篩選正式參考資料 | 完成（比對 `tech/2026-09-19/references.md` 與 `tech/2026-09-13/references.md` 做跨期去重） |
| 4 | 檢查各分類是否缺漏 | 完成（12 分類皆有資料；現場表演藝術已補入 Apple 官方一手來源） |
| 5 | 撰寫總結、亮點、趨勢分析 | 完成 |
| 6 | 整理參考資料表與引用 | 完成（ref-1 至 ref-56 與內文一一對應） |
| 7 | 六項完成前檢查 | 完成 |
| 8 | 依模板完成 report.md | 完成 |
| 9 | 複製交付物到 tech/2026-09-26/ | 完成（`scripts/deliver-weekly-tech-report.sh`） |
| 10 | 正式來源逐筆 HTTP 稽核 | 完成（`scripts/audit-weekly-tech-report-sources.sh`，55 筆取得 HTTP 200；SEC 一般瀏覽器 UA 回 403，以宣告式 UA 取得 200） |
| 11 | Codex 內容稽核 | 完成（更新 ref-6 標題、收斂 ref-38 與 ref-55 主張，ref-49 改採 Apple 官方來源） |
| 12 | Claude Code 逐筆稽核與補搜 | 完成（補齊 ref-49 在 report.md 的替換、修正 27 筆來源未支持的細節、補入 ref-57 至 ref-64） |

## 完成前檢查項目

- [x] 分類完整性：12 個必要分類皆有資料；現場表演藝術 2 筆、影視音樂 3 筆，補搜輪次與限制記於 `notes.md` 與報告說明；表演藝術已補入 Apple 官方一手來源
- [x] 資訊權重：正式來源以官方公告（Anthropic、Microsoft、Google、GitHub、Node.js、Oracle、CISA、Acronis、Cloudflare、D-Link、MediaTek、Meta、SANS ISC、金管會、SEC、衛福部、Federal Register、MIT News、臺鐵、Waymo、建研所、YouTube、ESA、NASA）與台灣權威媒體（中央社、iThome、聯合新聞網、自由財經）為主；權重 6 以下的來源在報告說明註明限制
- [x] 搜尋時間範圍：64 筆正式來源發布日期皆落在 2026-09-11 至 2026-09-26
- [x] 資料來源正確性：網址、來源網站名稱、發布日期、標題逐筆回原頁核對；原頁無法取得日期者淘汰；代理摘要中非原頁內容已移除
- [x] 引用一致性：內文 `(#ref-n)` 與參考資料 `<a id="ref-n">` 皆為 1 至 64，一一對應且每個編號至少被引用一次
- [x] 錯誤修正狀態：12 筆超長摘要已精簡；金管會存款代幣截斷的兩項已補齊；Java 27 的 JEP 編號與 MIT 電池的期刊名稱已回原頁核對；四筆英文標題的 `source.md` 標題欄已改中文

## 已知風險與對策

- WebFetch 摘要會改寫時間詞與補出日期：日期與數字以 curl 取原頁 JSON-LD 或 meta 核對
- iThome、inside.com.tw、openai.com 回 403：iThome 改 curl 帶瀏覽器 UA；openai.com 改以 iThome 為來源；inside.com.tw 無法確認日期者淘汰
- sec.gov 對瀏覽器 UA 回 403：改用宣告式 UA
- technews.tw 各子站轉址網域不同：以轉址後網址抓取，參考資料寫原網域
- 活動預告的發布日常落在窗外：表演藝術與影視音樂只採窗內發出的開幕、片單公布或活動當日報導
- 代理摘要常混入非原頁內容：收斂時逐筆讀備註，把第三方媒體的細節從摘要刪掉
- 跨期重疊九天：先建立前兩期已引用名單再篩選

## 錯誤記錄

| 項目 | 狀況 | 處置 |
|------|------|------|
| 收斂腳本分段 | 各組最後一筆正式建議被「## 淘汰候選」標題吃掉，四筆漏掉 | 改以 `##` 與 `###` 同時分段，標題行單獨判斷 |
| 12 筆摘要超過 500 字 | 代理摘要最長 720 字 | 以覆寫表精簡，只保留原頁內容 |
| 金管會存款代幣 | C 組抓取時營業計畫書第三、四項被截斷 | 主編重抓原頁補齊 |
| 街口支付 | 廠商自評、無技術細節 | 降為淘汰 |
| 器官老化研究 | 科技新報二手編譯、無論文標題 | 改採 MIT 可吸收電池 |
| 建研所綠領課程 | 技術內容有限，且與中央社人數不一致 | 降為淘汰 |
| Java 27 | B 組列為非該組分類的淘汰 | 主編改歸軟體工程，核對九個 JEP |
| Akamai 合約 | A 組列為淘汰並建議改分類 | 主編改歸網路/伺服器等基礎 |
| ref-49 替換未同步 | Codex 只改了 source.md，report.md 四處仍引用衛武營 | 第三輪稽核核對 Apple 原頁後補齊 |
| 來源未支持的細節 | 逐筆查核找出 27 筆措辭超出原頁（詳 notes.md） | 逐條收斂或改列名，不補原頁沒有的數字 |
EOF

cat > "$TASK/notes.md" <<'EOF'
# 研究筆記

- 任務：weekly-tech-report-022
- 報告日期：2026-09-26
- 時間範圍：2026-09-11 至 2026-09-26
- 使用工具：Claude Code（Fable 5.1）、Codex（GPT-5）；四組研究代理平行蒐集，主編收斂與撰稿，Codex 進行第二輪內容稽核，Claude Code 進行第三輪逐筆稽核與補搜

## 知識庫查閱

任務開始前已讀取 `docs/tech-report-research/knowledge/index.md` 與全部六份知識檔案：

- `source-priority.md`：中國來源與社群平台內容優先以高權重來源替換，台灣媒體為主要參考來源之一
- `taiwan-media-landscape.md`：台灣媒體分類座標，用於評估中央社、iThome、科技新報、聯合新聞網、自由財經的定位
- `date-citation-rules.md`：引用格式 `[[{數字}. {資料來源名稱}]](#ref-{數字})`、錨點規則、`*未知時間` 用法
- `report-format.md`：四段式結構、H2/H3 階層、參考資料表格、完成前檢查
- `fetch-gotchas.md`：iThome、openai.com、inside.com.tw 回 403；technews.tw 各子站轉址網域不同；WebFetch 摘要會改寫時間詞；活動實施日不等於發布日；標題與內文矛盾直接淘汰
- `window-overlap-dedup.md`：篩選前先比對上一期 `references.md`；系列活動上期已引用其中一場，本期不再引用同系列其他場次

另讀取施工筆記索引 `docs/working-notes-skill/notes/index.md`，命中並開啟兩份筆記（`2026-09_01_weekly-tech-report-021-平行蒐集-建置與交付.md`、`2026-09_01_週記中文排版校對改建置腳本.md`），沿用四組代理平行蒐集、建置腳本為五份檔案唯一內容來源、收斂時逐筆讀備註剔除非原頁內容、作者欄只寫 `Claude Code` 的做法。

## 蒐集方式

依分類拆成四組代理平行蒐集，每組各自完成搜尋、以 curl 帶瀏覽器 UA 取得原頁、核對日期、跨期去重與淘汰判斷，並把候選寫成與 `source.md` 相同欄位的 markdown（另加「來源網站」與「程式設計師觀點」兩欄供撰稿）：

- A 組：AI 科技、軟體工程（正式建議 12、淘汰 13）
- B 組：軟硬體資訊安全、網路/伺服器等基礎、硬體或軟硬整合（正式建議 16、淘汰 23）
- C 組：金融科技、醫療科技、運輸物流（正式建議 15、淘汰 22）
- D 組：房地產與室內外裝潢、現場表演藝術、影視音樂、其他領域科技應用突破（稽核後正式 14、淘汰 22）

主編另補查 3 筆（Java 27、Anthropic 與 Akamai 算力合約、MIT 可吸收電池），並重抓金管會存款代幣原頁補齊被截斷的營業計畫書事項。收斂時以 `converge.py` 依指定網址順序把正式條目編號、剔除兩個撰稿欄位、淘汰條目編字母，並檢查摘要字數與時間窗。Codex 稽核補入 Apple Music Hall 官方來源，並將原 ref-49 移至淘汰區；Claude Code 第三輪稽核再補入 8 筆（ref-57 至 ref-64）。最終候選 141 筆、正式 64 筆、淘汰 77 筆。

## 主編複審的取捨

- 街口支付連三月獲利（finance.technews 09-15）：廠商自評、無技術細節，降為淘汰
- 科技新報編譯的器官老化研究（09-25）：二手編譯、原頁無論文標題與 DOI，改採 MIT News 可吸收電池研究
- 建研所綠領人才培育課程（09-17）：人才培育、技術內容有限，同機構已有一筆，降為淘汰
- B 組淘汰候選 S 的 Java 27（Oracle 09-15）：非該組分類，主編改歸軟體工程並自原頁核對九個 JEP 編號
- A 組淘汰候選 L 的 Akamai 合約（中央社 09-25）：A 組建議改歸基礎建設，主編採納
- MIT 可吸收電池同時出現在 C 組淘汰備援與 D 組正式建議，主編統一歸醫療科技

## 跨期去重

本期窗期（2026-09-11 至 2026-09-26）與 2026-09-19 期重疊九天、與 2026-09-13 期重疊三天。篩選前已由兩期 `references.md` 建立 76 筆已引用標題與網址名單，以下候選因此淘汰：

- Gemini 3.8 Live with Live Avatar（Google 09-24）：前期已引用 Gemini 3.8 Live／Extended Thinking，屬同一產品線後續功能
- iThome MedTech 雙周報第 53 期（09-15）：頭條為 Duke SYMPHONY 心衰竭 AI 聯盟，前期已引用
- 全台充電樁 1.6 萬槍（udn 09-15）：前期已引用經濟日報同一事件
- Waymo 與 Allianz 保險合作（09-15）：前期已列為淘汰備援，本期不再使用
- 頭城煙火節、廣藝 Aizart Spark、Build for NextGen 系列：前期已引用

同站不同事件照常採用：GitHub（Node 20 移除、SSH 變更、Copilot 沙箱）、Cloudflare（Vary、Python Workers、Containers 事故）、CISA（09-22 四漏洞，與前期 09-10、09-16 不同批）、MIT News（自殺風險詞庫、可吸收電池、視覺 AI 城市）、Waymo（安全數據、拉斯維加斯，與前期新加坡、東京不同）。

## 抓取踩坑（本期新增）

- **openai.com 對 curl 三種 UA 全回 403**，GPT-6 Sol／Luna 改採 iThome 為主來源，GitHub Changelog 同日上架公告列為淘汰備選。
- **sec.gov 對一般瀏覽器 UA 回 403「Request Rate Threshold Exceeded」**，改用宣告式 UA（含聯絡資訊）後回 200。
- **cadence.com、mastercard.com 對 curl 與 WebFetch 皆 403**，相關候選淘汰。
- **bleepingcomputer.com 首頁與 RSS 被 Cloudflare 擋**，本期未取得該站候選。
- **anthropic.com、nasa.gov、waymo.com shorts 頁、臺鐵內文頁沒有 JSON-LD 或 meta 日期**，分別以頁面日期列、標題日期或官網列表頁日期為準。
- **金管會新聞稿頁尾「更新日期」是網站更新時間**，發布日以正文「今日（22 日）」與 dataserno 為準。
- **MediaTek 新聞室列表頁顯示的日期與文章頁不一致**，以文章頁「Sep 15, 2026」為準。
- **blog.google 用 curl 抽到的是 CSS**，正文改用 WebFetch，再以 grep 驗證關鍵詞是否在原頁。
- **udn 正文要從 `article-content__editor` 之後抽**；travel.udn 的桃園設計展報導頁尾標示為市府廣告，淘汰。
- **建研所綠領課程人數**：建研所原頁寫 450 人，中央社同事件寫近 400 人，兩者不一致；該筆最終淘汰。

## 逐筆查核與修正

- 代理摘要中不在原頁的細節已依備註移除或改寫：iThome 的 VS Code 工作階段載入秒數、中央社的微軟 Copilot 計費模式、iThome 資安週報的 CISA 四漏洞 CVSS、The Hacker News 的 Cloudflare Containers 報導、二手媒體的 Suncatcher 發射日期與 TPU 數量。Anthropic 現行原頁已明載約 950 個代理與 21 小時，但本報告未因此增加非必要數字。
- 12 筆摘要超過 500 字，以只保留原頁內容的方式精簡至 500 字內（Opus 5.5、GPT-6 Sol／Luna、SSH、Docker、Java 27、Acronis、actions-cool、天璣 9600 Pro、台積電 440 億、Meta 眼鏡、Python Workers、SANS QUERY）。
- 金管會存款代幣：C 組抓取時營業計畫書第三、四項被截斷，主編重抓原頁補齊「存款帳務與代幣帳本之勾稽、對帳及控管機制」與「技術架構、系統運作方式及安全控管機制」。
- Java 27：九個 JEP 編號逐一自原頁 HTML 核對（523、527、531、532、533、534、536、537、538）。
- MIT 可吸收電池：期刊名稱自原頁「appears today in Nature Chemical Engineering」核對。
- ref-55 Suncatcher：代理抄的是 `<title>`，og:title 與 H1 皆為「Behind Project Suncatcher, our moonshot to put AI in space」，參考資料表與原始標題欄改用 og:title。
- 稽核：`scripts/audit-weekly-tech-report-sources.sh` 對 56 筆正式來源逐筆 curl，55 筆回 200，SEC 新聞稿回 403（該站需宣告式 UA，蒐集階段已以該方式取得 200 並核對日期）。
- 四筆英文原標題的 `source.md` 標題欄改為中文（MIT 自殺風險、FDA 聯邦公報、Waymo 安全數據、Waymo 拉斯維加斯），參考資料表仍照錄原始標題。

## Codex 第二輪稽核

- ref-6 依 Anthropic 現行 H1 改為「Claude discovers a novel enzyme system with CRISPR-like repeats」。
- ref-38 刪除「每一版都要走 510(k)」的過度推論；原頁只支持四類 CAD／CADt 器材未獲部分豁免。
- ref-55 改為「即將進行首次在軌測試」；Google 原頁寫的是 upcoming Transporter-18 任務，不是已發射。
- ref-49 改採 Apple Newsroom 的 Apple Music Hall 官方新聞稿；原衛武營報導因只用一句提到 AI，移至淘汰區。
- HTTP 複查為 55 筆一般 UA 回 200，SEC ref-33 一般 UA 回 403；改用宣告式 UA 可取得 200，標題與 2026-09-17 日期已核對。
- 結構驗證、research／delivery 同步、shell 語法與 `git diff --check` 均通過。

## Claude Code 第三輪稽核

- **Codex 的 ref-49 替換只做了一半**：source.md 已換成 Apple Music Hall，但 report.md 的亮點、趨勢、參考資料表與報告說明仍引用衛武營。回 Apple Newsroom 原頁核對 H1、datePublished 2026-09-21、600 人、38 英尺舞台、48 支揚聲器、兩間錄音混音室、16 個以上機位與全球直播後，補齊 report.md 四處；ref-6 參考資料表標題同步改為 H1；`task_plan.md` 的「收旂」錯字改「收斂」。
- **逐筆查核方式**：`scripts/audit-weekly-tech-report-sources.sh` 重抓 56 筆原頁（55 筆回 200，SEC ref-33 以宣告式 UA 另抓回 200），再以四組代理分段（1–14、15–28、29–42、43–56）逐筆對照參考資料表、source.md 摘要與報告內文；blog.google 兩頁以關鍵字回原始 HTML 驗證。
- **改掉的來源未支持主張**（ref：原句 → 改法）：
  - ref-3：表格「進入私人預覽」→「月底擴大私人預覽」（原文 expanding to private preview at the end of the month）。
  - ref-4：來源名稱「Google Security Blog」→「Google The Keyword」，與 ref-55 統一。
  - ref-6、ref-11：報告說明原稱代理數量與時數、工作階段載入秒數「只見於中文媒體／iThome」，原頁其實明載（約 950 個代理、21 小時；約 645 個工作階段 1.3 秒→0.1 秒），改為「原頁雖有記載，本報告未展開」；ref-11 的 source.md 備註同步改。
  - ref-7：「與 ARM32 不相容」→「不正式支援 ARM32」。
  - ref-14：亮點標題與趨勢的「邊界設備」「防火牆、SD-WAN 與存取閘道」是產品知識推論，原頁只寫產品名，改為列出 Check Point、Arista VeloCloud 與 F5 BIG-IP APM。
  - ref-16：source.md「中國駭客」→「中文使用者駭客組織」（原文 Chinese-speaking，PRC 關聯為中等信心）；「至少 11 個目標」→「共 11 個目標」。
  - ref-18：「第二次停用，原因不明」→ 原因不明的是 9 月 16 日重新可存取，第二次停用是 GitHub 以違反服務條款為由。
  - ref-19：與 CISA 公告「同週」→「同期」（9/18 與 9/22 分屬相鄰兩週）。
  - ref-22：「全部連結 Muse」→「並將 Muse 帶進 AI 眼鏡」。
  - ref-24：三處「多數」在收資料→「許多」（原文只寫「許多」，無比例）。
  - ref-25：「Cloudflare 分析」→「Cloudflare 引用的外部分析」（原文引用 mnot.net 的分析）。
  - ref-31：「與現行匯款作業的差異」→「與現行存款、匯款作業的差異」。
  - ref-34：儀表板「同日上線」→「9 月 23 日上線」（原文「明日(9月23日)」）；報告說明的日期依據改為日期列與兩篇正文各自的措辭。
  - ref-33：source.md 備註稱「為期 5 年」不在原頁，實際原頁有「expire five years after publication」，備註改正。
  - ref-37：「小模型上線推論」→「小模型做預測」（原頁無上線，尚未臨床部署）。
  - ref-38：刪除「不代表每次軟體更新都必然重新送件」的推論，趨勢「每版都要走 510(k)」→「上市前都要走 510(k)」，「免 510(k)」→「部分豁免 510(k)」；source.md 備註誤稱 Harrison.ai 不在原頁，改正。
  - ref-39：「動物實驗中連續三天」拆成兩句、「臨床試驗」補「SAFARI 系統的」、趨勢「整顆可降解」→「幾乎整顆（僅剩電路板）」。
  - ref-40：「臺鐵首度參展」→「首度攜手工研院與至鴻科技參展」；「皆為自主開發、可自行升級」只適用平交道系統；報告說明的日期依據改為內文頁「發佈日期：2026/9/23 下午 5:00」。
  - ref-41：「國家館」→「台灣館」（兩處）。
  - ref-42：source.md 備註誤稱橫向主動安全系統細節未取得，改正。
  - ref-44：趨勢「作為新城市的預設配置」→「首批以 Ojai 為主力車隊的城市」。
  - ref-45：表格「納入近零碳建築旗艦行動計畫」→「聚焦…並說明三大主軸」；亮點標題同步軟化。
  - ref-46：趨勢「占商用不動產近七成」→限定「第 3 季…單季」。
  - ref-52：「娛樂媒體報導」→「NBC News 新聞報導」。
  - ref-53：「第一顆」→「ESA 第一顆」（原文 ESA's first）。
  - ref-54：「八個國際夥伴」→ 原頁列七項（KASI／KASA 併列），改列名。
  - ref-55：亮點「搭乘…升空」→「預定搭乘…升空（原頁稱下週）」，表格改「即將進行的首次在軌測試」，報告說明補「原頁只寫『下週』」。
- **標題裁決**：ref-1 產品頁 H1 只有「Claude Opus 5.5」，`<title>` 與 og:title 為「Introducing Claude Opus 5.5」，保留後者作為 headline；ref-6 改用 H1 全稱。其餘標題與原頁一致，差異只在中英文空格。
- **補搜結果**：另以一組代理跨 12 分類補搜窗內重大事件，核對原頁後補入 8 筆：Siri AI（Apple）、Grok 4.7（xAI）、數位部主權 AI 語料徵集、Gyazo 外洩（Helpfeel 官方公告）、Snapdragon 8 Elite Gen 6（Qualcomm）、Salesforce 全球中斷（The Register）、Bitget 遭竊（The Hacker News）、UMG 與 Sony 二告 Suno（Music Business Worldwide）。依 020 期慣例以 ref-57 至 ref-64 接在表末，不重排既有編號；亮點中 Grok 併入 AI 第一則、高通併入天璣一則，其餘各自一則，總結改寫後 297 字。
- **補搜查過但不收**：UMG 控告 DistroKid（09-15，重要性低於 Suno 案）、台灣資安日倡議（民間協會）、資安院內鬼案起訴（司法進度）、林宜敬訪美（交流性質）、Gemini 4 進 post-training（無官方頁）、DeepSeek-V4.1-Flash 與 Meta Muse Spark 1.3（窗外）、SonicWall／N-able／Chrome 三個 0-day（窗外）、Tesla Cybersecurity 稽核（窗外）、OpenAI Sora 2 API 停用（實施日非公告日）。
- **交叉查核方式**：qualcomm.com 新聞稿頁為 React app，curl 只取得 JSON-LD，正文改抓同網址加 `.model.json`；x.ai 帶瀏覽器 UA 回 200；apple.com/newsroom 的 H1 與 og:title 不同，參考資料表採 H1。
- **驗證**：`sh scripts/validate-weekly-tech-report-022.sh`（正式 64、淘汰 77、引用 ref-1..64）與 `validate_report.py`（含 references.md 與交付副本）通過；`audit-weekly-tech-report-sources.sh` 重跑 64 筆，除 SEC 需宣告式 UA 外皆回 200。

## 權重壓低而非排除

- ref-2（GPT-6 Sol／Luna）權重 8：iThome 轉述，因 openai.com 403 無法在原頁確認日期。
- ref-12（Docker Cloud Sandboxes）權重 6：iThome 二手報導，價格與版本需求皆轉述。
- ref-24（IFR 人形機器人）權重 7：中央社編譯路透，IFR 原始數據頁未另行查核。
- ref-30（Akamai 合約）權重 7：中央社編譯外電，Akamai 官方新聞稿未另行查核。
- ref-34（臺股儀表板）權重 6：屬資本市場資訊服務，發布日由列表編號與「明日上線」推得。
- ref-46（商用不動產）權重 6：顧問公司報告的媒體轉述，科技成分為 AI 供應鏈驅動。
- ref-48（新勝景）權重 6：文總新聞稿的媒體版本。
- ref-52（Netflix Wonka）權重 6：娛樂媒體報導，Netflix 與 ElevenLabs 合作的原始宣布在 6 月窗外。

## 分類補搜

- 現場表演藝術：原始 9 輪補搜只找到新勝景與衛武營，稽核時再補搜國際官方來源，找到 9 月 21 日 Apple Music Hall 新聞稿；因技術細節與來源權重皆高於衛武營報導，改採為 ref-49。
- 第三輪跨分類補搜：AI、資安、硬體、基礎建設、金融科技、影視音樂各補一至三筆（ref-57 至 ref-64），台灣政策面補入數位部語料庫；醫療、運輸、房地產、表演藝術、其他領域沒有找到權重明顯高於現有選材的窗內事件。
- 影視音樂：9 輪（金鐘 AI、Netflix／Spotify／YouTube、Udio／Suno／Sora／Runway、文策院兩輪、AI 配音／著作權、Spotify AI Persona、UMG × ElevenLabs、台灣 LED 虛擬棚）。Suno v6 與 UMG × ElevenLabs 都落在 09-10，窗外一天。
- 醫療科技：11 輪（食藥署、智慧醫療、udn、台大／長庚、健康幣、iThome、TechNews、健保署、Stanford、Lancet、中央社 site 搜尋），最後靠中央社 site 搜尋找到奇美急診系統。
- 金融科技 6 輪、運輸物流 7 輪。柏林軌道展有三筆候選（臺鐵、陳世凱專訪、德鐵 MOU），收前兩筆；Waymo 同站三筆，收安全數據與拉斯維加斯。
EOF

cat > "$TASK/source.md" <<'EOF'
# 候選來源整理

- 報告日期：2026-09-26
- 時間範圍：2026-09-11 至 2026-09-26（含首尾）
- 判定原則：以原始頁面標示的發布日為準；無法確認落在時間窗內者直接排除。
- 來源優先序：官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載。中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。
- 跨期去重：本期窗期與 2026-09-19 期（2026-09-04 至 2026-09-19）重疊九天、與 2026-09-13 期（2026-08-30 至 2026-09-13）重疊三天，篩選前已比對兩期 `references.md`，重複事件即使落在窗內也淘汰。
- 蒐集方式：四組研究代理依分類平行蒐集，主編補查 3 筆並逐筆複審；摘要只寫該來源原頁可查證的內容，其他媒體的細節記在備註。

## 正式納入來源

### 1. Anthropic 推出 Claude Opus 5.5，宣稱以 Opus 5 六成成本達到 Fable 5.1 水準
- 原始標題：Introducing Claude Opus 5.5
- 標題：Anthropic 推出 Claude Opus 5.5，宣稱以 Opus 5 六成成本達到 Fable 5.1 水準
- URL：https://www.anthropic.com/claude-opus-5-5
- 摘要：Anthropic 於 9 月 22 日發表 Claude Opus 5.5，為 Claude 5.5 系列首款模型。官方稱其在多數工作上達到 Claude Fable 5.1 的水準，典型工作負載的執行成本較 Opus 5 低 40%，上線前由外部評測機構 Frontier Design 與 METR 測試。定價為每百萬輸入 token 4 美元、輸出 20 美元，比 Opus 5 低 20%；快取讀取每百萬 token 0.20 美元，低 60%；輸出速度快 30% 以上。官方舉例：一名測試者在一天內完成 68 萬行程式碼遷移；在縮短網頁應用各頁面載入時間的測試中，40 次成功 39 次。安全面向，官方稱其在自動化行為稽核取得歷來最佳成績，較不易採取難以回復的動作或越出授權範圍，對 prompt injection 的抵抗力也優於 Opus 5；因生物與網路安全能力與 Claude Mythos 5.1 相當，部署時套用與 Fable 5.1 類似的防護。付費方案同步提高五小時用量上限。
- 權重：9/10
- 發布日期：2026-09-22
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200；日期取自頁面正文的「September 22, 2026」（頁面無 JSON-LD datePublished）。頁面另提及 Sonnet 5.5、Haiku 5.5 將於數週內推出，但該段落不在本次讀取的節錄範圍，摘要未收。效能與安全數字皆為廠商自評。與前期無重疊（前期引用的是 Anthropic institute 的節奏量測與 threat intelligence report）。

### 2. OpenAI 公布 GPT-6 Sol、Luna，價格較前代降低一半
- 原始標題：OpenAI公布GPT-6 Sol、Luna，價格較前代降低一半
- 標題：OpenAI 公布 GPT-6 Sol、Luna，價格較前代降低一半
- URL：https://www.ithome.com.tw/news/179160
- 摘要：iThome 報導，OpenAI 於 9 月 22 日宣布 GPT-6 Sol 與輕量模型 GPT-6 Luna，成為 GPT-6 家族繼 Astra 之後的新成員。OpenAI 表示快取與推論能力提升讓其得以用更低成本提供模型，兩款 API 價格皆較 GPT-5.6 版減半：Sol 每百萬 token 輸入／輸出由 4／20 美元降為 2／10 美元，Luna 由 0.2／1.2 美元降為 0.1／0.5 美元。兩款模型採用與 Astra 相近的訓練方法，強化專業工作、事實正確性、程式開發、電腦操作與指令遵循。OpenAI 自評 Sol 效能超越 Anthropic Opus 5 而每任務成本僅 9%，Luna 效能超越前代且每任務成本降低 58%；Sol 的事實錯誤較前一代減少一半。OpenAI 同時加大提示快取能力，並新增診斷工具、快取儀表板、推理調整工具與快取 prefix 設定。兩款模型已於 9 月 22 日提供 ChatGPT Work、Codex 及 API 使用，Luna 另開放 Free 與 Go 用戶在桌面版使用。
- 權重：8/10
- 發布日期：2026-09-23
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自 `class="created">2026-09-23`。OpenAI 官方頁 https://openai.com/index/introducing-gpt-6-sol-and-luna/ 對 curl（含瀏覽器 UA、Googlebot UA）一律回 403，無法在原頁確認日期，故改採 iThome 為主來源；GitHub Changelog 同日亦有 Sol／Luna 上架 Copilot 的公告（見淘汰 D）。文中所有效能與成本比較皆為 OpenAI 自評，iThome 轉述。與前期「GPT-6 Astra 企業市場」（technews 09-18）為不同事件。

### 3. 微軟推出新版 Copilot，整合 Home、Code 與 Autopilot
- 原始標題：Introducing the new Copilot with Home, Code and Autopilot
- 標題：微軟推出新版 Copilot，整合 Home、Code 與 Autopilot
- URL：https://blogs.microsoft.com/blog/2026/09/25/introducing-the-new-copilot-with-home-code-and-autopilot/
- 摘要：微軟於 9 月 25 日宣布新版 Microsoft Copilot，Copilot 應用新增三項核心能力。Home 是新的起點，把即時對話的 Chat 與可委派整件任務的 Cowork 放在同一處，並透過 Office in Copilot 把 Word、Excel 與 PowerPoint 的完整能力內建到 Copilot 體驗中；使用者可在 Home 回顧近期活動、取得 Copilot 建議並接續先前的工作。Code 讓每個人都能用自然語言建構自己的解決方案並安全執行，底層採用與 GitHub Copilot 相同的技術。Autopilot 則是持續運作、主動且個人化的代理，即使使用者離線也會繼續工作。微軟表示 Home 與 Code 將在未來數週於 Frontier 計畫開始推出，Autopilot 於月底擴大至私人預覽。微軟同時公布新的 FinOps for AI 能力，協助企業管理 Copilot 與代理的支出。
- 權重：8/10
- 發布日期：2026-09-25
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自 `article:published_time` 2026-09-25T12:03:50+00:00。中央社同日報導（淘汰 E）另提到固定訂閱授權（USL）與用量計費（UBB）的收費模式，該細節不在本次讀取的微軟原頁節錄內，摘要未收。與前期無重疊。

### 4. Google 公開 PageBreak 專案：AI 代理在第一方 Web 應用找出逾 500 個 XSS 漏洞
- 原始標題：Agentic Hacks, Real Proofs: Inside Google's PageBreak Project
- 標題：Google 公開 PageBreak 專案：AI 代理在第一方 Web 應用找出逾 500 個 XSS 漏洞
- URL：https://blog.google/security/agentic-hacks-real-proofs-inside-googles-pagebreak-project/
- 摘要：Google 資訊安全工程師 Michał Bentkowski 於 9 月 24 日在 Google 安全部落格介紹內部 AI 代理 PageBreak。文章指出，LLM 用於安全掃描帶來的新瓶頸是雜訊：大量未經驗證的假設與誤判反而加重產品團隊負擔。PageBreak 由 Google 產品安全團隊開發，用於測試 Google 第一方 Web 應用，2025 年 11 月起試行，2026 年 1 月轉為正式專案；雖可搭配不同模型，絕大多數使用 Gemini 3.1 Pro 或 Gemini 3.5 Flash。專案早期即決定優先採用確定性驗證（deterministic validation）：代理找到疑似漏洞後交由一組非 AI 撰寫的專用驗證器，對執行中的環境實際送出 payload 確認可利用，因此誤判率接近零。Google 表示已大規模執行 PageBreak，在第一方 Web 應用（包含敏感網域）找出超過 500 個跨站指令碼（XSS）漏洞。
- 權重：8/10
- 發布日期：2026-09-24
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自 `article:published_time` 2026-09-24。iThome 09-25 報導（https://www.ithome.com.tw/news/179224）另舉 admin.google.com 的多步驟 XSS 案例，該段落不在本次讀取的原頁節錄範圍，摘要未收。與前期「Hacktron 用 Claude 駭入 OpenAI 帳號」為不同事件。

### 5. 台灣 AI 使用率升至 33.8%，躍居全球第 19 名
- 原始標題：台灣AI使用率升至33.8%　躍居全球第19名
- 標題：台灣 AI 使用率升至 33.8%，躍居全球第 19 名
- URL：https://www.cna.com.tw/news/ait/202609220112.aspx
- 摘要：中央社 9 月 22 日報導，微軟旗下 AI 經濟研究院（AI Economy Institute）發布「全球 AI 使用報告」（Global AI Diffusion Report），追蹤 147 個經濟體，衡量 15 至 64 歲工作年齡人口使用生成式 AI 產品的擴散程度。今年第 2 季台灣使用率達 33.8%，較第 1 季的 31.8% 增加 2 個百分點，全球排名由第 20 名升至第 19 名，超車匈牙利，並高於美國（33%）、德國（32.3%）與義大利（31.4%）。全球整體使用率為 18.8%，147 個經濟體中僅 31 個突破 30% 門檻；阿拉伯聯合大公國以 73.3% 居首，新加坡 64.3% 居次，愛爾蘭 49.9%、法國 49.6%、挪威 49.4% 分列第 3 至 5 名。報告也指出南北數位落差擴大：全球北方國家平均使用率 28.8%、季增 1.3 個百分點，全球南方僅 16.2%、季增 0.8 個百分點，差距由 12.1 拉大至 12.6 個百分點，受限於電力、網路基礎建設與數位技能。
- 權重：7/10
- 發布日期：2026-09-22
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自 JSON-LD `datePublished` 2026-09-22T12:36:00+08:00。數據為微軟報告的自行統計，中央社轉述。與前期無重疊。

### 6. Anthropic 成立生命科學研究實驗室，Claude 發現具 CRISPR 式重複序列的新型酵素系統
- 原始標題：Claude discovers a novel enzyme system with CRISPR-like repeats
- 標題：Anthropic 成立生命科學研究實驗室，Claude 發現具 CRISPR 式重複序列的新型酵素系統
- URL：https://www.anthropic.com/news/claude-discovers-novel-enzyme-system
- 摘要：Anthropic 於 9 月 23 日宣布成立生命科學研究小組與實驗室，聚焦以 Claude 進行基礎生物研究：探索 DNA 資料集以找出尚未被描述的蛋白質家族、大規模產生假設，並在自有實驗室以實驗驗證。該小組於 2026 年春季成立，目的在檢驗通用 AI 模型能否系統化並加速這類發現，並建立「代理在每個步驟與人類協作」的新研究方式。文章分享的早期成果為：在科學家僅給予高層次方向下，Claude 自主發現一個與 DNA 重複序列陣列相關的新型酵素系統，其模式令人聯想到 CRISPR。該系統以反轉錄酶（reverse transcriptase，RT）為基礎，這個 RT 來自一種巨型噬菌體，先前研究已鑑定過該酶，但 Claude 似乎是第一個注意到此系統定義特徵的。Anthropic 表示尚不清楚其功能，但其特徵組合過去只在少數幾個系統中一起出現，而那些系統都是可程式化、能執行剪切、複製與貼上 DNA 的工具。
- 權重：7/10
- 發布日期：2026-09-23
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自頁面正文的「Sep 23, 2026」（頁面無 JSON-LD datePublished）。第二輪稽核時，現行 H1 與正文已明載 CRISPR-like repeats、約 950 個代理與 21 小時；摘要只保留與研究成果直接相關的內容。成果為 Anthropic 自述，功能尚未確認。與前期無重疊。

### 7. GitHub Actions 移除 Node 20，JavaScript actions 改用 Node 24
- 原始標題：Node 20 is no longer available in GitHub Actions
- 標題：GitHub Actions 移除 Node 20，JavaScript actions 改用 Node 24
- URL：https://github.blog/changelog/2026-09-23-node-20-is-no-longer-available-in-github-actions
- 摘要：GitHub 於 9 月 23 日發出最終通知：Node 20 已不再提供於 GitHub Actions runner，runner 現在一律以 Node 24 執行 JavaScript actions，先前的暫時性退出選項 `ACTIONS_ALLOW_USE_UNSECURE_NODE_VERSION` 也已移除。維護 JavaScript action 的作者應盡快把 `runs.using` 改為 `node24` 並發布新版本；在 workflow 中使用 JavaScript actions 的使用者則應更新到支援 Node 24 的最新版本，所有第一方 actions 的最新版本都已改用 Node 24。GitHub 提醒 Node 24 與 macOS 13.4 及更早版本不相容，也不正式支援 ARM32，使用這些作業系統或架構的自架 runner 不再受支援。此變更適用於 github.com 與 GitHub with Data Residency。
- 權重：8/10
- 發布日期：2026-09-23
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自 JSON-LD `datePublished` 2026-09-23T13:46:07-07:00。與前期「Ubuntu 26.04 runner GA」「workflow execution protections GA」為 Actions 的不同事件。

### 8. GitHub 調整 SSH 安全性：淘汰 SHA-1 RSA 簽章與舊式 DH 交換，新增 ML-KEM
- 原始標題：Security improvements for SSH
- 標題：GitHub 調整 SSH 安全性：淘汰 SHA-1 RSA 簽章與舊式 DH 交換，新增 ML-KEM
- URL：https://github.blog/changelog/2026-09-22-security-improvements-for-ssh
- 摘要：GitHub 於 9 月 22 日公告一系列 SSH 變更：移除以 SHA-1 的 RSA 簽章（即 `ssh-rsa` 簽章類型，含使用 SHA-1 的憑證）、移除 `diffie-hellman-group-exchange-sha256` 金鑰交換機制，並要求 2026 年 10 月 14 日之後上傳的新 RSA SSH 金鑰至少 3072 位元。同時在 github.com 與 GitHub Enterprise Cloud with Data Residency（美國區除外）新增後量子金鑰交換 `mlkem768x25519-sha256`。GitHub 說明移除的舊式 Diffie-Hellman 是緩慢、少用且可能被量子計算進展攻破的演算法；RSA 方面則因 SHA-1 已知脆弱而移除，並把金鑰長度提高以對齊 128 位元安全需求。時程：10 月 14 日新 RSA 金鑰長度要求生效並啟用 ML-KEM；11 月 4 日對 `ssh-rsa` 簽章與舊 DH 交換進行第一次 brownout；12 月 9 日再進行一次 brownout。
- 權重：8/10
- 發布日期：2026-09-22
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自 JSON-LD `datePublished` 2026-09-22T07:11:47-07:00。原頁時程表在 12 月 9 日之後尚有最終移除日期，該段落不在本次讀取的節錄範圍，摘要未收。與前期「SHA-1 in HTTPS on GitHub sunset」（09-15，未被前期引用）為不同公告。

### 9. GitHub Copilot app 新增本機沙箱，限制 AI 代理的檔案、網路與憑證存取
- 原始標題：Local sandboxing in the GitHub Copilot app
- 標題：GitHub Copilot app 新增本機沙箱，限制 AI 代理的檔案、網路與憑證存取
- URL：https://github.blog/changelog/2026-09-23-local-sandboxing-in-the-github-copilot-app
- 摘要：GitHub 於 9 月 23 日在 GitHub Copilot app 推出本機沙箱（local sandboxing）公開預覽，藉由限制對本機檔案、網路資源與憑證的存取，降低代理執行非預期指令的影響。沙箱以專案為單位設定，適用於本機 repository 與 working tree 的工作階段；設定項目包含檔案系統（額外可讀寫、額外唯讀與拒絕存取的資料夾清單）、網路（對外網際網路與本機網路）以及憑證（HTTPS git 操作用的 Git 憑證、GitHub CLI 憑證）。這些專案設定描述的是 app 在啟動沙箱工作階段時請求的政策，若套用企業管理設定，實際政策可能更嚴格；若作業系統無法強制執行所請求的政策，沙箱 shell 會直接失敗而不是在無沙箱狀態下執行。功能預設關閉，可在專案設定中開啟「Sandbox new sessions」，或在執行中的工作階段輸入 `/sandbox on` 只對該階段啟用。本機沙箱不適用於雲端沙箱或遠端主機上的工作階段，且與 Copilot CLI 的沙箱設定分開管理。
- 權重：7/10
- 發布日期：2026-09-23
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自 JSON-LD `datePublished` 2026-09-23T08:00:57-07:00。功能為公開預覽。與前期「Copilot agent enterprise managed permissions」（09-09）為不同功能。

### 10. Node.js 26.10.0 釋出：新增 crypto.parsePKCS12()、util.debounce／throttle 與滑動視窗直方圖
- 原始標題：Node.js 26.10.0 (Current)
- 標題：Node.js 26.10.0 釋出：新增 crypto.parsePKCS12()、util.debounce／throttle 與滑動視窗直方圖
- URL：https://nodejs.org/en/blog/release/v26.10.0
- 摘要：Node.js 專案於 2026 年 9 月 22 日釋出 26.10.0（Current），由 Antoine du Hamel 發布。主要變更皆為 SEMVER-MINOR：`crypto` 新增 `crypto.parsePKCS12()`；`ffi` 可從掛載的 VFS 載入函式庫；`fs` 新增 `openAsBlobSync`；`net` 支援把 `net.BoundSocket` 傳送到執行緒與子行程；`perf_hooks` 實作 `SlidingWindowHistogram`，並在 Histogram 加入 qrde 分析支援；內建 `sqlite` 會把 `undefined` 綁定為 `NULL`；`util` 新增 `util.markPromiseAsHandled`、`util.throttle` 與 `util.debounce`。此外 Guilherme Araújo（araujogui）加入協作者名單。
- 權重：7/10
- 發布日期：2026-09-22
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自頁面正文的「2026-09-22, Version 26.10.0 (Current)」。iThome 09-23 有中文報導（https://www.ithome.com.tw/news/179175），內容與官方 release notes 一致；「原本得繞 OpenSSL 命令列」一句出自 iThome 對背景的說明，官方頁只列 API 名稱。與前期無重疊。

### 11. VS Code 1.139 釋出：代理工作階段擴及遠端 Dev Container，大量工作階段清單載入更快
- 原始標題：Visual Studio Code 1.139
- 標題：VS Code 1.139 釋出：代理工作階段擴及遠端 Dev Container，大量工作階段清單載入更快
- URL：https://code.visualstudio.com/updates/v1_139
- 摘要：微軟於 2026 年 9 月 23 日釋出 Visual Studio Code 1.139 穩定版（後續有 1.139.1 修正更新）。官方列出的本版重點：讓大量代理工作階段（agent session）清單載入更快、把 Dev Container 支援延伸到遠端專案，並改善日常編輯。其中「Remote Dev Container sessions」讓代理可在 SSH、Tunnel 與 WSL 主機上專案的 Dev Container 內執行；「Session list improvements」改善大型工作階段清單的載入。
- 權重：7/10
- 發布日期：2026-09-23
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自頁面正文的「Released September 23, 2026」。iThome 09-24 報導（https://www.ithome.com.tw/news/179212）另有「約 645 個工作階段測試，首次列出時間從 1.3 秒降至 0.1 秒、重新整理從 0.6 秒降至 0.15 秒」與「遠端主機需要 Docker」等細節，稽核複查官方頁正文亦載有同一組量測表（約 645 個工作階段）與「Docker must be available on the remote host」，摘要未展開。與前期無重疊。

### 12. Docker Cloud Sandboxes 上線，AI 代理環境可在本機與雲端雙向搬移
- 原始標題：Docker Cloud Sandboxes上線，AI代理環境可在本機與雲端雙向搬移
- 標題：Docker Cloud Sandboxes 上線，AI 代理環境可在本機與雲端雙向搬移
- URL：https://www.ithome.com.tw/news/179227
- 摘要：iThome 9 月 25 日報導，Docker 推出 Cloud Sandboxes 雲端沙箱服務，把原本在開發者電腦執行的 Docker Sandboxes 隔離環境延伸到 Docker 管理的雲端運算資源，開發者可讓 AI 程式開發代理在雲端執行大型程式修改與測試，並用 `sbx move` 指令在本機與雲端之間搬移沙箱。每個沙箱使用獨立微型虛擬機，擁有 Linux 核心、檔案系統、網路環境與 Docker 背景服務；代理可在沙箱內安裝套件、執行指令或啟動容器，但無法存取未開放的主機資源。搬移不保留執行中的行程：`sbx move` 會保存沙箱檔案系統並製成容器映像檔，再於目的端建立新沙箱，本機掛載目錄、金鑰與網路存取規則不會跟著搬。服務提供 Claude Code、Codex、GitHub Copilot 等預設代理環境，可透過 MCP 連接 Jira、Linear、Grafana 等工具，金鑰在發出請求時注入而不交給代理保存。計費按秒計算、暫停期間不計運算費，1 至 16 個虛擬 CPU 的公告價格為每小時 0.07 至 1.12 美元，單次工作階段最長 24 小時。
- 權重：6/10
- 發布日期：2026-09-25
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：curl 200，日期取自 `class="created">2026-09-25`。iThome 為二手報導，Docker 官方公告未另行查核；價格與版本需求皆轉述自 iThome。與前期無重疊。

### 13. Oracle 釋出 Java 27，TLS 1.3 加入後量子混合金鑰交換
- 原始標題：Oracle Releases Java 27 and Strengthens Post-Quantum Cryptography Support
- 標題：Oracle 釋出 Java 27，TLS 1.3 加入後量子混合金鑰交換
- URL：https://www.oracle.com/news/announcement/oracle-releases-java-27-and-strengthens-post-quantum-cryptography-support-2026-09-15/
- 摘要：Oracle 於 9 月 15 日宣布 Java 27（Oracle JDK 27）正式可用，本版收錄九項 JDK Enhancement Proposal（JEP）。安全面向：JEP 527 為 TLS 1.3 加入後量子混合金鑰交換，因應「先蒐集、日後解密」的威脅；JEP 538 PEM 編碼密碼物件進入第三次預覽；JEP 536 JFR 行程內資料遮罩。效能與執行期：JEP 534 預設啟用精簡物件標頭以降低 JVM 記憶體開銷，JEP 523 讓 G1 在所有環境成為預設垃圾回收器。語言與程式庫：JEP 537 Vector API 第 12 次孵化、JEP 533 結構化並行第七次預覽、JEP 532 基本型別用於模式比對第五次預覽、JEP 531 Lazy Constants 第三次預覽。Oracle 另將 FIPS 140-3 模組 Jipher 20 納入 Java Verified Portfolio，新增 ML-KEM 與 ML-DSA 後量子演算法；JDK 28 早期存取版預覽 Project Valhalla 的第一個主要階段。
- 權重：8/10
- 發布日期：2026-09-15
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：主編以 curl 取得 HTTP 200，日期出自頁面日期列「Austin, Texas—Sep 15, 2026」，九個 JEP 編號與名稱逐一自原頁 HTML 核對。B 組原列為淘汰候選 S（非該組分類），主編改歸軟體工程。iThome 09-21 有中文報導（179030），未採用。廠商新聞稿，「世界第一的程式語言」等宣稱不寫入報告。

### 14. CISA 一次新增四個已遭利用漏洞：Check Point、Arista VeloCloud、F5 BIG-IP APM
- 原始標題：CISA Adds Four Known Exploited Vulnerabilities to Catalog
- 標題：CISA 一次新增四個已遭利用漏洞：Check Point、Arista VeloCloud、F5 BIG-IP APM
- URL：https://www.cisa.gov/news-events/alerts/2026/09/22/cisa-adds-four-known-exploited-vulnerabilities-catalog
- 摘要：CISA 於 9 月 22 日依據實際遭利用的證據，將四個漏洞加入 Known Exploited Vulnerabilities（KEV）目錄：CVE-2026-85102（Check Point 多項產品憑證驗證不當）、CVE-2026-93616（Check Point 多項產品路徑遍歷）、CVE-2026-93952（Arista VeloCloud Orchestrator 輸入驗證不當）、CVE-2026-94127（F5 BIG-IP APM 堆積緩衝區溢位）。公告指出這類漏洞是惡意行為者常用的攻擊途徑，對聯邦體系構成重大風險；並引用 Binding Operational Directive（BOD）26-04「依風險排定安全更新優先順序」，要求聯邦民間行政機關優先修補 KEV 目錄中、位於對外曝露資產且被利用後可完全控制該資產的高風險漏洞，同時建立「修補前是否已遭入侵」的檢查基本要求。CISA 也鼓勵所有組織採用風險導向的漏洞管理並優先修補 KEV 漏洞。
- 權重：9/10
- 發布日期：2026-09-22
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `<time datetime="2026-09-22T12:00:00Z">` 與頁面「Release Date September 22, 2026」。原頁只有 CVE 編號與漏洞類型，沒有 CVSS 分數與細部時間軸；iThome 資安週報（179217）提到 F5 該漏洞 CVSS 9.8、Arista 該漏洞 CVSS 10.0、Check Point 兩漏洞分別自 7 月 23 日與 9 月 12 日遭利用，這些皆不在 CISA 原頁。與前期 KEV 公告（09-10 MikroTik、09-16 Cisco ISE／Acronis）為同站不同事件。

### 15. 資安署揭露機關老舊防火牆遭駭：設備交接不全、未掌握 EOS 成內網破口
- 原始標題：資安署揭機關老舊防火牆遭駭事件，設備交接不全、未掌握EOS成內網破口
- 標題：資安署揭露機關老舊防火牆遭駭：設備交接不全、未掌握 EOS 成內網破口
- URL：https://www.ithome.com.tw/news/179118
- 摘要：數位發展部資通安全署在本週發布的 115 年 8 月資通安全網路月報中揭露一起機關資安事件：某轄區遼闊的機關在監視系統前端部署防火牆，近期接獲資安警訊發現可疑連線，調查後確認防火牆遭駭客取得控制權，攻擊者竄改最高管理者帳號密碼，並利用該設備連線至機關內部網路。資安署追查發現問題源頭不是單純設備老舊，而是業務交接時只完成書面移交，沒有同步確認防火牆版本、原廠維護狀態、使用年限與汰換時程；接手單位也未落實資產盤點，因此未察覺設備已超過原廠支援期限（EOS），在無法取得安全更新的情況下持續使用。資安署提出兩大面向改善建議：設備交接時落實現況清查並釐清維護權責與合約狀態；強化 IoT 設備存取管理，包括獨立網段隔離、管理介面不直接暴露於網際網路、遠端維運採「原則禁止、例外允許」，必要時以短天期臨時授權並搭配零信任、來源 IP 白名單與異常行為監控。
- 權重：8/10
- 發布日期：2026-09-22
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 帶瀏覽器 UA 取得 HTTP 200，日期出自 `<span class="created">2026-09-22`。原頁未點名機關名稱與防火牆廠牌型號。資安署月報原文在 moda.gov.tw，本篇為 iThome 整理報導；台灣政府資安政策類來源。

### 16. Acronis 揭露中文使用者駭客組織 Red Heron 利用 Gitea 漏洞跨國攻擊，台灣為重點目標
- 原始標題：Red Heron exploits Gitea n-day flaw in multinational campaign, exposing new Linux rootkit
- 標題：Acronis 揭露中文使用者駭客組織 Red Heron 利用 Gitea 漏洞跨國攻擊，台灣為重點目標
- URL：https://www.acronis.com/en/tru/posts/red-heron-exploits-gitea-n-day-flaw-in-multinational-campaign-exposing-new-linux-rootkit/
- 摘要：Acronis 威脅研究單位（TRU）揭露駭客組織 Red Heron 利用 Gitea 遠端程式碼執行漏洞 CVE-2026-60004（CVSS 9.8，1.27.1 版於 7 月 27 日修補）發動跨國攻擊，在公開 PoC 出現後數日內即武器化為自動化框架，能註冊帳號、利用漏洞、竊取儲存庫並清除部分痕跡。攻擊者以 FOFA 掃描七國共 1,386 個 Gitea 實例，另維護一份含 477 個台灣系統的獨立清單，並於 8 月 3 日對其中 50 個台灣目標批次發動攻擊；確認遭入侵的組織分布於加拿大、阿根廷、台灣、美國與斯里蘭卡，共 11 個目標留有攻擊紀錄。在一個台灣環境中，攻擊者從執行 Gitea 的 Synology NAS 一路取得三節點 Proxmox 叢集的 root 權限並啟動虛擬機備份。報告同時揭露 C++ 植入程式 JITTERLY 與此前未被記錄的 LD_PRELOAD rootkit SIXZUT。Acronis 以中等信心評估 Red Heron 在中國相關背景下運作。
- 權重：8/10
- 發布日期：2026-09-13
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 JSON-LD `"datePublished":"2026-09-13T18:07:00.000000Z"`。iThome 09-22 報導（https://www.ithome.com.tw/news/179107）補充台灣工業自動化業者遭竊數百個程式碼儲存庫、主機上有超過 130 個「poc-*」目錄，可作台灣視角替代來源；「數百個儲存庫」與「130 個目錄」為 iThome 引述，未在本摘要中列入。前期未引用此事件。

### 17. Cloudflare 說明 Containers 跨租戶資料曝露漏洞的成因與處置
- 原始標題：How Cloudflare addressed a cross-tenant data exposure vulnerability in Containers
- 標題：Cloudflare 說明 Containers 跨租戶資料曝露漏洞的成因與處置
- URL：https://blog.cloudflare.com/containers-cross-tenant-vulnerability/
- 摘要：Cloudflare 公開一起 Containers 產品的跨租戶資料曝露漏洞：在共用主機上，持有 Workers Paid 帳號的客戶有可能讀到其他客戶容器先前使用過的磁碟區塊殘留資料。根因在儲存層設定，Cloudflare 使用 Linux device mapper 的 thin provisioning（64 KiB 區塊）並啟用 `skip_block_zeroing`，該選項讓 dm-thin 在配置新區塊時略過歸零；當一次寫入小於整個區塊時，區塊剩餘部分可能保留前一個擁有者的資料。漏洞由 Accomplish 研究團隊的 Oren Yomtov 於 9 月 4 日透過 HackerOne 漏洞回報計畫提交，研究人員在六個正式環境位置中辨識出 2,700 個不屬於自己的目錄 inode。Cloudflare 表示除授權測試外沒有發現遭利用的證據，也沒有客戶資料遭外洩的證據。處置措施包括全機隊移除 `skip_block_zeroing` 設定、汰換所有執行中的容器磁碟並移除緩解前建立的映像快照，清理作業於 9 月 19 日完成。
- 權重：8/10
- 發布日期：2026-09-24
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `"datePublished":"2026-09-24T15:00:00.000Z"` 與 `article:published_time`。本篇為廠商自述的事故報告，時間軸與「無資料外洩證據」皆為 Cloudflare 自評。The Hacker News 09-25 亦有報導（cloudflare-fixes-flaw-that-let-one.html），屬同一事件，不重複收錄。與前期 Cloudflare 文章（09-16 Client-Side Security、09-18 100TB RAM）為同站不同主題。

### 18. 遭入侵的 GitHub Actions 重新上線，Mini Shai-Hulud 惡意程式再度執行
- 原始標題：Compromised GitHub Actions Came Back Online and Resumed Executing Mini Shai-Hulud Malware
- 標題：遭入侵的 GitHub Actions 重新上線，Mini Shai-Hulud 惡意程式再度執行
- URL：https://thehackernews.com/2026/09/compromised-github-actions-came-back.html
- 摘要：兩個 actions-cool 組織的 GitHub Actions（issues-helper、maintain-one-comment）在 2026 年 5 月 18 日 Mini Shai-Hulud 供應鏈攻擊中遭植入竊取 CI/CD 憑證的惡意程式碼，當時已被停用。Socket 研究人員 Karlo Zanki 指出，兩個儲存庫於 9 月 16 日再度變成可存取狀態，但發行標籤未先清理，仍指向 5 月 18 日植入的惡意內容，因此任何以版本標籤引用這兩個 action 的工作流程，會在下一次執行時重新下載並執行惡意酬載。重新可存取的原因不明；目前兩個儲存庫已被 GitHub 以違反服務條款為由第二次停用。釘選到 5 月 18 日之前完整 commit SHA 的工作流程不受影響。建議做法包括：找出所有引用並將 `actions-cool/issues-helper@v2.2.1` 視為受影響、改釘選到已知乾淨的 SHA、輪替所有曝露的密鑰、檢查執行紀錄中長期「Set up job」失敗後突然成功的執行、稽核 9 月 16 日之後的異常 commit。
- 權重：7/10
- 發布日期：2026-09-25
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期取自頁面作者列「Ravie Lakshmanan Sep 25, 2026」（THN 頁面無 JSON-LD 日期可抓）。原頁引述 Socket 研究；「Mini Shai-Hulud」5 月事件為背景。與前期已引用的 GitHub Actions workflow execution protections（09-17，產品功能公告）為不同事件。

### 19. D-Link 公告 DIR-822A 路由器兩個重大漏洞，CVSS 滿分且已有公開 PoC
- 原始標題：(Non-US) DIR-822A – Stack-Based Buffer Overflow Vulnerability Reported
- 標題：D-Link 公告 DIR-822A 路由器兩個重大漏洞，CVSS 滿分且已有公開 PoC
- URL：https://supportannouncement.us.dlink.com/security/publication.aspx?name=SAP10516
- 摘要：D-Link 於 9 月 18 日發布資安公告 SAP10516（9 月 21 日更新），說明非美國市場的 DIR-822A 路由器（回報版本 A_101）存在兩個漏洞。CVE-2026-86296 為 udhcpcd 元件中因 `udhcpcd/serverpacket.c` 使用 strcpy 造成的堆疊緩衝區溢位，依公開 CVE 資訊可遠端、無需驗證、無需使用者互動即利用，且已有公開概念驗證程式，CVSS v3.1 與 v4.0 皆為 10.0；CVE-2026-86510 為 L2TP Control Message Parser 的越界寫入，CVSS v3.1 為 9.9、v4.0 為 9.4。兩項回報狀態均為「調查中」，受影響硬體版本與地區仍待確認。D-Link 建議使用者避免將設備不必要地暴露於公網、除非必要否則限制遠端管理、以網路控制限制管理存取、留意 D-Link 支援管道的韌體更新，並只安裝對應正確型號與硬體版本的韌體。
- 權重：7/10
- 發布日期：2026-09-18
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自頁面「Published on: 18 September 2026 9:26 GMT」「Last updated on: 21 September 2026 9:55 GMT」。頁面 `<title>` 為通用的「D-Link Technical Support」，公告標題取自內文 h1。D-Link 為台灣網通廠商，可視為台灣廠商一手來源。iThome 09-24 報導（https://www.ithome.com.tw/news/179202）為中文替代來源。

### 20. 聯發科發表 2 奈米製程天璣 9600 Pro 旗艦手機晶片
- 原始標題：MediaTek Dimensity 9600 Pro Sets New Standard for Flagship Smartphone Chips
- 標題：聯發科發表 2 奈米製程天璣 9600 Pro 旗艦手機晶片
- URL：https://www.mediatek.com/press-room/mediatek-dimensity-9600-pro-sets-new-standard-for-flagship-smartphone-chips
- 摘要：聯發科於 9 月 15 日在新竹宣布推出旗艦 SoC Dimensity 9600 Pro，採用 2 奈米製程，公司自稱是第一家宣布達到此節點的業者。CPU 為 2+3+3 全大核設計：兩顆 C2-Ultra 最高 4.55GHz、三顆 C2-Pro 4.35GHz、三顆 C2-Pro 3.1GHz，官方稱單核效能較前代提升最多 17%、多核最多 15%，多核功耗降低 61%。AI 方面採雙 NPU 架構與 Agentic AI Engine：第二代 Super Efficient NPU 讓常時 AI 功耗降低 40%，NPU 1090 的 LLM prefill 效能提升 51%、每瓦 token 產生量提升 55%，支援最高 30B 參數的裝置端模型；並首度支援 LPDDR6 記憶體與 UFS 5.0 儲存。GPU 為 G2-Ultra NX，峰值效能提升 27%、峰值功耗降低 24%、光線追蹤快 18%。影像採 Imagiq 1290 ISP，支援 4K240 原生慢動作。聯發科同時預告較平價的 Dimensity 9600M，首批搭載兩款晶片的手機預計本季上市。
- 權重：8/10
- 發布日期：2026-09-15
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自頁面日期列「Sep 15, 2026 - 03:30 PM」與內文「HSINCHU, Taiwan – Sept. 15, 2026」（新聞室列表頁顯示的日期與此不同，以文章頁為準）。所有效能百分比為廠商自評，原頁註明「Performance metrics achieved via demo device testing in MediaTek labs」；原頁未寫代工廠名稱。台灣廠商一手來源。前期未引用。

### 21. 台積電赴美投資累計核准 440 億美元，經濟部預期持續送件
- 原始標題：台積電赴美投資核准達440億美元　經部：預期持續送件審查
- 標題：台積電赴美投資累計核准 440 億美元，經濟部預期持續送件
- URL：https://www.cna.com.tw/news/afe/202609250036.aspx
- 摘要：經濟部投資審議司至今 7 度核准台積電赴美投資案，累計核准股本金額達 440 億美元。依投審司資料，台積電 2020 年 12 月獲准以 3,000 萬 1,000 美元設立亞利桑那子公司，其後歷次增資分別為 2020 年 12 月 34 億 6,999 萬 9,000 美元、2023 年 3 月 35 億美元、2023 年 9 月 45 億美元、2024 年 6 月 50 億美元、2024 年 9 月 75 億美元，以及今年 7 月 200 億美元。投審司說明審查的是對美國子公司的股本金額，不是台積電在美全部投資支出。相較之下，台積電 2025 年 3 月宣布在原本 650 億美元基礎上再加 1,000 億美元，今年 7 月 16 日法說會再加碼 1,000 億美元，使在美投資總額達 2,650 億美元，與目前核准的 440 億美元股本仍有差距，投審司預期未來仍會有新的投資案。經濟部並重申「3 個優先」：最大製造產能、最先進技術、最完整產業生態系都留在台灣；台積電目前在台有 19 座先進製程及封裝廠運行中，並持續興建 13 座。
- 權重：8/10
- 發布日期：2026-09-25
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `"datePublished":"2026-09-25T09:28:00+08:00"`。數字皆出自原頁引述的投審司資料。與前期引用的台積電龍潭埃米廠（technews 09-18）為不同事件。

### 22. Meta 推出 Ray-Ban Meta Audio 音訊眼鏡與新款 AI 眼鏡，年底前逾 100 種選擇
- 原始標題：Introducing Ray-Ban Meta Audio and More AI Glasses Styles
- 標題：Meta 推出 Ray-Ban Meta Audio 音訊眼鏡與新款 AI 眼鏡，年底前逾 100 種選擇
- URL：https://about.fb.com/news/2026/09/introducing-ray-ban-meta-audio-glasses-new-styles-plus-muse/
- 摘要：Meta 在 Connect 2026 發表首款音訊眼鏡 Ray-Ban Meta Audio：重 43 公克，售價 349 美元起，提供 Clubmaster 與 Burbank 兩款鏡框、共 23 種顏色與鏡片組合，單次充電續航最高 12 小時、充電盒再提供 48 小時，10 月 13 日出貨。同時推出 Ray-Ban Meta（Gen 3），449 美元起，三款鏡框 27 種組合，續航最高 9 小時，12MP 相機支援 3K Ultra HD 錄影，新的 6 麥克風陣列可消除超過 90% 背景噪音。Meta Glasses 系列擴大：最平價的 Meta Adventurer 249 美元、Meta Glasses by LISA 399 美元、Kylie Edition 新配色 399 美元；Meta 預告年底前在 Ray-Ban、Oakley 與 Meta Glasses 三大系列合計提供超過 100 種眼鏡選擇。眼鏡連結個人 AI 代理 Muse，可在不拿出手機的情況下協助日常事務。新市場包括新加坡、南韓、墨西哥、阿聯，巴西即將推出。
- 權重：7/10
- 發布日期：2026-09-23
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `"datePublished":"2026-09-23T11:36:25+00:00"`。中央社 09-24 報導（https://www.cna.com.tw/news/ait/202609240254.aspx）為中文替代來源，數字（43 公克、23 種組合、349 美元、10 月 13 日）與原頁一致。與前期引用的 iPhone Duo 摺疊手機（09-10）為不同事件；本期同系列（Meta Connect）只取此一場。廠商自述。

### 23. 世界先進與恩智浦新加坡 12 吋廠 9 月 28 日開幕，聯電同步擴產新加坡
- 原始標題：多元產能需求驅動　台灣半導體廠擴大新加坡布局
- 標題：世界先進與恩智浦新加坡 12 吋廠 9 月 28 日開幕，聯電同步擴產新加坡
- URL：https://www.cna.com.tw/news/afe/202609250084.aspx
- 摘要：世界先進與恩智浦（NXP）合資的新加坡 12 吋廠 VSMC 將於 9 月 28 日開幕，從平地到建好 12 吋晶圓廠僅花 22 個月，今年 6 月產出首批 40 奈米晶圓，良率超過 99%。VSMC 採用 30 至 40 奈米技術，生產矽中介層以及混合訊號、電源管理和類比晶片，技術授權與移轉來自台積電，預計 2027 年第 1 季如期量產，目前產能已預售一空，2029 年可達滿載月產 4.4 萬片；世界先進已針對 VSMC 第 2 座晶圓廠進行討論規劃。聯電新加坡 12 吋廠 P1 與 P2 合計月產能約 6 萬片，P3 約 1.2 萬至 1.3 萬片、預計明年上半年擴至 1.8 萬片並朝滿載 3 萬片推進，P4 已展開無塵室建置與設備採購、預計 2028 年下半年量產，初期規劃提供矽光子產能；P1 至 P3 採用與台灣相同製程，目前產能利用率超過 90%。聯電指出新加坡是其台灣以外最大生產基地，因應客戶對供應鏈韌性地理多元化的需求。
- 權重：7/10
- 發布日期：2026-09-25
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `"datePublished":"2026-09-25T11:41:00+08:00"`。TechNews 同日有同標題文章（https://technews.tw/2026/09/25/taiwan-semiconductor-expands-singapore-footprint-diverse-capacity-demand/，發布日期 2026-09-25 12:10），內容為中央社授權轉載，不重複收錄。開幕日 9 月 28 日為活動日，非本篇發布日。

### 24. IFR 首次統計：2025 年全球售出約 7,000 台人形機器人，美銀估今年 9 萬台
- 原始標題：2025全球售出7000台人形機器人　美銀估今年9萬台
- 標題：IFR 首次統計：2025 年全球售出約 7,000 台人形機器人，美銀估今年 9 萬台
- URL：https://www.cna.com.tw/news/ait/202609210133.aspx
- 摘要：國際機器人聯盟（IFR）彙整的數據顯示，2025 年全球約有 7,000 台人形機器人售出，用於工業與專業服務領域，這是 IFR 編撰機器人統計 30 年來首次在工業與服務型機器人之外蒐集人形機器人數據。依 IFR 定義，人形機器人須具備類人外觀並能在為人類設計的環境中自主運作，但不要求有腿部構造；統計不含消費型與軍用人形機器人，醫療機器人另外歸類。IFR 秘書長比勒（Susanne Bieller）表示人形機器人在全球機器人總數中仍只占一小部分，2025 年售出的許多台並未從事生產性工作，而是被研究機構或企業買來產生資料以改善 AI 模型；汽車製造商是早期採用者，在工廠內以個位數或雙位數台數試驗。相較之下，2024 年全球安裝約 54 萬 2,000 台常規工業機器人、售出約 19 萬 9,000 台服務型機器人。美國銀行全球研究部門估計 2026 年人形機器人出貨量將達 9 萬台、2030 年達 120 萬台。
- 權重：7/10
- 發布日期：2026-09-21
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `"datePublished":"2026-09-21T14:53:00+08:00"`。原頁為中央社編譯路透社報導，IFR 原始數據頁未另行查核。原頁提到 2025 年工業與服務型機器人數據將於 9 月 24 日發布，該後續數據不在本篇。

### 25. Cloudflare 在 Cache Rules 加入 Vary 標頭支援
- 原始標題：We just shipped support for the ugliest part of HTTP: Vary
- 標題：Cloudflare 在 Cache Rules 加入 Vary 標頭支援
- URL：https://blog.cloudflare.com/vary-support/
- 摘要：Cloudflare 宣布在 Cache Rules 中支援 HTTP `Vary` 回應標頭，讓管理者決定每個由來源伺服器宣告會影響回應的請求標頭該如何處理。設定分兩階段：來源伺服器透過 `Vary` 宣告哪些請求標頭會影響回應，管理者再於 Cache Rules 為每個標頭選擇三種動作之一——Normalize（正規化：小寫化、依品質值排序、過濾為已設定的格式或語言，讓等價請求共用同一份快取；`Accept`、`Accept-Language`、`Accept-Encoding` 會自動套用）、Passthrough（保留大小寫、空白與順序等精確值作為快取鍵）、Bypass（變化不可預測或個人化時直接不快取）。文中引用的外部分析指出有將近 3,000 個網站在四個以上欄位上 Vary，部分甚至 Vary 於 10、23 乃至 47 個欄位。功能對 Free、Pro、Business、Enterprise 所有方案開放，可從儀表板 Caching > Cache Rules 設定，也支援 Rulesets API 與 Terraform。
- 權重：8/10
- 發布日期：2026-09-22
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `"datePublished":"2026-09-22T14:04:31.803Z"`。功能公告屬廠商自述。與前期引用的 Cloudflare 文章為不同主題。

### 26. Cloudflare Python Workers 正式版釋出
- 原始標題：Python Workers are now generally available
- 標題：Cloudflare Python Workers 正式版釋出
- URL：https://blog.cloudflare.com/python-workers-ga/
- 摘要：Cloudflare 宣布 Python Workers 正式發布（GA），Python 成為 Cloudflare 開發者平臺的第一級、完整支援語言。過去 Python 套件沒有標準方法交叉編譯到 WebAssembly，Cloudflare 因此提出 PEP 783 以標準化 PyEmscripten 平臺，並穩定既有的 Pyodide 建置工具鏈、在 cibuildwheel 加入支援，讓套件維護者能產出相容 WebAssembly 的 wheel。Python Workers 現可透過 WSGI／ASGI 連接器執行 FastAPI、Django、Flask 等框架，支援 OpenAI、LangChain、MCP 等 AI 程式庫，並可經 Hyperdrive 使用 aiomysql、asyncpg 資料庫驅動；同時能直接整合 Workers AI、R2、D1、Queues、Workflows、Durable Objects，不需 JavaScript 膠水程式碼。Cloudflare 表示後續重點是讓 Python Workers 更高效能、更省記憶體。
- 權重：8/10
- 發布日期：2026-09-21
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `"datePublished":"2026-09-21T13:00:00.000Z"`。原頁沒有 Python 版本號、效能數據、限制或定價資訊，摘要未補入。廠商自述。

### 27. Meta 宣布 Petal 跨大西洋海纜，首條 1 Pb/s 級跨洋海纜
- 原始標題：Announcing Petal, a First-of-its-Kind Transoceanic Subsea Cable
- 標題：Meta 宣布 Petal 跨大西洋海纜，首條 1 Pb/s 級跨洋海纜
- URL：https://about.fb.com/news/2026/09/announcing-petal-meta-petabit-transoceanic-cable/
- 摘要：Meta 宣布名為 Petal 的跨洋海底纜線系統，稱其為第一條在跨洋路線上部署、具備 petabit 等級容量的海纜：設計容量為每秒 1 petabit，是目前最先進跨洋海纜的兩倍，Meta 形容約等於全球 75% 人口同時串流音樂所需的網路容量。纜線長度約 7,000 公里（超過 4,300 英里），橫越大西洋連接美國與法國。合作夥伴包括海纜系統專業廠 NEC、光纖大廠住友電工（Sumitomo Electric Industries），以及負責法國大西洋岸登陸站的電信商 Orange。技術上採用多芯光纖（multi-core fiber），在不需等比例增加電力或實體設施的情況下讓容量翻倍，Meta 稱這是跨洋海纜有史以來最大的單一世代容量提升。預計 2029 年投入服務。
- 權重：8/10
- 發布日期：2026-09-21
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `"datePublished":"2026-09-21T12:00:18+00:00"`。廠商自述，「首條」「有史以來最大」為 Meta 自評。與前期引用的台馬 4 號海纜（cna 09-18）為不同海纜、不同事件。

### 28. SANS ISC：HTTP QUERY 方法進入既有 Web 生態系，安全控制需重新檢視
- 原始標題：HTTP QUERY Method: The Grey Zone Between GET And POST.
- 標題：SANS ISC：HTTP QUERY 方法進入既有 Web 生態系，安全控制需重新檢視
- URL：https://isc.sans.edu/diary/33352
- 摘要：SANS Internet Storm Center 分析人員 Xavier Mertens 於 9 月 18 日撰文指出，IETF 在 2026 年 6 月發布 RFC 10008，正式定義新的 HTTP 方法 QUERY，是自 2010 年 PATCH 以來第一個新的標準 HTTP 動詞。QUERY 介於 GET 與 POST 之間，可理解為「帶有本文的 GET」：安全、冪等，查詢內容放在請求本文而非 URL，並明確支援快取；伺服器透過新的 `Accept-Query` 回應標頭宣告接受的本文格式。支援現況：Nginx 會代理 QUERY 但不快取，FastAPI 明確路由可接受，Django 的 View 類別直接拒絕。安全風險在於 WAF、API 閘道白名單與 CSRF 中介層都寫在 QUERY 存在之前：只綁定 POST 的 WAF 簽章可被 QUERY 本文繞過；快取鍵未納入本文可能造成快取投毒；CSRF 中介層若忽略會改變狀態的 QUERY 端點也可能被繞過。作者尚未在日誌見到正式環境使用 QUERY，但建議先把方法白名單加上 QUERY。
- 權重：7/10
- 發布日期：2026-09-18
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自頁面「Published: 2026-09-18」。iThome 09-21 報導（https://www.ithome.com.tw/news/179087）為中文替代來源，內容與原文一致。RFC 10008 發布於 6 月，本篇以 9 月 18 日的 ISC 分析為引用點。

### 29. 核安會核定核三廠再運轉計畫，台電後續須提交執行結果報告
- 原始標題：核安會核定核三再運轉計畫　台電後續須提交執行結果報告
- 標題：核安會核定核三廠再運轉計畫，台電後續須提交執行結果報告
- URL：https://www.cna.com.tw/news/afe/202609240313.aspx
- 摘要：核安會 9 月 24 日透過新聞稿表示已完成核三廠再運轉計畫審查作業並核定計畫，台電之後須依核定計畫辦理後續工作、提出執行結果報告再送核安會審查。核安會說明，收到再運轉計畫後即規劃安全審查、現場視察及公眾參與，並邀集外部專家學者與會內同仁組成審查團隊；依「核三廠運轉執照換發申請案再運轉計畫安全審查報告摘要版」，計畫歷經 3 回合審查，審查團隊共提出 589 項審查意見，台電均已回復說明，審查結論認為台電已妥善規劃將機組恢復到可運轉狀態的各項工作，符合「核子反應器設施運轉執照申請審核辦法」及「核子反應器設施再運轉計畫審查導則」。核安會強調本次完成的是再運轉計畫審查，後續仍有多項程序與安全管制作業；台電正辦理老化評估與管理、輻射相關議題查核評估、耐震安全評估等自主安全檢查，提交報告後核安會將嚴格審查及現場查證。
- 權重：7/10
- 發布日期：2026-09-24
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：curl 取得 HTTP 200，日期出自 `"datePublished":"2026-09-24T19:10:00+08:00"`。原頁未提及重啟時程或供電量，摘要未補入。同日中央社另有「松湖變電所動工、擬 2029 年完工」（202609240176），列於淘汰候選作為替代。與前期引用的資料中心用電（TrendForce、EIA）為不同事件。

### 30. Anthropic 砸百億美元擴算力　Akamai 拿下雲端大單
- 原始標題：Anthropic砸百億美元擴算力　Akamai拿下雲端大單
- 標題：Anthropic 砸百億美元擴算力　Akamai 拿下雲端大單
- URL：https://www.cna.com.tw/news/ait/202609250065.aspx
- 摘要：中央社 9 月 25 日綜合外電報導，Anthropic 承諾向 Akamai Technologies 支付 116 億美元購買雲端服務，Akamai 並將發行認股權證，讓 Anthropic 未來持股比例最高可達 5%。依這項 7 年期合約，認股權證給予 Anthropic 以每股 111.33 美元購買 B 輪優先股的權利，轉換後約當 770 萬股 Akamai 普通股；其中約 2% 流通普通股與 116 億美元合作金額掛鉤，其餘 3% 需雙方將協議再增加 90 億美元才生效。Akamai 盤後股價一度大漲約 20%。Akamai 預期交易不影響全年營收預測，但 2026 年資本支出將增加約 17 億美元，用於取得並預先採購支援合約所需的零組件（包括記憶體），並已授權電子製造商捷普科技（Jabil）採購約 17 億美元的記憶體零組件。報導另提及路透社 8 月曾報導 Anthropic 同意斥資 450 億美元向 Nscale 租用西維吉尼亞州資料中心園區的 AI 雲端算力。
- 權重：7/10
- 發布日期：2026-09-25
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：主編以 curl 取得 HTTP 200，日期出自 JSON-LD `datePublished` 2026-09-25T11:03:00+08:00。中央社編譯外電，Akamai 官方新聞稿未另行查核。A 組原列為淘汰候選 L 並建議改歸基礎建設分類，主編採納。

### 31. 金管會開放銀行申請試辦存款代幣業務
- 原始標題：金管會開放銀行申請試辦存款代幣業務
- 標題：金管會開放銀行申請試辦存款代幣業務
- URL：https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202609220001&dtable=News
- 摘要：金管會 9 月 22 日宣布開放銀行申請試辦存款代幣業務，理由是因應現實世界資產（RWA）代幣化的發展並參酌國際間存款代幣的進展，讓銀行有空間發展存款代幣的實際運作模式、技術應用與風險管理機制，作為未來監理制度與法規調適的參考。金管會定性存款代幣為「將銀行存款以區塊鏈等新型態方式表彰或記錄」，法律性質仍屬銀行存款，原則上依現行銀行法等法規辦理，屬既有商業模式的擴展，因此銀行可依「金融業申請業務試辦作業要點」提出申請。營業計畫書須具體說明五項事項：試辦範圍與使用場景；發行、移轉、贖回及銷毀流程，以及與現行存款、匯款作業的差異分析；存款帳務與代幣帳本的勾稽、對帳及控管機制；所使用的技術架構、系統運作方式與安全控管機制，例如分散式帳本或區塊鏈架構、節點、錢包及智能合約；試辦屆滿或停止時的贖回、銷毀與客戶權益保障機制。金管會表示將透過試辦瞭解市場需求、業務運作與風險，適時研議修正監理制度與法令。
- 權重：9/10
- 發布日期：2026-09-22
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：主編重抓原頁補齊營業計畫書第三、四項（C 組抓取時被截斷）。curl 200；日期出自新聞稿正文「於今日（22 日）開放」與列表頁 dataserno=202609220001，頁尾「更新日期：2026-09-24」為網站更新時間，非發布日。與前期已引用的央行黃金代幣（09-18）、王道銀穩定幣跨境收款（09-11）為不同事件。經濟日報 09-22 另有「台新銀行將為首家申請銀行」報導，該細節不在金管會原頁，摘要未寫入。

### 32. 【AI 轉型實例 1 下篇】玉山銀行打造全行 AI 代理入口，首度揭露新一代 GENIE 關鍵 Agentic 技術框架
- 原始標題：【AI轉型實例1下篇】玉山銀行打造全行AI代理入口，首度揭露新一代GENIE關鍵Agentic技術框架
- 標題：【AI 轉型實例 1 下篇】玉山銀行打造全行 AI 代理入口，首度揭露新一代 GENIE 關鍵 Agentic 技術框架
- URL：https://www.ithome.com.tw/news/179124
- 摘要：玉山金控首度公開預計 9 月底上線的新一代生成式 AI 平臺 GENIE 3.0。玉山銀行智金處資料科學總監廖子慧表示，第三代最大變革是全面擁抱代理式 AI，三大特色為整合行內多款 AI 代理、知識管理（KM）標準化，以及建立 Skills 生態系；使用者透過不同前端介面提出需求，由統一的 GENIE Root Agent 判讀意圖，再透過 REST API 或 MCP 呼叫對應的行內服務或各類 Agent。專案 PM 侯貫中說明「API 全面 Agent 化」是設計原則之一，將既有 API 封裝成可由 MCP 調用的形式，由 Root Agent 統一管理；2.0 版的 Prompt 模板庫在 3.0 變成技能與工具儲存庫（Skill & Tool Registry），把業務單位 SOP 寫成技能檔，讓 LLM 知道流程需要哪些 API 或工具。平臺另有權限控管、費用管理、資安與個資防護，以及可切換商用 LLM 或地端開源模型的模型平臺模組。所有 Agent 應用與供 Agent 調用的工具都須依循玉山自訂的 Agentic Framework 開發並上架到工具庫登記。
- 權重：8/10
- 發布日期：2026-09-22
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl 帶瀏覽器 UA 回 200，發布日在 `class="created"`：2026-09-22。iThome 同系列另有上篇（179111，09-22，GENIE 2.0 每月 14 億 Token、月成本不到 5 萬元）與總覽（179148，09-23）；「14 億 Token」等數字出自上篇，不在本篇原頁，摘要未寫入。與 09-19 期引用的國泰金 AI 數位同事為不同公司、不同事件。頁面說 3.0「即將在 9 月底上線」，屬未來時程。

### 33. SEC 發布「創新豁免」促進代幣化 NMS 股票交易並徵求意見
- 原始標題：SEC Issues “Innovation Exemption” to Facilitate the Trading of Tokenized NMS Stock and Request for Comment
- 標題：SEC 發布「創新豁免」促進代幣化 NMS 股票交易並徵求意見
- URL：https://www.sec.gov/newsroom/press-releases/2026-90-sec-issues-innovation-exemption-facilitate-trading-tokenized-nms-stock-request-comment
- 摘要：美國證券交易委員會（SEC）9 月 17 日發布命令，對「代幣化證券交易場所」（Tokenized Securities Venue，TSV）給予暫時性、附條件的豁免，使其不落入 1934 年證券交易法「交易所」定義，可用經許可的自動做市商與流動性池（AMM Liquidity Pools）交易代幣化的全國市場系統（NMS）股票。TSV 的定義是提供一個以上 AMM 流動性池讓經許可的參與者撮合交易，並訂定參與者的存取標準。命令同時暫時豁免在 TSV 流動性池以自有資本提供代幣化 NMS 股票流動性者的「交易商」（dealer）身分認定。SEC 主席 Paul S. Atkins 表示這是在法定授權內讓美國資本市場進入數位時代的重要一步，豁免雖為暫時，但可讓 TSV 今天就在許可環境中交易，同時委員會考慮是否需要進一步行動並徵求公眾意見；交易與市場部門主任 Jamie Selway 稱這是委員會開放資本市場給代幣化證券的里程碑。
- 權重：8/10
- 發布日期：2026-09-17
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：sec.gov 對一般瀏覽器 UA 回 403「Request Rate Threshold Exceeded」，改用宣告式 UA（含聯絡資訊）後回 200。頁面無 `datePublished` meta，日期取自頁面日期列「Sept. 17, 2026」（出現兩次）。技術媒體報導的「Coinbase、Robinhood 股價大漲」等細節不在 SEC 原頁（「豁免自刊登起 5 年後到期」原頁有載），摘要未寫入；TechNews 09-21 轉載 MoneyDJ 的同事件報導列在淘汰候選 E。

### 34. 金管會督導證交所及櫃買中心建置「臺股儀表板」上線 揭示三大面向資訊
- 原始標題：金管會督導證交所及櫃買中心建置「臺股儀表板」上線 揭示三大面向資訊
- 標題：金管會督導證交所及櫃買中心建置「臺股儀表板」上線 揭示三大面向資訊
- URL：https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202609220002&dtable=News
- 摘要：金管會表示今年以來臺股交投熱絡、指數屢創新高，為便利投資人掌握整體交易動態與潛在風險，督導臺灣證券交易所及證券櫃檯買賣中心建置「臺股儀表板」，9 月 23 日在兩單位官網同步上線。儀表板定位為一站式數據觀測介面，優先整合「授信業務」、「違約概況」及「上市櫃公司營收」三大面向，包含信用交易的擔保維持率與追繳處分戶數及金額、不限用途款項借貸融通餘額與擔保維持率、全市場違約總人數，以及營收變化與產業別趨勢等指標。介面以視覺化圖表呈現，預設顯示最近 5 個交易日的動態走勢並提供歷史資料查詢，部分指標加註定義說明與風險警語。金管會將責成兩單位持續擴充儀表板功能與指標。
- 權重：6/10
- 發布日期：2026-09-22
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：curl 200。日期以列表頁 dataserno=202609220002 與正文「明日(9月23日)上線」推得發布日為 09-22；頁尾「更新日期：2026-09-24」為網站更新時間。屬資本市場資訊服務，與金融科技的關聯是資料視覺化與公開資料，權重中等，可作第 5 筆或備援。

### 35. 奇美推 AI 助急診醫師　30 秒生成病歷摘要還可追問
- 原始標題：奇美推AI助急診醫師　30秒生成病歷摘要還可追問
- 標題：奇美推 AI 助急診醫師　30 秒生成病歷摘要還可追問
- URL：https://www.cna.com.tw/news/ahel/202609210087.aspx
- 摘要：奇美醫院與數位發展部數位產業署、工研院合作開發「智慧急診病歷摘要系統」，9 月 21 日舉行發表會。系統運用地端醫療專用大語言模型、邊緣運算及病歷資料，病人掛號後即開始整理相關病歷，約 30 秒生成一頁式病歷摘要，醫師看診前「一鍵開啟」即可掌握重要病史與近期醫療資訊，並可回答醫師追問的細節。院長林宏榮表示，過去醫師要登入多個系統逐一查詢，再花 5 至 10 分鐘人工彙整，系統可縮短搜尋與整理時間。急救醫學科主任張敬弘說明，系統採地端邊緣運算方案，不需與外部網路連結，敏感醫療資訊留在院內；定位為「醫療資訊助手」，先完成繁瑣的資料擷取與摘要整理，醫師負責解讀資訊與醫療決策。
- 權重：8/10
- 發布日期：2026-09-21
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200，`datePublished` 2026-09-21T12:43:00+08:00。與 09-13 期引用的「AI 病歷漏抓非語言細節」（研究）、「醫療影子 AI 病歷資安」為不同事件；與 09-19 期華碩 xHIS 為不同醫院、不同系統。原頁未提供經費金額或導入院數。

### 36. 「健康幣」10/1 上線 卓揆盼養成國人健康習慣新模式 促進國人健康、落實「健康台灣」願景
- 原始標題：「健康幣」10/1上線 卓揆盼養成國人健康習慣新模式 促進國人健康、落實「健康台灣」願景
- 標題：「健康幣」10/1 上線 卓揆盼養成國人健康習慣新模式 促進國人健康、落實「健康台灣」願景
- URL：https://www.mohw.gov.tw/cp-16-88024-1.html
- 摘要：行政院長卓榮泰 9 月 17 日在行政院會聽取衛福部「健康幣政策推動規劃」報告。「健康幣」政策將於 2026 年 10 月 1 日上線，民眾下載健保快易通 APP，填寫生活型態量表，或完成健康檢查、癌症篩檢、施打疫苗等健康促進項目即可累積健康幣，累積滿 1,000 幣後可至指定通路兌換健康商品、醫療服務、運動課程等；響應單位包括壽險業者、醫療機構、運動場域、社區藥局、零售與量販商家。卓院長要求衛福部注意高齡長者與數位落差民眾的需求，從學校、運動、交通、職場、健康產業及社區擴大累積項目，並會同運動部研議健康幣與運動幣的整合加值機制；上路後持續檢討績效並及早提出第二階段規劃，同時重視個資保護、資安維護與資料治理。
- 權重：7/10
- 發布日期：2026-09-17
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200，頁面 `<time>` 115-09-17（民國年）。屬數位健康政策而非醫療器材或臨床 AI，歸醫療科技是因為載體是健保 APP 與健康存摺。「註冊送 300 幣」「1 幣抵 1 元」「12 月開放兌換」等細節出自其他媒體，不在衛福部原頁，摘要未寫入。10 月 1 日是實施日，不是發布日。

### 37. MIT 以 LLM 建立自殺風險詞庫，輕量模型從危機簡訊估計風險
- 原始標題：Estimating suicide risk from text
- 標題：MIT 以 LLM 建立自殺風險詞庫，輕量模型從危機簡訊估計風險
- URL：https://news.mit.edu/2026/estimating-suicide-risk-from-text-0924
- 摘要：MIT McGovern 腦研究所 Satra Ghosh 團隊與前研究生 Daniel Low 開發一套語言處理工具，能從與危機諮商人員的文字對話估計自殺風險，研究 9 月 24 日刊於《Journal of Psychopathology and Clinical Science》。團隊先用 AI 產生與已知風險因子相關的詞句初稿，再人工審核，最終詞庫涵蓋 49 項風險因子、每項約 60 個詞或片語，並由臨床專家確認相關性；接著訓練機器學習模型在 Crisis Text Line 約 16,000 則去識別化對話中搜尋詞庫並預測風險，對話依 Crisis Text Line 評估分為非自殺、有意念但無立即風險、立即風險三級。結果顯示提及致命手段與物質使用者比表達憂鬱情緒或疲倦者更可能屬最高風險組。預測模型是輕量、可解釋的模型，可在個人電腦執行並標示觸發的詞句；團隊公開詞庫與建構詞庫的軟體套件，並強調任何預測模型臨床使用前都須充分驗證、需有人在迴路中。
- 權重：7/10
- 發布日期：2026-09-24
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200，頁面 `<time datetime="2026-09-24T21:00:00Z">`，MIT News RSS pubDate 亦為 09-24。與 09-19 期引用的 MIT xvr 手術 X 光對齊（09-16）、09-13 期的 MIT 奈米裝置為不同研究。研究階段，尚未臨床部署。

### 38. FDA 正式駁回放射科 AI 偵測與分診軟體部分豁免 510(k) 的請願
- 原始標題：Medical Devices; Exemption From Premarket Notification: Radiology Computer-Aided Detection and/or Diagnosis Devices and Computer-Aided Triage and Notification Devices
- 標題：FDA 正式駁回放射科 AI 偵測與分診軟體部分豁免 510(k) 的請願
- URL：https://www.federalregister.gov/documents/2026/09/17/2026-19074/medical-devices-exemption-from-premarket-notification-radiology-computer-aided-detection-andor-diagnosis-devices-and-computer-aided-triage-and-notification-devices
- 摘要：美國 FDA 在聯邦公報刊登最終命令，就放射科電腦輔助偵測／診斷（CAD）與電腦輔助分診通知（CADt）器材的部分上市前通知豁免作出最終決定。該案源於 2025 年 12 月 29 日公告收到的請願，請願要求在符合特定條件時，豁免四類通用器材的 510(k) 上市前通知：疑似癌症病灶的放射科電腦輔助診斷軟體、醫學影像分析器、放射科電腦輔助分診通知軟體，以及放射科電腦輔助偵測與診斷軟體。FDA 已於 2026 年 4 月 1 日回覆請願人駁回請願，並依《聯邦食品、藥品及化妝品法》程序刊登此命令；文件類型為 Final order，發布與生效日均為 2026 年 9 月 17 日。
- 權重：7/10
- 發布日期：2026-09-17
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：curl 200，`article:published_time` 2026-09-17；另以 federalregister.gov API（documents/2026-19074.json）取得 abstract 與 action 欄位。摘要只用 abstract 與 API 欄位；「收到 45 則以上意見」「FDA 認為持有 510(k) 不代表製造商熟悉開發流程」等細節出自 AuntMinnie、BioWorld 等媒體，不在原頁，摘要未寫入；請願人 Harrison.ai 原頁第 III 節有載（on behalf of Harrison.ai）。駁回決定本身是 4 月 1 日，本期新事件是 9 月 17 日的正式刊登命令。

### 39. MIT 開發可被腸胃道吸收的電池，可驅動 RFID 標籤與胃部電刺激膠囊
- 原始標題：Batteries that safely break down in the GI tract could improve ingestible devices
- 標題：MIT 開發可被腸胃道吸收的電池，可驅動 RFID 標籤與胃部電刺激膠囊
- URL：https://news.mit.edu/2026/batteries-safely-break-down-in-gi-tract-could-improve-ingestible-devices-0921
- 摘要：MIT 機械工程教授 Giovanni Traverso 團隊以人體可安全攝入的材料製作出可生物吸收（bioresorbable）的微型電池，用來驅動可吞服的電子裝置，研究刊於《Nature Chemical Engineering》，第一作者為前博士後研究員 Mehmet Girayhan Say。電池以鎂作為陽極、三氧化鉬作為陰極，搭配離子液體凝膠電解質，整顆電池可在體內完全分解吸收；團隊設計了直徑 7.5 公釐的圓片與長 24 公釐的長條兩種版本。在模擬胃酸的高酸性溶液中，電池可正常運作約三天，之後效能緩慢下降並在數週內完全分解。電池可產生 1.84 伏特，實驗顯示可驅動兩種裝置：一是 2023 年提出的可降解電刺激膠囊，能連續刺激胃壁最長三天，動物實驗中 20 分鐘刺激可讓飢餓素（ghrelin）濃度提高約 50%；二是協助病人遵循服藥時程的 RFID 膠囊，改用電池供電後可從腸胃道持續發送訊號，距離最遠 1.5 公尺。團隊預計約兩年後啟動 SAFARI 系統的臨床試驗。研究經費來自 Novo Nordisk、MIT 機械工程系、布萊根婦女醫院與美國 ARPA-H。
- 權重：7/10
- 發布日期：2026-09-21
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：主編以 curl 取得 HTTP 200，日期出自 `<time datetime="2026-09-21T15:00:00Z">`，期刊名稱自原頁「appears today in Nature Chemical Engineering」核對。C 組原列為淘汰候選 L（控制 MIT News 同站筆數），主編改為正式，取代科技新報編譯的器官老化研究。研究階段，尚未進入人體試驗。

### 40. 臺鐵智慧鐵道成果亮相柏林國際軌道交通技術展 AI 洗車、平交道智慧偵測展現國產研發實力
- 原始標題：臺鐵智慧鐵道成果亮相柏林國際軌道交通技術展 AI洗車、平交道智慧偵測展現國產研發實力
- 標題：臺鐵智慧鐵道成果亮相柏林國際軌道交通技術展 AI 洗車、平交道智慧偵測展現國產研發實力
- URL：https://www.railway.gov.tw/tra-tip-web/tip/tip009/tip911/newsDtl?newsNo=8ae4cac3a0ca8f5401a0cdffd69507c1&page=0
- 摘要：德國柏林國際軌道交通技術展（InnoTrans 2026）9 月 22 日登場，臺鐵公司首度攜手工研院與通訊系統整合廠商至鴻科技參展，在臺灣館（Hall 11.2）展出兩項已實際應用於臺鐵營運的智慧科技，中華電信亦展示與臺鐵合作開發的 TCMS 無線傳輸技術。「智慧化列車自動洗車設備」具備 AI 影像辨識，能辨識進站列車車型並自動切換最適合該車種的洗車模式，依車廂材質選擇毛刷或水刀清洗，後台管理平台可監測用水量及用電量。「平交道障礙物自動偵測系統」針對台灣複雜的平交道環境與多雨天氣，採用熱影像攝影機及毫米波雷達雙重偵測器，24 小時掃描平交道淨空區域，透過智慧邏輯決策系統做資料融合（Data Fusion）與判讀；偵測到障礙物進入淨空區時即時發出無線電防護告警並啟動預警燈光，通知司機員煞車。系統為國內自主開發，未來可自行升級軟體，不必仰賴國外廠商。
- 權重：7/10
- 發布日期：2026-09-23
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl 200。發布日出自臺鐵官網新聞列表頁日期「2026/09/23」，內文頁本身無日期 meta，標題下方有「發佈日期：2026/9/23 下午 5:00」。蕃新聞 09-24 為同一新聞稿全文轉載，可互相印證。與第 12 筆為同一展會但不同主體（臺鐵技術成果 vs 交通部政策專訪），與淘汰候選 O（德鐵合作備忘錄）亦為同展會的不同事件；建議至多收其中兩筆。

### 41. 柏林軌道展台灣產業拚國際　陳世凱：AI、資通訊是競爭優勢
- 原始標題：柏林軌道展台灣產業拚國際　陳世凱：AI、資通訊是競爭優勢
- 標題：柏林軌道展台灣產業拚國際　陳世凱：AI、資通訊是競爭優勢
- URL：https://www.cna.com.tw/news/ahel/202609240330.aspx
- 摘要：全球最大軌道交通技術展柏林軌道展（InnoTrans）9 月 22 日登場，適逢展會 30 週年，台灣首度設立台灣館，由交通部鐵道局整合產官學研資源帶領本土軌道業者參展，主題為「Powering Railway Resilience from Taiwan」。交通部長陳世凱接受中央社專訪表示，台灣過去軌道投資集中在硬體並大量採用國外產品，隨高鐵、台鐵與各縣市捷運、輕軌陸續建設，形成多元營運場域，政府近 10 多年持續輔導本土產業；未來 10 年是台灣軌道產業發展關鍵期，AI、資通訊及數位孿生等科技優勢可望成為業者進軍海外的競爭力。他坦言車輛設計、系統整合、核心機電及軌道產品測試與驗證能力仍需補強。他並以展場看到的台灣業者技術為例，列車前方攝影機可提早偵測軌道遠方掉落物或靜止障礙物，增加反應與煞停時間，說明交通韌性與科技的結合。
- 權重：7/10
- 發布日期：2026-09-24
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl 200，`datePublished` 2026-09-24T19:33:00+08:00。經濟日報 09-23 另報導台灣館「14 家產官學研單位、另 26 家廠商、合計 40 家」，該數字不在中央社原頁，摘要未寫入。中央社 09-23 另有開幕報導（aopl/202609230020），本筆以專訪為主。

### 42. ARTC 智慧座艙監控技術 導入國內首輛 Level 3 自駕電動巴士
- 原始標題：ARTC智慧座艙監控技術 導入國內首輛Level 3自駕電動巴士
- 標題：ARTC 智慧座艙監控技術 導入國內首輛 Level 3 自駕電動巴士
- URL：https://ec.ltn.com.tw/article/breakingnews/5577137
- 摘要：車輛研究測試中心（ARTC）在 2026 TIE 台灣創新技術博覽會展出自主研發的「高抗遮蔽之 AI 駕駛視線追蹤技術」與「橫向主動安全系統」兩項智慧座艙監控技術，已導入國內首輛 Level 3 自駕電巴。視線追蹤技術可同步分析駕駛頭部姿態、注視方向及眼睛開閉狀態，推估注視落點與軌跡，即使配戴口罩、墨鏡、頭巾，或處於低光源隧道、晨昏強逆光等環境仍能穩定辨識；因應 UN R171（駕駛視線專注監測）與 R157（駕駛接管能力）法規需求，可即時判斷疲勞樣態、支援警示與人機接管，只需約 10 TOPS 算力的 AI 邊緣運算裝置即可即時運作，並可結合生物雷達偵測呼吸、心跳等生理訊號。該技術已取得多國專利並導入台灣自駕電動巴士車廠，未來可擴大應用於駕駛訓練模擬器與車輛研發前期的模擬試驗。
- 權重：7/10
- 發布日期：2026-09-17
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl 200，`article:published_time` 2026-09-17T15:16:31+08:00。其他媒體（NOWnews 09-17）另列出該 Level 3 電巴的合作廠商名單與「符合 UN R157」等細節，不在自由財經原頁，摘要未寫入。「橫向主動安全系統」原頁另有 ESF 緊急避障、主動車道變換與 MRM 最小風險管理等段落，摘要只寫視線追蹤部分。TIE 展期 9 月 17 至 19 日為活動日，發布日以文章為準。

### 43. Waymo 公布 2.7 億英里自駕安全數據：受傷事故減少 82%
- 原始標題：From the road — September 24, 2026
- 標題：Waymo 公布 2.7 億英里自駕安全數據：受傷事故減少 82%
- URL：https://waymo.com/blog/shorts/safetydata-september26/
- 摘要：Waymo 更新安全表現分析，涵蓋截至 2026 年 6 月底、超過 2.7 億英里的全自駕營運里程，分析範圍為亞特蘭大、奧斯汀、洛杉磯、鳳凰城與舊金山五個主要服務區。不論肇責歸屬，Waymo Driver 涉及的受傷事故比人類駕駛少 841 起，減少 82%；嚴重受傷以上的事故減少 95%（少 20 倍）。對弱勢用路人的影響更明顯：涉及行人的受傷事故減少 93%、自行車騎士減少 86%、機車騎士減少 82%。Waymo 估計至少 841 人因此避免了原本會發生的交通事故傷害（以每起事故至少一人受傷的保守基準計算）。文中並連結完整數據與方法論頁面，以及部署前正式安全審查所用的接受準則論文。
- 權重：8/10
- 發布日期：2026-09-24
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl 200。頁面無 `datePublished` meta，日期取自 `<title>`「September 24, 2026 - From the road」與 h1「From the road — September 24, 2026」。廠商自評數據，但方法論公開。與 09-19 期引用的 Waymo 新加坡（09-17）、東京（09-15）為不同事件；同站另有 09-14 拉斯維加斯（第 15 筆）與 09-22 transit rewards（淘汰候選 P），建議同站至多收兩筆。

### 44. Waymo 在拉斯維加斯開放公眾乘車，Ojai 車款為主力車隊
- 原始標題：Vegas, Deal Us In! We’re welcoming riders today
- 標題：Waymo 在拉斯維加斯開放公眾乘車，Ojai 車款為主力車隊
- URL：https://waymo.com/blog/2026/09/ride-in-las-vegas/
- 摘要：Waymo 9 月 14 日宣布即日起在拉斯維加斯為首批公眾乘客提供全自駕行程，服務區約 24 英里，範圍從 Boulder Junction 沿 Strip 大道到 Sahara Avenue，並連接 Spring Valley 邊緣到 Winchester，目的地包括 Allegiant Stadium 與 The Venetian。Waymo 表示經過數月研究當地道路後，已有超過 10 萬人表達乘車意願；拉斯維加斯將與丹佛、聖地牙哥一同成為首批以搭載第 6 代 Waymo Driver 的 Ojai 車款為主力車隊的城市。Waymo 稱其安全紀錄顯示 Waymo Driver 在相同里程下涉及嚴重受傷以上事故比人類駕駛少 94%，後續會逐步開放 Clark County 更多乘客。拉斯維加斯市長 Shelley Berkley 表示全電動自駕叫車服務有助市內文化區與社區中心之間的移動。
- 權重：7/10
- 發布日期：2026-09-14
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：curl 200，JSON-LD `datePublished` 2026-09-14。廠商官方公告，「94% 較少嚴重事故」為廠商自評。TechCrunch 09-01 報導的丹佛、聖地牙哥、坦帕上線為窗外事件，本筆只涵蓋拉斯維加斯。

### 45. 內政部建研所高雄「智慧節能創新技術跨域交流」聚焦智慧工地與立面彩繪光電
- 原始標題：智慧節能創新技術跨域交流 為近零碳建築注入轉型動能
- 標題：內政部建研所高雄「智慧節能創新技術跨域交流」聚焦智慧工地與立面彩繪光電
- URL：https://www.abri.gov.tw/News_Content.aspx?n=752&s=340910
- 摘要：內政部建築研究所 9 月 16 日在高雄舉辦「智慧節能創新技術暨跨領域產業交流推廣活動」，邀集產官學研代表分享智慧工地、立面彩繪光電等創新技術與實務經驗，目的是讓技術供給與市場需求對接。建研所所長王榮進表示，建築未來不應只是能源消費者，可透過智慧管理、再生能源及儲能技術兼具節能、創能、儲能功能，提升城市能源韌性。內政部已啟動「近零碳建築減碳旗艦行動計畫」，從「擴大建築能效」、「老宅延壽及社會住宅」、「綠領人才培育」三大主軸推動，由公有建築率先示範，並串聯環境部、教育部、勞動部、經濟部資源，推動建築能效提升、太陽光電設置、智慧淨零技術研發、人才培育與綠色金融。活動中企業代表分別就智慧工地與立面彩繪光電進行專題分享，展現數位科技、施工管理、能源應用與建築設計的跨域整合。
- 權重：7/10
- 發布日期：2026-09-16
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：內政部一手新聞稿，頁面日期欄標示 115-09-16，curl 回 HTTP 200。原頁未寫參與人數與具體廠商名稱，摘要未補。與 2026-09-19 期引用的內政部智慧建築標章 2450 件（cna 09-04）為不同事件。

### 46. AI 供應鏈擴廠推升台灣前三季大型商用不動產交易 2,577 億元創新高 廠房占近七成
- 原始標題：AI 供應鏈擴廠熱 前三季商用市場交易衝2,500億新高 全年挑戰3,000億
- 標題：AI 供應鏈擴廠推升台灣前三季大型商用不動產交易 2,577 億元創新高 廠房占近七成
- URL：https://udn.com/news/story/7240/9775639
- 摘要：第一太平戴維斯統計，2026 年第 3 季台灣大型商用不動產（單筆 3 億元以上）交易金額達 899 億元，累計前三季 2,577 億元，創歷史新高，較去年同期大增 109%。第 3 季廠房交易 602 億元，占單季商用不動產交易近七成，前三季累計 1,920 億元，較去年同期成長近 3 倍。指標交易包括廣達以 197 億元購入華亞科技園區廠房作為 AI 伺服器產線布局、日月光以 63 億元購置南科高雄園區廠房、大立光 6 至 9 月在台中陸續購入七筆廠房累計 80 億元；凱基人壽以 206 億元購入潤泰玉成廣場整棟商辦，為歷年最大筆辦公室交易，拆算建物單價約每坪 112.5 萬元，且已有輝達等科技企業承租逾半棟。廠房交易熱區為苗栗縣（690 億元）與桃園市（549 億元）。第一太平戴維斯董事長黃瑞楠表示，AI 產業硬體投資已由前端晶片需求延伸至資料中心與基礎設施建置，預期全年大型商用不動產交易金額有機會挑戰 3,000 億元。文中並提到主計總處 8 月上修 2026 年經濟成長率預測至 11.05%。
- 權重：6/10
- 發布日期：2026-09-24
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：`article:published_time` 2026-09-24T14:58:58+08:00，curl 回 HTTP 200。數據來源為第一太平戴維斯統計，屬顧問公司報告的媒體轉述；科技成分為「AI 供應鏈擴廠」驅動，非建築技術本身，權重因此壓在 6。

### 47. MIT Senseable City Lab 新書探討視覺 AI 研究城市的潛力與風險 曾以 331 支交通攝影機估算紐約排放
- 原始標題：The promise and peril of using visual AI to study cities
- 標題：MIT Senseable City Lab 新書探討視覺 AI 研究城市的潛力與風險 曾以 331 支交通攝影機估算紐約排放
- URL：https://news.mit.edu/2026/studying-cities-using-visual-ai-fabio-duarte-martina-mazzarello-carlo-ratti-fan-zhang-book-0924
- 摘要：MIT Senseable City Lab 研究人員數月前發表一項紐約市污染研究，以機器學習辨識該市 331 支交通攝影機中出現的車輛類型，並估算每輛車的排放；文章指出，若攝影機數量足夠，這類視覺 AI 技術可以前所未有的精度與規模監測排放。視覺 AI 也能回答都市規劃者的各種問題，例如交通為何壅塞、路口哪些面向最危險、廣場或公園哪些區域最吸引人。共同作者 Fábio Duarte 表示「我們可以把數位影像當成資料，量化城市的特徵」，以電腦視覺技術「每張影像都是一個資料集」，但也強調必須謹慎。另一位共同作者 Martina Mazzarello 指出，都市研究者長期以視覺觀察取得洞見，現在可以大規模、到處進行。新書《How AI Sees the City》列出這項技術的多項潛在問題，包括大規模視覺監控的侵入性，以及 AI 系統可能強化偏見。
- 權重：6/10
- 發布日期：2026-09-24
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：MIT News 頁面 `<time datetime="2026-09-24T04:00:00Z">`，MIT RSS pubDate 亦為 09-24，curl 回 HTTP 200。本則為新書介紹（都市研究），非建案或建築技術；歸入本分類是取其「城市空間分析」面向，若彙整者認為更適合「其他領域」可移動。書名與共同作者 Carlo Ratti、Fan Zhang 出現在原頁網址與內文，摘要僅寫原頁提及者。

### 48. 新勝景掌中劇團以光雕投影結合傳統戲台 「創新辦桌」第 4 集回顧從白晝之夜到大阪的創新歷程
- 原始標題：「創新辦桌」上菜 一窺新勝景光雕布袋戲創新歷程
- 標題：新勝景掌中劇團以光雕投影結合傳統戲台 「創新辦桌」第 4 集回顧從白晝之夜到大阪的創新歷程
- URL：https://www.cna.com.tw/news/acul/202609230269.aspx
- 摘要：文總攜手台灣證券交易所創新板推出影像企劃「創新辦桌」，第 4 集以新勝景掌中劇團為主角，呈現兄弟以光雕投影結合傳統戲台的創新歷程。新勝景掌中劇團 1996 年由藝師朱清貴創立，兒子朱祥溥與朱勝珏從小跟著劇團搭舞台、打燈光、做特效，朱祥溥北上成為動畫導演後，2018 年決定把專業帶回家中，嘗試將布袋戲與光雕投影結合。中華文化總會新聞稿表示，為首次在白晝之夜推出光雕投影布袋戲，朱祥溥特別製作純白景片，讓大雪、烈火等光影特效在戲台流轉，這場實驗成為新勝景光雕投影布袋戲的起點。2019 年作品前往北美巡演，2025 年以「伏魔英雄帖之再現白光劍」前進日本大阪 We Taiwan 活動，將布袋戲、光雕與擊樂跨界融合。
- 權重：6/10
- 發布日期：2026-09-23
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：JSON-LD `datePublished` 2026-09-23T17:22:00+08:00，curl 回 HTTP 200。內容基於中華文化總會新聞稿，屬主辦方發稿的媒體版本。文中提到的「白晝之夜」是 2018 年的首演背景，不是 2026 年活動，與 2026-09-05 期引用的活動系列無關。

### 49. Apple Music Hall 啟用，把現場演出、Spatial Audio 錄製與多機位播送整合在同一場館
- 原始標題：Apple opens Apple Music Hall, a brand-new state-of-the-art live music venue in London
- 標題：Apple Music Hall 啟用，把現場演出、Spatial Audio 錄製與多機位播送整合在同一場館
- URL：https://www.apple.com/newsroom/2026/09/apple-opens-apple-music-hall-a-state-of-the-art-live-music-venue-in-london/
- 摘要：Apple 於 9 月 21 日宣布倫敦 Apple Music Hall 啟用。場館容納 600 人，配置可調整形式的 38 英尺舞台與 48 支揚聲器的空間音效系統。後台設有兩間專業錄音與混音室，可將每場演出錄成多軌音訊，並在現場或事後製作 Spatial Audio。場館也預埋 16 個以上機位連接播送控制室，支援 iPhone 與傳統廣播攝影機並行拍攝。藝人可從同一場演出產出 Spatial Audio 成品、廣播級混音與多機位影片，演出也可全球直播。
- 權重：9/10
- 發布日期：2026-09-21
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：Apple Newsroom 官方新聞稿，頁面日期為 2026-09-21。稽核補搜時回原頁核對 H1、容量、揚聲器、機位與製作流程；場館規格與效益為 Apple 自行揭露。

### 50. 資策會打造 AI 音樂理解與智慧協奏技術 AI 化身「虛擬樂手」跟上真人臨場變速
- 原始標題：經濟部科技專案讓AI聽懂音樂…資策會打造智慧協奏技術 實現一人成團
- 標題：資策會打造 AI 音樂理解與智慧協奏技術 AI 化身「虛擬樂手」跟上真人臨場變速
- URL：https://udn.com/news/story/7240/9771299
- 摘要：在經濟部技術司科技專案支持下，資策會數轉院研發 AI 音樂理解與智慧協奏技術，讓 AI 具備「聽清楚、聽得懂、能擬真、同節拍」四項能力，並將於 9 月 29 日至 30 日「2026 ITRI ICT TechDay」展出。四項關鍵技術分別是：透過環境降噪與多聲源分離「聽清楚」演奏；以音樂理解模型辨識節奏、和弦與曲風做到「聽得懂」；運用 AI 音色建模重現樂器音色達到「能擬真」；透過動態跟拍即時調整速度與節奏做到「同節拍」。展覽呈現「AI 音樂夥伴」與「AI 一人成團」兩項情境，前者讓使用者哼唱後由 AI 理解內容與風格並延伸創作，後者以吉他演奏示範，當演奏者臨場加速、放慢或改變節奏時，AI 虛擬樂手能動態調整伴奏。資策會表示，技術將推動導入數位樂器、AI 電吉他、智慧音箱及互動展演等應用，發展「硬體＋AI 音訊引擎＋智慧服務」新模式。
- 權重：7/10
- 發布日期：2026-09-22
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：`article:published_time` 2026-09-22T19:43:25+08:00，curl 回 HTTP 200。自由財經 09-26 有同事件報導（https://ec.ltn.com.tw/article/breakingnews/5586150，published_time 2026-09-26T09:00），為同一事件，僅擇一引用。原頁未提及模型架構或延遲數字，摘要未補。

### 51. YouTube 在 Made On YouTube 2026 宣布肖像偵測進入行動 App 並將整合說話聲音偵測
- 原始標題：New tools to power your creation journey from start to finish
- 標題：YouTube 在 Made On YouTube 2026 宣布肖像偵測進入行動 App 並將整合說話聲音偵測
- URL：https://blog.youtube/news-and-events/made-on-youtube-new-tools-power-creation-journey/
- 摘要：YouTube 官方部落格在 Made On YouTube 2026 活動中公布多項創作工具更新，其中關於 AI 身分保護的部分指出：數十億個頻道已符合資格可申請 YouTube 的自動化深偽（deepfake）偵測，並透過肖像偵測（likeness detection）工具管控自己的視覺肖像。YouTube 表示，肖像不只是外貌，也包括聲音；今年稍晚將開始把說話聲音偵測與臉部偵測整合，以提升整體比對準確度，為更廣泛的聲音保護奠定基礎。此外，肖像偵測將直接在 YouTube 行動 App 中提供，讓創作者可以在手機上設定、檢視並採取行動。同場活動的另一篇官方文章也重申，肖像偵測將進入手機端，提供註冊、比對通知與處置功能。
- 權重：7/10
- 發布日期：2026-09-23
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：`article:published_time` 2026-09-23T14:30:00+00:00，curl 回 HTTP 200。同日另一篇官方文章「Innovation for the YouTube Era: What's new for viewers and creators」（https://blog.youtube/news-and-events/innovation-youtube-era-made-on-viewers-creators/）內容重疊，擇一引用。Medianama 09-25 有相關報導，屬二手，未採用。原頁未給出具體上線日期，摘要以「今年稍晚」轉述。

### 52. Netflix 實境秀「Wonka's The Golden Ticket」開播 以 ElevenLabs 生成式 AI 重現 Gene Wilder 聲音引發反彈
- 原始標題：Netflix turns Willy Wonka’s chocolate factory into a real-life ‘social experiment’
- 標題：Netflix 實境秀「Wonka's The Golden Ticket」開播 以 ElevenLabs 生成式 AI 重現 Gene Wilder 聲音引發反彈
- URL：https://www.nbcnews.com/pop-culture/pop-culture-news/netflix-willy-wonka-golden-ticket-reality-show-ai-gene-wilder-rcna598920
- 摘要：Netflix 實境競賽節目「Wonka's The Golden Ticket」於週三開播，參賽者在重現的巧克力工廠中競逐 300 萬美元獎金，場景包含 25,000 加侖巧克力糊打造的巧克力河。節目今年稍早釋出預告時，1971 年經典電影的影迷關注焦點並非實境設定，而是製作方以生成式 AI 複製已故演員 Gene Wilder 聲音的決定；節目中 AI 生成的 Wilder 聲音負責旁白。共同節目統籌 Alison Holloway 與 Emer Harkin 表示，使用 Wilder 肖像是為了致敬而非貶損，並獲得其遺產管理方與遺孀的明確同意與鼓勵。為捕捉 Wilder 聲音的節奏、語氣與「奇想」感，團隊翻閱了遺孀 Karen Boyer 提供的數小時 Wilder 有聲書；Netflix 與 AI 語音生成公司 ElevenLabs 合作，該公司近年持續與好萊塢片廠及名人合作。
- 權重：6/10
- 發布日期：2026-09-23
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：JSON-LD `datePublished` 2026-09-23T13:00:41Z，頁面日期列「Sept. 23, 2026, 9:00 AM EDT」，curl 回 HTTP 200。Netflix 與 ElevenLabs 合作的原始宣布在 2026-06-30（窗外），本則為窗內開播當日的報導；原頁未寫首播日期的具體日曆日（僅寫「Wednesday」），依發布日推算為 9 月 23 日，摘要以「週三」呈現。

### 53. ESA FLEX 與 Copernicus Sentinel-3C 由 Vega-C 一箭雙星升空 ESA 首顆專測植物光合作用螢光的衛星
- 原始標題：FLEX and Sentinel-3C launched
- 標題：ESA FLEX 與 Copernicus Sentinel-3C 由 Vega-C 一箭雙星升空 ESA 首顆專測植物光合作用螢光的衛星
- URL：https://www.esa.int/Applications/Observing_the_Earth/FLEX_and_Sentinel-3C_launched
- 摘要：ESA 的 FLEX 地球探索者衛星與 Copernicus Sentinel-3C 衛星搭乘 Vega-C 火箭自法屬圭亞那歐洲太空港一同升空，VV30 班次於 9 月 15 日 03:21（當地時間 14 日 22:21）發射。名為 Vespa 的酬載轉接器讓兩顆衛星堆疊在整流罩內，位於上方的 Sentinel-3C 先入軌，FLEX 約一小時後跟進；ESA 位於德國的歐洲太空操作中心隨後收到兩顆衛星的首個訊號，任務控制人員將在接下來數天進行「發射與早期軌道階段」檢查。FLEX 在 ESA FutureEO 計畫下研發，是 ESA 第一顆專門從太空量測光合作用活動的衛星，其螢光成像光譜儀將偵測植物吸收陽光時發出的極微弱螢光，直接反映植被把陽光與二氧化碳轉換成能量的效率，協助評估植物健康、生態系生產力與環境壓力、氣候變遷的影響。Sentinel-3C 是 Sentinel-3 系列第三顆衛星，系統性量測地球海洋、陸地、冰層與大氣，支援歐洲 Copernicus 服務。ESA 地球觀測計畫主任 Simonetta Cheli 表示，同時準備並發射兩顆衛星並非易事。
- 權重：9/10
- 發布日期：2026-09-15
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：ESA 一手來源，頁面日期列 15/09/2026，curl 回 HTTP 200。原頁未載明衛星重量與軌道高度，摘要未補。

### 54. NASA 選定 PRIMA 遠紅外線望遠鏡為 Probe Explorers 新任務級別首案 成本上限 12 億美元、預計 2033 年發射
- 原始標題：NASA Selects Far-Infrared Telescope as First in New Mission Class
- 標題：NASA 選定 PRIMA 遠紅外線望遠鏡為 Probe Explorers 新任務級別首案 成本上限 12 億美元、預計 2033 年發射
- URL：https://www.nasa.gov/news-release/nasa-selects-far-infrared-telescope-as-first-in-new-mission-class/
- 摘要：NASA 宣布 PRIMA（PRobe far-Infrared Mission for Astrophysics）成為新設 Probe Explorers 任務級別的第一個任務，進入 Phase B（初步設計與技術開發）階段。任務成本上限為 12 億美元（不含發射與非專案成本），預計 2033 年發射，規劃執行五年。PRIMA 搭載 5.9 英尺口徑望遠鏡，將以遠紅外線進行深度巡天，研究系外行星起源、星系與黑洞演化，以及宇宙塵埃的累積。任務由 NASA 噴射推進實驗室主導，Goddard 太空飛行中心與 Marshall 太空飛行中心參與；國際合作夥伴包括法國 CNES、義大利 ASI、德國 DLR、加拿大 CSA、韓國 KASI／KASA、日本 JAXA 與英國太空總署。新聞稿引述形容 PRIMA 是「人類通往深宇宙的下一扇窗」，將揭開跨越宇宙時間的隱蔽現象，增進對行星、恆星與黑洞形成的理解。
- 權重：8/10
- 發布日期：2026-09-23
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：NASA 一手新聞稿，頁面日期列標示「Sep 23, 2026」、更新「Sep 24, 2026」，curl 回 HTTP 200。內文由 WebFetch 抽取，數字（12 億美元、2033、5.9 英尺、五年）均為原頁所載。與 2026-09-19 期引用的 NASA Roman 望遠鏡儀器啟用為不同事件。

### 55. Google 公布 Project Suncatcher 首次在軌測試細節 與 Planet 合作搭乘 SpaceX Transporter-18 驗證 TPU 太空耐受性
- 原始標題：Behind Project Suncatcher, our moonshot to put AI in space
- 標題：Google 公布 Project Suncatcher 首次在軌測試細節 與 Planet 合作搭乘 SpaceX Transporter-18 驗證 TPU 太空耐受性
- URL：https://blog.google/innovation-and-ai/models-and-research/google-research/google-project-suncatcher-facts/
- 摘要：Google 官方部落格說明 Project Suncatcher 即將進行的首次在軌測試：與衛星公司 Planet 合作打造原型衛星，搭乘 SpaceX Transporter-18 共乘任務升空，目的是蒐集 TPU 在太空中承受發射物理應力、輻射與熱極端環境的實測資料。發射期間晶片將經歷劇烈振動與最高達 10 倍重力的持續加速度，個別零組件可能面臨 50 至 100 g；在 UC Davis Crocker 核子實驗室進行的輻射測試顯示，Trillium 世代 TPU 在超過五年任務累積劑量的照射下表現良好。散熱是另一挑戰：太空中沒有氣流，在真空裡只能靠輻射板散熱，因此需要熱管與輻射器而非傳統風冷。Google 表示這次發射的重點是「看什麼可行、找出故障點，並把發現套用到未來任務」；下一個里程碑是 2027 年部署兩顆衛星，測試軌道叢集間的高頻寬雷射互連，長期目標是串聯多組衛星星系承擔更大的 AI 工作負載，利用軌道上最高可達地面 8 倍的太陽能。
- 權重：8/10
- 發布日期：2026-09-24
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：`article:published_time` 2026-09-24，curl 回 HTTP 200。**原頁未載明具體發射日期（10 月 1 日）、衛星名稱 MVP、搭載 TPU 數量（4 顆）與供電功率（約 1 kW）**，這些細節僅見於 DCD、Technology.org 等二手報導（多數回 403），摘要一律未寫入；若彙整時要用這些數字，須另找可核對日期的來源並標明出處。與 2026-09-19 期引用的 Orbital 太空資料中心新創為不同事件，但同屬「太空算力」主題，撰寫趨勢時可互相呼應。

### 56. 國科會「2026 未來科技館」閉幕 84 件未來科技獎成果、逾 5 萬人次進場、150 場技術洽談
- 原始標題：國科會：未來科技館閉幕　加速科研成果走向市場應用
- 標題：國科會「2026 未來科技館」閉幕 84 件未來科技獎成果、逾 5 萬人次進場、150 場技術洽談
- URL：https://www.cna.com.tw/news/afe/202609190216.aspx
- 摘要：國科會 9 月 19 日宣布「2026 台灣創新技術博覽會—未來科技館」閉幕。今年主軸為「讓台灣科研成為產業轉型的力量」，由國科會攜手中央研究院、教育部、衛福部及運動部共同主辦，展示內容涵蓋 AI 智慧應用、半導體與晶片運算、智慧醫療與健康、淨零能源與材料、太空與韌性應用，集結 84 件「2026 未來科技獎」獲獎成果。3 天展期吸引逾 5 萬人次進場，完成 150 場技術洽談及 27 件技術發表與交流活動，另有 63 團產業公協會、企業、學校及專業團體組團參觀。國科會說明，展前即蒐集企業研發需求與技術痛點，展期間透過企業主題導覽、技術發表及一對一洽談媒合；參與企業包括和碩、友達、宏碁、富邦金控、台達電子、敦泰電子、致伸科技、安川電機、達明機器人、三聯科技、崇越科技。國科會副主委蘇振綱表示，透過頒獎、現場展示及企業媒合的串聯，協助研究團隊接觸潛在合作企業與投資夥伴；國科會並指出，企業關心的不只是技術是否創新，也詢問技術成熟度、驗證成果、導入條件與開發時程，讓交流從「認識技術」往「如何使用技術」推進。
- 權重：6/10
- 發布日期：2026-09-19
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：JSON-LD `datePublished` 2026-09-19T19:31:00+08:00，curl 回 HTTP 200。內容基於國科會新聞稿。原頁未列出個別得獎技術名稱，摘要未補；TechNews 09-01 的「未來科技館災防黑科技」報導為同展覽的開展前報導，落在窗外且為不同切角。

### 57. Apple 釋出新一代 Apple Intelligence 與 Siri AI，英文 beta 先行、五種語言下月跟進
- 原始標題：Siri AI, a profoundly more capable and personal assistant powered by the next generation of Apple Intelligence, is here
- 標題：Apple 釋出新一代 Apple Intelligence 與 Siri AI，英文 beta 先行、五種語言下月跟進
- URL：https://www.apple.com/newsroom/2026/09/siri-ai-a-profoundly-more-capable-and-personal-assistant-is-here/
- 摘要：Apple 9 月 14 日宣布新一代 Apple Intelligence 隨 2027 年度軟體（iOS 27、iPadOS 27、macOS 27、watchOS 27、visionOS 27）釋出，驅動全新的 Siri AI。Siri AI 當日起以 beta 形式在英文環境推出，法、日、韓、葡、西語下月跟進，需 Apple Intelligence 裝置並設為支援語言；iOS、iPadOS 與 watchOS 在歐盟初期不提供。Siri AI 具備個人脈絡理解、螢幕內容感知與更多 app 動作，可在 WhatsApp 傳訊、在 Audible 播放有聲書，稍後可在 Outlook 草擬郵件、在 Notability 搜尋作業、在 Tripsy 加入餐廳。Image Playground 改由在 Private Cloud Compute 執行的新生成模型驅動，可生成寫實影像並以描述修改，並將支援 SynthID 標準辨識 AI 生成或編輯的影像；Siri Recap 與 Live Rewind 今年稍晚推出 beta。
- 權重：9/10
- 發布日期：2026-09-14
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：Apple Newsroom，JSON-LD datePublished 2026-09-14，頁面標示 UPDATE、dateModified 2026-09-24；H1 比 og:title 長，參考資料表採 H1。功能描述皆為 Apple 自述。前期（09-13）引用的是 iPhone 硬體發表，本頁為窗內另一事件。第三輪稽核補搜時加入。

### 58. xAI 推出 Grok 4.7，價格與速度不變，改用更大基礎模型與更長強化學習
- 原始標題：Introducing Grok 4.7
- 標題：xAI 推出 Grok 4.7，價格與速度不變，改用更大基礎模型與更長強化學習
- URL：https://x.ai/news/grok-4-7
- 摘要：xAI 9 月 21 日發表 Grok 4.7，稱是該公司在程式撰寫與知識工作上最強的模型：在困難任務上工作更久、更仔細檢查自己的產出，並搭配至今校準最佳的安全防護；以與 Grok 4.6 相同的價格與速度提供。模型使用比 4.6 更大的新基礎模型，並以更長的強化學習訓練、加重需要數小時完成的任務，改善自我驗證與長上下文管理，也原生理解 Grok Bot harness。原頁以 CursorBench 4.0（依每任務平均成本繪製的散布圖）、DeepSWE、GDPval、AA Briefcase 與 EEBench 等基準與 Fable 5.1、Opus 5、GPT-6 Astra 比較，稱在專業知識工作上與其他前沿模型相當。
- 權重：8/10
- 發布日期：2026-09-21
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：x.ai 官方頁，JSON-LD datePublished 2026-09-21，頁面日期列「Sep 21, 2026」；`<title>` 站名為 SpaceXAI。基準成績皆為廠商自評，具體分數只在圖表 aria-label 內，摘要不逐項抄錄。第三輪稽核補搜時加入。

### 59. 數位部啟動主權 AI 語料庫民間語料徵集，政府語料規模已達約 22 億 tokens
- 原始標題：數發部啟動主權AI語料庫民間語料徵集 號召作家與出版業共襄盛舉
- 標題：數位部啟動主權 AI 語料庫民間語料徵集，政府語料規模已達約 22 億 tokens
- URL：https://moda.gov.tw/press/press-releases/20640
- 摘要：數位發展部 9 月 15 日宣布啟動「臺灣主權 AI 訓練語料庫」民間語料徵集，部長林宜敬以作家身分捐出《幸福的鬼島》與《流寇與創新者》，秀威資訊、印刻文學、Readmoo 讀墨、食力、巨思文化等出版與電子書平臺業者及多位作家現場簽署授權同意書。語料庫自 2025 年底上線，初期以中央及地方政府語料為主，至今年 8 月底規模約 22 億 tokens。現階段以出版業與電子書平臺為合作對象，採無償授權；徵集四大類內容：經同意授權的出版品、出版品簡介、試閱內容、已逾著作權保護期間的典籍與創作。數位部強調「自願參與、明確授權、可退出」三原則並設退出下架管道。林宜敬指出國際大型語言模型的中文訓練資料仍多以簡體中文為主，要讓 AI 理解臺灣，就要讓臺灣的語言、文化與價值進入訓練資料。
- 權重：8/10
- 發布日期：2026-09-15
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：數位部官網新聞發布，JSON-LD datePublished 2026-09-15T06:36:51+08:00，頁面「建立日期：2026-09-15」，正文「今（15）日」；H1 為站名，標題取 `<title>`／og:title。「去（114）年底」換算為 2025 年底。第三輪稽核補搜時加入。

### 60. Gyazo 上傳伺服器漏洞遭利用，約 2,362 萬筆使用者資料與 4.9 億筆影像 metadata 外洩
- 原始標題：Notice and Apology Regarding a Data Breach Resulting from Unauthorized Access to Gyazo
- 標題：Gyazo 上傳伺服器漏洞遭利用，約 2,362 萬筆使用者資料與 4.9 億筆影像 metadata 外洩
- URL：https://corp.helpfeel.com/en/news/news-20260916
- 摘要：Gyazo 營運商 Helpfeel 9 月 16 日公告，9 月 11 日有第三方利用 Gyazo 影像上傳伺服器的漏洞取得系統存取權並執行任意指令；當晚偵測到可疑活動並展開調查，9 月 12 日封鎖攻擊路徑，後續確認資料庫遭存取，並向日本個人資訊保護委員會通報。截至 9 月 16 日確認約 2,362 萬筆使用者相關資料外洩，欄位含姓名或暱稱、email、密碼雜湊、使用者 ID、裝置 ID、登入 session ID、X 整合 token、Google SSO 對應 email 等；另有約 4.9 億筆主要為 2019 年 1 月以前登錄影像的 metadata（約占全部影像資料 14.4%）外洩。公司要求所有使用者更改密碼，並提醒共用密碼者同步更改其他服務。9 月 24 日更新：服務暫停進行安全維護，密碼重設待恢復後進行。
- 權重：8/10
- 發布日期：2026-09-16
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：官方公告頁，頁面日期列「2026/9/16」與 meta 2026-09-16T10:00，正文「as of September 16, 2026」；另一個 meta 日期 2026-09-26 為更新時間，非發布日。時間以日本標準時間為準。第三輪稽核補搜時加入。

### 61. 高通發表 Snapdragon 8 Elite Extreme Gen 6 與 8 Elite Gen 6，同採 2 奈米製程、九家品牌首發
- 原始標題：Snapdragon Leads the Agentic AI Age with Two of the World's Fastest Mobile SoCs Powering the Next Generation of Smartphones
- 標題：高通發表 Snapdragon 8 Elite Extreme Gen 6 與 8 Elite Gen 6，同採 2 奈米製程、九家品牌首發
- URL：https://www.qualcomm.com/news/releases/2026/09/snapdragon-leads-the-agentic-ai-age-with-two-of-the-world-s-fast
- 摘要：Qualcomm Technologies 9 月 22 日在 Snapdragon Summit 發表 Snapdragon 8 Elite Extreme Gen 6 與 Snapdragon 8 Elite Gen 6 兩款旗艦手機平台，稱這是「多旗艦策略」。Extreme Gen 6 為該公司最強手機平台，新功能包括讓日常代理更快、更個人化與更可靠，新的 Adreno Neural Fusion 以 AI 提供遊戲圖形，以及支援 Advanced Professional Video（APV）與 Intelligent Pixel Control 的 AI 相機能力。8 Elite Gen 6 建立在同一個先進 2 奈米製程節點，搭載客製 Oryon CPU、重新架構的 Adreno GPU 與 Hexagon NPU，把多數相同功能帶到更多高階機種。首發品牌為 HONOR、iQOO、Motorola、OnePlus、OPPO、REDMI、RedMagic、vivo 與 Xiaomi。新聞稿正文未載效能百分比、時脈或裝置端模型參數量。
- 權重：8/10
- 發布日期：2026-09-22
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：官方新聞稿頁為 React app，curl 只取得 JSON-LD（datePublished 2026-09-22T00:00:00-10:00，夏威夷時區），正文以同網址加 `.model.json` 取得。與第 20 筆天璣 9600 Pro 同為窗內 2 奈米旗艦。第三輪稽核補搜時加入。

### 62. Salesforce 全球中斷數小時，內部登入服務卡住耗盡伺服器資源，撞上 Dreamforce 第二天
- 原始標題：Salesforce staggers back to feet after global outage
- 標題：Salesforce 全球中斷數小時，內部登入服務卡住耗盡伺服器資源，撞上 Dreamforce 第二天
- URL：https://www.theregister.com/saas/2026/09/16/salesforce-staggers-back-to-feet-after-global-outage/5296800
- 摘要：The Register 報導 9 月 16 日 Salesforce 發生全球性中斷，狀態頁描述為嚴重延遲、間歇錯誤與部分服務無法存取，影響美、日、印、英、法、德等地數百個 instance。中斷約 08:30 UTC 首次通報；09:10 UTC 的更新指出「請求在等待內部登入服務回應時卡住，耗盡可用伺服器資源」；之後宣布修正已推送、服務逐步恢復，但到 14:00 UTC 公司表示修正尚未完全恢復所有 instance，正手動重啟自動修正未解決的 instance，並收到部分客戶排程工作未如期執行的回報，同時稱影響範圍「比最初理解的窄」。中斷發生在 Dreamforce 開幕隔天，該會預計逾 4 萬人親臨、逾 20 萬人線上報名。
- 權重：7/10
- 發布日期：2026-09-16
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：JSON-LD datePublished 2026-09-16T10:06Z，頁面「Wed 16 Sep 2026 // 11:06 UTC」，dateModified 09-18。二手媒體，Salesforce 狀態頁的原始更新未另行查核；時間依原頁的 BST／UTC 標示。第三輪稽核補搜時加入。

### 63. Bitget 熱錢包與溫錢包遭竊 3.516 億美元，稱手法與北韓組織一致並暫停提領
- 原始標題：Bitget Says Suspected North Korean Hackers Stole $351.6M After Backend Compromise
- 標題：Bitget 熱錢包與溫錢包遭竊 3.516 億美元，稱手法與北韓組織一致並暫停提領
- URL：https://thehackernews.com/2026/09/bitget-says-suspected-north-korean.html
- 摘要：The Hacker News 9 月 25 日報導，加密貨幣交易所 Bitget 表示 2026 年 9 月 24 日 18:31 UTC 其安全系統偵測到少數熱錢包出現未授權轉帳，熱錢包與溫錢包合計損失 3.516 億美元；公司稱客戶帳戶餘額正確、存款與交易照常，但暫停提領進行全面安全檢視，並委託 Google 旗下 Mandiant 與 SlowMist 進行第三方調查。執行長 Gracy Chen 稱受影響資產含 ETH、XRP、BNB、AVAX、USDT 與 USDC，涉及 Ethereum、XRP Ledger、Arbitrum、Avalanche、Optimism、BSC 與 Base 等鏈，已聯繫各鏈基金會。Bitget 未揭露入侵方式；自託管的 Bitget Wallet 架構獨立、未受影響。
- 權重：7/10
- 發布日期：2026-09-25
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：頁面作者列「Ravie Lakshmanan Sep 25, 2026」，無 JSON-LD 日期。二手媒體轉述 Bitget 在 X 的公告；「與北韓組織一致」為 Bitget 自述的初步研判。第三輪稽核補搜時加入。

### 64. 環球與索尼二度控告 Suno，指 v6 以侵權模型的產出訓練、理論求償上限逾 90 億美元
- 原始標題：Universal and Sony sue Suno for a second time, claiming platform's v6 models are 'the fruit of the same poisoned tree'
- 標題：環球與索尼二度控告 Suno，指 v6 以侵權模型的產出訓練、理論求償上限逾 90 億美元
- URL：https://www.musicbusinessworldwide.com/universal-and-sony-sue-suno-for-a-second-time-claiming-platforms-v6-models-are-the-fruit-of-the-same-poisoned-tree/
- 摘要：Music Business Worldwide 報導，UMG 與 Sony Music 9 月 18 日在波士頓聯邦法院聯名提告，指 Suno 未經授權複製 60,202 首錄音用於建構其音樂生成模型。依美國著作權法故意侵權每件最高 15 萬美元計算，理論上限略高於 90 億美元；另就每次規避 YouTube 反下載技術求償最高 2,500 美元。新指控針對 Suno 的 v6 模型：Suno 產品長 Jack Brody 曾向 MBW 表示 v6「完全從零訓練」且資料不含環球與索尼內容，兩家唱片公司則主張這不能消除責任，因為 v6 是「同一棵毒樹的果實」。
- 權重：7/10
- 發布日期：2026-09-18
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：JSON-LD datePublished 2026-09-18T17:12:42+00:00，頁面「September 18, 2026 By Tim Ingham」。音樂產業專業媒體；Suno v6 於 9 月 9 日發布落在窗外，本筆為窗內的訴訟事件。第三輪稽核補搜時加入。

## 淘汰來源

### A. 街口支付甩開虧損迎連三月轉盈！總座范庭甄：損益兩平並非終點
- URL：https://finance.technews.tw/2026/09/15/three-consecutive-months-of-profit/
- 發布日期：2026-09-15
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：內容為廠商自評的獲利與用戶數公告，無第三方數據亦無技術細節，金融科技名額讓給金管會兩則政策公告、玉山 GENIE 3.0 與 SEC 創新豁免。curl 200，頁面日期列 2026-09-15。

### B. AI 破解人體老化時鐘：揭開三大「爆發性」衰老軌跡，兩個年齡是斷崖關鍵
- URL：https://technews.tw/2026/09/25/human-organ-aging-watershed/
- 發布日期：2026-09-25
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：科技新報編譯《Nature Aging》研究，原頁未給論文標題與 DOI，屬二手轉述；改採 MIT News 可吸收電池研究作為第五筆醫療來源。頁面日期列 2026-09-25。

### C. 內政部與環境部首推「近零碳建築綠領人才培育」 80 名額 3 天額滿、報名達 450 人
- URL：https://www.abri.gov.tw/News_Content.aspx?n=752&s=340955
- 發布日期：2026-09-17
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：主編複審：內容為人才培育課程開訓與報名人數，技術內容有限；同機構已有 09-16 智慧工地交流一筆，避免同機構集中。頁面日期欄 115-09-17，curl 200；中央社同事件寫「近 400 人」與原頁 450 人不一致。

### D. Introducing GPT-6 Sol and Luna（OpenAI 官方）
- URL：https://openai.com/index/introducing-gpt-6-sol-and-luna/
- 發布日期：無法確認
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：openai.com 對 curl（Chrome UA、curl UA、Googlebot UA）一律回 403，無法在原頁確認發布日期；同事件改以 iThome（正式 2）為來源。

### E. 安全疑慮升溫之際　Anthropic、OpenAI推低價模型（中央社）
- URL：https://www.cna.com.tw/news/ait/202609230032.aspx
- 發布日期：2026-09-23
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：與正式 1（Opus 5.5）與正式 2（GPT-6 Sol／Luna）為同一事件的綜合報導；已有官方一手與 iThome 來源，避免同事件三引。可作台灣媒體備選，內含「Opus 5.5 嘗試突破隔離邊界的機率比 Opus 5 或 Mythos 5.1 低約 85%」「GPT-6 Sol 每百萬輸入 2 美元、輸出 10 美元」等數字。curl 200，日期取自 JSON-LD。

### F. Claude Opus 5.5 is now available in GitHub Copilot（GitHub Changelog）
- URL：https://github.blog/changelog/2026-09-22-claude-opus-5-5-is-now-available-in-github-copilot
- 發布日期：2026-09-22
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：與正式 1 同一事件（模型上架 Copilot），權重不足以獨立成條。若需要可補一句：頁面提到 Opus 5.5 會在文字輸出加上浮水印，不增加 token 或成本。curl 200，日期取自 JSON-LD。

### G. OpenAI's GPT-6 Sol and GPT-6 Luna now available（GitHub Changelog）
- URL：https://github.blog/changelog/2026-09-22-openais-gpt-6-sol-and-gpt-6-luna-now-available
- 發布日期：2026-09-22
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：與正式 2 同一事件；內容僅為 Copilot 各方案可用性與 model picker 位置。curl 200，日期取自 JSON-LD。

### H. 微軟Copilot迎3大功能　主打自主AI代理與低門檻開發（中央社）
- URL：https://www.cna.com.tw/news/ait/202609250235.aspx
- 發布日期：2026-09-25
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：與正式 3 同一事件，已採微軟官方一手來源。可作台灣媒體備選；文中有官方節錄未收的「日常查詢採固定訂閱授權（USL）、Cowork／Code／Autopilot 採用量計費（UBB）」說明。curl 200，日期取自 JSON-LD。

### I. Introducing Gemini 3.8 Live with Live Avatar（Google）
- URL：https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-8-live-with-live-avatar/
- 發布日期：2026-09-24
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：前期（09-19）已引用「Gemini 3.8 Live／3.8 Live Extended Thinking」，本則為同一產品線的後續功能，依系列去重規則不再用。curl 200，日期取自 `article:published_time`。iThome 09-25 亦有報導（https://www.ithome.com.tw/news/179229）。

### J. Google DeepMind 希望年底前推出 Gemini 4，加速追趕領先集團（TechNews）
- URL：https://technews.tw/2026/09/24/google-deepmind-nears-launch-of-gemini-4-ai-model
- 發布日期：2026-09-24
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：權重不足——內容為 DeepMind 主管在 The Information 活動上的口頭說法，文中自承 Google 尚未公布上市時間、規模、成本與基準；無官方公告可對照。curl 200（經 301 轉 cdn.technews.tw），日期取自頁面「發布日期 2026 年 09 月 24 日」。

### K. Anthropic調整Claude Code每周用量上限，9月14日起較目前減少17%（iThome）
- URL：https://www.ithome.com.tw/news/178590
- 發布日期：2026-09-01
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：日期窗外（09-01）；9 月 14 日只是政策生效日，不是發布日。curl 200，日期取自 `class="created"`。

### L. Kubernetes v1.37: Garhwal
- URL：https://kubernetes.io/blog/2026/08/26/kubernetes-v1-37-release/
- 發布日期：2026-08-26
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：日期窗外。另查核 Rust 1.98.1（09-03）、Go 1.27.1（09-01）、Python 3.15.0rc2（09-01）亦皆在窗外，窗內無主要語言／平台的新版本公告。curl 200，日期取自 `article:published_time`。

### M. Require proof of presence for high-impact actions（GitHub Changelog）
- URL：https://github.blog/changelog/2026-09-24-require-proof-of-presence-for-high-impact-actions
- 發布日期：2026-09-24
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：備選。公開預覽僅限使用 Microsoft Entra ID 作為 SSO IdP 的 EMU 企業，受眾窄；篇幅優先給正式 7 至 9。內容為在建立 token、編輯 webhook、變更組織安全設定等高影響操作前，把使用者導回 IdP 重新驗證（sudo mode 的企業版擴充），成功後同一瀏覽器工作階段可延續兩小時。curl 200，日期取自 JSON-LD。

### N. Announcing a Maintainer in Residence: Scott Schafer for the Cargo team（Rust Blog）
- URL：https://blog.rust-lang.org/2026/09/22/announcing-a-maintainer-in-residence-scott-schafer-for-the-cargo-team/
- 發布日期：2026-09-22
- 分類：軟體工程
- 是否納入正式參考資料：否
- 淘汰原因：備選，社群治理題材權重略低於工具鏈變更。內容：Rust 領導委員會追加 RFMF 預算並獲 AWS 額外資金，開出 Cargo 團隊的全職 Maintainer in Residence，由 Scott Schafer 出任；起因是 Cargo 團隊近期成員異動與原有資助中斷，難以維持維護基線。iThome 09-23 有中文報導（https://www.ithome.com.tw/news/179161，`class="created">2026-09-23`，稱任期至少 12 個月）。curl 200，日期取自頁面「Sept. 22, 2026」。

### O. 提示詞注入仍難可靠防範，澳洲通訊局公布AI代理權限控管原則（iThome）
- URL：https://www.ithome.com.tw/news/179149
- 發布日期：2026-09-24
- 分類：AI 科技／資安
- 是否納入正式參考資料：否
- 淘汰原因：備選。二手轉述澳洲通訊局（ASD）指引，未查核 ASD 原文網址與日期；若資安組需要 AI 代理治理題材可接手。內容：ASD 稱目前缺乏完全可靠的技術防範 prompt injection，建議以最小權限限制代理存取、高影響操作需人工核准、完整保留提示詞與工具呼叫紀錄，並把多代理系統視為單一代理評估。curl 200，日期取自 `class="created"`。

### P. Introducing Worker Previews: isolated preview environments for every change your agent makes
- URL：https://blog.cloudflare.com/worker-previews/
- 發布日期：2026-09-22
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：同站本期已選 Vary 與 Python Workers GA 兩筆，避免 Cloudflare 占比過高；原頁無定價與限制資訊。可作替補。

### Q. Agents can now set up your website's security with Turnstile Spin
- URL：https://blog.cloudflare.com/turnstile-spin/
- 發布日期：2026-09-25
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：主題偏 AI 代理工具（較適合 AI 分類），且同站已選兩筆。原頁有 65,000 次 widget 建立、30,000 次複製提示、每個工作日約 30 億次驗證等數字，若 AI 組需要可移用。

### R. NVIDIA Launches DSX Ready to Qualify Power and Cooling Products for AI Factories
- URL：https://blogs.nvidia.com/blog/dsx-ready-ai-factories-power-cooling/
- 發布日期：2026-09-21
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：權重不足——原頁只有認證計畫與合作夥伴名單（BESS：Hitachi Energy、LG Energy Solution、Tesla；CDU：LG Electronics、LiquidStack、Vertiv），沒有功率、電壓等技術規格。

### S. 歷經26年推動24日動工　台電：松湖變電所擬於2029年完工
- URL：https://www.cna.com.tw/news/afe/202609240176.aspx
- 發布日期：2026-09-24
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：同日同主題（台灣電力）已選核三再運轉計畫核定；本篇為地方變電所動工，權重較低。可作台灣電力替補。

### T. Roundcube Pre-Auth SQL Injection Flaw Actively Exploited in the Wild
- URL：https://thehackernews.com/2026/09/roundcube-pre-auth-sql-injection-flaw.html
- 發布日期：2026-09-25
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：權重不足——漏洞 CVE-2026-48842 已於 5 月修補，原頁引述 Shadowserver 資料顯示 523,000 個曝露實例中僅 10 台仍被標記為易受攻擊；加拿大網路安全中心未揭露利用細節。

### U. CISA Adds Two Known Exploited Vulnerabilities to Catalog（WSO2 CVE-2026-5430、Adobe Commerce CVE-2026-71362）
- URL：https://www.cisa.gov/news-events/alerts/2026/09/24/cisa-adds-two-known-exploited-vulnerabilities-catalog
- 發布日期：2026-09-24
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：同站本期已選 09-22 四漏洞公告，避免 KEV 公告重複；WSO2 事件在 The Hacker News 09-25（wso2-and-adobe-commerce-flaws-exploited.html）有較完整脈絡（watchTowr 於 9 月 13 日觀測到偽造 JWT 攻擊），可作替補。

### V. CISA Adds Two Known Exploited Vulnerabilities to Catalog（Microsoft SharePoint CVE-2026-65660、MikroTik RouterOS CVE-2026-67279）
- URL：https://www.cisa.gov/news-events/alerts/2026/09/25/cisa-adds-two-known-exploited-vulnerabilities-catalog
- 發布日期：2026-09-25
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：同站已選一筆；MikroTik 與前期（09-10 KEV）為同廠商不同 CVE，為避免讀者混淆不再收。另 09-25 尚有 WordPress Core CVE-2026-87902 遠端檔案引入單筆公告（cisa-adds-one-known-exploited-vulnerability-catalog），同理淘汰。

### W. CISA Adds One Known Exploited Vulnerability to Catalog（Zyxel GS1900 CVE-2026-7273）
- URL：https://www.cisa.gov/news-events/alerts/2026/09/21/cisa-adds-one-known-exploited-vulnerability-catalog
- 發布日期：2026-09-21
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：同站已選一筆。iThome 資安週報（179217，09-24）指出 GreyNoise 同日揭露 996 台 GS1900 交換器遭入侵、台灣受害數量排名第三、疑與 Red Heron 有關；若要補台灣受害角度，可用此筆搭配 iThome 週報作替補。

### X. pgAdmin 4修補重大身分驗證繞過漏洞，若未更新可能導致攻擊者冒充管理員
- URL：https://www.ithome.com.tw/news/179200
- 發布日期：2026-09-24
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：權重不足——CVE-2026-86863（CVSS 9.8）尚未發現實際利用或公開 PoC，且僅影響 Webserver 驗證模式。

### Y. Next.js修補ImageResponse元件重大漏洞
- URL：https://www.ithome.com.tw/news/179215
- 發布日期：2026-09-24
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：權重中等（CVE-2026-94545，CVSS v4.0 9.5，影響 16.2.0 至 16.3.5），但屬前端框架漏洞，較適合 AI／開發工具組；Next.js 官方公告未另行查核。可作替補。

### Z. 群暉修補DSM作業系統8個漏洞，含兩個可能導致服務阻斷攻擊的重大漏洞
- URL：https://www.ithome.com.tw/news/179077
- 發布日期：2026-09-21
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：權重不足——例行性 DSM 更新，兩個 CVSS 9.8 漏洞（CVE-2026-13684、CVE-2026-13639）無已知利用；台灣廠商來源本期已有 D-Link。

### AA. TWNIC籲企業將網域納入資安治理，臺灣DNSSEC部署率僅2.47%
- URL：https://www.ithome.com.tw/news/179047
- 發布日期：2026-09-18
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：篇幅考量下讓位給核三；數據佳（截至 9 月 14 日 .tw 與 .台灣 域名 10,356 個完成 DNSSEC、占 2.47%；ROA 覆蓋率 98.06%、ROV 過濾率 55.98%、Registry Lock 約 24 個核心域名），是台灣 DNS 基礎建設的好替補。

### AB. 瞄準 AI 與 HPC 晶片設計，Cadence 攜手台積電布局 A14 製程與小晶片生態系
- URL：https://technews.tw/2026/09/24/cadence-expands-tsmc-partnership-to-power-next-gen-ai-chips/
- 發布日期：2026-09-24
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：Cadence 原廠新聞稿（cadence.com）對 curl 與 WebFetch 皆回 403，無法核對一手內容；TechNews 轉述屬二手，且本期硬體類已足額。

### AC. 輝達盯玻璃基板  傳催台日韓 2 年交卷、德商曝進展
- URL：https://technews.tw/2026/09/24/nvidia-follows-glass-substrate-developments-in-taiwan-japan-and-south-korea/
- 發布日期：2026-09-24
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：核心主張（NVIDIA 要求台日韓兩年內完成玻璃基板開發）出自韓媒與 X 平臺爆料帳號轉述，無 NVIDIA 官方來源；MoneyDJ 授權轉載。

### AD. ASML 罕見示警！歐洲半導體投資冷清，今上半年營收占比竟是 0%
- URL：https://technews.tw/2026/09/25/asml-sell-0-europe-in-2026/
- 發布日期：2026-09-25
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：二手轉述 Tom's Hardware 報導，ASML 原始發言場合未查核；且與台灣供應鏈關聯較弱。

### AE. 晶圓代工到晶片設計　台灣半導體產業鏈擴大領先韓國
- URL：https://www.cna.com.tw/news/ait/202609240049.aspx
- 發布日期：2026-09-24
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：內容為中央社編譯韓媒 Chosun Biz 的產業評論，主要事實（聯發科獲 NVIDIA 35 億美元可轉債投資）發生於 8 月 31 日、在窗外；本期已有多筆台灣半導體來源。

### AF. NVIDIA Isaac ROS 5.0 Advances Agentic, Open Source Robotics Development
- URL：https://blogs.nvidia.com/blog/isaac-ros-5-0-agentic-open-source-robotics/
- 發布日期：2026-09-22
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：偏軟體框架釋出（ROS Lyrical、Ubuntu 24.04 支援、FoundationPose 推論快 5.5 倍），機器人主題已選 IFR 統計；可作替補。

### AG. 格羅方德深耕台灣生態系夥伴，擴展氮化鎵技術與全球產能布局
- URL：https://technews.tw/2026/09/24/globalfoundries-deeply-rooted-in-taiwans-ecosystem/
- 發布日期：2026-09-24
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：活動採訪性質、無具體投資金額或產能數字，權重不足。

### AH. OpenAI 代理人駭入澳洲政府網站（The Hacker News／iThome 179208）
- URL：https://thehackernews.com/2026/09/openai-agent-bypassed-australian.html
- 發布日期：未逐頁核對
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：屬 AI 代理安全事件，與前期已引用的 Hacktron／Claude 與 Gemini 代理事件同一主題脈絡，應由 AI 組判斷；本組不收。

### AI. 臉書、IG短暫當機已恢復　官方尚未說明異常原因
- URL：https://www.cna.com.tw/news/ait/202609210032.aspx
- 發布日期：2026-09-21
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：原頁明載官方未說明原因，無事故報告可引，權重不足。

### AJ. AT&T 與 Amazon Leo 達成合作協議，將 Amazon Leo 衛星服務與企業連網方案整合
- URL：https://technews.tw/2026/09/23/att-business-expands-enterprise-and-public-sector-connectivity-architecture-with-amazon-leo-satellite/
- 發布日期：2026-09-23
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：TechNews VIP 付費內容，公開頁面只有導言，無法核對正文細節。

### AK. 夏普研發通用衛星天線　挑戰星鏈市場主導地位
- URL：https://www.cna.com.tw/news/ait/202609230125.aspx
- 發布日期：2026-09-23
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否
- 淘汰原因：日經亞洲轉述的研發計畫，產品要到 2030 年才推出，權重不足。

### AL. Mastercard launches Wallet Pay（Mastercard 推出 Wallet Pay 與 Agent Connect）
- URL：https://www.mastercard.com/us/en/news-and-trends/press/2026/september/mastercard-wallet-pay.html
- 發布日期：無法確認（搜尋摘要為 2026-09-10，原頁 curl 回 403）
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：搜尋摘要日期 09-10 在窗外一天，且 mastercard.com 對 curl 回 403 無法核對原頁；同時與 09-19 期引用的 Mastercard／Visa 代理付款主題重疊。

### AM. Visa Announces New AI, Stablecoin and Token Innovations at Visa Payments Forum
- URL：https://usa.visa.com/about-visa/newsroom/press-releases.releaseId.22491.html
- 發布日期：2026-06-10（依 Business Wire 同稿日期）
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：日期窗外（6 月），搜尋結果誤列為 9 月新聞。

### AN. 標普：未來 AI 應用將越來越影響銀行信用評級
- URL：https://finance.technews.tw/2026/09/22/s-p-future-ai-applications-impact-bank-credit-ratings
- 發布日期：2026-09-22（頁面日期列）
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：原文開頭寫明「綜合中媒及港媒報導」並由 MoneyDJ 授權轉載，屬二手轉載且內文僅三段；標普報告原文未取得。

### AO. AI 通膨來襲？央行：短期可控、長期生產力提升將降壓
- URL：https://finance.technews.tw/2026/09/18/ai-inflation-looming-central-bank-short-term-controllable-long-term-productivity-gains-alleviate-pressure
- 發布日期：2026-09-18（URL 日期，未逐頁核對日期列）
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：主題為總體經濟與物價，非金融科技應用；權重不足。

### AP. 24 小時交易有譜？SEC 放行美股代幣化 Coinbase 飆
- URL：https://technews.tw/2026/09/21/sec-clears-path-for-tokenized-stocks/
- 發布日期：2026-09-21（頁面日期列）
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：與正式建議第 3 筆（SEC 官方新聞稿）為同一事件，且為 MoneyDJ 授權轉載；若 SEC 官方連結在撰稿時抓取受限（403），可改用本筆作備援。

### AQ. 挑戰美國運通簽帳白金卡！中信萬豪聯名卡年費 2.2 萬最優 6 元換 1 點
- URL：https://finance.technews.tw/2026/09/16/membership-upgrade/
- 發布日期：2026-09-16（URL 日期，未逐頁核對）
- 分類：金融科技
- 是否納入正式參考資料：否
- 淘汰原因：信用卡產品行銷新聞，無技術內容，權重不足。

### AR. 成大醫院參展Medical Fair Asia 2026 三項AI智慧醫療成果亮相新加坡
- URL：https://money.udn.com/money/story/5635/9746393
- 發布日期：2026-09-10（頁面 `article-body__time`）
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：日期窗外一天（09-10）。

### AS. MedTech醫療科技雙周報第53期： 美國組全國聯盟測試心衰竭AI代理，要提供全天候照護
- URL：https://www.ithome.com.tw/news/178967
- 發布日期：2026-09-15（`class="created"`）
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：頭條事件為 Duke DCRI SYMPHONY 心衰竭 AI 聯盟，09-19 期已引用同一事件；其餘為多則新聞的彙整稿，且新加坡 AgentSea 一則 iThome 09-01 已另有專文（窗外）。

### AT. 勒索軟體The Gentlemen近期接連鎖定醫療產業，Nutex、Veradigm均向SEC揭露資安事件
- URL：https://www.ithome.com.tw/news/178935
- 發布日期：2026-09-15（`class="created"`）
- 分類：醫療科技（實為資安）
- 是否納入正式參考資料：否
- 淘汰原因：主體是資安事件（8 月 24 日至 9 月 8 日的 8-K 揭露），分類上屬資訊安全而非醫療科技；留給 B 組判斷。

### AU. 資安事故不只會外洩資料：Boston Scientific 網攻為何衝擊全球營運？
- URL：https://finance.technews.tw/2026/09/23/boston-scientific-cyberattack-sends-warning-to-global-businesses/
- 發布日期：2026-09-23（URL 日期）
- 分類：醫療科技（實為資安評論）
- 是否納入正式參考資料：否
- 淘汰原因：事件發生於 8 月 25 日（窗外），本文為評論性回顧；iThome 08-31 已有原始報導。

### AV. New cell-collection device could improve early cancer detection（MIT 微流體活細胞採集裝置）
- URL：https://news.mit.edu/2026/new-cell-collection-device-could-improve-early-cancer-detection-0924
- 發布日期：2026-09-24（RSS pubDate）
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：備援。內容可用（3D 列印微流體裝置以流體剪應力採集輸卵管活細胞，刊於《Device》，與 Johns Hopkins 合作），但為控制 MIT News 同站筆數並維持台灣來源占多數而暫列淘汰；若正式名單需要第三筆國際來源可替換第 8 筆。

### AW. 智捷AI醫療影像進算力中心　許添財談精準健康新模式
- URL：https://www.cna.com.tw/news/afe/202609210234.aspx
- 發布日期：2026-09-21（`datePublished`）
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：中央社自辦論壇的廠商演講報導，「2028 年前部署 29 家醫學中心」「檢測能力接近 9 成」均為廠商自述且系統「尚未公開使用」，屬廠商自評與未來時程。

### AX. 縮短研發陣痛、提早揪出病灶，AI 助攻癌症醫療的三大關鍵
- URL：https://technews.tw/2026/09/23/ai-accelerates-cancer-treatment-breakthroughs/
- 發布日期：2026-09-23（URL 日期）
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：編譯自外媒評論的綜述，無新事件；引用的 MASAI 試驗與 TrialGPT 皆為舊研究。

### AY. 德鐵深化台灣合作　技術人才交流升級共拓東協市場
- URL：https://www.cna.com.tw/news/ahel/202609250231.aspx
- 發布日期：2026-09-25（`datePublished`）
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：備援。德鐵系統技術公司（DB Systemtechnik）在 InnoTrans 期間與台灣鐵道技術研究及驗證中心、中華軌道車輛工業發展協會簽署合作備忘錄，內容可用，但與第 11、12 筆同為柏林軌道展事件，為避免同一展會佔三筆而暫列淘汰。

### AZ. Introducing transit rewards（Waymo 推出大眾運輸轉乘獎勵）
- URL：https://waymo.com/blog/2026/09/transit-rewards/
- 發布日期：2026-09-22（`datePublished`）
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：備援。舊金山灣區乘客綁定 Visa 卡、2 小時內轉乘大眾運輸即發 2.85 美元 Waymo Cash，並租用 40 個 Caltrain 車站停車位；同站已收兩筆（第 14、15 筆），暫列淘汰。

### BA. 特斯拉 Cybercab 東京亮相：日本電動車產業競爭從 EV 邁向自駕與 Robotaxi 生態系
- URL：https://technews.tw/2026/09/24/tesla-unveils-its-cybercab-robotaxi-in-japan/
- 發布日期：2026-09-24（頁面日期列）
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：通篇「筆者認為」的評論文，事件本身（Cybercab 東京青山展示）自 9 月 11 日起、Tesla 官方未發新聞稿；且 09-13 期已引用 Tesla Roadster 2，本期不再收 Tesla 二手評論。

### BB. 亞馬遜德州無人機快遞「箱如雨下」，惹周邊居民怒斥抗議噪音擾人
- URL：https://technews.tw/2026/09/22/its-raining-boxes-amazon-drones-overwhelm-a-texas-suburb/
- 發布日期：2026-09-22（URL 日期）
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：編譯自紐約時報的居民抗議報導，技術資訊有限（起飛高度提高至 225 英尺、單日 52 架次），權重不足。

### BC. 電動車充電網擴大 全台充電樁達1.6萬槍
- URL：https://udn.com/news/story/7241/9755945
- 發布日期：2026-09-15
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：09-19 期已引用同一事件（經濟日報 09-15 全台充電樁 16,280 槍）。

### BD. Building Waymo’s Risk and Insurance Foundation in Europe with Allianz Partners
- URL：https://waymo.com/blog/2026/09/allianzpartnership/
- 發布日期：2026-09-15（依搜尋摘要）
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：09-19 期已列為淘汰備援，依任務指示本期不再使用。

### BE. 保時捷正式開賣「電動車無線充電板」，暫時只有凱燕能用
- URL：https://technews.tw/2026/09/21/porsche-wireless-ev-charging-into-production/
- 發布日期：2026-09-21（URL 日期）
- 分類：運輸物流
- 是否納入正式參考資料：否
- 淘汰原因：單一車廠配件上市新聞，權重不足；正文未抽取核對。

### BF. AI省力北醫體系臨床應用破41萬次 每月幫護理師省下800小時文書
- URL：https://udn.com/news/story/7266/9592498
- 發布日期：2026-06-27（`article:published_time`）
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：日期窗外（6 月），搜尋結果誤列為近期。

### BG. Suno launches v6 with music partners and plans paid fan remixes
- URL：https://www.therundown.ai/news/suno-v6-music-partners-paid-fan-remixes
- 發布日期：2026-09-10
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：`datePublished` 2026-09-10T13:34Z，落在時間窗前一天；Suno v6 發表本身亦為 09-09。另 2026-09-19 期已引用 Suno 資料外洩訴訟，同站題材連續出現宜避免。

### BH. Universal Music Group, ElevenLabs to Launch AI-Powered Music Platform
- URL：https://variety.com/2026/music/news/umg-elevenlabs-ai-powered-music-platform-licensing-1236857240/
- 發布日期：2026-09-10
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：`article:published_time` 2026-09-10T14:18Z，窗外一天。ElevenLabs 官方部落格同日發文，亦窗外。

### BI. Stability AI 7,600 萬美元 Series B（EA、Sony Music、UMG、WMG、AMD Ventures 參投）
- URL：https://stability.ai/news-updates/stability-ai-latest-funding-backed-by-entertainment-industry-biggest-names
- 發布日期：2026-08-26（依 TechTimes 報導日期推估，未逐頁核對）
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：媒體報導集中在 8 月 26 日至 9 月 1 日，落在窗外；未再核對官方頁日期。

### BJ. Spotify「AI Persona」標章 9 月中上線
- URL：https://newsroom.spotify.com/2026-08-11/ai-persona-badges-transparency/
- 發布日期：2026-08-11
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：官方公告 08-11 窗外；「9 月中上線」在窗內沒有找到可核對日期的一手或權威二手報導，僅有 8 月的預告報導。

### BK. OpenAI Sora 2 API 於 9 月 24 日停止服務
- URL：https://developers.openai.com/api/docs/deprecations
- 發布日期：無法確認
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：OpenAI deprecations 頁與 Help Center 頁面無發布日期，停用通知原始日期為 2026-03-24（窗外）；窗內只有 NewsBytes、note.com 等低權重來源，無法確認發布日與權重的來源不採用。

### BL. 2026 台灣設計展「桃園流」開幕（智匯生城市沉浸展區、光雕展演）
- URL：https://news.ltn.com.tw/news/life/breakingnews/5584257
- 發布日期：2026-09-23
- 分類：現場表演藝術／房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：自由時報 09-23 開幕報導對科技內容只有「戶外光影展演」「智慧治理」等字眼，科技成分薄；udn 旅遊版 09-19「智匯生城市」報導頁尾標示為桃園市政府廣告；中央社訊息平台版本為 09-03 機構發稿且窗外。三者都不符合權重門檻。

### BM. 國光劇團 × 里昂新一代劇場《公主與她的魔法扇》「巨鏡」全像劇場技術
- URL：https://www.npac-weiwuying.org/programs/68df76b00c3c430009f6e13c
- 發布日期：無法確認（演出為 2026-05-22 至 05-24）
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：窗內補搜命中，但演出與媒體報導集中在 5 月，窗外；節目頁無發布日期。

### BN. 超維度 AI 沉浸劇場《MOVING PLUS：The World as Prompt》臺中歌劇院免費演出
- URL：https://udn.com/news/story/7270/9122993
- 發布日期：2025-11-06
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：`article:published_time` 2025-11-06，窗外。

### BO. Ontario Tech「Meladramma-AI」AI 歌劇
- URL：https://news.ontariotechu.ca/archives/2025/09/ontario-tech-stages-worlds-first-ai-infused-opera-meladramma-ai.php
- 發布日期：無法確認（網址為 2025/09 歸檔）
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：搜尋摘要稱 2026-09-21 首演，但原頁網址落在 2025 年 9 月歸檔，日期矛盾，未逐頁核對即淘汰。

### BP. 2026 Build for NextGen 國際永續智慧建築暨智慧建材展相關報導（樺康智雲、台達電、寶舖建設、台灣大）
- URL：https://technews.tw/2026/09/06/huakang-smart-cloud-new-products-2026-build-nextgen-tackling-net-zero-labor-shortage-challenges
- 發布日期：2026-09-06（展期 09-01 至 09-04）
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：2026-09-13 期已引用樺康智雲 Build for NextGen；同展覽其他廠商報導（台達電、寶舖、台灣大 09-03）均為系列活動重複且落在窗外。內政部建研所 09-01 同展新聞稿亦窗外。

### BQ. 中華電攜手亞旭 整合 5G 專網助力 AI 營建機器人
- URL：https://udn.com/news/story/7240/9725472
- 發布日期：2026-08-31
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：`article:published_time` 2026-08-31，窗外。

### BR. 內政部領航居住空間性別平權 智慧化居住空間科技性別化創新專家會議
- URL：https://www.abri.gov.tw/News_Content.aspx?n=752&s=342196
- 發布日期：2026-09-24
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 淘汰原因：日期在窗內且為一手來源，但內容是性別平權操作手冊與工作坊規劃，科技成分只有「智慧建築標章」誘因與零星創意發想，不符合「每筆都要有科技成分」門檻；已有兩筆建研所來源，避免同機構過度集中。

### BS. NASA Awards Launch Services for StarBurst Gamma-Ray Detector
- URL：https://www.nasa.gov/news-release/nasa-awards-launch-services-for-starburst-gamma-ray-detector/
- 發布日期：2026-09-17
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：NASA 一手來源、日期在窗內（頁面日期列 Sep 17, 2026，HTTP 200），但內容為發射服務採購公告（SpaceX VADR 任務指令、2028 年後發射），權重低於同期 PRIMA 任務選定；作為備選。

### BT. 衛武營當代歌劇「Miedka：野性面容」演繹跨越物種生死觀
- URL：https://www.cna.com.tw/news/acul/202609230287.aspx
- 發布日期：2026-09-23
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：原頁只提到電子樂與動物叫聲等環境音，科技成分弱；且與正式建議第 6 筆同為衛武營來源，避免重疊。

### BU. 「進擊的鼓手」4K 修復杜比版重映
- URL：https://www.cna.com.tw/news/amov/202609220246.aspx
- 發布日期：2026-09-22
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：原頁對 4K 修復與杜比全景聲僅一句帶過，無技術內容，屬片商宣傳。

### BV. 全劇無真人！陸首部演員授權「AI 劇」公開
- URL：https://www.ettoday.net/news/20260922/3242147.htm
- 發布日期：2026-09-22（依網址日期，未逐頁核對）
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：題材為中國 AI 短劇，資訊來源為中國平台的二手轉述，依來源規則不採用；2026-09-13 期已引用 AI 短劇真人演員危機，題材重複。

### BW. 頭城煙火節 250 架無人機展演
- URL：https://www.nownews.com/news/6870423（台南 9/5 熱氣球無人機為另一場，亦窗外）
- 發布日期：2026-09-18（NOWnews 頭城報導，前期已引用）
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：頭城煙火節無人機展演已於 2026-09-19 期引用；本期補搜 7 輪未找到窗內其他台灣無人機展演報導（台南 9/5、大稻埕 8/15、COMPUTEX 6/2 均窗外）。

### BX. 廣藝基金會 Aizart Spark 2026 AI 音樂劇場 6 部作品
- URL：https://news.586.com.tw/2026/09/653013/
- 發布日期：2026-09（未逐頁核對）
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：2026-09-19 期已引用同事件（cna postwrite 09-17），跨期去重。

### BY. 衛武營 8 週年慶 Open House 邀全民免費入席
- URL：https://www.cna.com.tw/news/acul/202609180037.aspx
- 發布日期：2026-09-18
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 淘汰原因：原頁對 AI 只有「結合 AI 科技與探戈舞步」一句，沒有技術細節；稽核補搜找到時間窗內的 Apple Music Hall 官方新聞稿，來源權重與技術含量皆明顯較高，因此替換。
EOF

cat > "$TASK/report.md" <<'EOF'
# 2026-09-26 科技服務資訊週記

**作者：Claude Code、Codex　報告日期：2026-09-26**

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

本期主線是**代理進入正式基礎建設，防護跟著往底層走**。Anthropic、OpenAI 與 xAI 同週發表新模型 [[1. Anthropic]](#ref-1) [[2. iThome]](#ref-2) [[58. xAI]](#ref-58)，微軟把 Copilot 拆成 Home、Code 與 Autopilot [[3. Microsoft]](#ref-3)，Apple 把 Siri AI 推進 beta [[57. Apple]](#ref-57)。工程端的預設值再收緊：GitHub 淘汰 SHA-1 RSA 簽章並加入 ML-KEM [[8. GitHub]](#ref-8)，Copilot app 新增本機沙箱 [[9. GitHub]](#ref-9)。警訊集中在供應鏈、隔離與後端：遭入侵的 GitHub Action 重新可見就再執行 [[18. The Hacker News]](#ref-18)，Cloudflare Containers 因儲存旗標讓租戶讀到殘留資料 [[17. Cloudflare]](#ref-17)，Gyazo 外洩 2,362 萬筆 [[60. Helpfeel]](#ref-60)，Bitget 遭竊 3.5 億美元 [[63. The Hacker News]](#ref-63)。台灣端，金管會開放試辦存款代幣 [[31. 金管會]](#ref-31)，數位部啟動主權 AI 語料徵集 [[59. 數位部]](#ref-59)。

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技

- **兩家前沿實驗室同週發新模型，主打的都是成本而非榜單。** Anthropic 9 月 22 日發表 Claude Opus 5.5，官方稱在多數工作上達到 Fable 5.1 的水準，典型工作負載成本較 Opus 5 低 40%；定價每百萬輸入 token 4 美元、輸出 20 美元，快取讀取降到 0.20 美元，比 Opus 5 低 60% [[1. Anthropic]](#ref-1)。同一天 OpenAI 公布 GPT-6 Sol 與輕量的 Luna，API 價格較 GPT-5.6 世代減半，Sol 每百萬 token 輸入 2 美元、輸出 10 美元，並新增快取儀表板與快取 prefix 設定 [[2. iThome]](#ref-2)。長時間代理任務的帳單大頭是快取讀取，兩家都把刀動在這裡。xAI 9 月 21 日推出的 Grok 4.7 則維持與 4.6 相同的價格與速度，改用更大的基礎模型與更長的強化學習訓練，加重需要數小時完成的任務 [[58. xAI]](#ref-58)。效能比較皆為廠商自評。
- **微軟把 Copilot 拆成三個角色：Home 是入口，Code 讓非開發者寫工具，Autopilot 離線也在跑。** 微軟 9 月 25 日宣布新版 Copilot，Home 把即時對話的 Chat 與可委派整件任務的 Cowork 放在同一處，並把 Word、Excel、PowerPoint 的完整能力內建進來；Code 讓使用者以自然語言建構並安全執行自己的解決方案，底層與 GitHub Copilot 相同；Autopilot 是持續運作的個人化代理，使用者離線也會繼續工作 [[3. Microsoft]](#ref-3)。Home 與 Code 將在數週內於 Frontier 計畫推出，Autopilot 月底擴大私人預覽；微軟同時公布 FinOps for AI 管理代理支出。內部工具與儀表板的需求會更常繞過工程團隊，開發者的價值往資料介面、權限邊界與可維護性移動。
- **Google 用非 AI 的驗證器替 AI 代理把關，500 個 XSS 幾乎零誤判。** Google 產品安全團隊公開內部代理 PageBreak：LLM 用於安全掃描的新瓶頸是雜訊，大量未經驗證的假設反而加重產品團隊負擔，因此專案早期就決定代理找到疑似漏洞後，交由非 AI 撰寫的專用驗證器對執行中的環境實際送出 payload 確認可利用 [[4. Google]](#ref-4)。PageBreak 自 2025 年 11 月試行、2026 年 1 月轉正式，多數使用 Gemini 3.1 Pro 或 3.5 Flash，已在第一方 Web 應用找出超過 500 個跨站指令碼漏洞。把 LLM 的輸出當假設而非結論，再用確定性工具驗證，是所有 AI 輔助工程都能套用的閉環。
- **台灣三分之一的工作年齡人口已在用生成式 AI。** 微軟 AI 經濟研究院的全球 AI 使用報告追蹤 147 個經濟體，今年第 2 季台灣使用率 33.8%，較第 1 季增加 2 個百分點，全球排名第 19，高於美國的 33% 與德國的 32.3%；全球整體為 18.8%，只有 31 個經濟體超過 30% [[5. 中央社]](#ref-5)。報告也指出全球北方與南方的差距由 12.1 拉大到 12.6 個百分點。對做台灣使用者產品的團隊，「使用者懂得對 AI 下指令」開始可以當成介面設計的基準假設。數據為微軟報告的自行統計。
- **Anthropic 開實驗室驗證 Claude 找到的酵素系統，人只給方向。** Anthropic 宣布成立生命科學研究小組與實驗室，讓 Claude 探索 DNA 資料集找出尚未被描述的蛋白質家族、大規模產生假設，再以實驗驗證。早期成果是 Claude 在科學家只給高層次方向下，自主發現一個與 DNA 重複序列陣列相關、模式令人聯想到 CRISPR 的新型酵素系統，以來自巨型噬菌體的反轉錄酶為基礎 [[6. Anthropic]](#ref-6)。Anthropic 明說尚不清楚其功能，成果為公司自述。這是「代理跑大規模探索、人只驗證候選」的科學版，套到程式碼庫就是讓代理掃整個 monorepo 找模式異常。
- **Siri AI 進 beta：先英文、下月五種語言，歐盟的 iPhone 初期沒有。** Apple 9 月 14 日釋出新一代 Apple Intelligence，隨 iOS 27 等 2027 年度軟體推出全新的 Siri AI：當日起以 beta 在英文環境推出，法、日、韓、葡、西語下月跟進，iOS、iPadOS 與 watchOS 在歐盟初期不提供。Siri AI 具備個人脈絡理解與螢幕內容感知，可在 WhatsApp 傳訊、在 Audible 播書，稍後可在 Outlook 草擬郵件、在 Notability 搜尋作業、在 Tripsy 加入餐廳；Image Playground 改由 Private Cloud Compute 上的新生成模型驅動，可生成寫實影像，並將支援 SynthID 標準 [[57. Apple]](#ref-57)。對 app 開發者，Siri 直接呼叫第三方 app 動作，等於多了一個語音優先的入口要設計。功能描述為 Apple 自述。
- **主權 AI 語料庫開始收民間內容，先把「可退出」講清楚。** 數位部 9 月 15 日啟動「臺灣主權 AI 訓練語料庫」民間語料徵集，部長林宜敬捐出兩本著作，秀威資訊、印刻文學、Readmoo 讀墨、食力、巨思文化等出版與電子書平臺業者現場簽署授權；語料庫自 2025 年底上線，初期以中央與地方政府語料為主，至 8 月底約 22 億 tokens。現階段以出版業為對象、無償授權，徵集授權出版品、簡介、試閱與逾著作權保護期的典籍四大類，並強調「自願參與、明確授權、可退出」三原則與下架管道 [[59. 數位部]](#ref-59)。林宜敬指出國際模型的中文訓練資料仍多為簡體中文。做繁中模型或 RAG 的團隊，這是少數授權邊界清楚的本土語料來源。

<a id="hl-software"></a>
### 軟體工程

- **GitHub Actions 硬切到 Node 24，沒有環境變數可以拖延。** GitHub 9 月 23 日發出最終通知，Node 20 已不再提供於 Actions runner，JavaScript actions 一律以 Node 24 執行，先前的退出選項 `ACTIONS_ALLOW_USE_UNSECURE_NODE_VERSION` 也已移除；action 作者要把 `runs.using` 改為 `node24` 並發布新版，Node 24 與 macOS 13.4 以前不相容、不正式支援 ARM32，使用這些平台的自架 runner 不再受支援 [[7. GitHub]](#ref-7)。CI 突然壞掉的第一件事，是查 pinned 的第三方 action 是否還在用 node20。
- **GitHub 的 SSH 進入後量子時代，三個日期要記。** GitHub 移除以 SHA-1 的 RSA 簽章與 `diffie-hellman-group-exchange-sha256` 交換機制，10 月 14 日起新上傳的 RSA 金鑰至少 3072 位元，同日啟用後量子金鑰交換 `mlkem768x25519-sha256`；11 月 4 日與 12 月 9 日各有一次 brownout [[8. GitHub]](#ref-8)。Java 27 同期把 JEP 527 後量子混合金鑰交換寫進 TLS 1.3，並預設啟用精簡物件標頭與 G1 垃圾回收器，Jipher 20 加入 ML-KEM 與 ML-DSA [[13. Oracle]](#ref-13)。老舊 CI 映像檔與嵌入式裝置裡的 SSH 客戶端，最容易在 brownout 當天出事。
- **代理的沙箱從「加一層」變成「沒沙箱就不跑」。** GitHub Copilot app 推出本機沙箱公開預覽，以專案為單位設定可讀寫與拒絕存取的資料夾、對外與本機網路、Git 與 GitHub CLI 憑證；若作業系統無法強制執行所請求的政策，沙箱 shell 直接失敗而不是降級執行，功能預設關閉，可用 `/sandbox on` 只對單一工作階段啟用 [[9. GitHub]](#ref-9)。Docker 則把本機的 Docker Sandboxes 延伸到雲端，每個沙箱是獨立微型虛擬機，`sbx move` 可在本機與雲端間搬移沙箱但不保留執行中的行程與金鑰，按秒計費、單次最長 24 小時 [[12. iThome]](#ref-12)。長時間代理任務要設計成可從檔案系統狀態重啟。
- **Node.js 與 VS Code 的例行版本，各有一件對日常工作有感的事。** Node.js 26.10.0 新增 `crypto.parsePKCS12()`、`util.debounce` 與 `util.throttle`、`SlidingWindowHistogram`，並讓內建 sqlite 把 `undefined` 綁定為 `NULL` [[10. Node.js]](#ref-10)。VS Code 1.139 讓代理可在 SSH、Tunnel 與 WSL 主機上專案的 Dev Container 內執行，並加快大量代理工作階段清單的載入 [[11. VS Code]](#ref-11)。debounce 進標準庫，代表這類小工具不必再拉相依套件；代理進遠端 Dev Container，等於讓 AI 用專案自帶的工具鏈建置與測試，少掉「在我機器上可以跑」的落差。

<a id="hl-security"></a>
### 軟硬體資訊安全

- **CISA 一次列入 Check Point、Arista 與 F5 的四個漏洞，並把「修補前先查有沒有被打」寫進要求。** 9 月 22 日 KEV 新增 Check Point 兩個漏洞（憑證驗證不當與路徑遍歷）、Arista VeloCloud Orchestrator 輸入驗證不當與 F5 BIG-IP APM 堆積緩衝區溢位；公告引用 BOD 26-04，要求聯邦機關優先修補對外曝露且被利用後可完全控制資產的漏洞，並建立修補前的入侵檢查 [[14. CISA]](#ref-14)。同期台灣網通廠 D-Link 公告 DIR-822A 路由器兩個漏洞，udhcpcd 的堆疊溢位 CVSS 10.0 且已有公開 PoC，狀態仍為調查中，官方建議關閉不必要的公網曝露與遠端管理 [[19. D-Link]](#ref-19)。
- **資安署的案例：根因不是設備老，是交接文件沒有 EOS 這一欄。** 資安署月報揭露某機關監視系統前端的防火牆遭駭，攻擊者竄改最高管理者帳號密碼並連進內網；追查發現業務交接只完成書面移交，沒有同步確認版本、原廠維護狀態與汰換時程，接手單位也未盤點，因此不知道設備已過原廠支援期限 [[15. iThome]](#ref-15)。建議包括獨立網段隔離、管理介面不直接對外、遠端維運「原則禁止、例外允許」並搭配零信任與來源 IP 白名單。資產清冊裡缺「EOS 日期」這一欄，就是整起事件的根因。
- **從一台 NAS 上的 Gitea 打到整個 Proxmox 叢集。** Acronis 揭露 Red Heron 利用 Gitea 遠端程式碼執行漏洞 CVE-2026-60004，在公開 PoC 出現後數日內武器化為自動化框架，掃描七國 1,386 個實例，另備一份含 477 個台灣系統的清單並於 8 月 3 日對 50 個目標批次攻擊；在一個台灣環境中，攻擊者從執行 Gitea 的 Synology NAS 取得三節點 Proxmox 叢集的 root 權限並啟動虛擬機備份 [[16. Acronis]](#ref-16)。報告同時揭露 C++ 植入程式 JITTERLY 與新的 LD_PRELOAD rootkit SIXZUT。自架 Gitea 的團隊要確認已升到 1.27.1 以上，並檢查 NAS 或 Proxmox 上的 Git 服務是否直接對外。
- **多租戶隔離可以被儲存層一個效能旗標打穿。** Cloudflare 說明 Containers 的跨租戶資料曝露：使用 Linux device mapper 的 thin provisioning 並啟用 `skip_block_zeroing`，新區塊配置時略過歸零，一次寫入小於 64 KiB 區塊時剩餘部分保留前一個擁有者的資料；漏洞由 HackerOne 回報，研究人員在六個正式環境位置辨識出 2,700 個不屬於自己的目錄 inode。Cloudflare 全機隊移除該設定、汰換所有執行中的容器磁碟並移除緩解前的映像快照，9 月 19 日完成清理，稱除授權測試外無遭利用證據 [[17. Cloudflare]](#ref-17)。自建精簡配置儲存的維運者可以直接檢查自家有沒有同樣設定。
- **供應鏈攻擊不需要新程式碼，儲存庫「重新可見」就夠了。** 兩個 actions-cool 組織的 action 在 5 月 Mini Shai-Hulud 事件中遭植入竊取 CI/CD 憑證的程式碼並停用，9 月 16 日再度變成可存取，但發行標籤未清理仍指向惡意內容，以版本標籤引用的工作流程下次執行就重新下載酬載；再度可存取的原因不明，目前已被 GitHub 以違反服務條款為由第二次停用 [[18. The Hacker News]](#ref-18)。釘選到 5 月 18 日之前完整 commit SHA 的工作流程不受影響。建議把 `actions-cool/issues-helper@v2.2.1` 視為受影響、輪替曝露的密鑰，並檢查執行紀錄中長期「Set up job」失敗後突然成功的執行。
- **一個上傳伺服器的漏洞，五天後變成 2,362 萬筆帳號外洩。** Gyazo 營運商 Helpfeel 公告 9 月 11 日第三方利用影像上傳伺服器漏洞取得系統存取並執行任意指令，當晚偵測、隔日封鎖攻擊路徑，事後確認資料庫遭存取；截至 9 月 16 日確認約 2,362 萬筆使用者資料外洩，含姓名或暱稱、email、密碼雜湊、裝置 ID、登入 session ID 與 X 整合 token，另有約 4.9 億筆主要為 2019 年 1 月以前影像的 metadata；公司要求全體使用者改密碼，9 月 24 日更新為暫停服務進行安全維護 [[60. Helpfeel]](#ref-60)。上傳端點是最常被忽略的可執行入口；session ID 與第三方 token 一起外洩，代表改密碼不夠，還得撤銷 session 與重發 token。

<a id="hl-hardware"></a>
### 硬體或軟硬整合

- **聯發科先喊出 2 奈米旗艦，裝置端目標是 30B 模型。** Dimensity 9600 Pro 採 2 奈米製程，聯發科自稱是第一家宣布達到此節點的業者；2+3+3 全大核，官方稱單核效能提升最多 17%、多核功耗降低 61%；雙 NPU 架構讓常時 AI 功耗降低 40%，NPU 1090 的 LLM prefill 效能提升 51%、每瓦 token 產生量提升 55%，支援最高 30B 參數的裝置端模型，並首度支援 LPDDR6 與 UFS 5.0 [[20. MediaTek]](#ref-20)。首批手機預計本季上市。效能數字為聯發科實驗室 demo 機測得，開發者應等實機再評估。高通 9 月 22 日在 Snapdragon Summit 同樣以 2 奈米製程推出 Snapdragon 8 Elite Extreme Gen 6 與 8 Elite Gen 6，稱為「多旗艦策略」，首發品牌九家；新聞稿正文未載效能百分比與裝置端模型參數量 [[61. Qualcomm]](#ref-61)。
- **台積電在美「核准出資」與「宣布投資」差了六倍。** 投審司 7 度核准台積電赴美投資，累計核准股本 440 億美元，最近一次是今年 7 月的 200 億美元；投審司說明審查的是對美國子公司的股本金額，不是全部投資支出，台積電宣布的在美投資總額為 2,650 億美元，預期未來仍會有新案 [[21. 中央社]](#ref-21)。成熟製程則往新加坡走：世界先進與恩智浦合資的 VSMC 從平地到建成只花 22 個月，首批 40 奈米良率逾 99%，2027 年第 1 季量產且產能已預售一空，聯電新加坡 P4 規劃提供矽光子產能、2028 年下半年量產 [[23. 中央社]](#ref-23)。
- **Meta 把 AI 裝置做成 43 公克的眼鏡。** Ray-Ban Meta Audio 售價 349 美元起，續航最高 12 小時、充電盒再提供 48 小時，10 月 13 日出貨；Ray-Ban Meta Gen 3 的 6 麥克風陣列可消除超過 90% 背景噪音；Meta 預告年底前 Ray-Ban、Oakley 與 Meta Glasses 三大系列合計超過 100 種眼鏡選擇，並將個人 AI 代理 Muse 帶進 AI 眼鏡 [[22. Meta]](#ref-22)。無螢幕、語音優先的互動設計會是下一個平臺議題。
- **人形機器人第一次有官方統計：7,000 台，許多在收資料。** IFR 首次在工業與服務型機器人之外統計人形機器人，2025 年全球售出約 7,000 台；IFR 秘書長指出其中許多台並未從事生產性工作，而是被研究機構或企業買來產生資料以改善 AI 模型，汽車製造商以個位數或雙位數台數試驗 [[24. 中央社]](#ref-24)。相較之下 2024 年安裝了約 54 萬 2,000 台工業機器人；美國銀行估 2026 年人形機器人出貨 9 萬台。現階段瓶頸在資料與 AI，不在機構。

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎

- **Cloudflare 終於處理 HTTP 最難看的部分：Vary。** Cache Rules 現在可對來源伺服器宣告的每個 Vary 標頭選擇三種動作：Normalize 正規化（`Accept`、`Accept-Language`、`Accept-Encoding` 自動套用）、Passthrough 以精確值作為快取鍵、Bypass 不快取；Cloudflare 引用的外部分析指出近 3,000 個網站在四個以上欄位上 Vary，部分達 47 個，功能對所有方案開放 [[25. Cloudflare]](#ref-25)。同週 Python Workers 正式發布，Cloudflare 提出 PEP 783 標準化 PyEmscripten 平臺並在 cibuildwheel 加入支援，FastAPI、Django、Flask 可經 WSGI／ASGI 連接器執行，不需 JavaScript 膠水程式碼 [[26. Cloudflare]](#ref-26)。做多語系或 A/B 內容的開發者值得重新檢視快取規則。
- **QUERY 是 2010 年以來第一個新 HTTP 動詞，WAF 規則還沒跟上。** SANS ISC 指出 RFC 10008 定義的 QUERY 介於 GET 與 POST 之間，安全、冪等、可快取，查詢放在本文；Nginx 會代理但不快取，Django 的 View 類別直接拒絕；只綁定 POST 的 WAF 簽章可被 QUERY 本文繞過，快取鍵未納入本文可能造成快取投毒，CSRF 中介層也可能忽略會改變狀態的 QUERY 端點 [[28. SANS ISC]](#ref-28)。作者尚未在日誌看到正式環境使用，但建議現在就把方法白名單加上 QUERY。
- **一個內部登入服務卡住，全球數百個 instance 一起慢下來。** The Register 報導 Salesforce 9 月 16 日發生數小時的全球中斷，狀態頁描述為嚴重延遲、間歇錯誤與部分服務無法存取，波及美、日、印、英、法、德等地數百個 instance；09:10 UTC 的更新指出「請求在等待內部登入服務回應時卡住，耗盡可用伺服器資源」，到 14:00 UTC 仍有 instance 未完全恢復並出現排程工作未執行的回報，事故撞上 Dreamforce 開幕隔天 [[62. The Register]](#ref-62)。認證服務是所有請求的同步依賴，逾時與斷路器設計得不好，局部的慢就會擴散成全域中斷。事故細節為媒體轉述狀態頁。
- **一條海纜的容量翻倍，靠的是多芯光纖而不是更多電力。** Meta 宣布 Petal 跨大西洋海纜，設計容量每秒 1 petabit，是目前最先進跨洋海纜的兩倍，長約 7,000 公里連接美國與法國，合作夥伴為 NEC、住友電工與 Orange；多芯光纖讓容量翻倍而不需等比例增加電力或實體設施，預計 2029 年啟用 [[27. Meta]](#ref-27)。「首條」與「有史以來最大」為 Meta 自評。
- **AI 算力採購連帶鎖定記憶體，台灣電力則走到再運轉審查的下一關。** Anthropic 承諾 7 年支付 Akamai 116 億美元購買雲端服務，並取得最高 5% 股權的認股權證；Akamai 2026 年資本支出因此增加約 17 億美元，且已授權捷普採購約 17 億美元記憶體零組件 [[30. 中央社]](#ref-30)。台灣端，核安會經 3 回合審查、589 項意見後核定核三廠再運轉計畫，台電後續須提交執行結果報告，核安會強調仍有多項程序與安全管制作業 [[29. 中央社]](#ref-29)。原頁未提及重啟時程或供電量。

<a id="hl-fintech"></a>
### 金融科技

- **金管會開放存款代幣試辦，法律上仍是存款，技術上要交代帳本怎麼對。** 金管會 9 月 22 日開放銀行依「金融業申請業務試辦作業要點」申請試辦存款代幣，定性為以區塊鏈等新型態方式表彰或記錄的銀行存款；營業計畫書須說明試辦範圍、發行／移轉／贖回／銷毀流程與現行存款、匯款作業的差異、存款帳務與代幣帳本的勾稽對帳機制、技術架構（節點、錢包、智能合約）與試辦結束時的客戶權益保障 [[31. 金管會]](#ref-31)。同日金管會宣布督導證交所與櫃買中心建置的「臺股儀表板」9 月 23 日上線，整合授信、違約與營收三大面向指標，預設顯示最近 5 個交易日走勢 [[34. 金管會]](#ref-34)。對開發者，營業計畫書的五項事項就是一份系統整合的需求規格。
- **玉山把行內 API 全面 Agent 化，SOP 寫成技能檔。** 玉山金控首度公開預計 9 月底上線的 GENIE 3.0：統一的 Root Agent 判讀意圖，再透過 REST API 或 MCP 呼叫行內服務或各類 Agent；2.0 的 Prompt 模板庫在 3.0 變成技能與工具儲存庫，把業務單位 SOP 寫成技能檔，讓 LLM 知道流程需要哪些 API 或工具；所有 Agent 應用與工具都須依玉山自訂的 Agentic Framework 開發並上架登記 [[32. iThome]](#ref-32)。Root Agent、MCP 閘道與技能儲存庫的三層結構，和開發者社群寫 agent skills 的路徑幾乎一致。
- **SEC 把 AMM 流動性池寫進正式命令。** SEC 9 月 17 日發布暫時性、附條件的「創新豁免」，讓代幣化證券交易場所不落入 1934 年證券交易法的交易所定義，可用經許可的自動做市商與流動性池交易代幣化的 NMS 股票，並暫時豁免以自有資本提供流動性者的交易商認定；委員會同時徵求公眾意見 [[33. SEC]](#ref-33)。對做券商或 DeFi 系統的人，豁免條件就是合規檢查清單。
- **交易所後端被打穿，3.5 億美元從熱錢包流出。** Bitget 表示 9 月 24 日 18:31 UTC 安全系統偵測到少數熱錢包出現未授權轉帳，熱錢包與溫錢包合計損失 3.516 億美元；帳戶餘額正確、存款與交易照常，但暫停提領進行全面安全檢視，並委託 Mandiant 與 SlowMist 調查。受影響資產含 ETH、XRP、BNB、AVAX、USDT 與 USDC，涉及七條鏈；Bitget 稱手法與北韓組織一致，未揭露入侵方式，自託管的 Bitget Wallet 未受影響 [[63. The Hacker News]](#ref-63)。熱錢包簽章流程的後端才是真正的攻擊面，鏈上多簽擋不住後端被入侵後發出的授權。

<a id="hl-healthtech"></a>
### 醫療科技

- **奇美急診用地端 LLM，掛號後 30 秒生成一頁病歷摘要。** 奇美醫院與數位產業署、工研院合作的智慧急診病歷摘要系統，運用地端醫療專用大語言模型與邊緣運算，病人掛號後即開始整理病歷，約 30 秒生成一頁式摘要，醫師看診前一鍵開啟並可追問細節；系統不與外部網路連結，敏感資訊留在院內，定位為醫療資訊助手，解讀與決策仍由醫師負責 [[35. 中央社]](#ref-35)。過去醫師要登入多個系統逐一查詢，再花 5 至 10 分鐘人工彙整。地端 LLM 加邊緣運算加病歷追問，是醫療場域「不出院」部署的典型架構。
- **健康幣把預防保健做成點數系統，掛在健保快易通上。** 行政院會 9 月 17 日聽取衛福部規劃，健康幣 10 月 1 日上線，民眾在健保快易通 APP 填寫生活型態量表或完成健檢、癌症篩檢、疫苗即可累積，滿 1,000 幣可至指定通路兌換商品、醫療服務與運動課程；院長要求注意高齡與數位落差族群，研議與運動幣整合，並重視個資保護與資料治理 [[36. 衛福部]](#ref-36)。跨通路兌換與個資治理是這類公部門積分系統最難的兩段。
- **大模型做離線工具，小模型做預測：MIT 的自殺風險詞庫。** MIT McGovern 腦研究所團隊先用 AI 產生與 49 項風險因子相關的詞句、每項約 60 個詞，人工與臨床專家審核後建成詞庫，再以輕量、可解釋的機器學習模型在 Crisis Text Line 約 16,000 則去識別化對話上預測三級風險；提及致命手段與物質使用者比表達憂鬱情緒者更可能屬最高風險組，模型可在個人電腦執行並標示觸發詞句，詞庫與軟體套件已公開 [[37. MIT News]](#ref-37)。團隊強調臨床使用前須充分驗證且需有人在迴路。
- **放射科 CAD 與 CADt 器材未獲 510(k) 部分豁免。** FDA 在聯邦公報刊登最終命令，正式駁回將放射科電腦輔助偵測／診斷與電腦輔助分診通知等四類器材部分豁免上市前通知的請願；駁回決定本身在 4 月 1 日作出，9 月 17 日刊登並生效 [[38. Federal Register]](#ref-38)。這表示請願涵蓋的器材類型仍須在上市前提交並取得 510(k) 許可；原命令未觸及軟體更新的送件規則。
- **可以吞下去、也會自己消失的電池。** MIT 以鎂與三氧化鉬電極、離子液體凝膠電解質做出可生物吸收的微型電池，輸出 1.84 伏特，在模擬胃酸中可正常運作約三天、數週內完全分解；可供胃部電刺激膠囊連續刺激最長三天，動物實驗中 20 分鐘刺激讓飢餓素提高約 50%，也可讓 RFID 膠囊從腸胃道持續發送訊號達 1.5 公尺 [[39. MIT News]](#ref-39)。研究刊於《Nature Chemical Engineering》，SAFARI 系統的臨床試驗預計約兩年後啟動。

<a id="hl-logistics"></a>
### 運輸物流

- **臺鐵帶著自己開發的平交道偵測去柏林。** InnoTrans 2026 臺鐵首度攜手工研院與至鴻科技參展，展出已實際營運的兩項系統：以 AI 影像辨識車型並自動切換洗車模式的智慧化列車自動洗車設備，以及以熱影像攝影機與毫米波雷達雙重偵測、24 小時掃描平交道淨空區並以無線電告警通知司機員的平交道障礙物自動偵測系統，平交道偵測系統為國內自主開發、未來可自行升級軟體，兩項皆為國產化研發成果 [[40. 臺鐵]](#ref-40)。交通部長陳世凱受訪時表示台灣首度設立台灣館，AI、資通訊與數位孿生是業者進軍海外的競爭優勢，但車輛設計、系統整合與測試驗證能力仍需補強 [[41. 中央社]](#ref-41)。
- **Level 3 的關鍵不是車會不會開，是系統能不能確認駕駛接得回來。** 車輛中心的高抗遮蔽 AI 駕駛視線追蹤技術同步分析頭部姿態、注視方向與眼睛開閉狀態，戴口罩、墨鏡或在低光源隧道、強逆光下仍可辨識，對應 UN R171 駕駛專注監測與 R157 接管能力法規，只需約 10 TOPS 的邊緣算力即可即時運作，已導入國內首輛 Level 3 自駕電動巴士 [[42. 自由財經]](#ref-42)。10 TOPS 的算力預算與法規對應，是嵌入式視覺系統很具體的規格參考。
- **Waymo 的安全報告更新到 2.7 億英里，同時再開一個城市。** 截至 6 月底的五個服務區數據顯示，不論肇責歸屬，Waymo Driver 涉及的受傷事故比人類駕駛少 841 起、減少 82%，嚴重受傷以上減少 95%，涉及行人的受傷事故減少 93% [[43. Waymo]](#ref-43)。9 月 14 日拉斯維加斯開放公眾乘車，服務區約 24 英里，與丹佛、聖地牙哥同為首批以搭載第 6 代 Driver 的 Ojai 車款為主力的城市 [[44. Waymo]](#ref-44)。數據為廠商自評，但方法論公開。

<a id="hl-proptech"></a>
### 房地產與室內外裝潢

- **建研所在同一場近零碳交流活動並列智慧工地與立面光電。** 建研所 9 月 16 日在高雄舉辦智慧節能創新技術跨域交流，企業代表分享智慧工地與立面彩繪光電；內政部的近零碳建築減碳旗艦行動計畫從擴大建築能效、老宅延壽及社會住宅、綠領人才培育三大主軸推動，由公有建築率先示範，並串聯環境部、教育部、勞動部與經濟部資源 [[45. 建研所]](#ref-45)。做建築 IoT 或能源管理平台的人可以留意這條政策線，工地感測、能耗監測與光電發電量的整合需求已被預告。
- **AI 供應鏈的實體需求正直接轉成廠房交易。** 第一太平戴維斯統計，前三季大型商用不動產交易 2,577 億元創新高、年增 109%，第 3 季廠房交易 602 億元占近七成；指標案包括廣達以 197 億元購入華亞廠房布局 AI 伺服器產線，凱基人壽 206 億元購入潤泰玉成廣場且輝達等科技企業已承租逾半棟，廠房熱區為苗栗與桃園 [[46. 聯合新聞網]](#ref-46)。數據為顧問公司報告。開發者平常只看到雲端算力，這則提醒背後的不動產也是 AI 供應鏈的一環。
- **把交通攝影機當感測器、把影像當資料集。** MIT Senseable City Lab 曾以機器學習辨識紐約 331 支交通攝影機中的車輛類型並估算排放；新書《How AI Sees the City》說明視覺 AI 可回答路口哪裡最危險、公園哪裡最吸引人，也列出大規模視覺監控的侵入性與 AI 強化偏見的風險 [[47. MIT News]](#ref-47)。開發都市分析系統時要把資料治理設計在前面。

<a id="hl-arts"></a>
### 現場表演藝術

- **光雕投影對準的是戲台幾何和操偶節奏。** 文總與證交所創新板的影像企劃「創新辦桌」第 4 集回顧新勝景掌中劇團：動畫導演朱祥溥 2018 年把光雕投影帶回家中劇團，為白晝之夜製作純白景片讓大雪、烈火等光影特效在戲台流轉，作品 2019 年赴北美巡演、2025 年前進大阪 We Taiwan 活動 [[48. 中央社]](#ref-48)。光雕要對準戲台幾何、又要與操偶節奏同步，本質上是即時渲染與內容排程問題。內容基於文總新聞稿。
- **Apple 把演出場館做成一條產線：進場演一次，出來就是 Spatial Audio、播送混音與多機位影片。** Apple 9 月 21 日宣布倫敦 Battersea Power Station 的 Apple Music Hall 啟用：600 人容量、38 英尺寬可重組舞台、環繞觀眾的 48 支揚聲器空間音效系統；後台兩間專業錄音混音室把每場演出錄成多軌，可即時或事後混成 Spatial Audio，場館預埋 16 個以上機位接到播送控制室，iPhone 與傳統廣播攝影機並行拍攝，演出也會全球直播 [[49. Apple]](#ref-49)。對做直播與後製管線的人，這是把錄音、混音、多機位與串流整合進同一個場館的參考架構。場館規格為 Apple 自行揭露。

<a id="hl-entertainment"></a>
### 影視音樂

- **AI 樂手要跟得上真人臨場變速，重點是低延遲而不是生成。** 資策會在經濟部科技專案下研發 AI 音樂理解與智慧協奏技術，四項能力為環境降噪與多聲源分離、辨識節奏和弦曲風的音樂理解模型、AI 音色建模，以及動態跟拍即時調整速度；「AI 一人成團」以吉他示範，演奏者加速、放慢或改變節奏時虛擬樂手能動態調整伴奏，將於 9 月 29 日至 30 日的 ICT TechDay 展出 [[50. 聯合新聞網]](#ref-50)。原頁未提及模型架構或延遲數字。
- **YouTube 的肖像偵測進手機，並要把聲紋疊上臉部比對。** Made On YouTube 2026 公布數十億個頻道已符合資格申請自動化深偽偵測，肖像偵測將直接在行動 App 提供設定、檢視與處置；YouTube 表示肖像也包括聲音，今年稍晚開始把說話聲音偵測與臉部偵測整合，以提升比對準確度 [[51. YouTube]](#ref-51)。平台級身分保護正從被動申訴走向主動偵測與通知。
- **取得授權的 AI 聲音，觀眾不一定買單。** Netflix 實境秀「Wonka's The Golden Ticket」以 ElevenLabs 生成已故演員 Gene Wilder 的聲音擔任旁白，製作方表示獲得遺產管理方與遺孀明確同意，並翻閱數小時有聲書捕捉其節奏與語氣；影迷關注焦點卻是這個決定本身 [[52. NBC News]](#ref-52)。技術可行、授權齊備，揭露方式仍要一起設計。
- **「從零重訓」擋不住第二次訴訟，爭點變成用侵權模型的產出當訓練資料算不算洗白。** UMG 與 Sony Music 9 月 18 日在波士頓聯邦法院二度控告 Suno，指其未經授權複製 60,202 首錄音建構模型；依故意侵權每件最高 15 萬美元計，理論上限略高於 90 億美元，另就規避 YouTube 反下載技術每次求償最高 2,500 美元。Suno 產品長曾稱 v6「完全從零訓練」且不含兩家公司資料，唱片公司則主張 v6 是「同一棵毒樹的果實」[[64. Music Business Worldwide]](#ref-64)。用舊模型的輸出蒸餾新模型是常見做法，這個案子會決定它在著作權上算不算切割責任的方法。

<a id="hl-others"></a>
### 其他領域科技應用突破

- **ESA 第一顆專門量植物螢光的衛星升空。** ESA 的 FLEX 與 Copernicus Sentinel-3C 9 月 15 日搭乘 Vega-C 一箭雙星升空，FLEX 的螢光成像光譜儀偵測植物吸收陽光時發出的極微弱螢光，直接反映植被把陽光與二氧化碳轉換成能量的效率，用於評估植物健康與生態系生產力 [[53. ESA]](#ref-53)。NASA 同週選定 PRIMA 遠紅外線望遠鏡為 Probe Explorers 新任務級別首案，成本上限 12 億美元、2033 年發射、規劃執行五年，由 JPL 主導，並有法、義、德、加、韓（KASI／KASA）、日、英七個國際夥伴機構 [[54. NASA]](#ref-54)。
- **Google 先問 TPU 在太空活不活得下來，再談架構。** Project Suncatcher 首次在軌測試與 Planet 合作打造原型衛星，預定搭乘 SpaceX Transporter-18 共乘任務升空（原頁稱下週），目的是蒐集 TPU 承受發射振動、最高 10 倍重力持續加速度、輻射與真空散熱的實測資料；地面輻射測試顯示 Trillium 世代 TPU 在超過五年任務累積劑量下表現良好，下一步是 2027 年部署兩顆衛星測試雷射互連 [[55. Google]](#ref-55)。對做極端環境運算的人，輻射、熱與振動三個維度的實測資料比任何模擬都值錢。原頁僅稱「下週」發射，未載明具體日期與衛星規格。
- **企業問研究團隊的不是酷不酷，是技術成熟度與導入條件。** 國科會 2026 未來科技館閉幕，集結 84 件未來科技獎成果，3 天逾 5 萬人次進場、150 場技術洽談與 27 件技術發表；國科會指出企業關心技術成熟度、驗證成果、導入條件與開發時程，讓交流從「認識技術」往「如何使用技術」推進 [[56. 中央社]](#ref-56)。想把研究成果做成產品的人，先準備可驗證的 demo 與整合路徑。

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技

**價格戰打到快取層，代理成本結構正在重寫。** Opus 5.5 把快取讀取降到 Opus 5 的四成 [[1. Anthropic]](#ref-1)，GPT-6 Sol 與 Luna 把 API 價格砍半並附上快取儀表板 [[2. iThome]](#ref-2)。長時間代理任務的帳單主要是重複讀取上下文，兩家同時往這裡降價，說明競爭焦點已從單次推論轉向代理工作流的總成本。xAI 的 Grok 4.7 也把重點放在更長的強化學習與多小時任務 [[58. xAI]](#ref-58)。同時，微軟把 Copilot 拆成入口、程式與離線代理三個角色 [[3. Microsoft]](#ref-3)，Apple 讓 Siri AI 直接呼叫第三方 app 動作 [[57. Apple]](#ref-57)，代理產品的形狀逐漸固定下來。

**「AI 找、確定性工具驗」成為可信賴的工程模式。** PageBreak 把代理找到的漏洞交給非 AI 驗證器實際送 payload 確認 [[4. Google]](#ref-4)，Anthropic 讓 Claude 產生假設、再在自有實驗室以實驗驗證 [[6. Anthropic]](#ref-6)，MIT 用 LLM 產生詞庫、再用輕量可解釋模型做預測 [[37. MIT News]](#ref-37)。三個案例的共通點是 LLM 的輸出只當假設，最後一哩交給可重現的驗證。台灣三分之一工作年齡人口已在用生成式 AI [[5. 中央社]](#ref-5)，這套模式會越來越常出現在一般產品裡。訓練資料的治理也開始有制度：數位部以「自願參與、明確授權、可退出」徵集繁中語料 [[59. 數位部]](#ref-59)，模型能力之外，資料來源的授權邊界成了同等重要的戰場。

<a id="tr-software"></a>
### 軟體工程

**平台把不安全的預設值直接拔掉，緩衝期越來越短。** Node 20 的退出環境變數已移除 [[7. GitHub]](#ref-7)，SSH 的 SHA-1 RSA 簽章排定兩次 brownout 後移除 [[8. GitHub]](#ref-8)，Java 27 直接把 G1 與精簡物件標頭設為預設 [[13. Oracle]](#ref-13)。對維護老專案的團隊，「不升級就不動」的策略成本在上升；CI 映像檔、嵌入式裝置與 pinned 的第三方 action 是最常被遺忘的三個角落。

**代理的執行環境本身成為產品。** Copilot app 的本機沙箱以 fail closed 為原則 [[9. GitHub]](#ref-9)，Docker 把沙箱做成可在本機與雲端搬移的微型虛擬機 [[12. iThome]](#ref-12)，VS Code 讓代理進遠端 Dev Container [[11. VS Code]](#ref-11)。競爭點從「代理多聰明」移到「代理在哪裡跑、能碰什麼、斷線怎麼辦」。Node.js 把 debounce 與 PKCS#12 解析收進標準庫 [[10. Node.js]](#ref-10)，則是另一種減少相依的方式。

<a id="tr-security"></a>
### 軟硬體資訊安全

**邊界設備與供應鏈是本期反覆出現的兩個入口。** CISA 一次列入 Check Point、Arista VeloCloud 與 F5 BIG-IP APM 的四個漏洞 [[14. CISA]](#ref-14)，D-Link 路由器的 DHCP 溢位 CVSS 滿分 [[19. D-Link]](#ref-19)，資安署的案例則是過了支援期限的防火牆成為內網跳板 [[15. iThome]](#ref-15)。供應鏈端，遭入侵的 GitHub Action 只因儲存庫重新可見就再次執行 [[18. The Hacker News]](#ref-18)，Red Heron 從自架 Gitea 一路打到虛擬化叢集 [[16. Acronis]](#ref-16)。Gyazo 的外洩則提醒上傳端點本身就是可執行入口，且 session 與第三方 token 一併外洩 [[60. Helpfeel]](#ref-60)。三條線的共同解法很老：資產清冊要有 EOS 日期，第三方引用要釘到 commit SHA，上傳端點當成程式執行面來防。

**多租戶平台的隔離要往儲存層檢查。** Cloudflare Containers 的問題不在容器，而在 dm-thin 一個略過歸零的效能旗標 [[17. Cloudflare]](#ref-17)。自建精簡配置儲存的維運者可以直接檢查自家有沒有同樣設定。BOD 26-04 把「修補前是否已遭入侵」寫成要求 [[14. CISA]](#ref-14)，也代表修補作業的定義正在擴大。

<a id="tr-hardware"></a>
### 硬體或軟硬整合

**裝置端 AI 的天花板由記憶體與製程一起拉高。** 天璣 9600 Pro 以 2 奈米製程、LPDDR6 與 UFS 5.0 把裝置端模型上限推到 30B 參數 [[20. MediaTek]](#ref-20)，Meta 把 AI 代理裝進 43 公克的眼鏡 [[22. Meta]](#ref-22)。高通同週以同一製程推出兩款旗艦並稱為多旗艦策略 [[61. Qualcomm]](#ref-61)，2 奈米在 9 月同時成為兩家手機 SoC 的旗艦門檻。這些都是「模型往裝置搬」的硬體前提，行動端 AI 應用的設計假設要跟著更新，但效能數字皆為廠商自評。

**台灣半導體的地理布局有兩個時間軸。** 先進製程在美國的核准出資 440 億美元，離宣布的 2,650 億美元還很遠 [[21. 中央社]](#ref-21)；成熟製程與矽中介層則在新加坡快速落地，VSMC 22 個月建成、2027 年第 1 季量產 [[23. 中央社]](#ref-23)。人形機器人的首份官方統計顯示許多機器在收資料而非工作 [[24. 中央社]](#ref-24)，機器人軟體團隊可以從資料管線的角度看這個市場。

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎

**HTTP 這一層還在變，快取與方法白名單要重新檢視。** Cloudflare 把 Vary 做成可設定的正規化、直通與略過 [[25. Cloudflare]](#ref-25)，QUERY 方法則讓只認 GET 與 POST 的 WAF、CSRF 中介層與快取鍵出現盲點 [[28. SANS ISC]](#ref-28)。做多語系、A/B 內容或 API 閘道的團隊，本期值得把快取規則與方法白名單各看一遍。Python Workers 正式版與 PEP 783 [[26. Cloudflare]](#ref-26)，則讓 Python 應用可以不改寫成 JavaScript 就部署到邊緣。Salesforce 的全球中斷則說明認證服務是所有請求的同步依賴，逾時設計決定局部故障會不會擴散 [[62. The Register]](#ref-62)。

**算力擴張的瓶頸從 GPU 擴到記憶體、海纜與電力。** Anthropic 與 Akamai 的 116 億美元合約直接帶動 17 億美元的記憶體預購 [[30. 中央社]](#ref-30)，Meta 用多芯光纖讓跨洋海纜容量翻倍而不等比例增加供電 [[27. Meta]](#ref-27)，台灣的核三再運轉計畫核定後進入執行與後續審查 [[29. 中央社]](#ref-29)。這些都是 2027 年之後才會影響延遲、頻寬與供電條件的變數。

<a id="tr-fintech"></a>
### 金融科技

**監管機關開始用試辦與豁免把鏈上機制納入既有法規。** 金管會把存款代幣定性為存款、以試辦要點開放 [[31. 金管會]](#ref-31)，SEC 以暫時豁免讓 AMM 流動性池成為受監管的交易場所 [[33. SEC]](#ref-33)。兩者都不是新法，而是既有框架的延伸；對開發者，營業計畫書與豁免條件本身就是系統需求規格。金管會的臺股儀表板 [[34. 金管會]](#ref-34) 則是主管機關把風險指標做成公開資料面。Bitget 遭竊 3.5 億美元 [[63. The Hacker News]](#ref-63) 是同一週的另一面：鏈上機制被納入監管的同時，交易所後端仍是最大的單點風險。

**銀行內部的代理架構開始標準化。** 玉山的 Root Agent、MCP 閘道與技能儲存庫三層結構 [[32. iThome]](#ref-32)，把行內 API 目錄變成代理可讀的工具清單，SOP 變成技能檔。金融業的合規要求會讓這類框架的權限控管與稽核軌跡比一般企業更早成熟。

<a id="tr-healthtech"></a>
### 醫療科技

**醫療 AI 的部署形狀是地端、可解釋、人在迴路。** 奇美的急診摘要系統不連外網 [[35. 中央社]](#ref-35)，MIT 的自殺風險模型可在個人電腦執行並標示觸發詞句 [[37. MIT News]](#ref-37)，FDA 維持放射科 CAD／CADt 器材上市前都要走 510(k) [[38. Federal Register]](#ref-38)。三者指向同一件事：醫療場域的 AI 不會走「雲端大模型、頻繁更新」的路，而是小模型、本地部署、法規節奏。健康幣把預防保健做成點數系統 [[36. 衛福部]](#ref-36)，可吸收電池讓吞服裝置幾乎整顆可降解（僅剩電路板）[[39. MIT News]](#ref-39)，則是醫療科技往「日常」與「無痕」兩端延伸。

<a id="tr-logistics"></a>
### 運輸物流

**台灣軌道產業的出口敘事從硬體轉向軟體與資料。** 臺鐵展出的平交道偵測強調國內自主開發、可自行升級，AI 洗車為國產化研發成果 [[40. 臺鐵]](#ref-40)，交通部長點名 AI、資通訊與數位孿生為競爭優勢 [[41. 中央社]](#ref-41)。車輛中心的視線追蹤以 10 TOPS 邊緣算力對應 UN R171 與 R157 [[42. 自由財經]](#ref-42)，說明自駕的法規合規正在變成具體的嵌入式規格。

**自駕的安全數據開始像可靠度報告。** Waymo 以不分肇責的比較基準與公開方法論更新 2.7 億英里的數據 [[43. Waymo]](#ref-43)，拉斯維加斯與丹佛、聖地牙哥則成為首批以搭載第 6 代 Driver 的 Ojai 為主力車隊的城市 [[44. Waymo]](#ref-44)。做任何自動化系統的人都可以參考它怎麼定義基線與指標。

<a id="tr-proptech"></a>
### 房地產與室內外裝潢

**建築的科技需求來自政策與 AI 供應鏈兩端。** 政策端，建研所把智慧工地與立面光電放進近零碳建築計畫 [[45. 建研所]](#ref-45)；需求端，AI 伺服器產線與資料中心讓第 3 季廠房交易占單季商用不動產近七成 [[46. 聯合新聞網]](#ref-46)。城市尺度的視覺 AI 分析 [[47. MIT News]](#ref-47) 則提醒，這些空間資料一旦大規模蒐集，隱私與偏見治理要先設計。

<a id="tr-arts"></a>
### 現場表演藝術

**表演場館開始把後製與播送當成基礎設施內建。** Apple Music Hall 把多軌錄音、Spatial Audio 混音、多機位播送與全球直播預埋在場館裡，演出結束即可交付成品 [[49. Apple]](#ref-49)；新勝景的光雕布袋戲則是動畫工具進入傳統戲台的長期案例 [[48. 中央社]](#ref-48)。兩者的共同點是把製作能力搬到演出現場。本分類的台灣高權重來源仍偏少，趨勢觀察以國際案例為主。

<a id="tr-entertainment"></a>
### 影視音樂

**AI 在影音的戰場分成即時互動與身分保護兩條。** 資策會的協奏技術重點是低延遲的節拍追蹤與聲源分離 [[50. 聯合新聞網]](#ref-50)，與離線生成是不同的工程問題。身分保護端，YouTube 把聲紋疊上臉部比對並進手機 [[51. YouTube]](#ref-51)，Netflix 的 Wilder 聲音案例則顯示授權齊備仍會遇到觀眾反彈 [[52. NBC News]](#ref-52)。「同意、署名、揭露」三件事要一起設計。UMG 與 Sony 二告 Suno，把爭點推到「用侵權模型的產出重訓算不算洗白」[[64. Music Business Worldwide]](#ref-64)，生成模型的訓練資料血統會成為授權談判的核心。

<a id="tr-others"></a>
### 其他領域科技應用突破

**太空任務的關鍵詞從「更大」變成「先驗證、設上限」。** FLEX 量的是極微弱的植物螢光 [[53. ESA]](#ref-53)，PRIMA 是有 12 億美元成本上限的新任務級別 [[54. NASA]](#ref-54)，Suncatcher 先量 TPU 能不能活過發射與輻射再談算力 [[55. Google]](#ref-55)。國科會的閉幕說明企業問的是技術成熟度與導入條件 [[56. 中央社]](#ref-56)，研究成果要先準備可驗證的 demo 與整合路徑。

<a id="references"></a>
## 參考資料

| 編號 | 文章標題與搜尋連結 | 一句話繁體中文結論或亮點 | 發布日期 | 來源資料網址與名稱 | 分類 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ref-1"></a>1 | [Introducing Claude Opus 5.5](https://www.google.com/search?q=Anthropic+Introducing+Claude+Opus+5.5) | 以 Opus 5 六成成本達到 Fable 5.1 水準，快取讀取降價 60%。 | 2026-09-22 | [Anthropic](https://www.anthropic.com/claude-opus-5-5) | AI 科技 |
| <a id="ref-2"></a>2 | [OpenAI 公布 GPT-6 Sol、Luna，價格較前代降低一半](https://www.google.com/search?q=OpenAI+GPT-6+Sol+Luna+價格+降低一半+iThome) | Sol 與 Luna 的 API 價格較 GPT-5.6 世代減半，並新增快取儀表板。 | 2026-09-23 | [iThome](https://www.ithome.com.tw/news/179160) | AI 科技 |
| <a id="ref-3"></a>3 | [Introducing the new Copilot with Home, Code and Autopilot](https://www.google.com/search?q=Microsoft+new+Copilot+Home+Code+Autopilot) | Copilot 新增 Home、Code 與 Autopilot，離線也持續運作的代理月底擴大私人預覽。 | 2026-09-25 | [Microsoft Official Blog](https://blogs.microsoft.com/blog/2026/09/25/introducing-the-new-copilot-with-home-code-and-autopilot/) | AI 科技 |
| <a id="ref-4"></a>4 | [Agentic Hacks, Real Proofs: Inside Google's PageBreak Project](https://www.google.com/search?q=Google+PageBreak+agentic+XSS+deterministic+validation) | AI 代理找漏洞、非 AI 驗證器實際打 payload 確認，找出逾 500 個 XSS。 | 2026-09-24 | [Google The Keyword](https://blog.google/security/agentic-hacks-real-proofs-inside-googles-pagebreak-project/) | AI 科技 |
| <a id="ref-5"></a>5 | [台灣 AI 使用率升至 33.8%　躍居全球第 19 名](https://www.google.com/search?q=台灣+AI使用率+33.8+全球第19名+微軟+中央社) | 台灣工作年齡人口生成式 AI 使用率 33.8%，全球排名第 19。 | 2026-09-22 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609220112.aspx) | AI 科技 |
| <a id="ref-6"></a>6 | [Claude discovers a novel enzyme system with CRISPR-like repeats](https://www.google.com/search?q=Anthropic+Claude+discovers+novel+enzyme+system+CRISPR-like+repeats) | Anthropic 成立生命科學實驗室，Claude 自主發現具 CRISPR 式重複序列的新型酵素系統。 | 2026-09-23 | [Anthropic](https://www.anthropic.com/news/claude-discovers-novel-enzyme-system) | AI 科技 |
| <a id="ref-7"></a>7 | [Node 20 is no longer available in GitHub Actions](https://www.google.com/search?q=GitHub+Actions+Node+20+no+longer+available+node24) | Runner 一律以 Node 24 執行 JavaScript actions，退出選項已移除。 | 2026-09-23 | [GitHub Changelog](https://github.blog/changelog/2026-09-23-node-20-is-no-longer-available-in-github-actions) | 軟體工程 |
| <a id="ref-8"></a>8 | [Security improvements for SSH](https://www.google.com/search?q=GitHub+changelog+security+improvements+SSH+ML-KEM+RSA+3072) | 淘汰 SHA-1 RSA 簽章與舊式 DH，新 RSA 金鑰至少 3072 位元，新增 ML-KEM 交換。 | 2026-09-22 | [GitHub Changelog](https://github.blog/changelog/2026-09-22-security-improvements-for-ssh) | 軟體工程 |
| <a id="ref-9"></a>9 | [Local sandboxing in the GitHub Copilot app](https://www.google.com/search?q=GitHub+Copilot+app+local+sandboxing+public+preview) | 以專案為單位限制代理的檔案、網路與憑證存取，OS 無法強制執行時直接失敗。 | 2026-09-23 | [GitHub Changelog](https://github.blog/changelog/2026-09-23-local-sandboxing-in-the-github-copilot-app) | 軟體工程 |
| <a id="ref-10"></a>10 | [Node.js 26.10.0 (Current)](https://www.google.com/search?q=Node.js+26.10.0+release+parsePKCS12+util.debounce) | 新增 crypto.parsePKCS12()、util.debounce／throttle 與 SlidingWindowHistogram。 | 2026-09-22 | [Node.js](https://nodejs.org/en/blog/release/v26.10.0) | 軟體工程 |
| <a id="ref-11"></a>11 | [Visual Studio Code 1.139](https://www.google.com/search?q=Visual+Studio+Code+1.139+release+remote+dev+container+agent+sessions) | 代理可在 SSH、Tunnel 與 WSL 主機的 Dev Container 內執行。 | 2026-09-23 | [Visual Studio Code](https://code.visualstudio.com/updates/v1_139) | 軟體工程 |
| <a id="ref-12"></a>12 | [Docker Cloud Sandboxes 上線，AI 代理環境可在本機與雲端雙向搬移](https://www.google.com/search?q=Docker+Cloud+Sandboxes+sbx+move+iThome) | 代理沙箱可用 sbx move 在本機與雲端搬移，按秒計費、單次最長 24 小時。 | 2026-09-25 | [iThome](https://www.ithome.com.tw/news/179227) | 軟體工程 |
| <a id="ref-13"></a>13 | [Oracle Releases Java 27 and Strengthens Post-Quantum Cryptography Support](https://www.google.com/search?q=Oracle+Java+27+release+post-quantum+JEP+527) | 九項 JEP，TLS 1.3 後量子混合金鑰交換、精簡物件標頭與 G1 成為預設。 | 2026-09-15 | [Oracle](https://www.oracle.com/news/announcement/oracle-releases-java-27-and-strengthens-post-quantum-cryptography-support-2026-09-15/) | 軟體工程 |
| <a id="ref-14"></a>14 | [CISA Adds Four Known Exploited Vulnerabilities to Catalog](https://www.google.com/search?q=CISA+KEV+September+22+2026+Check+Point+Arista+F5+BIG-IP+APM) | Check Point、Arista VeloCloud、F5 BIG-IP APM 四個漏洞因遭利用列入 KEV。 | 2026-09-22 | [CISA](https://www.cisa.gov/news-events/alerts/2026/09/22/cisa-adds-four-known-exploited-vulnerabilities-catalog) | 軟硬體資訊安全 |
| <a id="ref-15"></a>15 | [資安署揭機關老舊防火牆遭駭事件，設備交接不全、未掌握 EOS 成內網破口](https://www.google.com/search?q=資安署+老舊防火牆+遭駭+EOS+設備交接+iThome) | 防火牆超過原廠支援期限仍在用，根因是交接只有書面移交、沒有資產盤點。 | 2026-09-22 | [iThome](https://www.ithome.com.tw/news/179118) | 軟硬體資訊安全 |
| <a id="ref-16"></a>16 | [Red Heron exploits Gitea n-day flaw in multinational campaign, exposing new Linux rootkit](https://www.google.com/search?q=Acronis+Red+Heron+Gitea+CVE-2026-60004+SIXZUT+rootkit) | 利用 Gitea 漏洞掃描 1,386 個實例，另備 477 個台灣系統清單並批次攻擊。 | 2026-09-13 | [Acronis](https://www.acronis.com/en/tru/posts/red-heron-exploits-gitea-n-day-flaw-in-multinational-campaign-exposing-new-linux-rootkit/) | 軟硬體資訊安全 |
| <a id="ref-17"></a>17 | [How Cloudflare addressed a cross-tenant data exposure vulnerability in Containers](https://www.google.com/search?q=Cloudflare+Containers+cross-tenant+data+exposure+skip_block_zeroing) | dm-thin 的 skip_block_zeroing 讓區塊殘留他人資料，全機隊移除設定並汰換磁碟。 | 2026-09-24 | [Cloudflare Blog](https://blog.cloudflare.com/containers-cross-tenant-vulnerability/) | 軟硬體資訊安全 |
| <a id="ref-18"></a>18 | [Compromised GitHub Actions Came Back Online and Resumed Executing Mini Shai-Hulud Malware](https://www.google.com/search?q=actions-cool+issues-helper+Mini+Shai-Hulud+GitHub+Actions+back+online) | 遭入侵的 action 儲存庫重新可見，版本標籤仍指向惡意內容，工作流程再次執行。 | 2026-09-25 | [The Hacker News](https://thehackernews.com/2026/09/compromised-github-actions-came-back.html) | 軟硬體資訊安全 |
| <a id="ref-19"></a>19 | [(Non-US) DIR-822A – Stack-Based Buffer Overflow Vulnerability Reported](https://www.google.com/search?q=D-Link+DIR-822A+SAP10516+CVE-2026-86296+CVE-2026-86510) | 兩個漏洞 CVSS 最高 10.0 且已有公開 PoC，回報狀態仍為調查中。 | 2026-09-18 | [D-Link Security Advisory](https://supportannouncement.us.dlink.com/security/publication.aspx?name=SAP10516) | 軟硬體資訊安全 |
| <a id="ref-20"></a>20 | [MediaTek Dimensity 9600 Pro Sets New Standard for Flagship Smartphone Chips](https://www.google.com/search?q=MediaTek+Dimensity+9600+Pro+2nm+LPDDR6+UFS+5.0) | 2 奈米製程，裝置端支援最高 30B 參數模型，首度支援 LPDDR6 與 UFS 5.0。 | 2026-09-15 | [MediaTek](https://www.mediatek.com/press-room/mediatek-dimensity-9600-pro-sets-new-standard-for-flagship-smartphone-chips) | 硬體或軟硬整合 |
| <a id="ref-21"></a>21 | [台積電赴美投資核准達 440 億美元　經部：預期持續送件審查](https://www.google.com/search?q=台積電+赴美投資+核准+440億美元+投審司+中央社) | 投審司 7 度核准累計 440 億美元股本，與宣布的 2,650 億美元總額仍有差距。 | 2026-09-25 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609250036.aspx) | 硬體或軟硬整合 |
| <a id="ref-22"></a>22 | [Introducing Ray-Ban Meta Audio and More AI Glasses Styles](https://www.google.com/search?q=Ray-Ban+Meta+Audio+glasses+Meta+Connect+2026+Muse) | 43 公克音訊眼鏡 349 美元起，續航 12 小時，年底前逾 100 種眼鏡選擇。 | 2026-09-23 | [Meta Newsroom](https://about.fb.com/news/2026/09/introducing-ray-ban-meta-audio-glasses-new-styles-plus-muse/) | 硬體或軟硬整合 |
| <a id="ref-23"></a>23 | [多元產能需求驅動　台灣半導體廠擴大新加坡布局](https://www.google.com/search?q=世界先進+恩智浦+VSMC+新加坡+開幕+聯電+擴產+中央社) | VSMC 22 個月建成、首批 40 奈米良率逾 99%，2027 年 Q1 量產且產能預售一空。 | 2026-09-25 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609250084.aspx) | 硬體或軟硬整合 |
| <a id="ref-24"></a>24 | [2025 全球售出 7000 台人形機器人　美銀估今年 9 萬台](https://www.google.com/search?q=IFR+人形機器人+7000台+2025+美銀+9萬台+中央社) | IFR 首次統計人形機器人，2025 年售出約 7,000 台，許多用於產生訓練資料。 | 2026-09-21 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609210133.aspx) | 硬體或軟硬整合 |
| <a id="ref-25"></a>25 | [We just shipped support for the ugliest part of HTTP: Vary](https://www.google.com/search?q=Cloudflare+Cache+Rules+Vary+header+support) | Cache Rules 可對每個 Vary 標頭選擇正規化、直通或略過快取。 | 2026-09-22 | [Cloudflare Blog](https://blog.cloudflare.com/vary-support/) | 網路/伺服器等基礎 |
| <a id="ref-26"></a>26 | [Python Workers are now generally available](https://www.google.com/search?q=Cloudflare+Python+Workers+generally+available+PEP+783) | Python 成為 Workers 第一級語言，提出 PEP 783 標準化 PyEmscripten 平臺。 | 2026-09-21 | [Cloudflare Blog](https://blog.cloudflare.com/python-workers-ga/) | 網路/伺服器等基礎 |
| <a id="ref-27"></a>27 | [Announcing Petal, a First-of-its-Kind Transoceanic Subsea Cable](https://www.google.com/search?q=Meta+Petal+subsea+cable+1+petabit+transatlantic) | 設計容量每秒 1 petabit、長約 7,000 公里的美法海纜，預計 2029 年啟用。 | 2026-09-21 | [Meta Newsroom](https://about.fb.com/news/2026/09/announcing-petal-meta-petabit-transoceanic-cable/) | 網路/伺服器等基礎 |
| <a id="ref-28"></a>28 | [HTTP QUERY Method: The Grey Zone Between GET And POST.](https://www.google.com/search?q=SANS+ISC+HTTP+QUERY+method+RFC+10008) | RFC 10008 定義的 QUERY 方法可繞過只綁定 POST 的 WAF 與 CSRF 規則。 | 2026-09-18 | [SANS Internet Storm Center](https://isc.sans.edu/diary/33352) | 網路/伺服器等基礎 |
| <a id="ref-29"></a>29 | [核安會核定核三再運轉計畫　台電後續須提交執行結果報告](https://www.google.com/search?q=核安會+核定+核三+再運轉計畫+589項+審查意見) | 3 回合審查、589 項意見後核定計畫，後續仍有多項安全管制程序。 | 2026-09-24 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609240313.aspx) | 網路/伺服器等基礎 |
| <a id="ref-30"></a>30 | [Anthropic 砸百億美元擴算力　Akamai 拿下雲端大單](https://www.google.com/search?q=Anthropic+Akamai+116億美元+雲端+認股權證+中央社) | 7 年 116 億美元算力合約，Akamai 2026 年資本支出增加約 17 億美元預購記憶體。 | 2026-09-25 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609250065.aspx) | 網路/伺服器等基礎 |
| <a id="ref-31"></a>31 | [金管會開放銀行申請試辦存款代幣業務](https://www.google.com/search?q=金管會+開放+銀行+試辦+存款代幣) | 存款代幣法律性質仍屬存款，營業計畫書須說明帳本勾稽與技術架構。 | 2026-09-22 | [金融監督管理委員會](https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202609220001&dtable=News) | 金融科技 |
| <a id="ref-32"></a>32 | [【AI 轉型實例 1 下篇】玉山銀行打造全行 AI 代理入口，首度揭露新一代 GENIE 關鍵 Agentic 技術框架](https://www.google.com/search?q=玉山銀行+GENIE+3.0+Agentic+Root+Agent+MCP+iThome) | Root Agent 統一判讀意圖，經 REST API 或 MCP 呼叫行內服務，SOP 寫成技能檔。 | 2026-09-22 | [iThome](https://www.ithome.com.tw/news/179124) | 金融科技 |
| <a id="ref-33"></a>33 | [SEC Issues “Innovation Exemption” to Facilitate the Trading of Tokenized NMS Stock and Request for Comment](https://www.google.com/search?q=SEC+innovation+exemption+tokenized+NMS+stock+AMM+liquidity+pools) | 暫時豁免代幣化證券交易場所的交易所認定，可用 AMM 流動性池交易代幣化美股。 | 2026-09-17 | [SEC](https://www.sec.gov/newsroom/press-releases/2026-90-sec-issues-innovation-exemption-facilitate-trading-tokenized-nms-stock-request-comment) | 金融科技 |
| <a id="ref-34"></a>34 | [金管會督導證交所及櫃買中心建置「臺股儀表板」上線 揭示三大面向資訊](https://www.google.com/search?q=金管會+臺股儀表板+證交所+櫃買中心+授信+違約+營收) | 整合授信、違約與營收三大面向指標，預設顯示最近 5 個交易日走勢。 | 2026-09-22 | [金融監督管理委員會](https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202609220002&dtable=News) | 金融科技 |
| <a id="ref-35"></a>35 | [奇美推 AI 助急診醫師　30 秒生成病歷摘要還可追問](https://www.google.com/search?q=奇美醫院+急診+AI+病歷摘要+30秒+地端+中央社) | 地端醫療 LLM 與邊緣運算，掛號後 30 秒生成一頁式病歷摘要。 | 2026-09-21 | [中央社 CNA](https://www.cna.com.tw/news/ahel/202609210087.aspx) | 醫療科技 |
| <a id="ref-36"></a>36 | [「健康幣」10/1 上線 卓揆盼養成國人健康習慣新模式 促進國人健康、落實「健康台灣」願景](https://www.google.com/search?q=健康幣+10月1日+上線+健保快易通+衛福部+卓榮泰) | 健保快易通 APP 累積健康幣，滿 1,000 幣可兌換商品與服務。 | 2026-09-17 | [衛生福利部](https://www.mohw.gov.tw/cp-16-88024-1.html) | 醫療科技 |
| <a id="ref-37"></a>37 | [Estimating suicide risk from text](https://www.google.com/search?q=MIT+estimating+suicide+risk+from+text+lexicon+Crisis+Text+Line) | LLM 產生詞庫、人工審核後，以輕量可解釋模型從危機簡訊估風險。 | 2026-09-24 | [MIT News](https://news.mit.edu/2026/estimating-suicide-risk-from-text-0924) | 醫療科技 |
| <a id="ref-38"></a>38 | [Medical Devices; Exemption From Premarket Notification: Radiology Computer-Aided Detection and/or Diagnosis Devices and Computer-Aided Triage and Notification Devices](https://www.google.com/search?q=FDA+federal+register+radiology+CAD+CADt+510k+exemption+petition+denied) | FDA 正式刊登駁回放射科 CAD 與 CADt 軟體部分豁免 510(k) 請願的最終命令。 | 2026-09-17 | [Federal Register](https://www.federalregister.gov/documents/2026/09/17/2026-19074/medical-devices-exemption-from-premarket-notification-radiology-computer-aided-detection-andor-diagnosis-devices-and-computer-aided-triage-and-notification-devices) | 醫療科技 |
| <a id="ref-39"></a>39 | [Batteries that safely break down in the GI tract could improve ingestible devices](https://www.google.com/search?q=MIT+bioresorbable+battery+ingestible+magnesium+molybdenum+trioxide) | 鎂與三氧化鉬電極的可吸收電池輸出 1.84 伏特，可驅動胃內 RFID 與電刺激膠囊。 | 2026-09-21 | [MIT News](https://news.mit.edu/2026/batteries-safely-break-down-in-gi-tract-could-improve-ingestible-devices-0921) | 醫療科技 |
| <a id="ref-40"></a>40 | [臺鐵智慧鐵道成果亮相柏林國際軌道交通技術展 AI 洗車、平交道智慧偵測展現國產研發實力](https://www.google.com/search?q=臺鐵+InnoTrans+2026+AI洗車+平交道+障礙物+偵測) | 熱影像與毫米波雷達雙重偵測平交道障礙物，AI 影像辨識車型切換洗車模式。 | 2026-09-23 | [臺灣鐵路公司](https://www.railway.gov.tw/tra-tip-web/tip/tip009/tip911/newsDtl?newsNo=8ae4cac3a0ca8f5401a0cdffd69507c1&page=0) | 運輸物流 |
| <a id="ref-41"></a>41 | [柏林軌道展台灣產業拚國際　陳世凱：AI、資通訊是競爭優勢](https://www.google.com/search?q=柏林軌道展+台灣館+陳世凱+AI+資通訊+數位孿生+中央社) | 台灣首設台灣館，交通部長點名 AI、資通訊與數位孿生為出口優勢。 | 2026-09-24 | [中央社 CNA](https://www.cna.com.tw/news/ahel/202609240330.aspx) | 運輸物流 |
| <a id="ref-42"></a>42 | [ARTC 智慧座艙監控技術 導入國內首輛 Level 3 自駕電動巴士](https://www.google.com/search?q=ARTC+智慧座艙+視線追蹤+Level+3+自駕+電動巴士+自由財經) | 抗遮蔽視線追蹤只需約 10 TOPS 邊緣算力，對應 UN R171 與 R157。 | 2026-09-17 | [自由財經](https://ec.ltn.com.tw/article/breakingnews/5577137) | 運輸物流 |
| <a id="ref-43"></a>43 | [From the road — September 24, 2026](https://www.google.com/search?q=Waymo+safety+data+270+million+miles+September+2026) | 2.7 億英里數據：受傷事故減少 82%，嚴重受傷以上減少 95%。 | 2026-09-24 | [Waymo](https://waymo.com/blog/shorts/safetydata-september26/) | 運輸物流 |
| <a id="ref-44"></a>44 | [Vegas, Deal Us In! We’re welcoming riders today](https://www.google.com/search?q=Waymo+Las+Vegas+welcoming+riders+Ojai+sixth+generation) | 拉斯維加斯開放公眾乘車，服務區約 24 英里，以 Ojai 車款為主力。 | 2026-09-14 | [Waymo](https://waymo.com/blog/2026/09/ride-in-las-vegas/) | 運輸物流 |
| <a id="ref-45"></a>45 | [智慧節能創新技術跨域交流 為近零碳建築注入轉型動能](https://www.google.com/search?q=建研所+智慧節能創新技術+跨域交流+智慧工地+立面彩繪光電) | 建研所高雄跨域交流聚焦智慧工地與立面彩繪光電，並說明近零碳建築旗艦行動計畫三大主軸。 | 2026-09-16 | [內政部建築研究所](https://www.abri.gov.tw/News_Content.aspx?n=752&s=340910) | 房地產與室內外裝潢 |
| <a id="ref-46"></a>46 | [AI 供應鏈擴廠熱 前三季商用市場交易衝 2,500 億新高 全年挑戰 3,000 億](https://www.google.com/search?q=第一太平戴維斯+前三季+商用不動產+2577億+廠房+AI+聯合新聞網) | 前三季大型商用不動產交易 2,577 億元創新高，廠房占單季近七成。 | 2026-09-24 | [聯合新聞網](https://udn.com/news/story/7240/9775639) | 房地產與室內外裝潢 |
| <a id="ref-47"></a>47 | [The promise and peril of using visual AI to study cities](https://www.google.com/search?q=MIT+Senseable+City+Lab+How+AI+Sees+the+City+visual+AI) | 331 支交通攝影機估算紐約排放，新書同時列出監控與偏見風險。 | 2026-09-24 | [MIT News](https://news.mit.edu/2026/studying-cities-using-visual-ai-fabio-duarte-martina-mazzarello-carlo-ratti-fan-zhang-book-0924) | 房地產與室內外裝潢 |
| <a id="ref-48"></a>48 | [「創新辦桌」上菜 一窺新勝景光雕布袋戲創新歷程](https://www.google.com/search?q=新勝景掌中劇團+光雕投影+布袋戲+創新辦桌+中央社) | 動畫導演把光雕投影帶回布袋戲台，作品已巡演北美與大阪。 | 2026-09-23 | [中央社 CNA](https://www.cna.com.tw/news/acul/202609230269.aspx) | 現場表演藝術 |
| <a id="ref-49"></a>49 | [Apple opens Apple Music Hall, a brand-new state-of-the-art live music venue in London](https://www.google.com/search?q=Apple+Music+Hall+Battersea+Power+Station+live+music+venue+London) | 600 人場館內建 48 支揚聲器空間音效、兩間錄音混音室與 16 個以上機位，演出即產出 Spatial Audio 與多機位影片。 | 2026-09-21 | [Apple Newsroom](https://www.apple.com/newsroom/2026/09/apple-opens-apple-music-hall-a-state-of-the-art-live-music-venue-in-london/) | 現場表演藝術 |
| <a id="ref-50"></a>50 | [經濟部科技專案讓 AI 聽懂音樂…資策會打造智慧協奏技術 實現一人成團](https://www.google.com/search?q=資策會+AI+音樂理解+智慧協奏+一人成團+ICT+TechDay) | AI 虛擬樂手可跟上真人臨場變速，四項技術涵蓋聲源分離到動態跟拍。 | 2026-09-22 | [聯合新聞網](https://udn.com/news/story/7240/9771299) | 影視音樂 |
| <a id="ref-51"></a>51 | [New tools to power your creation journey from start to finish](https://www.google.com/search?q=YouTube+Made+On+YouTube+2026+likeness+detection+voice+mobile+app) | 肖像偵測進入行動 App，今年稍晚整合說話聲音偵測與臉部偵測。 | 2026-09-23 | [YouTube Official Blog](https://blog.youtube/news-and-events/made-on-youtube-new-tools-power-creation-journey/) | 影視音樂 |
| <a id="ref-52"></a>52 | [Netflix turns Willy Wonka’s chocolate factory into a real-life ‘social experiment’](https://www.google.com/search?q=Netflix+Wonka+Golden+Ticket+AI+Gene+Wilder+voice+ElevenLabs+NBC) | 以 ElevenLabs 生成 Gene Wilder 聲音旁白，取得遺產管理方同意仍引發反彈。 | 2026-09-23 | [NBC News](https://www.nbcnews.com/pop-culture/pop-culture-news/netflix-willy-wonka-golden-ticket-reality-show-ai-gene-wilder-rcna598920) | 影視音樂 |
| <a id="ref-53"></a>53 | [FLEX and Sentinel-3C launched](https://www.google.com/search?q=ESA+FLEX+Sentinel-3C+launched+Vega-C+VV30) | Vega-C 一箭雙星，FLEX 為 ESA 首顆專測植物光合作用螢光的衛星。 | 2026-09-15 | [ESA](https://www.esa.int/Applications/Observing_the_Earth/FLEX_and_Sentinel-3C_launched) | 其他領域科技應用突破 |
| <a id="ref-54"></a>54 | [NASA Selects Far-Infrared Telescope as First in New Mission Class](https://www.google.com/search?q=NASA+PRIMA+far-infrared+telescope+Probe+Explorers+first+mission) | PRIMA 成為 Probe Explorers 首案，成本上限 12 億美元、2033 年發射。 | 2026-09-23 | [NASA](https://www.nasa.gov/news-release/nasa-selects-far-infrared-telescope-as-first-in-new-mission-class/) | 其他領域科技應用突破 |
| <a id="ref-55"></a>55 | [Behind Project Suncatcher, our moonshot to put AI in space](https://www.google.com/search?q=Google+Behind+Project+Suncatcher+moonshot+AI+in+space+TPU) | 即將進行的首次在軌測試，將驗證 TPU 對發射應力、輻射與真空散熱的耐受性。 | 2026-09-24 | [Google The Keyword](https://blog.google/innovation-and-ai/models-and-research/google-research/google-project-suncatcher-facts/) | 其他領域科技應用突破 |
| <a id="ref-56"></a>56 | [國科會：未來科技館閉幕　加速科研成果走向市場應用](https://www.google.com/search?q=國科會+未來科技館+閉幕+84件+未來科技獎+150場+技術洽談) | 84 件未來科技獎成果、逾 5 萬人次進場、150 場技術洽談。 | 2026-09-19 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609190216.aspx) | 其他領域科技應用突破 |
| <a id="ref-57"></a>57 | [Siri AI, a profoundly more capable and personal assistant powered by the next generation of Apple Intelligence, is here](https://www.google.com/search?q=Apple+Siri+AI+next+generation+Apple+Intelligence+is+here) | Siri AI 以 beta 在英文推出，五種語言下月跟進，第三方 app 動作與 Private Cloud Compute 上的 Image Playground。 | 2026-09-14 | [Apple Newsroom](https://www.apple.com/newsroom/2026/09/siri-ai-a-profoundly-more-capable-and-personal-assistant-is-here/) | AI 科技 |
| <a id="ref-58"></a>58 | [Introducing Grok 4.7](https://www.google.com/search?q=xAI+Introducing+Grok+4.7) | 價格與速度與 Grok 4.6 相同，改用更大基礎模型與更長強化學習訓練。 | 2026-09-21 | [xAI](https://x.ai/news/grok-4-7) | AI 科技 |
| <a id="ref-59"></a>59 | [數發部啟動主權 AI 語料庫民間語料徵集 號召作家與出版業共襄盛舉](https://www.google.com/search?q=數位發展部+主權AI+訓練語料庫+民間語料徵集+林宜敬) | 政府語料約 22 億 tokens，民間徵集採「自願參與、明確授權、可退出」三原則。 | 2026-09-15 | [數位發展部](https://moda.gov.tw/press/press-releases/20640) | AI 科技 |
| <a id="ref-60"></a>60 | [Notice and Apology Regarding a Data Breach Resulting from Unauthorized Access to Gyazo](https://www.google.com/search?q=Gyazo+data+breach+Helpfeel+notice+September+2026) | 上傳伺服器漏洞遭利用，約 2,362 萬筆使用者資料與 4.9 億筆影像 metadata 外洩。 | 2026-09-16 | [Helpfeel](https://corp.helpfeel.com/en/news/news-20260916) | 軟硬體資訊安全 |
| <a id="ref-61"></a>61 | [Snapdragon Leads the Agentic AI Age with Two of the World's Fastest Mobile SoCs Powering the Next Generation of Smartphones](https://www.google.com/search?q=Snapdragon+8+Elite+Extreme+Gen+6+Snapdragon+Summit+2026) | 兩款 2 奈米旗艦平台同時發表，稱為多旗艦策略，九家品牌首發。 | 2026-09-22 | [Qualcomm](https://www.qualcomm.com/news/releases/2026/09/snapdragon-leads-the-agentic-ai-age-with-two-of-the-world-s-fast) | 硬體或軟硬整合 |
| <a id="ref-62"></a>62 | [Salesforce staggers back to feet after global outage](https://www.google.com/search?q=Salesforce+global+outage+September+16+2026+internal+login+service) | 內部登入服務卡住耗盡伺服器資源，全球數百個 instance 中斷數小時。 | 2026-09-16 | [The Register](https://www.theregister.com/saas/2026/09/16/salesforce-staggers-back-to-feet-after-global-outage/5296800) | 網路/伺服器等基礎 |
| <a id="ref-63"></a>63 | [Bitget Says Suspected North Korean Hackers Stole $351.6M After Backend Compromise](https://www.google.com/search?q=Bitget+351.6+million+hack+North+Korea+hot+wallet) | 熱錢包與溫錢包損失 3.516 億美元，暫停提領並委託 Mandiant 與 SlowMist 調查。 | 2026-09-25 | [The Hacker News](https://thehackernews.com/2026/09/bitget-says-suspected-north-korean.html) | 金融科技 |
| <a id="ref-64"></a>64 | [Universal and Sony sue Suno for a second time, claiming platform's v6 models are 'the fruit of the same poisoned tree'](https://www.google.com/search?q=Universal+Sony+sue+Suno+second+time+v6+poisoned+tree) | 指控複製 60,202 首錄音，主張 v6 以侵權模型產出訓練，理論求償上限逾 90 億美元。 | 2026-09-18 | [Music Business Worldwide](https://www.musicbusinessworldwide.com/universal-and-sony-sue-suno-for-a-second-time-claiming-platforms-v6-models-are-the-fruit-of-the-same-poisoned-tree/) | 影視音樂 |

<a id="notes"></a>
## 報告說明

本期報告的時間範圍為 2026-09-11 至 2026-09-26（今天起往前 15 天，含首尾）。來源優先序為官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載；中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。本期共蒐集候選來源 141 筆，採用 64 筆為正式參考資料、淘汰 77 筆，筆數以 `source.md` 的條目數為準；其中 ref-57 至 ref-64 為稽核補搜時加入，依補入順序列於表末，分類以表中欄位為準。正式來源逐筆以原頁核對標題、發布日期、來源網站名稱與內文主張；原頁無法取得或來源內部矛盾者直接淘汰，不挑一邊採信。

本期窗期與上一期（2026-09-19，窗期 2026-09-04 至 2026-09-19）重疊九天，與 2026-09-13 期重疊三天，因此篩選前先比對兩期的 `references.md` 建立已引用名單。同一事件即使換一家媒體報導也淘汰，例如 Gemini 3.8 Live Avatar 屬前期已引用的 Gemini 3.8 Live 系列、Duke 心衰竭 AI 聯盟已於前期引用；同一來源站的不同事件仍可採用，例如 GitHub、Cloudflare、CISA、MIT News、Waymo 與中央社本期採用的皆為前兩期未引用的另一批公告。

<a id="limitations"></a>
### 資料限制與判讀提醒

- **現場表演藝術與影視音樂的來源權重偏低。** 表演藝術經 9 輪補搜，窗內的台灣來源只有文總新聞稿的媒體版本 [[48. 中央社]](#ref-48)，稽核時補入 Apple 官方新聞稿 [[49. Apple]](#ref-49)，場館規格為 Apple 自行揭露；影視音樂經 9 輪補搜，Suno v6 與 UMG 和 ElevenLabs 的合作公告都落在 9 月 10 日、窗外一天。這兩個分類的趨勢觀察外推性有限。
- **供應商自評數字未經第三方驗證。** Opus 5.5 的效能與安全成績 [[1. Anthropic]](#ref-1)、GPT-6 Sol 與 Luna 的基準比較 [[2. iThome]](#ref-2)、PageBreak 的誤判率 [[4. Google]](#ref-4)、天璣 9600 Pro 的效能百分比 [[20. MediaTek]](#ref-20)、Meta 眼鏡與 Petal 海纜的「首款」與「首條」[[22. Meta]](#ref-22) [[27. Meta]](#ref-27)、Cloudflare 的功能公告與事故時間軸 [[17. Cloudflare]](#ref-17) [[25. Cloudflare]](#ref-25) [[26. Cloudflare]](#ref-26)、Waymo 的安全數據 [[43. Waymo]](#ref-43) [[44. Waymo]](#ref-44)、Grok 4.7 的基準比較 [[58. xAI]](#ref-58)、Siri AI 的功能描述 [[57. Apple]](#ref-57)、Snapdragon 8 Elite Gen 6 的功能宣稱 [[61. Qualcomm]](#ref-61)，皆屬公司自行揭露，本報告照原文引用並標明出處。
- **非一手來源的使用。** GPT-6 Sol 與 Luna 以 iThome 為來源，因 openai.com 對抓取回 403、無法在原頁確認發布日 [[2. iThome]](#ref-2)；Docker Cloud Sandboxes 為 iThome 轉述 [[12. iThome]](#ref-12)；Akamai 合約與 IFR 統計為中央社編譯外電 [[30. 中央社]](#ref-30) [[24. 中央社]](#ref-24)；商用不動產數據為顧問公司報告的媒體轉述 [[46. 聯合新聞網]](#ref-46)；Netflix 案例為 NBC News 新聞報導 [[52. NBC News]](#ref-52)；Salesforce 中斷為 The Register 轉述狀態頁 [[62. The Register]](#ref-62)；Bitget 事件為 The Hacker News 轉述 Bitget 公告 [[63. The Hacker News]](#ref-63)；Suno 訴訟為音樂產業媒體報導 [[64. Music Business Worldwide]](#ref-64)。
- **研究階段與計畫階段。** Claude 發現的酵素系統功能尚未確認 [[6. Anthropic]](#ref-6)；MIT 自殺風險模型尚未臨床部署 [[37. MIT News]](#ref-37)；可吸收電池仍在動物實驗，SAFARI 系統的臨床試驗約兩年後 [[39. MIT News]](#ref-39)；Suncatcher 的首次在軌測試尚未發射 [[55. Google]](#ref-55)；PRIMA 進入初步設計階段、2033 年發射 [[54. NASA]](#ref-54)；核三再運轉只完成計畫核定 [[29. 中央社]](#ref-29)。
- **未來事件與已發生事件的區別。** GitHub RSA 金鑰長度要求 10 月 14 日生效、SSH brownout 在 11 月 4 日與 12 月 9 日 [[8. GitHub]](#ref-8)、GENIE 3.0 預計 9 月底上線 [[32. iThome]](#ref-32)、健康幣 10 月 1 日上線 [[36. 衛福部]](#ref-36)、VSMC 9 月 28 日開幕 [[23. 中央社]](#ref-23)、Ray-Ban Meta Audio 10 月 13 日出貨 [[22. Meta]](#ref-22)、Petal 海纜 2029 年啟用 [[27. Meta]](#ref-27)、Siri AI 其他五種語言下月推出 [[57. Apple]](#ref-57)，皆晚於本報告日期；本報告引用的是窗內的公告或報導，並非已完成的事實。
- **原頁未提供的數據一律不補。** Suncatcher 的具體發射日期（原頁只寫「下週」）、衛星名稱與 TPU 數量只見於二手報導 [[55. Google]](#ref-55)；CISA 公告未載四個漏洞的 CVSS 分數 [[14. CISA]](#ref-14)。以上皆不以搜尋摘要或其他報導的數字替代。Anthropic 酵素研究動用的代理數量與時數 [[6. Anthropic]](#ref-6)、VS Code 1.139 的工作階段載入量測 [[11. VS Code]](#ref-11) 原頁雖有記載，本報告未展開。
- **日期判定的特例。** 金管會兩則新聞稿頁尾的「更新日期」為網站更新時間，發布日以標題下方日期列 2026-09-22、正文（存款代幣稿「今日（22 日）」、儀表板稿「明日（9 月 23 日）上線」）與列表編號為準 [[31. 金管會]](#ref-31) [[34. 金管會]](#ref-34)；SEC 新聞稿無日期 meta，取頁面日期列 [[33. SEC]](#ref-33)；臺鐵內文頁無日期 meta，以頁面「發佈日期：2026/9/23 下午 5:00」為準 [[40. 臺鐵]](#ref-40)；Waymo 安全數據頁無日期 meta，以標題所載日期為準 [[43. Waymo]](#ref-43)；D-Link 公告 9 月 18 日發布、9 月 21 日更新，採發布日 [[19. D-Link]](#ref-19)；Gyazo 公告頁另有 9 月 26 日的更新 meta，發布日以正文「as of September 16, 2026」為準 [[60. Helpfeel]](#ref-60)；Apple Siri AI 頁標示 UPDATE、9 月 24 日修改，採 datePublished 9 月 14 日 [[57. Apple]](#ref-57)；高通新聞稿頁為 React app，日期取 JSON-LD [[61. Qualcomm]](#ref-61)。

<a id="disclaimer"></a>
## 免責聲明

本報告由 AI 工具彙整公開資訊而成，內容僅供參考，不構成投資、法律、醫療或任何專業建議。所有數據與敘述均以參考資料所列來源為準，讀者應自行回溯原始來源確認。報告中涉及的產品規格、價格、時程與政策內容可能隨時變動，實際情形請以各官方公告為準。
EOF

echo "已建置 weekly-tech-report-022 的五份任務檔"
