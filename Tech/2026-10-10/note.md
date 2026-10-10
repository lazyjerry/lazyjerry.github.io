# 研究筆記

- 任務：weekly-tech-report-024
- 報告日期：2026-10-10
- 時間範圍：2026-09-25 至 2026-10-10
- 使用工具：Claude Code（Opus 5.5）；四組研究代理平行蒐集，主編收斂、核對與撰稿，再以稽核代理逐筆對照本機原頁；Codex 執行第三輪原頁與缺漏複核

## 知識庫查閱

任務開始前已讀取 `docs/tech-report-research/knowledge/index.md` 與全部七份知識檔案：

- `source-priority.md`：中國來源與社群平台內容優先以高權重來源替換；本期正式來源無中國或社群平台來源
- `taiwan-media-landscape.md`：台灣媒體分類座標，用於評估中央社、iThome、經濟日報的定位
- `date-citation-rules.md`：引用格式 `[[{數字}. {資料來源名稱}]](#ref-{數字})`、錨點規則、`*未知時間` 用法
- `report-format.md`：四段式結構、H2/H3 階層、參考資料表格、完成前檢查
- `fetch-gotchas.md`：iThome 用 curl 帶瀏覽器 UA；openai.com 全 UA 403；fda.gov 改宣告式 UA；blog.google 用 curl 需從 HTML 取 JSON-LD 與 `<p>`；ITmedia BUILT 以 cp932 解碼並另查原始發表日；moi.gov.tw 帶 cookie 重試
- `window-overlap-dedup.md`：篩選前比對前兩期 `references.md`；系列活動上期已引用其中一場，本期不再引用同系列其他場次
- `parallel-collection.md`：四組分類拆法、候選檔格式、`converge-weekly-tech-report-candidates.py` 的用法、收斂時的固定檢查、撰稿後的逐筆稽核，以及 AI 組要盤點 AI 開發工具的 Release 與窗內開發者大會

另讀取施工筆記索引 `docs/working-notes-skill/notes/index.md`，命中並開啟三份筆記（weekly-tech-report-022 平行蒐集與收斂工具、023 平行蒐集與交付、023 第二輪逐筆稽核與補搜），沿用建置腳本為五份任務檔唯一內容來源、共用簡報統一代理規則、每分類 3 至 5 筆，並把撰稿後的逐筆稽核排進本期流程，而不是等交付後再做。

## 蒐集方式

依分類拆成四組代理平行蒐集，四組共用一份簡報（時間窗、權重、去重名單、候選檔格式、原頁核對要求與回報格式），各自完成搜尋、以 curl 取得原頁並存檔、核對日期與數字、跨期去重與淘汰判斷：

- A 組：AI 科技、軟體工程（正式建議 10、淘汰 34）。依知識庫要求盤點 Claude Code v2.1.288 至 v2.1.296、Codex CLI、Gemini CLI、GitHub Changelog、Cursor 與 JetBrains 的 Release；窗內的 Gemini at Work 2026 與微軟 10 月 7 日 Windows 發表會，分別以 Gemini agent 與 MXC 作為開發者端彙整。
- B 組：軟硬體資訊安全、網路/伺服器等基礎、硬體或軟硬整合（正式建議 14、淘汰 27）
- C 組：金融科技、醫療科技、運輸物流（正式建議 15、淘汰 30；醫療科技補搜 12 輪）
- D 組：房地產與室內外裝潢、現場表演藝術、影視音樂、其他領域科技應用突破（正式建議 19、淘汰 34；房地產、表演藝術、影視音樂各補搜 9 輪）

四組合計 183 筆，去除跨組重複的 2 筆（本田與大成建設行駛中充電同時出現在 C、D 組；Deno 加入 Cloudflare 同時出現在 A 組正式與 B 組淘汰）後，候選 181 筆。收斂以 `scripts/converge-weekly-tech-report-candidates.py` 依 `order.txt` 編號正式條目、剔除撰稿欄位、檢查摘要字數與時間窗，結果正式 51 筆、淘汰 130 筆，零錯誤。

## 主編複審的取捨

代理正式建議 58 筆，主編降 7 筆，讓每分類維持 3 至 5 筆：

- Debian 核心更新 1,313 個 CVE（The Register 10-05）：屬評論稿，網路/伺服器基礎保留四則一手公告
- 金管會規劃穩定幣合資發行（經濟日報 10-10）：規劃階段，金管會表示尚無定論
- 桃機第三航廈智慧行李系統（交通部 09-27）：工程進度，系統仍在安裝
- 地政數位櫃臺測量案件擴至 12 種（內政部 10-10）：新聞稿主體為使用統計，新功能 7 月已上線
- 2026 TTXC 開幕與 DigiWave 4DGS（中央社 10-08）：與上期 MUTEK×TTXC 同屬 TTXC 系列，依系列規則淘汰
- 艾美獎改由 Prime Video 串流（Television Academy 10-06）：播映權合約，無技術細節
- 苗栗農改場天敵蟎技轉（中央社 10-08）：與軟硬體技術關聯低

分類與標題調整：ccTLD 劫持與 IDC Frontier 勒索事件維持在網路/伺服器等基礎（B 組判斷），資安分類交叉引用；MXC 維持軟體工程，硬體段的 RTX Spark 不重複描述 MXC；本田與大成建設採 C 組版本歸運輸物流。ref-12 代理標題「疑專為眾至設備開發的安裝程式」中，「眾至」是 iThome 對 ShareTech 的譯名，「專為某廠商設備開發」是推論，原頁只寫以 ShareTech 字串衍生金鑰，以 `overrides.tsv` 改為原頁可支持的標題。

各組淘汰候選中標註「建議交由其他分類」的來源已逐一檢視：Anthropic Cyber Verification Program、ICANN .agent 申請、微軟 PC 端模型（中央社）、Kubernetes cgroup v2、AWS AgentCore 憑證外洩研究、GitHub 公開憑證研究、Ledger 錢包遭盜、Thales SConnect 漏洞、AWS PCI DSS 指引、Spotify Technology、Live Nation 外洩、聯邦上訴法院合理使用判決評析、諾貝爾生醫獎、陳仲瑄質譜平台。各分類名額已滿且現有選材權重較高、或原頁未核對，維持淘汰。

## 跨期去重

本期窗期（2026-09-25 至 2026-10-03 與上期重疊）與 2026-10-03 期重疊九天、與 2026-09-26 期重疊兩天。篩選前已由兩期 `references.md` 建立 114 筆已引用名單，以下候選因此淘汰：

- 韓國金融業遭駭的 CrowdStrike 歸因（iThome、中央社、The Register）：上期已引用同事件
- Shai-Hulud 的 Tensorlake 受害案：與前期 Mini Shai-Hulud 同系列攻擊
- Citrix NetScaler CVE-2026-88779：為新 CVE，但同產品連兩期且影響為可用性，名額讓給其他事件
- 2026 TTXC 開幕：與上期 MUTEK×TTXC 同系列
- Claude Code v2.1.288 至 v2.1.296：上期已收 v2.1.287（Mods），窗內版本皆為增量更新

同站不同事件照常採用：Anthropic（Haiku 5.5，上期為 Sonnet 5.5 與 Claude Mods）、Cloudflare（根區 KSK 說明，上期為公開 CA）、NVIDIA（RTX Spark，上期為 DGX Spark 與代理安全平台）、ARPA-H（Delphi，上期為 SURPASS）、FDA（指引清單，上期為 Autus 瓣膜與非臨床試驗規則）、Waymo（事故演練框架，上期為轉乘回饋）、MIT News（SANDO，上期為 PTIQ 與風洞研究）、Python（3.15.0 正式版，上期為 3.10 EOL）、Rust（1.100 平台調整，上期為 1.99.0）。

## 逐筆查核

- **原頁抓取**：51 筆正式來源皆由蒐集代理以 curl 取得 200 並存檔；iThome 帶瀏覽器 UA、fda.gov 用宣告式 UA、ITmedia BUILT 以 cp932 解碼、blog.google 從 HTML 取 JSON-LD 與段落。
- **代理摘要中的非原頁內容**：各組已在備註標出並排除在摘要外，例如 Mistral Large 4 的 iThome 參數與價格、Haiku 5.5 的 1M context（Claude Code release note）、格芯合約金額（The Register）、MAS 獨立審查要求（The Register）、IDC Frontier 個別客戶遷移細節（iThome）、AVERAT 的設備廠商中文名與廠商回應（iThome）；主編逐筆讀備註確認摘要未收這些句子。
- **日期依據較弱的來源**：DIVD 頁面無日期 meta，以時間軸的 casefile 發布日為準；FDA 指引清單頁以 10 月 1 日的時間標記為準，MedTech Dive 交叉印證；微軟數位防禦報告的正式發布日未確認，以 iThome 報導日為準；Ticketmaster 斷線的事件日原頁未寫明。

## 權重壓低而非排除

- ref-4（ChatGPT 智慧介面）權重 8：iThome 轉述，openai.com 403。
- ref-5（中小微企業條例）權重 7：草案，本期唯一找到的窗內台灣 AI 政策。
- ref-19（HPE Gen13）權重 8：iThome 轉述，HPE 官方部落格 403，部分細節引述分析機構。
- ref-41（BOTS Act）權重 7、ref-42（Ticketmaster 斷線）與 ref-43（ShopTickets）權重 6：表演藝術窗內來源稀少。
- ref-44（Sony 深偽下架）權重 6：轉述《金融時報》。
- ref-47（YouTube 台灣 Brandcast）權重 6：活動報導。

## 分類補搜

- 醫療科技：12 輪（C 組）。收 ARPA-H Delphi、FDA 指引清單、衛福部元宇宙大會、Abbott CardioMEMS 與英國 AI 醫療監理委員會。
- 房地產與室內外裝潢：9 輪（D 組）。收 ITmedia BUILT 三則（皆另查原始發表日）與高科大海廢噴凝土；地政數位櫃臺主編降為淘汰。
- 現場表演藝術：9 輪（D 組）。台灣在地題只有 TTXC 開幕（依系列規則淘汰），收 Digital Music News 三則；Sphere《綠野仙蹤》4D 升級上期已因名額淘汰、官方稿技術細節少，未撈回。
- 影視音樂：9 輪（D 組）。收著作權局徵詢、AGCM 調查 Suno、Sony 深偽下架與 YouTube 台灣 Brandcast。

## 中文排版校對

`check_copywriting.py` 對交付報告初跑命中 15 項，修正 4 項（日文大樓名改寫為「天神商業中心 II」、「問問 YouTube」補空格、兩處全形標點後接引用標記的空格），稽核修正後新增的 1 處全形括號後空格也已修；剩 11 項不修，皆為參考資料表的日文原標題（ITmedia BUILT 三則與 IDC Frontier），沿用前期「排版規則針對中文、日文原標題保留原樣」的裁決。

## 撰稿後逐筆稽核（Claude Code，Opus 5.5）

- **方式**：依知識庫「撰稿後的逐筆稽核」，建置完成後就把 51 筆原頁的本機副本（蒐集代理存檔）交給四組稽核代理，每組 12 至 13 筆，只讀本機頁面不上網，逐句對照總結、亮點、趨勢、資料限制、參考表與 `source.md` 摘要；每條回報附原頁原文，主編再回原頁 grep 關鍵指控（ref-1 價格、ref-8 僅限 Windows、ref-12 未歸因國家級、ref-17 金額、ref-29 published_time）才裁決。四組回報 40 筆有修正、11 筆無問題。
- **最嚴重的兩條是「原頁沒有」的反向錯誤**：ref-17 格芯新聞稿副標明寫「Multi-year $2 billion agreement」，蒐集代理只讀正文，備註寫「新聞稿無金額」，報告亮點與資料限制因此說金額只見於 The Register；ref-1 Mistral 官方頁底部模型卡列有每百萬輸入 1.36 美元、輸出 4.18 美元，報告卻說 API 價格只見於 iThome。兩處都已改正，`source.md` 備註註明稽核補正。
- **歸因**：ref-12 標題「國家級攻擊者」原頁沒有，Rapid7 只說符合中國關聯隱蔽中繼網路的設備類型、未歸因於已知網路；ref-13 轉向身分攻擊與利用 AI 的主詞是「（部分）中國國家級駭客」；ref-15 的使用者是 Integrity Tech 支援的攻擊者；ref-39 壽命數字出自海委會新聞稿；ref-44「愈來愈吃力」是 Sony 對《金融時報》說的、指整體維權；ref-50 遙測分析是航空宇宙研究院；ref-51 論文內容是鴻海新聞稿的說法，趨勢段原把推論寫成論文說法。
- **狀態與時態**：ref-6 新格式已是預設，11 月 30 日是暫時性標頭的棄用日，不是修改期限；ref-1 地端部署要等權重釋出；ref-2 Max 與 Team 的 API 額度是「本週將推出」；ref-30 一週以上是「過去」的瓶頸；ref-31 App 與動態治療計畫尚未推出；ref-19 上一代 iLO 7 已有後量子韌體簽章，不是「開始內建」；ref-41 裁定只駁回撤銷動議；ref-43 2026 年場次已結束。
- **原頁沒有的定性**：ref-17「第二來源」（原頁是美國第一個來源）；ref-18「AI 資料中心吃掉記憶體」（IDC 首要原因是提前拉貨）；ref-21「合法憑證」（原頁一律稱 unauthorized）；ref-36「翻倍」（實為約 2.4 倍，且去年是名稱不同的前身計畫）；ref-40「電力條件好」；ref-43「中小主辦方」。
- **語意精度**：ref-15 跨站腳本打的是有漏洞的網站、只有密碼噴灑針對 Exchange；ref-22 加快發版的理由是 AI 找出的漏洞常被他人重複發現、且是暫時措施，不是「回報變多」；ref-25 75 萬美元是 7 天一系列結算的總額；ref-26 徵詢的是「如何」而非「是否」；ref-8 Learning 模式的活動報告只在 Windows；ref-20 哨兵查詢需解析器支援 RFC 8509；ref-5 100 萬元是《產業創新條例》的門檻；ref-16 RTX Spark 也含小型桌機；ref-32「預先變更控制」是 FDA 用語；ref-33「部分國際市場」；ref-34 測試對象是行駛中電動車、商用車是初期導入對象；ref-35 HSEEP 只是被改編的實務之一；ref-37 只公開部分資料且尚未上線；ref-38 是切換檢量線而非改寫；ref-42 週五未發公告、週六指示限特定用戶；ref-45 是義大利機關，條件語氣只用在部分條款；ref-29 頁面其實有 article:published_time。
- **修正方式**：收斂輸出的修正寫在 scratchpad 的 `fixups.py`（每次重建時對 `out_formal.md` 斷言式替換）；報告片段與 `refs.tsv` 的修正寫在一次性的 `patch-body.py`，重跑時以「新字串已存在」判定跳過。踩到的坑：ref-17 刪除句尾一句的那條，新字串剛好是舊字串的前綴，首輪就被判定「已套用」而跳過，改以單獨替換處理。
- **驗證**：`scripts/validate-weekly-tech-report-024.sh` 通過（正式 51、淘汰 130、ref-1..51）；總結 293 字。

## 知識庫更新

- `docs/tech-report-research/knowledge/parallel-collection.md`「撰稿後的逐筆稽核」新增三條：資料限制段「原頁未提供」的否定式主張也要回原頁全文確認；稽核代理以文字回報、不指定輸出檔；以「新字串已存在」判定跳過時，新字串是舊字串前綴會被誤判
- `docs/tech-report-research/knowledge/index.md` 同步更新該檔摘要

## 第二輪查核（Claude Code，Fable 5.1；`audit-tech-weekly-report` skill）

- **方式**：先確認建置腳本輸出與任務資料夾五份檔案一致，再派四組查核代理**開原始網址**（第一輪只讀本機副本），每組 12 至 13 筆，重新 curl 存檔、核對 H1／headline、datePublished、媒體名稱與網址，並逐句對照總結、亮點、趨勢、資料限制、參考表與 `source.md` 摘要；另派一組補搜代理跨 12 分類找漏。查核結果以文字回傳，主編對關鍵指控回原頁 grep 後裁決。
- **元資料**：51 筆網址全部 HTTP 200，無 403、無實質轉址（ref-6、ref-9、ref-35 僅多尾端 `/`）；標題、發布日期、媒體名稱 51 筆全部與參考表一致；抓回的正文與第一輪本機副本零差異（iThome、金管會僅計數器與 nonce 不同）。UTC 發布時間換算台灣時間跨日的有 ref-6、8、12、16、18、20、28，皆依原頁標示日，符合規則。
- **內文修正 10 筆**：ref-8 原頁把政策撰寫階段對應 Permissive 模式（只記錄不阻擋），報告誤寫 Learning；ref-11 原頁把召集團隊的交通時間歸在 19 小時首次回應之後的 9 小時圍堵，趨勢句改寫；ref-22 原文「a number of cases」是多起案例，報告四處「常被重複發現」改為「多起…被獨立重複發現」；ref-25 結算雙方是 Lloyds 與 Visa、原頁無「消費者」，標題「銀行間」改「銀行與 Visa」；ref-15「As early as 2017」改「最早自 2017 年起」；ref-34 原頁主要課題只有成本、耐久性是另一項技術課題；ref-36 漢翔案原文是「韌性通訊」，「抗干擾通訊」是關鍵技術類的用詞；ref-27 「獨立審查」一句出自指引全文、由 The Register 引述；ref-44 `source.md` 摘要把 Spotify 規則區分兩種手法寫成「Sony 的數字未區分」；ref-11「開源」不在原頁，刪。日期顯示差異補進資料限制：ref-3 原頁正文標 10 月 9 日、JSON-LD 為 10 月 8 日；ref-12 正文顯示的日期是 dateModified 10 月 2 日。
- **否定式主張全部驗證成立**：Haiku 1M context 不在官方頁、openai.com 仍 403、「眾至」不在 Rapid7 原頁、Zammad 版號敘述矛盾、IDC Frontier 個別客戶遷移細節不在原頁、MAS 新聞稿無獨立審查句、Ticketmaster 原頁無官方公告。
- **補搜補入 6 筆（ref-52 至 ref-57）**：WordPress 7.1.3（7 個修補中 3 個由 Anthropic、1 個由 Trail of Bits 與 OpenAI 通報；核心 RCE CVE-2026-87902 同週列 KEV）、丹麥 CPR 約 880 萬人外流（官方丹麥文新聞稿，取代上期因「技術細節少」淘汰的 iThome 綜合稿）、Lumen PoeLLM（專攻自架 LiteLLM、Ollama、Gitea）、Biohub 18 億美元 AI 可用生物資料、維基媒體對 OpenAI 代理的調查（與上期澳洲事件不同受害者與調查主體，判定為不同事件）、GitHub 堆疊式 PR 正式推出。六筆皆回原頁 grep 關鍵數字全中；依慣例接在表末、不重排。
- **補搜淘汰 4 筆**：Cloudflare Birthday Week 總整理（上期已引用同系列 CA 文，依系列規則淘汰）、Anthropic Cyber Mission（同站已收 Haiku，資安已 8 筆）、SynthID Detector 開放（上期已收 SynthID Bio 同技術家族）、NASA 與能源部核能備忘錄（無技術細節）。另查過不收：AI 開發工具窗內皆增量版本；窗內無新 PIR；台灣各部會窗內新聞稿無高於現有選材者；swift.com、CISA 10-08 警示、Park24 原頁無法取得，不憑二手補入。
- **踩到的坑**：補搜代理的存檔編號與回報序號對不上（gap-9 實為 SynthID 頁、堆疊 PR 在 gap-8），主編以 `<title>` 重新對應才核對；第二輪修正腳本再次遇到「新字串是舊字串子字串」被誤判已套用（「客服工單系統 Zammad」是「開源客服工單系統 Zammad」的子字串），改單獨替換。
- **驗證**：`scripts/validate-weekly-tech-report-024.sh` 常數改為正式 57、淘汰 134、ref-1..57，通過；`validate_report.py`（含 `--references`）通過；總結 298 字；排版校對剩 11 項不修（日文原標題）。

## 第三輪查核（Codex；`audit-tech-weekly-report` skill）

- **原頁重抓**：57 筆正式來源全部 HTTP 200。自動標題比對標出 ref-22、37、38、40、55；人工複核後，ref-22 是聚合式 Release Notes 頁、ref-37／38／40 是 Shift_JIS 解碼造成的雜訊、ref-55 的 `<title>` 仍為報告採用的原始標題，較長文字是頁面 H1，皆不構成標題錯誤。
- **日期複核**：ref-11 的頁面 meta 只呈現 2026-10-09 最後修改日，事件時間軸仍列 2026-09-29 對外公開聲明，報告保留 2026-09-29；ref-29 的 2026-10-01 仍與 `article:published_time` 一致。
- **缺漏補搜**：重新掃描 12 個必要分類。候選多為現有事件的二手轉述、低權重產業文或同系列更新，無來源權重或重要性明顯高於現有 57 筆者，因此不新增。
- **修正範圍**：新聞主張、日期、網址、引用編號不變；作者 Meta 加入 `Codex`，並補齊本輪查核紀錄。
