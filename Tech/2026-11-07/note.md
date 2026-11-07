# 研究筆記

- 任務：weekly-tech-report-028
- 報告日期：2026-11-07
- 時間範圍：2026-10-24 至 2026-11-07
- 使用工具：Claude Code（Opus 5.5）擔任主編，負責收斂、補查、撰稿與裁決；四組 `tech-collector` 代理（sonnet）平行蒐集；三組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核；Codex 執行第二輪原頁、來源詞、metadata 與缺漏複核

## 知識庫查閱

任務開始前已讀取 `docs/tech-report-research/knowledge/index.md`，並開啟其中五份知識檔：

- `parallel-collection.md`：四組分類拆法、候選檔格式、收斂工具與固定檢查、撰稿後稽核的四類常見錯誤、稽核包與文字回報、AI 組盤點 AI 開發工具 Release 與窗內開發者大會
- `window-overlap-dedup.md`：篩選前比對前兩期 `references.md`；系列活動上期已引用其中一場，本期不再引用同系列其他場次
- `source-priority.md`：中國來源與社群平台內容優先以高權重來源替換；本期正式來源無中國或社群平台來源
- `date-citation-rules.md`：引用格式 `[[{數字}. {資料來源名稱}]](#ref-{數字})`、錨點規則、`*未知時間` 用法
- `report-format.md`：四段式結構、H2/H3 階層、參考資料表格、完成前檢查

`fetch-gotchas.md` 與 `taiwan-media-landscape.md` 由蒐集代理依簡報讀取。另讀取施工筆記索引 `docs/working-notes-skill/notes/index.md`，命中並開啟兩份筆記（weekly-tech-report-027 平行蒐集與四組稽核、週記流程 agent 化），沿用建置腳本為五份任務檔唯一內容來源、共用簡報統一代理規則、輔助腳本加組別前綴、每分類 3 至 5 筆、撰稿後先產生稽核包再派稽核代理。

## 蒐集方式

依分類拆成四組 `tech-collector` 代理平行蒐集，四組共用一份簡報（時間窗、權重、去重名單與上期淘汰清單、候選檔格式、原頁核對與 `grep 核對` 清單格式、存檔檔名與輔助腳本的組別前綴、否定式主張的全頁查核與回報格式），各自完成搜尋、以 curl 取得原頁並存檔、核對日期與數字、跨期去重與淘汰判斷：

- A 組：AI 科技、軟體工程（正式建議 10、淘汰 9）。盤點 Google DeepMind、Anthropic research、OpenAI（經 iThome）、Hugging Face、GitHub Changelog、`claude-code` Releases、Go、.NET、VS Code、Rust、Python、Next.js、Django。窗內 .NET Conf 為 11-10 至 11-13，在窗外；GitHub Universe 與 Android Dev Summit 上期已收，本期沒有窗內的大型開發者大會。
- B 組：軟硬體資訊安全、硬體或軟硬整合、網路/伺服器等基礎（正式建議 13、淘汰 14）。網路/伺服器另查 AWS、Azure、Google Cloud `incidents.json`、kernel.org、nginx、OpenSSL，窗內沒有可收的事故或版本事件。
- C 組：金融科技、醫療科技、運輸物流（正式建議 14、淘汰 11；醫療科技補搜 9 輪）
- D 組：房地產與室內外裝潢、現場表演藝術、影視音樂、其他領域科技應用突破（正式建議 16、淘汰 14；三個稀疏分類各補搜 8 輪以上）

並行上限為 3 組，D 組在 A 組完成後才啟動。收斂以 `scripts/converge-weekly-tech-report-candidates.py` 依 `order.txt` 編號正式條目、剔除撰稿欄位、檢查摘要字數與時間窗，結果正式 57 筆、淘汰 46 筆，零錯誤。

## 主編複審的取捨

代理正式建議 53 筆，主編降 1 筆、補 5 筆：

- 降為淘汰：Stripe 讓 Samsung Wallet 支援 USDC 購買（Stripe Newsroom 11-05）。金融科技本期已有 6 筆，這則是既有 Crypto Onramp 的通路擴充，內容較短。
- 補入 GPT-6 Cyber（ref-1）：B 組列淘汰並建議交由 AI 科技；B 組已存原頁，主編核對後收入。
- 補入 Claude Code v2.1.319（ref-10）：A 組已用 GitHub API 確認窗內有 v2.1.317 至 v2.1.319 但未收；主編開 Release 頁核對，以行為變更最大的 v2.1.319 為代表。
- 補入 Cursor 市集的惡意 Claude Code 擴充套件（ref-15）：由 B 組存檔的 iThome 11 月 2 日資安日報追到單篇報導 180119。
- 補入 Binance 竊案攻擊鏈（ref-28）：B 組列淘汰並建議交由金融科技，但存的網址是資安日報彙整頁；主編改收 11 月 4 日的單篇攻擊鏈報導 180203，11 月 2 日的事件公告報導 180126 只作備註。
- 補入 Claude Personal Finance（ref-31）：C 組只見 RSS 標題並建議交由 AI 科技；Anthropic 官網 news 列表找不到對應頁，主編以 iThome 原頁核對後收於金融科技。

各組淘汰候選中標註「建議交由他組」的來源已逐一檢視：CWE-bench v2 與 Next.js、Django 例行安全釋出（A 組建議交資安，影響低於現有選材）、Apple Siri 繁中測試（只見中央社列表網址）、Hybe 資料外洩（揭露日 10-18 在窗外）、Nature 的 AI 代理機器人實驗室新聞（付費牆無法核對），維持淘汰。C 組的 Circle 第三季財報條目網址是新聞中心列表頁，屬盤點型條目，收斂前移出候選檔。

## 跨期去重

本期窗期與 2026-10-31 期重疊八天、與 2026-10-24 期重疊一天。篩選前已由兩期 `references.md` 與 2026-10-31 期的淘汰清單建立已引用名單，候選網址與前兩期正式來源沒有重複；以下事件因重複而未收：

- Gemini 4 Carbon、GPT-6.1 Terra、Mistral Large 4、Anthropic S-1、Genie 4、TypeScript 7.1 Beta、Python 3.15.1、Node.js 26 LTS（上期已收）
- Waymo × Toyota、FAA eVTOL、OCC 穩定幣最終規則、FDA Voceryq、Visa × BILL、Stripe Treasury for agents（上期已收）；Cloudflare 的 eMudhra 後續（前期已收同事件）
- Garth Brooks、StubHub 巴西、Sphere、Suno 對 Apple 的傳票、YouTube 訂閱數、Spotify AI 翻唱工具、NASA Swift（上期已收或已淘汰）

上一期事件的新進展可收：Linux 核心 TCP 漏洞本期是 NetApp 儲存設備受影響（ref-25）；TCCF 上期收的是中央社的活動預告，本期是開幕日 Wētā FX 與文策院簽約與投資（ref-49）；Suno 本期是 Jason Isbell 的 NIL 集體訴訟（ref-51），與上期的傳票爭議為不同案件。同站不同事件照常採用：Anthropic（FlashProve、代理記憶）、Cloudflare（DNS 建置）、Waymo（冬季營運）、FAA（數位塔台、E-IDS）、Apple（iPad mini）、NVIDIA（Vera CPU）、Digital Music News、ITmedia BUILT、中央社。

## 逐筆查核

- 正式來源 57 筆皆 curl 到 HTTP 200，原頁存於 scratchpad 的 `pages/`，日期取 JSON-LD、meta 或頁面日期列；更新註記與 dateModified 不作發布日
- 每筆的 `grep 核對` 詞由代理與主編以腳本對原頁逐詞比對，全部命中；ITmedia BUILT 以 cp932 解碼
- 擋抓取的站點：openai.com 全擋，GPT-6 Cyber、LifeVal、Pierre 以 iThome 為來源；Mayo Clinic 官方站、EurekAlert 與 Fierce Healthcare 回 403，Mayo 的方案改以 HIT Consultant 為來源；Marvell 官網回 403，以 iThome 為來源；Nature 與 Nature Medicine 為付費牆，只依摘要
- 代理已把非原頁內容隔離在備註：OpenSSH 官方發布說明未用 SSHole 與 CVE 名稱（摘要採 iThome）、iThome 對 NuGet 技能的供應鏈提醒、XCPE 波及台灣近 9 萬臺的資安日報數字、IREN 的彭博與路透說法，皆未寫成原頁事實
- 日期特例：Claude Code v2.1.319 取 UTC 11-06；NVIDIA Vera 取 UTC 11-05；VS Code 1.145 的 JSON-LD 為 2021 年模板值，改取頁面 Release date 並與官方 feed 交叉確認；DDEX 與 Suno 的網址日期比 datePublished 早一天，取 datePublished；Toridoll 的 meta 疑似把 JST 標成 Z，兩種讀法都在窗內；健保署新聞稿取建檔日期

## 分類補搜

- 醫療科技：9 輪（FDA 新聞稿 RSS、MHRA atom、EMA、STAT 與 MedTech Dive 等產業媒體 RSS、Nature Medicine 與 Lancet Digital Health RSS、衛福部與食藥署、中央社與 iThome 列表、醫院 AI 落地搜尋、科技新報轉述的 Pew 調查追原始日期）
- 房地產與室內外裝潢：8 輪（ITmedia BUILT 首頁約 30 篇、Construction Dive、MIT News、內政部與營建署、建研所、台灣媒體的都更與智慧化、中央社地方與社會列表）；窗內的台灣題只有高雄亞灣智慧社宅動土，沒有技術細節
- 現場表演藝術：8 輪（Digital Music News、Pollstar、Billboard、票務機器人、兩廳院與衛武營、演唱會實名制、Sphere 與票務平台、中央社文化列表）；窗內沒有台灣場館的科技應用新聞
- 影視音樂：9 輪（Digital Music News、Variety、Hollywood Reporter、Deadline、Spotify Newsroom、YouTube Blog、Billboard、金馬獎（頒獎 11-22，窗外）、中央社文化與影視列表）
- 盤點未成條目：SpaceX Starship 第 15 次試飛在窗內尚未發射；核融合只有一則無一手來源的外媒說法；台灣太空中心窗內無新事件；教育科技無可核對條目

## 撰稿後逐筆稽核

- **原頁重抓**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 57 筆原頁，全部 HTTP 200；ITmedia BUILT 三筆以 cp932 解碼。再以 `scripts/build-weekly-tech-report-audit-packets.sh` 產生稽核包。
- **三組逐筆稽核**：三組 `tech-auditor` 各負責 19 筆，只讀稽核包與本機原頁、以文字回報；主編逐條回原頁 grep 核對後採納，修正入口 `scripts/apply-weekly-tech-report-028-audit.sh`。類型：歸因（ref-7 推送延遲是 OpenAI 的說法、ref-13 成因為 Wakefield 的分析、ref-17 合規性是報導敘述、ref-38 宣布者是美國運輸部長、ref-41 基隆監測與 ref-57 登陸火星時程為記者敘述、ref-47 AI 代理說明出自 Easol 網站）；語意精度（ref-2 運動賽事動作、ref-4 dreaming 的範圍、ref-24 與 ref-30 約數與確數、ref-29 should not、ref-35 建議、ref-41 8 成以上、ref-42 限人工昂貴地區、ref-46 大半取決於證據開示、ref-53 through 2027、ref-55 silk 是蠶絲而非矽）；狀態與時態（ref-16 400 多名客戶是先前傳出的數字、ref-20 CPO 雷射是去年推出、ref-26 交付延遲與營收目標延後的原因分開、ref-41 201 架是 2028 年目標、ref-45 BIM 導入已開始）；自加定性（ref-13、ref-17、ref-19、ref-31、ref-37 趨勢段，ref-18 結尾，ref-32 縮短審查，ref-44 電線電纜廠商，ref-55「只」，ref-56「純」）；否定式主張與原頁矛盾（ref-50 原頁其實寫了 GAI-D 草案進度）；網址改列 canonical（ref-2 deepmind.google 轉址到 blog.google，來源名改 Google Blog）。
- **未採納**：ref-48「首度擴展到歐洲以外」依原頁 One Arena 現有七個成員皆為歐洲集管團體推得，備註已寫明依據，保留。
- **結果**：正式 57、淘汰 46、12 分類、ref-1 至 ref-57 一致。

## 第二輪查核（Codex；`audit-tech-weekly-report` skill）

- **原頁與元資料**：依參考表重抓 ref-1 至 ref-57，57 筆均取得 HTTP 200。自動標題或日期差異來自 Go Blog H1 抓到站名、金管會／衛福部／FAA 的網站包裝、FDA 日期格式、VS Code JSON-LD 殘留 2021 模板日期與 ITmedia Shift_JIS 解碼；人工複核後不構成標題、發布日、來源名或網址錯誤。
- **逐筆內文複核**：以 `scripts/validate-weekly-tech-report-source-terms.sh` 對 57 筆正式來源檢查 559 個 `grep 核對` 詞，全部命中。再掃描歸因、時態、數字強度、供應商自評與資料限制段，未發現新的新聞主張錯誤。
- **12 類缺漏補搜**：補搜腳本產生 140 筆候選；多為彙整頁、財經市場評論、廠商稿、低權重轉載或已由正式來源涵蓋的同一事件。沒有重要性或來源權重明顯高於現有選材的項目，不為增加筆數納入。
- **結果**：正式來源 57 筆、淘汰 46 筆、ref-1 至 ref-57 與 12 分類不變；作者 Meta 加入 Codex。
