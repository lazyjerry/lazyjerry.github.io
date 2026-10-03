# 研究筆記

- 任務：weekly-tech-report-023
- 報告日期：2026-10-03
- 時間範圍：2026-09-18 至 2026-10-03
- 使用工具：Claude Code（Opus 5.5 建置；Fable 5.1 稽核）；四組研究代理平行蒐集，主編收斂、逐筆核對與撰稿，再以四組稽核代理逐筆對照本機原頁、一組代理跨分類補搜

## 知識庫查閱

任務開始前已讀取 `docs/tech-report-research/knowledge/index.md` 與全部七份知識檔案：

- `source-priority.md`：中國來源與社群平台內容優先以高權重來源替換；本期 C 組一筆中國交通運輸部來源依此淘汰
- `taiwan-media-landscape.md`：台灣媒體分類座標，用於評估中央社、iThome、經濟日報、科技新報、VERSE 的定位
- `date-citation-rules.md`：引用格式 `[[{數字}. {資料來源名稱}]](#ref-{數字})`、錨點規則、`*未知時間` 用法
- `report-format.md`：四段式結構、H2/H3 階層、參考資料表格、完成前檢查
- `fetch-gotchas.md`：iThome 改 curl 帶瀏覽器 UA；openai.com 全 UA 403；sec.gov 用宣告式 UA；technews.tw 轉址 cdn；blog.google 用 curl 只抽到樣式；WebFetch 摘要會改寫日期
- `window-overlap-dedup.md`：篩選前先比對前兩期 `references.md`；系列活動上期已引用其中一場，本期不再引用同系列其他場次
- `parallel-collection.md`：四組分類拆法、候選檔格式、`converge-weekly-tech-report-candidates.py` 的用法與收斂時的固定檢查

另讀取施工筆記索引 `docs/working-notes-skill/notes/index.md`，命中並開啟四份筆記（weekly-tech-report-021 平行蒐集、022 平行蒐集與收斂工具、022 第三輪逐筆稽核、週記中文排版校對改建置腳本），沿用建置腳本為五份任務檔唯一內容來源、收斂時逐筆讀備註、補搜代理結論只當線索的做法，並依 022 筆記建議把每分類正式來源壓在 3 至 5 筆。

## 蒐集方式

依分類拆成四組代理平行蒐集，四組共用一份簡報（時間窗、權重、去重名單、候選檔格式、原頁核對要求），各自完成搜尋、以 curl 取得原頁、核對日期與數字、跨期去重與淘汰判斷：

- A 組：AI 科技、軟體工程（正式建議 10、淘汰 19；各補搜 5 至 6 輪）
- B 組：軟硬體資訊安全、網路/伺服器等基礎、硬體或軟硬整合（正式建議 14、淘汰 23；補搜 4 至 5 輪）
- C 組：金融科技、醫療科技、運輸物流（正式建議 15、淘汰 22；醫療科技補搜 12 輪）
- D 組：房地產與室內外裝潢、現場表演藝術、影視音樂、其他領域科技應用突破（正式建議 19、淘汰 32；房地產 16 輪、表演藝術 13 輪、影視音樂 16 輪）

四組合計 154 筆，去除跨組重複的 4 筆（無人船聯邦式學習出現在三組、AMD 併購 World Labs 與蘋果智慧家庭中樞傳聞各出現在兩組）後，候選 150 筆。收斂以 `scripts/converge-weekly-tech-report-candidates.py` 依 `order.txt` 編號正式條目、剔除撰稿欄位、檢查摘要字數與時間窗，結果正式 51 筆、淘汰 99 筆，摘要字數與時間窗檢查零錯誤。稽核補搜再加入 4 筆正式、15 筆淘汰，最終候選 169 筆、正式 55 筆、淘汰 114 筆。

## 主編複審的取捨

代理正式建議 58 筆，主編降 7 筆，讓每分類維持 3 至 5 筆：

- SEC 譴責 OTC Link（09-22）：監理執法個案，金融科技保留保管提案、OUSD、韓國銀行與國銀保管四則
- 南鐵地下化台南車站（中央社 10-01）：以通車時程與車站配置為主，代理自己也建議名額不足時先刪
- 建研所智慧化居住空間性別化創新會議（09-24）：工作坊草案，尚無實作，權重 5
- 國慶總統府光雕記者會（10-02）：科技細節只有投影與逐格動畫，且與前期新勝景同屬文總光雕題材
- 派拉蒙收購華納兄弟獲准（10-01）：反壟斷和解與經營權安排，原頁無技術面細節
- ARPA-H CIRCLE（09-22）：與 SURPASS 同機構，保留一則
- ESA Smile 展開科學觀測（09-30）：同機構已收 Jammertest

分類調整：無人船聯邦式學習 B 組列硬體、A 組建議交運輸、C 組建議交其他領域，主編歸入其他領域科技應用突破（以 `overrides.tsv` 覆寫分類欄）。韓國銀行遭駭 C 組列金融科技並提醒與資安重疊，主編維持金融科技，資安段落以趨勢分析交叉引用。NVIDIA Open Agent Safety Platform 兼具 AI 代理安全，維持硬體分類，總結與 AI 趨勢交叉引用。

各組淘汰候選中標註「建議交由其他分類」的高權重來源已逐一檢視：Anthropic 警告 GLM-5.3、AMD 併購 World Labs、Next.js 漏洞、Shopify WebMCP、Amazon 封鎖 Meta Muse、京王電鐵與東京地鐵遭攻擊、ATM 吐鈔制裁、Cloudflare Birthday Week 其他篇、中央社西班牙文新聞網、ElevenLabs 估值、夏普衛星天線。AI 與軟體工程名額已滿且現有選材權重較高，資安分類已有兩則零時差與一則國家級 APT，這些來源維持淘汰。

## 跨期去重

本期窗期（2026-09-18 至 2026-10-03）與 2026-09-26 期重疊九天、與 2026-09-19 期重疊兩天。篩選前已由兩期 `references.md` 建立 106 筆已引用標題與網址名單，以下候選因此淘汰：

- 微軟新 Copilot 整合 Cowork、Office（iThome 09-28）：前期已引用微軟官方部落格同事件
- Shai-Hulud 蠕蟲擴散至企業內部儲存庫（iThome 09-23）：與前期 Mini Shai-Hulud 同系列攻擊
- D-Link DIR-822A 台灣用戶不受影響（iThome 09-30）、Gyazo 外洩（iThome 09-24）：前期已引用原公告
- 存款代幣 QA、玉山 Agentic Banking、健康幣上路首日：前期已引用同事件
- Meta 100 公克 VR 眼鏡：與前期 Ray-Ban Meta Audio 同屬 Meta Connect 系列
- Apple Music Hall 首波陣容、Made on YouTube 其他公告、Suno 反駁新訴訟：前期已引用同系列或同事件
- VS Code 1.140：前期已收 1.139，本期改收其中最重要的 HydraFusion（GitHub Changelog）

同站不同事件照常採用：Anthropic（Sonnet 5.5，前期為 Opus 5.5）、Apple（Mac 與 iOS 修補，前期為 Siri AI 與 Music Hall）、NVIDIA（DGX Spark 與代理安全平台，前期為 MLPerf）、SEC（加密資產保管，前期為代幣化股票豁免）、Cloudflare（公開 CA，前期為 Containers 事故等）、MIT News、Waymo、ESA。

## 逐筆查核

- **原頁抓取**：以 `scripts/audit-weekly-tech-report-sources.sh` 把 51 筆正式來源抓回本機，49 筆一般瀏覽器 UA 回 200；SEC ref-24 回 403，改宣告式 UA 取得 200；內政部 ref-38 回 307（WAF），帶 cookie 間隔重試後取得 200。
- **關鍵數字核對**：對每筆來源挑出摘要與報告引用的數字、版本號、CVE 與專有名詞（共 143 項），在原頁純文字或 HTML 內逐項 grep；全部命中，其中 Argon「800K+」、凱基「八種」、ARPA-H「90 percent」、MUTEK「10 月 15 日」、Qobuz「four million」為寫法差異。
- **撰稿措辭回原頁核對**：Sonnet 5.5 的 `between_tools` 是「維持不先思考」的設定，初稿趨勢段誤寫成工具呼叫設定，已改；星艦「3 具主引擎之一提前關閉」與「6 圈縮短為 3 圈」、Apple M5 Ultra 5,499 美元與 4.3 倍、Sonnet 5.5「first Sonnet model to launch with cyber safeguards」皆在原頁。
- **日期依據較弱的兩筆**：CISA NetScaler 警示頁只標示 10 月 2 日修訂，另抓同日 KEV 公告頁確認 Release Date September 27, 2026 與兩個 CVE；Azure 狀態歷史頁確認條目「09/30/2026 Mitigated」與 Tracking ID 7Q30-010 仍在頁上。
- **Azure 標題**：代理寫「約 6 小時」，原頁時間為 20:30 至 02:15 UTC（5 小時 45 分），`source.md` 標題與參考資料表改為「近 6 小時」。
- **代理摘要中的非原頁內容**：各組已在備註標出並排除在摘要外，例如 NetScaler 的 CVSS 與修補版本號、Antino 誘餌郵件細節、iOS 漏洞的 NVD 分數（皆出自 iThome）、Argon 落後對手的說法（中央社）、OUSD 聯盟成立日期（搜尋摘要）、Lucid 首批車輛時程（FT 轉述）；主編逐筆讀備註確認摘要未收這些句子。iThome 報導 Vite+ 的速度數字與 VoidZero 官方頁不同，採官方頁。

## 抓取踩坑（本期新增）

- **fda.gov 對瀏覽器 UA 間歇回 401**（「resembles an automated request」），C 組改宣告式 UA 取得 200；主編稽核時一般 UA 又回 200，連續請求才會被擋。
- **moi.gov.tw 連續請求被 WAF 擋**，回 307 或錯誤頁；帶 cookie、間隔 20 秒重試可取得 200。日期欄用民國年，頁尾「更新日期」不是發布日。
- **abri.gov.tw 本期兩次 curl 皆逾時**，建研所新聞無法盤點。
- **built.itmedia.co.jp 頁面為 Shift_JIS**，需以 cp932 解碼；報導日常晚原始發表一至兩週，要另查原始發表日。
- **cisco.com 資安公告頁含非 UTF-8 位元組**，解碼要忽略錯誤；日期取「First Published」。
- **azure.status.microsoft 狀態歷史頁是動態列表**，條目會下沉或改成正式 PIR，引用時記下 Tracking ID。
- **investor.nvidia.com 回 403**，改用 nvidianews.nvidia.com 同篇新聞稿。

## 權重壓低而非排除

- ref-3（OpenAI Dots）權重 7：iThome 轉述，openai.com 403。
- ref-19（西門子與台積電）權重 7：科技新報轉述廠商新聞稿。
- ref-25（OUSD）權重 8：iThome 轉述，Open Standard 官網無法連線。
- ref-34（Lucid 與 Bolt）權重 7：iThome 報導，事件 9 月 17 日宣布、報導 9 月 18 日發布。
- ref-37（Nossa）、ref-38（環境敏感地區平台）權重 6：房地產分類窗內來源稀少。
- ref-41（MUTEK×TTXC）權重 6：活動前置報導，活動在報告日期之後。
- ref-42、ref-45、ref-46 權重 6：Digital Music News 報導，未找到公司官方新聞頁。

## 分類補搜

- 房地產與室內外裝潢：16 輪。建研所官網逾時、內政部 WAF、PropTech 與智慧家庭關鍵字皆無窗內事件；最後在 ITmedia BUILT 列表逐篇核對原始發表日，收清水建設與 Nossa，鹿島、淀屋橋、日本 HP 因原始發表在窗外淘汰。
- 現場表演藝術：13 輪。兩廳院、衛武營、雄影 XR 主稿皆在窗外，inside.com.tw 與 artouch 回 403；收 Sphere×Disguise 官方新聞稿、拓元登入異常、MUTEK×TTXC 前置報導與 Unit1 融資。
- 影視音樂：16 輪。台灣在地題只有派拉蒙收購案、金馬人物稿與藝人花絮，技術內容不足；收東京地院聲音公開權判決、Spotify Taste Profile、Qobuz AI 標籤與 Voice-Swap 加入 DDEX。
- 醫療科技：12 輪。台灣媒體窗內醫療科技報導很少，收 FDA 兩則、ARPA-H SURPASS 與健保署 HIS 雲端轉型。

## 中文排版校對

`check_copywriting.py` 對交付報告初跑命中 69 項，修正後剩 8 項不修：

- 參考資料表的中文原標題補中英數空格（例如「商用逾 30 年 C++ 編譯器前端 EDG 開源」），由表格產生器套用；`source.md` 的「原始標題」欄保持字面原樣，沿用前期裁決。
- 正文與一句話結論的數字與單位補空格（`64 GB`、`512 GB`、`100 Mbps`），Rust ABI 字串改為行內程式碼 `` `"C"` ``。
- 不修：日文原標題 6 項（ITmedia 三則，排版規則針對中文）、英文原標題 `DGX Spark 64GB` 1 項、表演作品名《MOVING PLUS: The World as Prompt》的書名號 1 項（沿用前期 R8 裁決）。

## 第二輪稽核（Claude Code，Fable 5.1）

- **方式**：先比對建置腳本輸出與任務資料夾五份檔案（一致），再把 51 筆原頁的本機副本（`audit-weekly-tech-report-sources.sh` 抓回，SEC 與內政部另抓）交給四組稽核代理，每組 12 至 13 筆，只讀本機頁面不上網，逐句對照參考資料表、`source.md` 摘要與 `report.md` 引用句；每條回報附原頁原文，主編再回原頭 grep 一次才裁決。四組回報 21 筆有修正、30 筆無問題。
- **狀態與時態（原頁為預告或進行中，報告寫成已完成）**：ref-2 Argon 的 C/C++ 轉 Rust 遷移「are working on … before rolling out to production」，三處加「正在」「尚未上線」；ref-16 DGX Spark 64GB「on Friday, Oct. 23, starting at $4,999」與 Sync Model Launcher「end of the month」，亮點與摘要改為預告並補售價，備註「原頁未列售價」改正；ref-18 Mac Studio 512GB 配置「coming in late October」，兩處補註；ref-33 Waymo 轉乘回饋「start with employee access」，亮點補「先開放員工、數週內逐步開放」；ref-34 Bolt「未來也將持有及營運」改未來式；ref-37 Nossa「できるようになれば」是條件式願景，趨勢「持續蒐集」改「驗證讓機器人蒐集」；ref-5 法務部自建與租用、AI PC 地端執行原頁皆為「考慮」。
- **原頭沒有的細節**：ref-12 「部署 shield 前要先建立災難復原與叢集設定」原頁完全沒有（唯一提醒是 URI 編碼登入可能失敗）；ref-14 macOS Tahoe 26.7.1 不在本頁（在 149228 頁），摘要與亮點刪除；ref-26 「周邊系統／不是網銀核心」為報告定性，原頁用語是「對外暴露的系統」，總結、亮點標題、趨勢與參考資料表四處改寫；ref-38 「用了 10 年」誤讀「上線屆滿 10 週年」，「42 個」原頁為「至少 42 個」；ref-50 「不需電池」原頁限定感測元件，訊號仍無線傳輸；ref-50 趨勢「雜訊大的」為推論，刪。
- **歸因**：ref-4 中央社為綜合外電引述路透社，摘要與報告說明補註，「以基金資助」改「承諾透過基金資助」、表格「設基金」改「以全球基金資助」；ref-26 「成為利用 AI 代理程式發動攻擊的目標」原頁未歸給金融委，三處改「報導指出」或「中央社引述韓聯社」；ref-46 「首家」為雙方公告自述且限定「專職（dedicated）」AI 聲音公司，趨勢「DDEX 開始收詮釋資料」改「Voice-Swap 將在 DDEX 提出需求」，與 ref-43（09-30）「同週」改「同期」「數日前」（09-25）。
- **語意精度**：ref-12 「沒有替代緩解措施」混淆 workaround（無）與 mitigation（限制網路存取、Live Protect shield），三處改寫；ref-11 表格「要求」改「建議」（encouraged）；ref-9 「企業版」改「Business 與 Enterprise」；ref-19 「Calibre 3DStack」補「Advanced」；ref-21 趨勢「每個元件都照設計運作」與原頁「preventing these regional services from scaling as expected」相反，改寫；ref-23 台灣 38.26% 的母體是前十萬網站；ref-24 「尚在意見徵詢」改「待聯邦公報刊登後開放 60 天意見」；ref-28 「減少」改「可望減少」；ref-31 責任轉移為推論，改推測語氣；ref-42 補「可能」；ref-43 `source.md` 標題刪「首度」（原頁「ほとんどなかった」）；ref-48 OSNMA 屬 SAS 的一部分、EGNOS 是提供設備而非測試；ref-49 加壓風洞是 Princeton 設施、原頁用 validate 非校正。
- **報告說明的自我修正**：ref-13 原稱 Antino 誘餌細節只見於 iThome，原頁其實有 4 張 Base64 PNG 與財政部函釋，只有講師費金額不在原頁，備註與報告說明改正。
- **補搜**：一組代理跨 12 分類補搜，回報 4 筆正式建議全收、15 筆淘汰（Swift Sibos 原站 403、SvelteKit 3 與 Vite+ 同類、RSA 1024 偽造無立即威脅、軟銀投資與 OpenAI 點名月之暗面無技術面、台灣資安日為倡議、Defender DoS 弱點、智捷規劃、工研院論壇、Shield AI 招募、歐盟無人機預算、Tesla 歐盟表決窗外、台積電 A13 為 4 月、Accenture 合作公告）。補入 ref-52 微軟 Storm-3168（資安，一手代理式雲端攻擊事故分析）、ref-53 DMDC 外洩（資安，Military Times 首報）、ref-54 SynthID Bio（其他領域，DeepMind 一手）、ref-55 Reddit 停 RSS 與 Public API（軟體工程，iThome；Reddit 原頁無法取得）。4 頁皆 curl 200、日期取 JSON-LD 或 `class="created"`，關鍵數字逐項 grep（DMDC 原頁寫「approximately four million」）。依 020、022 期慣例接在表末，不重排既有編號；三筆代理摘要超過 500 字，只刪不補精簡至 431、494、496 字。
- **驗證**：`scripts/validate-weekly-tech-report-023.sh` 常數改為正式 55、淘汰 114、ref-1..55，通過；總結 272 字；中文排版校對維持 8 項不修。所有修正都寫在 scratchpad 的 `fixups.py`（對收斂輸出與報告正文做斷言式字串替換），重建後五份任務檔仍由建置腳本產生。
