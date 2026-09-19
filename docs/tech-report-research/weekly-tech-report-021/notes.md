# 研究筆記

- 任務：weekly-tech-report-021
- 報告日期：2026-09-19
- 時間範圍：2026-09-04 至 2026-09-19
- 使用工具：Claude Code（Opus 5，1M context）、Codex（第二輪稽核）

## 知識庫查閱

任務開始前已讀取 `docs/tech-report-research/knowledge/index.md` 與全部六份知識檔案：

- `source-priority.md`：中國來源與社群平台內容優先以高權重來源替換，台灣媒體為主要參考來源之一
- `taiwan-media-landscape.md`：台灣媒體分類座標，用於評估中央社、科技新報、經濟日報、NOWnews 的定位
- `date-citation-rules.md`：引用格式 `[[{數字}. {資料來源名稱}]](#ref-{數字})`、錨點規則、`*未知時間` 用法
- `report-format.md`：四段式結構、H2/H3 階層、參考資料表格、完成前檢查
- `fetch-gotchas.md`：iThome、openai.com、inside.com.tw 回 403；technews.tw 轉址到 cdn 網域；Cloudflare 與 Anthropic 的 slug 不可由標題推測；活動實施日不等於發布日；標題與內文矛盾直接淘汰
- `window-overlap-dedup.md`：15 天窗與上一期重疊，篩選前先比對上一期 `references.md`；大型系列活動上期已引用其中一場，本期不再引用同系列其他場次

另讀取施工筆記索引 `docs/working-notes-skill/notes/index.md`，命中並開啟四份週記相關筆記（`2026-09_01_weekly-tech-report-020-建置-來源查核與交付.md`、`2026-09_01_週記中文排版校對改建置腳本.md`、`2026-09_01_weekly-tech-report-020-內容稽核與第二作者.md`、`2026-09_01_weekly-tech-report-020-人性化改寫與發布.md`），確認本期同樣以 `scripts/build-weekly-tech-report-021.sh` 作為五份檔案的唯一內容來源，報告尾段保留 `notes`、`limitations`、`disclaimer` 三個錨點，正文不使用破折號。

## 作者欄

初稿由 Claude Code 建置；Codex 於 2026-09-19 完成第二輪逐筆來源稽核、分類補搜、內文修正與交付驗證，報告 Meta 改為 `作者：Claude Code、Codex`。

## 蒐集方式

依分類拆成四組平行蒐集，每組各自完成搜尋、原頁核對、跨期去重與淘汰判斷：

- A 組：AI 科技、軟體工程（正式建議 10、淘汰 11）
- B 組：軟硬體資訊安全、網路/伺服器等基礎、硬體或軟硬整合（正式建議 12、淘汰 10）
- C 組：金融科技、醫療科技、運輸物流（正式建議 9、淘汰 12）
- D 組：房地產與室內外裝潢、現場表演藝術、影視音樂、其他領域科技應用突破（正式建議 12、淘汰 15）

初次蒐集候選 91 筆；第二輪補搜 12 分類共審視 153 筆 RSS 候選，新增 AEPD 與 iThome 兩筆後，合計候選 93 筆、正式 42 筆、淘汰 51 筆。原 ref-5 Google Cloud 與 ref-22 NVIDIA CUDA-Q 改列淘汰。

## 跨期去重

本期窗期（2026-09-04 至 2026-09-19）與 2026-09-13 期重疊十天、與 2026-09-05 期重疊兩天。篩選前已由 `tech/2026-09-13/references.md` 與 `tech/2026-09-05/references.md` 建立 64 筆已引用標題與網址名單，以下候選因此淘汰或改採：

- Copilot code review〈An improved review experience〉（09-18）：核心的自動解決留言與上期 ref-7（09-11）重疊，淘汰；Copilot 當週彙整（ref-9）只取模型分級、Dev Container 與 Sentry 整合，不重述自動解決
- iThome〈GPT-6 Astra 推向 ChatGPT Work、Codex 及 API〉：Astra 發表屬 2026-09-05 期已引用事件，淘汰；ref-4 是發表兩週後的市場數據分析，報告不重述發表內容
- 聯合新聞網 09-07 TTXC 報導：與上期 ref-30 的 Newtalk 09-08 預告為同一份新聞稿，淘汰
- 「潮臺北 × 潮首爾」K-POP 舞台製作展（TVBS 09-04）：2026-09-05 期已引用同一音樂節底下的科技音樂互動展（中央社 08-27），依 `window-overlap-dedup.md` 的系列活動規則淘汰；主辦單位含 TVBS 也使權重偏低
- 科技新報 Apple Watch S11 晶片（09-15）：與上期 iPhone Duo 屬同一場 Apple 發表會，淘汰

同站不同事件照常採用：GitHub（Actions 執行保護、npm stage-only、Ubuntu 26.04、Copilot 週報）、Cloudflare（前端惡意腳本、Pingora 雜湊環）、CISA（09-16 Cisco ISE 與 Acronis，與上期 09-10 MikroTik 不同批）、MIT News（xvr、Atlas、機器人光學實驗室）。

## 抓取踩坑（本期新增）

- **WebFetch 摘要可能改寫時間詞，網頁內容也可能更新。** 中央社原文的「今天」曾被寫成「昨日」。Digital Music News 初查時僅見「last year」，第二輪現行頁面已明列「November 2025」並擴充標題，因此以最新原頁為準，並在筆記保留變動記錄。
- **TechNews 子站的轉址網域各不相同。** `finance.technews.tw` 轉到 `cdnfinance.technews.tw`，`infosecu.technews.tw` 轉到 `cdninfosecu.technews.tw`，不是 `cdn.technews.tw`。參考資料仍寫原網域。
- **iThome 可改用 curl 帶瀏覽器 User-Agent 取得。** WebFetch 回 403，curl 帶 Chrome UA 可拿到 200，發布日在 `class="created"`；列表頁 `ithome.com.tw/healthit` 也可用。本期部分 iThome 文章仍無法取得日期，一律淘汰。
- **inside.com.tw 連 curl 帶瀏覽器 UA 也回 403**，雄影系列報導因此無法確認日期而淘汰。
- **Anthropic 的 `/institute/` 路徑沒有日期列**，原頁上的「August 2026」是資料期間，發布日要看 Newsroom 列表（Sep 17）。
- **轉述報導與原頁數字不一致。** 科技新報寫 Claude 主導比例「從 3 月約 1%」，Anthropic 原頁是「2026 年 2 月不到 1%」，以原頁為準。
- **OpenAI 的 misalignment 彙整頁不顯示框架公告本身的日期**，只列各則通報日期；發布日以中央社 09-17 原頁為準。
- **Cisco 官方 advisory 與 CISA 的 CVE 編號對不上。** Cisco「ISE Hardening Release: September 2026」列 CVE-2026-20130、20192 等，查不到 CISA 的 CVE-2026-76460，因此正式來源用 CISA 公告，不引用 Cisco 頁面。
- **ISC 沒有 BIND 14 個漏洞的總覽頁**，每個 CVE 各有一篇 KB，正式來源改用 The Hacker News 整理，並以 `kb.isc.org/docs/cve-2026-77692` 交叉確認。
- **AWS Health Dashboard 是 JS 動態頁**，WebFetch 取回空白，相關事件無法查證而淘汰。
- **cisa.gov 本期未回 403**，WebFetch 可直接取得。
- **中央社列表頁可用 curl 解析**：`cna.com.tw/list/{ait|amov|acul}.aspx` 能抽出標題與網址；MIT News 的 RSS `news.mit.edu/rss/feed` 有 pubDate。

## 逐筆查核與修正

- ref-1 OpenAI：中央社原頁只載概要，6 起案例的細節（壓縮摘要插入越獄指令、擅用外洩 API 金鑰等）出自 The Hacker News 09-17，報告正文只引用中央社可查證的部分，細節不掛在中央社名下，已自 source.md 摘要移除。
- ref-12 GitLab：第二輪重查現行官方頁，確認頁面直接列出 CVE-2026-85706 可未經驗證讀取任意檔案、CVSS 10.0、各版本受影響區間與 KEV 狀態；原先將這些屬性寫成 Rapid7 搜尋摘要為初查錯誤，已更正。
- ref-13 CISA：Cisco ISE 的 CVSS 10.0、root 權限與修正版本出自 The Hacker News，CISA 原頁未載明，已自摘要移除。
- ref-17 台馬 4 號海纜：台澎 4 號、澎金 4 號年底完工出自數發部新聞稿，中央社原頁未載，已自摘要移除。
- ref-11 微軟：同一頁先寫 7 月為 569 個、後又寫 663 個，因此移除「多 71%」與舊紀錄比較。Office 漏洞數與 SecurityWeek 寫法也不同，摘要與報告均不寫 Office 數字。原標題「新紀綠」為原頁錯字，參考資料照錄。
- ref-25 American Banker：摘要 529 字超過上限，刪除 Mastercard 高層引言後為 475 字。網址 slug 與頁面標題不同，以頁面標題為準。
- ref-27 Duke：Fierce Healthcare、Quartz 提到的 6,270 萬美元經費不在 Duke 原頁，且 Fierce 回 403，不寫金額。
- ref-23 黃金代幣：科技新報版另載批發型 CBDC 與 RWA 代幣平台，中央社主文未載，不寫入。
- ref-42 MIT 機器人實驗室：原文沒有說系統使用 AI 模型，報告不寫成 AI 驅動。
- ref-38 Suno：第二輪查核時，現行 H1 與首段已明列「November 2025」外洩，標題也加入另一起 ADA 投訴；已更新原始標題與摘要。外洩與未告知仍是原告主張，尚未經法院認定。

## 權重壓低而非排除

- ref-5（AEPD AI 代理攻擊個資外洩）權重 9：為西班牙資料保護機關的第一手公告，但事件資訊來自受影響組織的通報，仍待後續分析。
- ref-22（晶創臺灣方案）權重 8：iThome 依行政院與國科會資料報導，計畫時程為 2024 至 2028 年，不把規畫寫成已建成。
- ref-35（廣藝 Aizart Spark）權重 6：中央社訊息平台為機構自行發稿，頁面註明內容由發稿單位負責；三大報未見獨立報導。
- ref-36（頭城煙火節）權重 4：技術內容只有無人機數量，作為表演藝術分類的補位。
- ref-38（Suno 資料外洩訴訟）權重 6：產業垂直媒體，指控為原告主張。
- ref-34（工總白皮書）權重 6：轉載住展雜誌，屬政策倡議。

## 分類補搜

- 現場表演藝術：7 輪（兩廳院秋天藝術節、無人機燈光秀、白晝之夜、北流 K-POP、臺北藝術節與劇場 AI、國表藝 AI 劇場、演唱會實名制與 Sphere）。窗內可用的只有廣藝新聞稿與頭城煙火節；北美館 MR 為 2025 年舊文、VISION FESTA 為 3 月，均淘汰。
- 影視音樂：8 輪（雄影 XR、金馬入圍、科技新報音樂 AI、Spotify、Suno／Udio、Netflix、YouTube Music、KKBOX／文策院／AI 配音）。雄影 XR 入圍名單在 08-26 窗外，改採 09-16 片單公布；金馬入圍 10-01 才公布；Netflix 300 部作品用 AI 為 07-16 財報內容。
- 醫療科技：09-14 之後的台灣來源稀少，保留經濟日報 09-11 的華碩 xHIS；FDA 胸腔 X 光基礎模型因 diagnosticimaging.com 回 403 無法確認發布日而淘汰。
- 運輸物流：Waymo 同週有新加坡、東京、歐洲保險三則公告，採前兩則（官方與中央社各一），Allianz 保險合作列備援淘汰。
- 第二輪補搜：以 Google News RSS 依 12 分類取得 153 筆候選，逐筆排除跨期重複、活動預告、編輯評論與低技術密度內容。最後以 AEPD 官方個資外洩通報取代 Google Cloud 廠商論壇發言，並以 iThome 晶創臺灣硬體與 EDA 雙軌布局取代 NVIDIA CUDA-Q 廠商案例。

## 第二輪逐筆查核（Codex，2026-09-19）

- 42 筆正式來源皆以 curl 實際取得 HTTP 200，同時擷取最終 URL、H1、頁面標題與日期候選。
- 修正 ref-11 頁內數字矛盾、ref-12 官方頁可查屬性、ref-38 現行頁面標題與時間，並縮限 GitHub、npm、龍科三期、Waymo 與高雄電影節的外推語氣。
- 稽核用腳本 `scripts/audit-weekly-tech-report-sources.sh` 保留為下期可重複使用的逐筆 HTTP 與分類補搜工具。
