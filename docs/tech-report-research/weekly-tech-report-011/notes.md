# 筆記：科技服務資訊週記

--- 2026-07-11 第 1 次更新筆記 ---

## 任務摘要
- 目標：產出 2026-07-11 科技服務資訊週記，時間範圍 2026-06-26 至 2026-07-11。
- 作者欄位：Claude Code (Opus 4.8)。
- 12 個必要分類全部覆蓋，共 16 筆正式參考資料。
- 執行模式：一次完成。

## 知識庫比對
- 專案知識庫（`docs/tech-report-research/knowledge/index.md`）5 個檔案全部適用：
  - source-priority：中國來源與社群平台優先替換／刪除 → 已排除 CGTN、騰訊 CBDC、知乎等。
  - date-citation-rules：15 天窗、`*未知時間`、引用 `[[數字. 來源]](#ref-數字)`、HTML 錨點。
  - report-format：四段式、H2/H3、粗體專有名詞、表格、台灣用語、中英空格。
  - fetch-gotchas：iThome/techbang WebFetch 常 403 → 改用搜尋摘要交叉確認；趨勢型文章逐篇查核實際發布日。
  - taiwan-media-landscape：優先採用台灣主流媒體（TechNews、iThome、NOWnews、PChome 等）。

## 逐篇日期查核（關鍵：剔除窗外趨勢型舊文）
- 剔除 7-Zip CVE-2026-48095：修補 2026-04-27、YorkU 公告 05-29 → 窗外。
- 剔除 林百里量子電腦：廣達股東會 2025-06（PTT 時間戳）→ 窗外。
- 剔除 The Velvet Sundown：2025-06/07 事件 → 窗外。
- 剔除 Android XR 智慧眼鏡：techbang 2026-05-31（WebFetch 確認）→ 窗外，改用 SK 海力士上市＋SpaceX 衛星。
- 剔除 NVIDIA GTC Vera Rubin：GTC 於 3 月 → 窗外。

## 綜合發現（依分類）
- AI 科技：GPT-5.6 公開發布（Sol/Terra/Luna）＋ChatGPT Work＋GPT-Live；Claude Sonnet 5 低成本 Agent。兩強在「Agent 化」與價格上正面對決。
- 軟體工程：Z.ai ZCode 加入 AI Coding IDE 戰局，戰場由「模型能力」轉向「IDE＋Agent＋訂閱平台」。
- 資安：PChome Pi 拍錢包遭 Settra 勒索、350 萬個資外洩，數產署行政檢查；Nissan PeopleSoft 外洩。
- 硬體/軟硬整合：人形機器人進入商業化與規模部署階段；SK 海力士 290 億美元赴美上市、HBM 超級循環延續至 2027 後。
- 基礎設施：經濟部修法將 AI 資料中心納入產業效益評估，估 2030 新增用電 5 GW。
- 金融科技：穩定幣＋即時支付成主流基礎設施，產業重心轉向營運韌性與監管成熟度。
- 醫療科技：亞洲生技大會 7/15 登場，AI 貫穿新藥研發全鏈。
- 運輸物流：日本電動運具最後一哩＋Level 2 自駕貨運實證。
- 房地產：PropTech 導入生成式 AI 摘要（inHom AI 理家）；AI 帶動廠房物流投資年增 279%。
- 現場表演藝術：Wayne McGregor 沉浸式 AI 舞蹈；颱風致演唱會延期，考驗票務系統。
- 影視音樂：CAA AI 數位分身、聲音權（Harry Shearer）、虛擬製作擴張。
- 其他突破：SpaceX 發射全球第一顆核動力商用衛星。

## 待辦
- [x] source.md 完成
- [ ] report.md 撰寫
- [ ] 完成前檢查（引用一致性）
- [ ] 複製交付物到 tech/2026-07-11/
