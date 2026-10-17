# 研究筆記

- 任務：weekly-tech-report-025
- 報告日期：2026-10-17
- 時間範圍：2026-10-02 至 2026-10-17
- 使用工具：Claude Code（Opus 5.5）；四組研究代理平行蒐集，主編收斂、核對與撰稿，再以稽核代理逐筆對照本機原頁；Codex 執行第二輪原頁、內文與缺漏複核；Claude Code（Opus 5.5）執行第三輪逐句稽核與補搜

## 知識庫查閱

任務開始前已讀取 `docs/tech-report-research/knowledge/index.md` 與全部七份知識檔案：

- `source-priority.md`：中國來源與社群平台內容優先以高權重來源替換；本期正式來源無中國或社群平台來源，Rust 漏洞的 GitHub issue 與 Raye 的 Instagram 貼文只作佐證，正式來源分別為 iThome 與 Digital Music News
- `taiwan-media-landscape.md`：評估中央社、iThome 的定位
- `date-citation-rules.md`：引用格式 `[[{數字}. {資料來源名稱}]](#ref-{數字})`、錨點規則、`*未知時間` 用法
- `report-format.md`：四段式結構、H2/H3 階層、參考資料表格、完成前檢查
- `fetch-gotchas.md`：iThome 用 curl 帶瀏覽器 UA；openai.com 全 UA 403；fda.gov、ftc.gov 改宣告式 UA；ITmedia BUILT 以 cp932 解碼並另查原始發表日；moi.gov.tw 帶 cookie 間隔重試
- `window-overlap-dedup.md`：篩選前比對前兩期 `references.md`；系列活動上期已引用其中一場，本期不再引用同系列其他場次
- `parallel-collection.md`：四組分類拆法、候選檔格式、收斂工具、收斂時的固定檢查、撰稿後逐筆稽核（含否定式主張與文字回報），以及 AI 組盤點 AI 開發工具 Release 與窗內開發者大會

另讀取施工筆記索引 `docs/working-notes-skill/notes/index.md`，命中並開啟四份筆記（weekly-tech-report-022 平行蒐集與收斂工具、023 平行蒐集與交付、024 平行蒐集與撰稿後稽核、024 第三輪原頁複核），沿用建置腳本為五份任務檔唯一內容來源、共用簡報統一代理規則、每分類 3 至 5 筆，並把撰稿後逐筆稽核排在交付前。上期留在 scratchpad 的組裝工具已隨 session 清除，本期依筆記重寫 `assemble.py`、`mkrefs.py`、`run.sh`。

## 蒐集方式

依分類拆成四組代理平行蒐集，四組共用一份簡報（時間窗、權重、去重名單、候選檔格式、原頁核對要求、否定式主張的全頁查核與回報格式），各自完成搜尋、以 curl 取得原頁並存檔、核對日期與數字、跨期去重與淘汰判斷：

- A 組：AI 科技、軟體工程（正式建議 10、淘汰 39）。盤點 Anthropic news／research／engineering、GitHub Changelog、npm registry 與 GitHub Release（含 Claude Code 2.1.299 至 2.1.302）、iThome 第 0 至 20 頁與約 25 個官方 RSS。窗內沒有大型開發者大會：GitHub Universe 為 10 月 28 至 29 日，在窗外。
- B 組：軟硬體資訊安全、硬體或軟硬整合、網路/伺服器等基礎（正式建議 15、淘汰 27）
- C 組：金融科技、醫療科技、運輸物流（正式建議 14、淘汰 25；醫療科技補搜 14 輪）
- D 組：房地產與室內外裝潢、現場表演藝術、影視音樂、其他領域科技應用突破（正式建議 18、淘汰 37；房地產 11 輪、表演藝術 11 輪、影視音樂 12 輪補搜）

收斂以 `scripts/converge-weekly-tech-report-candidates.py` 依 `order.txt` 編號正式條目、剔除撰稿欄位、檢查摘要字數與時間窗，同網址的跨組重複自動合併，結果正式 52 筆、淘汰 125 筆，零錯誤。

## 主編複審的取捨

代理正式建議 57 筆，主編降 5 筆，讓每分類維持 3 至 5 筆：

- Apple HomeView（Apple Newsroom 10-13）：與房地產分類的 Apple Home Collection 同日同場發表，Home Collection 已涵蓋 Apple 智慧家庭布局
- Waymo 清醒駕駛基準研究（Waymo 10-08）：同站本期已收多倫多，業者自身研究
- 地政數位櫃臺測量案件（內政部 10-10）：上一期主編已以「成效統計、新功能 7 月 1 日上線」淘汰同一則新聞稿，本期維持
- 艾美獎改由 Prime 串流（中央社 10-07）：上一期已以 Television Academy 同事件淘汰（播映權合約、無技術細節），本期維持
- 2026 諾貝爾化學獎（NobelPrize.org 10-07）：上一期已收物理獎，依系列規則淘汰；生理醫學獎同理

標題調整：ref-48 代理標題寫「破獲」，但搜索在今年 1 月、窗內是移送新聞，以 `overrides.tsv` 改為「移送」；ref-50 代理標題寫「準確度翻倍」，原頁為 doubled the skill，改為「預測能力翻倍」。

各組淘汰候選中標註「建議交由其他分類」的來源已逐一檢視：Anthropic 自我複製研究與 Cyber Mission、金管會代理 AI 指引（C 組已收官方稿，iThome 版淘汰）、Maia 300 與 Next.js 的 iThome 版（已收一手來源）、Let's Encrypt 的 iThome 版、GhostAction（僅二手轉述；Actions 鎖定檔已涵蓋同一風險）、Node.js 10-21 安全更新預告（修補版在窗外）、GitHub AI Scan、Ubuntu 26.10、Cloudflare D1／Hyperdrive 工程文、諾貝爾生理醫學獎、中研院 Cell 論文、MIT 細胞語言 AI、美國防新創無人機供應鏈。各分類名額已滿且現有選材權重較高、或原頁未核對，維持淘汰。

## 跨期去重

本期窗期與 2026-10-10 期重疊九天、與 2026-10-03 期重疊兩天。篩選前已由兩期 `references.md` 建立 115 筆已引用名單，以下候選因此淘汰：

- DNS 根區 KSK 實際輪替（10-12）：上期已收 Cloudflare 的輪替說明，同一事件
- 美國司法部與 FBI 查封永信至誠駭客工具（10-12）：原頁寫明與 AA26-281A 同日公布，上期已收 AA26-281A
- Live Nation 答辯 FTC 的 BOTS Act 訴訟（10-14）：上期已收同案裁定
- Gemini 4 Argon 全面開放與 API 定價（10-13）：10-03 期已收同一模型的發表文
- Cloudflare 收購 Deno（iThome 10-12）：上期已收 Deno 官方公告
- Sony Music 下架 AI 深偽、AGCM 調查 Suno：上期已收
- TTXC 系列的工研院資策會展出、TTXC 開幕：上期已收 MUTEK×TTXC
- 智捷 AI 3D 醫療影像（10-05）：與上期衛福部元宇宙智慧醫療同一場大會
- Python 3.16.0a1、Rust 1.99.1：前兩期已收 Python 3.15.0 與 Rust 1.99.0，本期版本為預覽或修正版

同站不同事件照常採用：Anthropic（非預期行為報告、METR、Scion；上期為 Haiku 5.5）、Waymo（多倫多；上期為事故演練框架）、FDA（O.N. Diagnostics 警告信；上期為指引清單）、ARPA-H（BIOGAMI；上期為 Delphi）、MIT News（次季節預報）、Cloudflare（Yandex 分析；上期為根區 KSK）、GitHub（Actions 鎖定檔；上期為堆疊式 PR 與無狀態權杖）、金管會（諮詢文件與 AI 調查）、ITmedia BUILT（日立、奧村組、STUDIO55）、Digital Music News（Raye）、FTC（REPS；上期為 Live Nation 案的法院裁定）。

## 逐筆查核

- 正式來源 52 筆皆 curl 到 HTTP 200，原頁存於 scratchpad 的 `pages/`，日期取 JSON-LD、meta 或頁面日期列；更新註記與 dateModified 不作發布日
- 擋抓取的站點：openai.com 全 UA 403（本期無 OpenAI 一手來源）；pr.tsmc.com 與 investor.tsmc.com 回 403，台積電改以中央社為來源；intel.com 對瀏覽器 UA 回 403、curl 預設 UA 回 200；ftc.gov 對瀏覽器 UA 回 404、宣告式 UA 回 200；nhi.gov.tw 回 403；MSRC 更新指南為前端渲染，改以 iThome 為來源
- 代理已把非原頁內容隔離在備註：Next.js 的 CVSS 與受影響版本、Ledger 的受害錢包數、CERT-FR 的受害規模、微軟本月修補總數、Muse Wonder 的評測分數、Bun 記憶體的 iThome 換算，皆未寫入摘要

## 分類補搜

- 醫療科技：14 輪（iThome 列表、FDA RSS 與警告信資料表、衛福部與食藥署列表、MHRA、EMA、WHO、日文醫療 AI、Nature Medicine／NEJM、HLTH、ARPA-H、CMS、科技新報 biotech）
- 房地產與室內外裝潢：11 輪（ITmedia BUILT 10 月存檔、內政部、奧村組、住都中心、3D 列印建築、PropTech、建研所、Matter、國土管理署 BIM、中央社站內搜尋）；本期無台灣題
- 現場表演藝術：11 輪（DMN 與 MBW RSS、兩廳院、衛武營、歌劇院、台北數位藝術節、文化部列表、中央社文化與影劇列表、FTC）
- 影視音樂：12 輪（DMN、MBW、YouTube、Deezer、Spotify、Netflix、中央社影劇列表、文策院、高雄電影節、金馬影展、DistroKid）

## 中文排版校對

`check_copywriting.py` 對交付報告命中 15 項，修 2 項（同一處的 `2 mm × 2 mm` 補空格），不修 13 項：參考表的日文原標題 6 項與日文產品名「検図AI」、FDA 術語 `510(k)`、金管會原標題的半形括號 2 項（`source.md` 與參考表的原始標題維持字面）、英文作品名與期刊名的書名號 3 項沿用既有裁決。

## 撰稿後逐筆稽核（Claude Code，Opus 5.5）

建置通過後，為每筆 ref 產生稽核包（本機原頁路徑、`source.md` 條目、參考表列、報告中所有引用該 ref 的段落），派四組稽核代理各 13 筆，只讀本機原頁、以文字回報。四組合計回報約 70 項，主編回原頁確認後修正 94 處（`report.md` 正文、報告說明與參考表 74 處，`source.md` 摘要與備註 20 處；同一句同時出現在報告與摘要者兩邊都改），寫成斷言式替換腳本後重建；另有 3 筆摘要因補充後超過 500 字，以只刪不補的方式精簡 4 處：

- **反向錯誤（「原頁沒有」寫錯）**：ref-1 備註稱 anthropic.com 無 datePublished，原頁 JSON-LD 其實有（另有 10-12 更正註記，解釋了 iThome 的「週一公布」）；ref-6 備註稱「Scion 不適合一般用途」不在原頁，原頁確有此句。兩處皆只在備註，正文未沿用。
- **跨來源引用錯置**：硬體趨勢段把台積電寫成 Intel 與 Maia 共同的上游，Intel 原頁沒提台積電，改為只連 Maia 300 的 N2P。
- **語氣與時態**：金管會諮詢文件原文為「宜」，「要求」改為「建議」，趨勢段「從調查走到規範」改為「走到諮詢」並修正發布先後；YouTube 標籤為逐步推出；Raye 並非不開放預售，名單上的歌迷有收到購票代碼；Ivanti 紀錄是選擇性刪除；Volexity 為中等信心評估，趨勢改為「可能已進入」。
- **自加定性**：「全面」「最大」「最普及」「閉源」「只開放」「取代」「全天候」（Inyo 的引述）「資安」（日文セキュリティ指實體防護）等改回原頁用語。
- **歸因與範圍**：FTC 案由司法部代為提告、門檻措施出自訴狀；拿破崙密碼信拆回原頁的兩句；毅力號的軟體說明出自 Mark Maimone；Patch Tuesday 的 CVE-2026-96951 是「首先介紹」而非「首要修補」；METR 的排除類別限縮的是員工分享資訊；Windows Update 補上漏列的 Windows 10、Windows Server 2022 一組；Intel 480 GB 為 ODM 夥伴卡上限，自有品牌卡為 160 GB；CERT-FR 10 月 13 日更新只寫「新增其他受攻擊設備」。
- 已確認成立的否定式主張：Muse Wonder 官方頁無評測分數、Muse Spark Open 文章無授權條款、Next.js 原頁無 CVSS 與版本範圍、CERT-FR 無受害數量、91APP 無資料種類與筆數、Ledger 無受害錢包數、Cloudflare 36.1% 與 39.4% 不一致、YouTube 原頁無 DDEX 申報與主 App 時程。

## 第二輪查核（Codex；`audit-tech-weekly-report` skill）

- **原頁重抓與元資料**：52 筆正式來源中 50 筆用瀏覽器 UA 直接回 HTTP 200；ref-18 Intel 改用 curl 預設 UA、ref-42 FTC 改用宣告式 UA 後均為 200。ref-39 至 ref-41 以 CP932 解碼。人工複核原頁 H1／`<title>`、發布日、來源名稱與轉址結果，無需修正報告資料。
- **正文主張**：以 `source.md` 每筆的原頁關鍵詞清單重跑驗證，52 筆共 549 個日期、數字、產品名與關鍵敘述全數在重新下載的原頁命中。再對照稽核包中的摘要、參考表列、亮點、趨勢與資料限制，未發現新的狀態、歸因、數字或語意錯誤。
- **缺漏補搜**：重新搜尋 12 個必要分類，檢視 137 筆 RSS 候選。高權重結果多為已收事件的二手轉述、前期已引用事件或資安週報；其餘多為低權重投資稿。沒有比現有 52 筆選材明顯更重要或來源權重更高的缺漏，不新增。
- **修正範圍**：新聞主張、日期、網址、參考編號與來源數量不變；作者 Meta 加入 `Codex`，並補齊本輪查核紀錄。


## Humanizer-zh 人性化改寫（Codex）

- 透過 `scripts/humanize-weekly-tech-report-025.sh` 修改 canonical build script，再重建並同步交付檔。
- 共改寫 26 處，集中處理類比、金句式結尾、對稱排比、抽象隐喻與「可以看出」等機械轉場。
- 保留新聞事實、數字、日期、引用編號、參考資料與 `source.md`。
- Humanizer-zh 品質自評：直接性 9、節奏 9、信任度 9、真實性 8、精簡度 9、用詞準確性 10，合計 54/60。

## 第三輪查核（Claude Code，Opus 5.5；`audit-tech-weekly-report` skill）

- **原頁重抓與元資料**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 52 筆，50 筆直接 HTTP 200；Intel 以 curl 預設 UA、FTC 以宣告式 UA 重抓後為 200，ITmedia 三筆以 CP932 解碼。標題、發布日、媒體名稱與網址無差異；`scripts/validate-weekly-tech-report-source-terms.sh` 的 549 個原頁關鍵詞全數命中。
- **逐句稽核**：以 `scripts/build-weekly-tech-report-audit-packets.sh` 重建稽核包，四組代理各 13 筆逐句對照原頁。數字、日期與否定式主張全數成立；主編回原頁確認後修正：
  - **歸因（未支持）**：ref-45「寄發購票代碼」寫在 Raye 的說法裡，原頁這句是 DMN 作者的敘述（作者也提到可能只有一組通用碼），改為「報導指出⋯並稱購票代碼已寄給入選的歌迷」；source.md 標題「主辦改人工審核」改為「歌手團隊改人工審核」。
  - **備註舊編號**：正式區 ref-26、ref-45、ref-47 與淘汰區 BD、BE、BF、BG、BI、BJ、BW、CA、CQ、CV、DP、DQ、DR 沿用分組階段的「正式建議第 N 筆」，改為正式來源編號。
  - **措辭**：Maia 300 標題補「運算小晶片」；Ledger 趨勢句加「據 Ledger 說明」；金融趨勢標題改為「同週發布諮詢文件與調查結果」（調查晚兩天公布）；CERT-FR 摘要補「一般而言」；FinLLM 改為「最新書面業務報告」（原頁未寫送財委會）；Visa 補「符合資格的企業」；FDA 標題限縮為「一款 AI 醫療軟體」；FHIR Box 表單改為「希望由系統先填、再由人員確認」；Apple 設定改為「從輕點一下開始」；日立「可採用」國產木材、「延面積」改「總樓地板面積」；奧村組「可望」縮短檢查時間；FTC 摘要補「據訴狀」；YouTube 摘要補「逐步」；拿破崙密碼信改為「清單經營者稱」；科藝沙龍改為「國際藝文專業人士」；Volexity 的 LLM 用途改為「進行後續入侵活動」（原文 post-exploitation activity）；微軟 source 標題改回原標題的「須特別留意」，資安趨勢標題改為「可經網路直接觸及的服務與管理介面」。
- **缺漏補搜**：一組代理重搜 12 分類（大廠公告、CISA KEV、主要語言與框架版本、監管機關、台灣主流媒體）。補入 3 筆，接在表末不重排：
  - ref-53 Euronews：歐盟 AI Office 就代理越界事件向 OpenAI 與 Anthropic 發出資訊要求，與本期主線直接相關；底層的夏季事件不在前兩期 `references.md`，收的是 10 月 14 日的執法動作。
  - ref-54 中央社：中國擬將大模型、智慧體等 23 項 AI 技術列入出口管制，一手為中國商務部，依來源優先序改用中央社。
  - ref-55 Google Blog：Willow 處理器實證 magic state cultivation，附《Science》論文；其他領域分類因此到 5 筆。
  - AI 科技分類因此到 7 筆，與 024 期資安分類 8 筆的前例相同，接受。
  - 淘汰 3 筆：Motivista（許可日 7 月 30 日在窗外）、GitLab 19.4.2（與 Next.js RCE 同級）、騰訊 AI 越界（三手轉述、數字不一）。CISA KEV 窗內新增項、Linux 7.3、Node.js 26 LTS、104 人力銀行履歷外洩等也檢視過，維持不收。
- **修正後量測**：新增 3 筆摘要與受影響摘要皆在 100 至 500 字內，總結仍在 300 字內；正式來源 55、淘汰 128。

## 知識庫更新

- `docs/tech-report-research/knowledge/fetch-gotchas.md`：新增「依站別換 UA，以及轉址後的正式網址」一節（intel.com、ftc.gov、台積電官網、CERT-FR、健保署、MSRC、中央社列表 API、inside.com.tw），並補 anthropic.com/research 有 datePublished 的例外
- `docs/tech-report-research/knowledge/parallel-collection.md`：新增稽核包、備註裡的否定式主張、修正後重量摘要字數三條
- `knowledge/index.md` 兩列摘要同步
