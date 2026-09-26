# 研究筆記

- 任務：weekly-tech-report-022
- 報告日期：2026-09-26
- 時間範圍：2026-09-11 至 2026-09-26
- 使用工具：Claude Code（Fable 5.1）；四組研究代理平行蒐集，主編收斂與撰稿

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
- D 組：房地產與室內外裝潢、現場表演藝術、影視音樂、其他領域科技應用突破（正式建議 14、淘汰 21）

主編另補查 3 筆（Java 27、Anthropic 與 Akamai 算力合約、MIT 可吸收電池），並重抓金管會存款代幣原頁補齊被截斷的營業計畫書事項。收斂時以 `converge.py` 依指定網址順序把正式條目編號、剔除兩個撰稿欄位、淘汰條目編字母，並檢查摘要字數與時間窗。最終候選 132 筆、正式 56 筆、淘汰 76 筆。

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

- 代理摘要中不在原頁的細節已依備註移除或改寫：iThome 的 VS Code 工作階段載入秒數、iThome 的 Anthropic 近千代理與 21 小時、中央社的微軟 Copilot 計費模式、iThome 資安週報的 CISA 四漏洞 CVSS、The Hacker News 的 Cloudflare Containers 報導、二手媒體的 Suncatcher 發射日期與 TPU 數量。
- 12 筆摘要超過 500 字，以只保留原頁內容的方式精簡至 500 字內（Opus 5.5、GPT-6 Sol／Luna、SSH、Docker、Java 27、Acronis、actions-cool、天璣 9600 Pro、台積電 440 億、Meta 眼鏡、Python Workers、SANS QUERY）。
- 金管會存款代幣：C 組抓取時營業計畫書第三、四項被截斷，主編重抓原頁補齊「存款帳務與代幣帳本之勾稽、對帳及控管機制」與「技術架構、系統運作方式及安全控管機制」。
- Java 27：九個 JEP 編號逐一自原頁 HTML 核對（523、527、531、532、533、534、536、537、538）。
- MIT 可吸收電池：期刊名稱自原頁「appears today in Nature Chemical Engineering」核對。
- ref-55 Suncatcher：代理抄的是 `<title>`，og:title 與 H1 皆為「Behind Project Suncatcher, our moonshot to put AI in space」，參考資料表與原始標題欄改用 og:title。
- 稽核：`scripts/audit-weekly-tech-report-sources.sh` 對 56 筆正式來源逐筆 curl，55 筆回 200，SEC 新聞稿回 403（該站需宣告式 UA，蒐集階段已以該方式取得 200 並核對日期）。
- 四筆英文原標題的 `source.md` 標題欄改為中文（MIT 自殺風險、FDA 聯邦公報、Waymo 安全數據、Waymo 拉斯維加斯），參考資料表仍照錄原始標題。

## 權重壓低而非排除

- ref-2（GPT-6 Sol／Luna）權重 8：iThome 轉述，因 openai.com 403 無法在原頁確認日期。
- ref-12（Docker Cloud Sandboxes）權重 6：iThome 二手報導，價格與版本需求皆轉述。
- ref-24（IFR 人形機器人）權重 7：中央社編譯路透，IFR 原始數據頁未另行查核。
- ref-30（Akamai 合約）權重 7：中央社編譯外電，Akamai 官方新聞稿未另行查核。
- ref-34（臺股儀表板）權重 6：屬資本市場資訊服務，發布日由列表編號與「明日上線」推得。
- ref-46（商用不動產）權重 6：顧問公司報告的媒體轉述，科技成分為 AI 供應鏈驅動。
- ref-48（新勝景）權重 6：文總新聞稿的媒體版本。
- ref-49（衛武營）權重 5：原頁對 AI 只有一句描述。
- ref-52（Netflix Wonka）權重 6：娛樂媒體報導，Netflix 與 ElevenLabs 合作的原始宣布在 6 月窗外。

## 分類補搜

- 現場表演藝術：9 輪（兩廳院／衛武營／歌劇院、無人機燈光秀兩輪、演唱會 XR／全息、售票實名制、白晝之夜／桃園科技藝術節／台灣設計展、AI 劇場沉浸式、國表藝／北藝／北流、國際 AI opera、國光魔法扇）。窗內只有新勝景與衛武營兩筆過門檻，其餘為 5 月或 2025 年舊事件。
- 影視音樂：9 輪（金鐘 AI、Netflix／Spotify／YouTube、Udio／Suno／Sora／Runway、文策院兩輪、AI 配音／著作權、Spotify AI Persona、UMG × ElevenLabs、台灣 LED 虛擬棚）。Suno v6 與 UMG × ElevenLabs 都落在 09-10，窗外一天。
- 醫療科技：11 輪（食藥署、智慧醫療、udn、台大／長庚、健康幣、iThome、TechNews、健保署、Stanford、Lancet、中央社 site 搜尋），最後靠中央社 site 搜尋找到奇美急診系統。
- 金融科技 6 輪、運輸物流 7 輪。柏林軌道展有三筆候選（臺鐵、陳世凱專訪、德鐵 MOU），收前兩筆；Waymo 同站三筆，收安全數據與拉斯維加斯。
