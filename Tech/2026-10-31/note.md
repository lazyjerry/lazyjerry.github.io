# 研究筆記

- 任務：weekly-tech-report-027
- 報告日期：2026-10-31
- 時間範圍：2026-10-17 至 2026-10-31
- 使用工具：Claude Code（Opus 5.5）擔任主編，負責收斂、補查、撰稿與裁決；四組 `tech-collector` 代理（sonnet）平行蒐集；四組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核；Codex 執行第二輪原頁、來源詞與缺漏複核；第三輪由 Claude Code（Opus 5.5）裁決，四組 `tech-auditor`（fable）逐句稽核、一組 `tech-collector`（sonnet）補搜

## 知識庫查閱

任務開始前已讀取 `docs/tech-report-research/knowledge/index.md`，並開啟其中五份知識檔：

- `parallel-collection.md`：四組分類拆法、候選檔格式、收斂工具與固定檢查、撰稿後稽核的四類常見錯誤、稽核包與文字回報、AI 組盤點 AI 開發工具 Release 與窗內開發者大會
- `window-overlap-dedup.md`：篩選前比對前兩期 `references.md`；系列活動上期已引用其中一場，本期不再引用同系列其他場次
- `source-priority.md`：中國來源與社群平台內容優先以高權重來源替換；本期正式來源無中國或社群平台來源
- `date-citation-rules.md`：引用格式 `[[{數字}. {資料來源名稱}]](#ref-{數字})`、錨點規則、`*未知時間` 用法
- `report-format.md`：四段式結構、H2/H3 階層、參考資料表格、完成前檢查

`fetch-gotchas.md` 與 `taiwan-media-landscape.md` 由蒐集代理依簡報讀取。另讀取施工筆記索引 `docs/working-notes-skill/notes/index.md`，命中並開啟三份筆記（weekly-tech-report-026 斷言式修正與稽核收斂、weekly-tech-report-025 平行蒐集與稽核包、週記流程 agent 化），沿用建置腳本為五份任務檔唯一內容來源、共用簡報統一代理規則、每分類 3 至 5 筆、撰稿後先產生稽核包再派稽核代理。

## 蒐集方式

依分類拆成四組 `tech-collector` 代理平行蒐集，四組共用一份簡報（時間窗、權重、去重名單、候選檔格式、原頁核對與 `grep 核對` 清單格式、否定式主張的全頁查核與回報格式），各自完成搜尋、以 curl 取得原頁並存檔、核對日期與數字、跨期去重與淘汰判斷：

- A 組：AI 科技、軟體工程（正式建議 10、淘汰 15）。盤點 Anthropic news／research／engineering、Mistral、Hugging Face、Meta、iThome AI 頻道，以及 claude-code Releases、Rust、Go、Node.js、.NET、React、Django、Rails、Kotlin、Java、VS Code、Cursor、Codex。窗內開發者大會有 GitHub Universe（10-28 至 10-29）與 Android Dev Summit（10-28 至 10-29），兩者都收官方開發者端彙整；KubeCon NA 為 11-09 至 11-12，在窗外。
- B 組：軟硬體資訊安全、硬體或軟硬整合、網路/伺服器等基礎（正式建議 14、淘汰 18）。網路/伺服器另查 AWS 部落格、Google Cloud `incidents.json`、kernel.org `releases.json`、OpenSSL，窗內只有一筆 Google Cloud 事故且上期已收。
- C 組：金融科技、醫療科技、運輸物流（正式建議 14、淘汰 12；醫療科技補搜 12 輪）
- D 組：房地產與室內外裝潢、現場表演藝術、影視音樂、其他領域科技應用突破（正式建議 19、淘汰 12；三個稀疏分類各補搜 8 輪以上）

C、D 兩組在前一個 session 結束時中斷、尚未寫出候選檔，以 SendMessage 接續後完成。兩組各自在共用目錄建立的輔助腳本曾互相覆寫同名檔（`txt.py`），之後改用組別前綴的檔名；候選檔不受影響。

收斂以 `scripts/converge-weekly-tech-report-candidates.py` 依 `order.txt` 編號正式條目、剔除撰稿欄位、檢查摘要字數與時間窗，結果正式 57 筆、淘汰 52 筆，零錯誤。

## 主編複審的取捨

代理正式建議 57 筆，主編降 3 筆、補 3 筆：

- 廣達 MIT 論壇（中央社 10-30）：論壇閉幕致詞，沒有具體產品、數據或落地案例
- 熊谷組 ADT 自動運行（ITmedia BUILT 10-27）：與 Bedrock Robotics 的自主機具題材重疊，且代理自述為湊滿名額列入
- YouTube 訂閱戶突破 1.5 億（Digital Music News 10-28）：以 Alphabet 財報數字為主；上一期已以「財報類」淘汰 Spotify 第三季財報，本期維持一致
- 補入 Anthropic 提交 S-1（ref-6）：A 組列淘汰並建議交由他組；主編開原頁核對後收於 AI 科技
- 補入 Anthropic 藥物開發進展（ref-35）：A 組淘汰候選 J（iThome 報導收購 Mithril Medicine）與 K（Anthropic 研究頁，未開原頁）為同一事件，主編改收 Anthropic 一手頁
- 補入 Google TPU 進駐 OCI（ref-26）：A 組建議交由網路/伺服器組，主編以 A 組存檔的 iThome 原頁收入

另評估未收：Suno 推出 MCP 作曲工具（Music Business Worldwide 對 curl 回 403，搜尋也找不到 Suno 一手公告，無法核對日期與內容）；PHP 10 月 23 日的 session upload progress 資訊性公告（官方自述為少見組態下的 RCE 路徑，屬上一期 PHP 漏洞的補充建議）；Cloudflare tsrs（TypeScript 移植到 Rust，B 組建議交軟體工程，名額已滿且 Cloudflare 本期已有 4 筆）；Cisco ASA／FTD 已遭利用漏洞與微軟移除 eMudhra 根憑證（資安名額已滿）。

各組淘汰候選中標註「建議交由他組」的來源已逐一檢視：微軟 AI 代理防護機制、.NET 十月 out-of-band 更新（只見列表頁）、Neuralink 植入裝置（中央社綜合外電，權重 6/10）、Google Suncatcher 的 The Verge 報導與 Bedrock 的 TechCrunch 報導（已收一手或同事件來源），維持淘汰。

C、D 組另有 6 筆「整站盤點」性質的淘汰條目（Mastercard、Fed／OCC／BIS、NIH、財報類合併、Apple Home 與 Matter、內政部與國土署），沒有單篇網址、發布日期欄填的是盤點日，收斂前移出候選檔，盤點結果改記於本筆記：mastercard.com 擋抓取、bis.org 回 404、nih.gov 回 403；Fed 窗內新聞稿多為核准與 FOMC；內政部、國土署、建研所窗內沒有科技相關新稿；CSA 窗內只有上期已淘汰的 Suzi 認證。

## 跨期去重

本期窗期與 2026-10-24 期重疊八天、與 2026-10-17 期重疊一天。篩選前已由兩期 `references.md` 與 2026-10-24 期的淘汰清單建立已引用名單，以下候選因此淘汰：

- Google Cloud 倫敦斷電（上期 ref-22）、PHP2Shell 的 Cloudflare WAF 規則與北韓掃描活動（上期 ref-12、ref-13 同事件）、全家與 91APP（2026-10-17 期 ref-15 同事件）
- Anthropic 公共利益基金（上期已淘汰，維持）、AISI 事件對齊評估（上期 ref-2）

上一期事件的後續新進展可收：PHP2Shell 本期是串連 Linux 核心漏洞入侵 PAN-OS 設備（ref-13）；Brotli 上期淘汰的是 Node.js 十月安全版，本期是 .NET、PHP、Python 與發行版的修補整理（ref-14）。同站不同事件照常採用：Anthropic（藥物開發、專家判斷研究、S-1；上期為 AISI 事件與 Agent Skills）、Cloudflare（KV 快取、Radar、DDoS、私有來源；上期為 eMudhra 與 R2）、Waymo（Toyota；上期為馬德里與多倫多）、FAA（佛州 eIPP 示範飛行；上期為垂直起降場草案）、MHRA（CE 承認；上期為 AI 藥品行動計畫）、Digital Music News、ITmedia BUILT、中央社。Spotify AI 工具上期收的是 Believe 授權與工具預告，本期是《金融時報》據報的推出時程與價格。

## 逐筆查核

- 正式來源 57 筆皆 curl 到 HTTP 200，原頁存於 scratchpad 的 `pages/`，日期取 JSON-LD、meta 或頁面日期列；更新註記與 dateModified 不作發布日
- 擋抓取的站點：openai.com 全 UA 403，GPT-6.1 Terra 改以 iThome 為來源；Music Business Worldwide 與 science.org 回 403，相關候選淘汰或改收一手頁；developer.android.com 需帶 cookie 避免 302 迴圈；STAT 為付費牆，只依公開段落
- 代理已把非原頁內容隔離在備註：GPT-6.1 Terra 的 Hacker News 討論、貓王訴訟的 Digital Music News 細節、IBM l-coupler 的 Science News 報導、Suncatcher 的 The Verge 報導，皆未寫入摘要
- 日期特例：Claude Code Release 取 UTC 10-31；Cloudflare KV 快取一文 UTC 10-26（台灣時間 10-27）；Digital Music News 各則取 UTC；ITmedia BUILT 兩則另確認企業原始發表日在窗內；Android Developers Blog 與 Node.js 沒有 datePublished，取頁面日期

## 分類補搜

- 醫療科技：12 輪（FDA RSS、MHRA atom、EMA、MedTech Dive、STAT、ARPA-H、Nature Medicine、Lancet Digital Health、NIH、衛福部與食藥署、中央社健康列表、醫院 AI 落地）
- 房地產與室內外裝潢：8 輪以上（ITmedia BUILT 首頁 28 篇、Construction Dive、MIT News、ArchDaily 與 Dezeen、CSA、Matter 報導、內政部與國土署、中央社列表）；窗內沒有台灣政府或業者的科技題
- 現場表演藝術：8 輪以上（兩廳院、衛武營、台中國家歌劇院、國表藝、文化部、中央社文化列表、Pollstar、Billboard、Variety、Digital Music News）
- 影視音樂：8 輪以上（Digital Music News、Music Business Worldwide、Variety、Hollywood Reporter、Deadline、中央社影視列表、金鐘與金馬、文策院）

## 撰稿後逐筆稽核

- **原頁重抓**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 57 筆原頁；intel.com 對瀏覽器 UA 回 403，ref-20、ref-21 以蒐集時的副本為準；ITmedia BUILT 兩筆以 cp932 解碼。再以 `scripts/build-weekly-tech-report-audit-packets.sh` 產生稽核包。
- **四組逐筆稽核**：四組 `tech-auditor` 各負責約 14 筆，只讀稽核包與本機原頁、以文字回報；主編逐條回原頁 grep 核對後採納，修正入口 `scripts/apply-weekly-tech-report-027-audit.sh`。類型：歸因（ref-12 成因為 Linux 核心 CVE 團隊所述、ref-29 引言只屬 ACI 的 Craig Ramsey、ref-39 多燃料策略為 Emma Mazhari 所述、ref-41 B2B 擴展是公司方針、ref-43 與 ref-48 補上說話者、ref-45 機器人是 Brooks 的說法、ref-50 訴狀主張與律師引言分開、ref-52 第四要素為記者解說）；語意精度（ref-4 五項決策與 38 例、ref-7 差距在兩分以內、ref-23 208% 的分母是全部網路層攻擊、ref-27 在中央證券保管機構發行、ref-31 許可方式針對醫材整體、ref-33 sought to、ref-44 第二種規格、ref-47 arena 不是巨蛋、ref-49 郡與州兩個數字）；狀態與時態（ref-1 本週起、ref-3 三週與本月稍早、ref-5 預計、ref-19 初期安裝測試中、ref-26 將部署、ref-29 示範、ref-35 條件句、ref-42 目標）；自加定性（ref-11 趨勢、ref-13「很快」、ref-15 成因、ref-17 結尾、ref-34 送審、ref-36 計費、ref-44 與 ref-51 趨勢）；標題改用 H1（ref-17、ref-33、ref-45、ref-52）。
- **未採納**：ref-44 與 ref-41 原始標題維持 ITmedia BUILT 的 `<title>` 寫法，兩筆一致；ref-50 趨勢段句尾屬本報告觀察，保留；ref-15 結尾「要升級」已由前句寫明版本，不重複。
- **結果**：正式 57、淘汰 52、12 分類、ref-1 至 ref-57 一致。

## 第二輪查核（Codex；`audit-tech-weekly-report` skill）

- **原頁與元資料**：依參考表重抓 ref-1 至 ref-57，55 筆以瀏覽器 UA 取得 HTTP 200；ref-20、ref-21 Intel 依站別規則改用 curl 預設 UA 後皆為 200。自動標題差異只有 Mistral／IBM 分隔符、Intel 擋頁與兩筆 ITmedia Shift_JIS 解碼雜訊；人工複核後不構成標題、日期、來源或網址錯誤。
- **逐筆內文複核**：以 `scripts/validate-weekly-tech-report-source-terms.sh` 對 57 筆正式來源檢查 580 個 `grep 核對` 詞，全部命中。再對照第一輪已修正的狀態、歸因、數字分母、供應商自評與資料限制段，未發現新的新聞主張錯誤。
- **12 類缺漏補搜**：重新掃描 AI、軟體工程、資安、硬體、基礎設施、金融、醫療、運輸、房地產、表演藝術、影視音樂與其他應用。新增兩筆淘汰候選：OpenAI 10 月 30 日 GPT-6 Rosalind Research 為限核准客戶的受限預覽，且本期已有 Anthropic 藥物開發；FDA 10 月 30 日皮膚病灶輔助診斷軟體 Class II 最終命令，是將 2024 年 De Novo 分類編入法規。兩者的重要性未明顯高於現有正式選材，不為增加筆數而納入。
- **結果**：正式來源 57 筆、淘汰 54 筆、ref-1 至 ref-57 與 12 分類不變；作者 Meta 加入 Codex。

## 第三輪查核（Claude Code；`audit-tech-weekly-report` skill）

- **原頁重抓**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 57 筆，55 筆以瀏覽器 UA 回 HTTP 200；Intel ref-20、ref-21 改用 curl 預設 UA 後為 200；ITmedia BUILT 兩筆以 cp932 解碼。`scripts/validate-weekly-tech-report-source-terms.sh` 對 580 個詞全部命中，再以 `scripts/build-weekly-tech-report-audit-packets.sh` 產生稽核包。
- **四組逐句稽核**：四組 `tech-auditor` 對照稽核包與本機原頁回報 35 處，主編逐條回原頁 grep 後全部採納。歸因：ref-16 聲明內容是 iThome 引述的段落、ref-28 是講者以秘書長身分的看法、ref-42 客戶量與付費工作是公司新聞稿的說法、ref-43 平板避難所的用途是 MIT News 的敘述；狀態與時態：ref-5 預計、ref-11 將改用、ref-19 初期 Helios 機櫃安裝測試中（趨勢段）、ref-20 預期涵蓋、ref-48 10 月 31 日開展、ref-49 動土典禮將排定；語意精度：ref-1 初期定價、ref-4 sometimes 與「未給予明確偏好與表達指示」兩個條件、60% 不寫成因果、ref-7 GitHub Enterprise 與 Copilot 方案分開、ref-17 many 與 enable、ref-19 lead customer、ref-31 CE 承認範圍為醫材與 IVD、ref-33 sought to 與 would likely、ref-48 修飾關係、ref-52 throughout much of 2026、ref-55 we owe it to 與 likely；資料限制段 ref-3 的第三方基準由 Mistral 轉述；ref-10 多餘空格；ref-20、ref-21 備註的 403 紀錄更新。
- **補搜**：一組 `tech-collector` 依 Google News 自動盤點的線索與各分類重掃。新增正式來源 4 筆：Google DeepMind Genie 4（ref-58）、CISA 將 PHP2Shell 列入 KEV 並依 BOD 26-04 要求聯邦民間機關優先修補（ref-59，PHP2Shell 事件的官方新進展；鉅亨網稱「緊急指令」不準，原頁是 KEV 納入與 BOD）、NVIDIA 與 Meta 擴大 Muse 合作並投資 30 億美元（ref-60）、鴻海科技日 3 款參考設計電動車（ref-61，中央社）。主編回原頁逐句核對四筆摘要與報告句。新增淘汰 5 筆（BC 至 BG）：Claude Duet（上期已淘汰且發布日在上期窗內）、PyTorch Conference 回顧（TorchTPU 上期已收）、Magento 近千站後門（iThome 轉述 Sansec）、Amadeus 帳號憑證外流（無官方或通訊社來源，範圍仍在調查）、Google Cloud 與 NASA 深空機器人（概念驗證）。
- **盤點未成條目**：TTXC 台灣文化科技大會只找到 10-13 至 10-16 的展前與開幕稿，桃園科技藝術節開幕稿找不到；是方虎尾 AI 資料中心動土（中央社 10-20）未開原頁、重要性不足；AWS 德國投資只找到 2024 年公告；日本雲端安全認證沒有 10 月的新制度公告；PwC 第三方廠商事件只有媒體與駭客組織的說法；鉅亨網的 CISA 報導改以 cisa.gov 原頁取代。
- **新來源的否定式主張**：CISA 兩頁都沒有寫聯邦修補期限，KEV 目錄與媒體的 10 月 29 日不採；NVIDIA 正文沒有部署規模與時程，二手媒體的股票發行規模與 Muse 下載量不採；中央社鴻海報導沒有自駕與量產時程，Honda L4 合作只見科技新報，不採；Genie 4 原頁沒有定價、基準與確切開放日期。總結維持原樣，未加入新來源。
- **結果**：正式來源 61 筆、淘汰 59 筆、12 分類、ref-1 至 ref-61 一致。
