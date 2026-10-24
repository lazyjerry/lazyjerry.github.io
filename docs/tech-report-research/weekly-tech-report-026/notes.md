# 研究筆記

- 任務：weekly-tech-report-026
- 報告日期：2026-10-24
- 時間範圍：2026-10-10 至 2026-10-24
- 使用工具：Claude Code（Opus 5.5）擔任主編，負責收斂、補查、撰稿與裁決；四組 `tech-collector` 代理（sonnet）平行蒐集；四組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核；Codex 執行第二輪原頁、內文與缺漏複核；Claude Code（Fable 5.1）執行第三輪重抓、稽核派工與補搜裁決

## 知識庫查閱

任務開始前已讀取 `docs/tech-report-research/knowledge/index.md` 與全部七份知識檔案：

- `source-priority.md`：中國來源與社群平台內容優先以高權重來源替換；本期正式來源無中國或社群平台來源
- `taiwan-media-landscape.md`：評估中央社、iThome 的定位
- `date-citation-rules.md`：引用格式 `[[{數字}. {資料來源名稱}]](#ref-{數字})`、錨點規則、`*未知時間` 用法
- `report-format.md`：四段式結構、H2/H3 階層、參考資料表格、完成前檢查
- `fetch-gotchas.md`：iThome 用 curl 帶瀏覽器 UA；openai.com 全 UA 403；sec.gov 用宣告式 UA；ITmedia BUILT 以 cp932 解碼並另查企業原始發表日；中央社列表 API；anthropic.com/research 有 datePublished
- `window-overlap-dedup.md`：篩選前比對前兩期 `references.md`；系列活動上期已引用其中一場，本期不再引用同系列其他場次
- `parallel-collection.md`：四組分類拆法、候選檔格式、收斂工具、收斂時的固定檢查、撰稿後逐筆稽核與稽核包，以及 AI 組盤點 AI 開發工具 Release 與窗內開發者大會

另讀取施工筆記索引 `docs/working-notes-skill/notes/index.md`，命中並開啟三份筆記（weekly-tech-report-025 平行蒐集與稽核包、週記流程 agent 化、週記中文排版校對改建置腳本），沿用建置腳本為五份任務檔唯一內容來源、共用簡報統一代理規則、每分類 3 至 5 筆、撰稿後先產生稽核包再派稽核代理。上期 scratchpad 的組裝工具已隨 session 清除，本期重寫 `assemble.py`（片段組成建置腳本）與 `patch.py`（斷言式替換）。

## 蒐集方式

依分類拆成四組 `tech-collector` 代理平行蒐集，四組共用一份簡報（時間窗、權重、去重名單、候選檔格式、原頁核對要求、否定式主張的全頁查核與回報格式），各自完成搜尋、以 curl 取得原頁並存檔、核對日期與數字、跨期去重與淘汰判斷：

- A 組：AI 科技、軟體工程（正式建議 10、淘汰 15）。盤點 Anthropic news／research／engineering、Mistral、Meta、Hugging Face、GitHub Changelog、主要語言與框架版本，以及 Claude Code v2.1.301 至 v2.1.310、Codex rust-v0.164.0、Cursor 變更紀錄（單版發行，未收）。窗內沒有可確認的大型開發者大會：GitHub Universe 為 10 月 28 至 29 日，在窗外。
- B 組：軟硬體資訊安全、硬體或軟硬整合、網路/伺服器等基礎（正式建議 14、淘汰 10）
- C 組：金融科技、醫療科技、運輸物流（正式建議 15、淘汰 21；醫療科技補搜 9 輪）
- D 組：房地產與室內外裝潢、現場表演藝術、影視音樂、其他領域科技應用突破（正式建議 19、淘汰 13；房地產約 9 輪、表演藝術約 8 輪、影視音樂約 9 輪補搜）

收斂以 `scripts/converge-weekly-tech-report-candidates.py` 依 `order.txt` 編號正式條目、剔除撰稿欄位、檢查摘要字數與時間窗，同網址的跨組重複自動合併，結果正式 55 筆、淘汰 62 筆，零錯誤。

## 主編複審的取捨

代理正式建議 58 筆，主編降 4 筆、補 1 筆：

- Gemini 4 Argon 推向付費方案（iThome 10-14）：上一期已以「2026-10-03 期已收同一模型的發表文」淘汰同一事件，本期維持
- Live Nation 答辯 FTC 的 BOTS Act 訴訟（DMN 10-14）：上一期已以「2026-10-10 期已收同案裁定」淘汰，本期維持
- TTXC 工研院與資策會展出（中央社 10-13）：上一期已以 MUTEK×TTXC 為代表淘汰 TTXC 系列，本期維持
- Google Cloud A5X 採用 Vera Rubin（NVIDIA Blog 10-21）：與 GTC Berlin 主題演講同日同系列，且正式供應為下個月，以主題演講為代表
- 補入 Google Cloud 倫敦區域斷電（ref-22）：C 組把 iThome 報導列為「建議交由他組」，主編找到 Google Cloud 狀態頁的事故紀錄與 10 月 22 日的初步事故報告，改以一手來源收入。iThome 寫的 07:08 至 15:00、7 小時 52 分，約對應告警（07:08）到結案公告（15:03）的區間，初步報告的事故期間為 07:00 至 13:10、6 小時 10 分，以狀態頁為準。

網址調整：nginx 條目代理存的是 nginx.org 首頁（滾動新聞），主編改用內容相同、網址固定的年度歸檔頁 `nginx.org/2026.html`，並以 `overrides.tsv` 改寫 URL 與原始標題。

各組淘汰候選中標註「建議交由他組」的來源已逐一檢視：PHP2Shell 的 iThome 系列與 Check Point 統計（已收 PHP.net 與數發部）、eMudhra 波及 Python 的 iThome 版（已收 Python Insider 一手頁）、Node.js 十月安全版（只看列表未核內文）、LiteLLM 發布流程遭濫用（資安名額已滿）、AWS Continuum、韓國藥品監管網站外洩、Stripe 與 Anthropic 的 Claude Duet 合作、中研院細胞鐵死亡研究。各分類名額已滿且現有選材權重較高、或原頁未核對，維持淘汰。

## 跨期去重

本期窗期與 2026-10-17 期重疊八天、與 2026-10-10 期重疊一天。篩選前已由兩期 `references.md` 建立已引用名單，除上節三筆維持淘汰外，以下候選因此淘汰：

- Waymo 多倫多（10-16）：上期 ref-34
- 台積電 High-NA EUV 時程（科技新報 10-15）：上期已收的 10-15 法說會後續細節
- AMD Helion（OCP 2026）：上期已收 Intel 的 OCP 公告，依系列規則淘汰
- Apple HomeView、地政數位櫃臺：前期已淘汰的同一則，本期維持

同站不同事件照常採用：Anthropic（AISI 事件檢視、Agent Skills 捐贈；上期為非預期行為、METR、Scion）、Waymo（馬德里；上期為多倫多）、FDA（處方藥配套 App 指引；上期為警告信）、ARPA-H（阿茲海默症計畫；上期為 BIOGAMI）、MIT News（晶體材料模型；上期為次季節預報）、Cloudflare（eMudhra、Origin Range Requests；上期為 Yandex 分析）、GitHub（package firewall；上期為 Actions 鎖定檔）、金管會（Travel Rule；上期為代理 AI 諮詢文件與 AI 調查）、ITmedia BUILT（大成建設、大林組）、Digital Music News（Tickitto、Sony、Reservoir、Tyger）。上期事件的後續新進展可收：iPhone Duo 上期淘汰的是 Apple 預購通知，本期是 10 月 23 日開賣與評測反應。

## 逐筆查核

- 正式來源 55 筆皆 curl 到 HTTP 200，原頁存於 scratchpad 的 `pages/`，日期取 JSON-LD、meta 或頁面日期列；更新註記與 dateModified 不作發布日
- 擋抓取的站點：openai.com、xAI 官網回 403，OpenAI 相關事件改以 iThome 為來源；sec.gov 改用宣告式 UA；健保署兩種 UA 都 403；NIH 官網回 403；iThome 依文章編號掃描時遇 429 限流
- 代理已把非原頁內容隔離在備註：nginx 的 CVSS 與最早受影響版本、ConnectWise 的受影響租戶數、Gemini 4 Argon 的發表日、Bolt 與 Lucid 9 月的外電、Digital Music News 對 Spotify AI 混音夥伴的補充，皆未寫入摘要
- 日期特例：Linux Kernel Newbies 無發布日期，取 kernel.org mainline 7.3 釋出日 2026-10-18；Cloudflare 兩篇的 datePublished 在 UTC 與台灣時間跨日，取 UTC 日期；ITmedia BUILT 兩則另確認企業原始發表日在窗內

## 分類補搜

- 醫療科技：9 輪（FDA 新聞列表、ARPA-H、MHRA、EMA、食藥署、Nature Medicine、iThome 編號掃描、STAT 與 MedTech Dive、中央社健康列表）
- 房地產與室內外裝潢：約 9 輪（ITmedia BUILT 首頁約 25 篇、Matter 與 CSA RSS、內政部與國土署、建研所、PropTech、3D 列印建築、中央社站內搜尋）；智慧家居無窗內可收的正式來源
- 現場表演藝術：約 8 輪（兩廳院、衛武營、國表藝、DMN RSS、中央社文化列表與站內搜尋、文化部列表）
- 影視音樂：約 9 輪（DMN、MBW、Spotify 新聞室、YouTube blog、中央社影視列表、串流與影展站內搜尋）

## 撰稿後逐筆稽核

以 `scripts/build-weekly-tech-report-audit-packets.sh` 產生 ref-01 至 ref-55 的稽核包，分四組派 `tech-auditor` 代理（ref-1 至 14、15 至 28、29 至 42、43 至 55）對照本機原頁副本，逐句檢查參考資料表、`source.md` 摘要與報告引用句；代理只讀不改，以文字回報。四組共回報約 65 處，主編逐一回原頁核對後全數採納，以斷言式替換套用到片段後重建：

- 狀態與時態：Agent Skills 的提案流程只是路線圖提議（ref-8）；PHP「應用程式碼執行前即可觸發」限於 mod_php 的實證（ref-12）；eIPP 是原頁回顧的既有計畫，不是本次進展（ref-36）
- 自加定性：刪除「照例」「最常見的入口」「核心條件」等原頁沒有的判斷（ref-34、ref-6、ref-35）；台積電「未證實」改回原文的「未回應置評」（ref-16）
- 歸屬：Zeabur 的 GCP 金鑰路徑為 Zeabur 研判（ref-10）；iPhone Duo 沒有臉部辨識是個別評論人的說法（ref-18）；預製貨櫃的部署時程是 NVIDIA 的說法（ref-15）
- 語意精準：GPT-6.1 Sol 的版本號（ref-4）；MHRA 的 45 天是新增的較高價位快速選項（ref-29）；國衛院的機器學習只用在腎病變研究（ref-33）；128 MiB 是 R2 以 64 MiB 範圍設定時的例子，不是上限（ref-23）；Stripe 的對象是新創（ref-27）
- 遺漏與數字：Google Cloud 初步事故報告另列控制層跨可用區的同步驗證相依為主因，內文列 40 項服務、事故頁首列 38 項產品（ref-22）；nginx 五項漏洞中綁特定組態的是四項（ref-19）
- 錯字：「接獲時商」改為「接獲比利時商」（ref-40）

## 第二輪查核（Codex；`audit-tech-weekly-report` skill）

- **原頁與元資料**：依參考表重抓 ref-1 至 ref-55，54 筆以 curl 取得 HTTP 200。ref-28 SEC 對本輪 curl 回 403，改以瀏覽器擷取官方頁，H1、2026-10-23 日期與 34,000 家受檢單位、營運韌性、資安、super intelligence、美國公債清算與 tokenization 重點均吻合。ITmedia BUILT 兩筆為 Shift_JIS 顯示雜訊；其餘 H1／headline、來源名稱與可取得的發布日未見新差異。
- **逐筆內文複核**：對照現行原頁、`source.md` 摘要、參考表與報告中的引用段落。正文數字、狀態、歸因與供應商自評的限制均已在第一輪收旂；本輪未發現需改的新聞主張。唯一內容矛盾是 ref-16 備註仍寫「工研院稀土廠未採用」，但它已為 ref-55，已更正。
- **12 類缺漏補搜**：重新掃描 AI、軟體工程、資安、硬體、基礎設施、金融、醫療、運輸、房地產、表演藝術、影視音樂與其他應用。金管會 10 月 13 日代理 AI 諮詢文件已在上一期 ref-25，依跨期去重不重收；是方虎尾 AI 資料中心與 AWS 產能報導有資訊價值，但來源權重或重要性未明顯高於本期已收的五筆基礎設施來源，不為湊數新增。
- **工具收旂**：`build-weekly-tech-report-audit-packets.sh` 改為只擷取參考資料章節前的正文，並在 `## 淘汰來源` 前停止 source 條目擷取，避免每包重複報告說明與 ref-55 夾入淘汰區標題。
- **結果**：正式來源 55 筆、淘汰 62 筆、ref-1 至 ref-55 與 12 分類不變。

## Humanizer-zh 人性化改寫

- 透過 `scripts/humanize-weekly-tech-report-026.sh` 修改 canonical build script，再重建並同步交付檔。
- 共改寫 23 處，集中處理亮點結尾與趨勢判讀中的金句、否定式排比、三段排比、類比與「值得追蹤」等套話；「軟體棧」改為具體敘述。
- 保留新聞事實、數字、日期、引用編號、參考資料與 `source.md`。

## 第三輪查核（`audit-tech-weekly-report` skill；Claude Code Fable 5.1）

- **原頁與元資料**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 ref-1 至 ref-55，54 筆 HTTP 200，SEC（ref-28）改宣告式 UA 後 200；Google Cloud 事故頁改抓 `incidents.json`，ITmedia BUILT 兩筆以 cp932 解碼。標題、媒體名稱與網址 55 筆全部相符；41 筆日期 meta 吻合，其餘 14 筆由頁面日期列、iThome `created`、kernel.org 釋出日（Linux 7.3 為 2026-10-18）確認，無差異。
- **四組逐筆稽核**：稽核包加本機原頁副本，四組 `tech-auditor` 回報約 40 處，主編逐條回原頁 grep 後全數採納，合計 50 處替換。類型：歸因（ref-13 數發部未收到通報為記者敘述、ref-35 數千小時測試飛行為運輸部長的話、ref-37 測試初期避開複雜路況為業者說法、ref-47 兩段式同意是 Believe 而非 Spotify、ref-53 抵達火星時程為專案科學家所述、ref-43 作品主體是駐館藝術家）；語意精度（ref-11 may 不是「常」、ref-23 128 MiB 是資料中心間傳輸、ref-15 節能數字屬 DSX AI Factory 平臺、ref-22 控制層同步相依是未斷電可用區受影響的主因、ref-29 higher value 不是「較高價位」、ref-36 CTOL 不是「固定翼」、ref-49 all but admitted、ref-26 can satisfy、ref-28 may adjust、ref-41 申請補助經費、ref-5 行為變更有兩項、ref-25 必要資訊）；報告自加定性（ref-6 冷卻期結尾、ref-34 概括到所有新城市、ref-50 不經開發者嵌入、ref-51 推到其他領域、ref-46 偵測器、ref-40 使用紀錄、趨勢段「變成產品的預設」、ref-22 多可用區擋得住）；狀態（ref-8 路線圖為提議、ref-2 越界程度略輕、ref-32 本週宣布、ref-38 宣布日）；備註（ref-7 日期出處為 `<time>`、ref-47 頁尾另列 Kobalt 與 UMG）；格式（ref-32 中英空格、ref-4 與 ref-18 標題、ref-55 的「約」）。
- **補搜與新增**：一組 `tech-collector` 掃 12 類共約 48 輪，提出 6 筆；收 4 筆明顯高於現有選材的一手來源：NIST／NSA／CISA 十項事件應變作法（ref-56，AI 科技）、TorchTPU（ref-57，硬體或軟硬整合）、OCC GENIUS Act 最終規則（ref-58，金融科技）、INTerpath-001 第三期結果（ref-59，醫療科技）。Nature 的 prime editing 報導因公司公告日 10-05 在窗外不收；TechCrunch 的 OpenAI 訓練不連網為二手且與 ref-56 重疊，不收。淘汰條目 S 的「窗內無開發者大會」更正為 PyTorch Conference 在窗內。
- **工具修正**：稽核包腳本第二輪把 `references` 錨點後全部截掉，連資料限制段也漏了，四組代理都要自己回報告補讀；改為正文加 `limitations` 至 `disclaimer` 段。C 組備註的 grep 核對清單用全形逗號分隔，`validate-weekly-tech-report-source-terms.sh` 會整串當一個詞，統一改為「、」。
- **結果**：正式 59、淘汰 62、12 分類、ref-1 至 ref-59 一致；修正入口 `scripts/apply-weekly-tech-report-026-third-audit.sh`。
