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
