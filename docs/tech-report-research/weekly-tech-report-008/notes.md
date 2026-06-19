# 筆記：科技服務資訊週記

--- 2026-06-20 第 1 次更新筆記 ---
## 任務摘要
建立 `2026-06-20 科技服務資訊週記`。時間範圍為 2026-06-06 至 2026-06-20，目標讀者為程式設計師。已讀取 skill 規格、報告模板與 repo 知識庫，並建立任務資料夾 `docs/tech-report-research/weekly-tech-report-008`。

## 已讀取規格
- `/Users/lazyjerry/.ai-global/skills/tech-report-research/SKILL.md`
- `/Users/lazyjerry/.ai-global/skills/tech-report-research/references/file-structure.md`
- `/Users/lazyjerry/.ai-global/skills/tech-report-research/references/rules.md`
- `/Users/lazyjerry/.ai-global/skills/tech-report-research/references/knowledge-base.md`
- `/Users/lazyjerry/.ai-global/skills/tech-report-research/references/report-spec.md`
- `/Users/lazyjerry/.ai-global/skills/tech-report-research/assets/weekly-report-template.md`
- `docs/tech-report-research/knowledge/index.md`
- `docs/tech-report-research/knowledge/source-priority.md`
- `docs/tech-report-research/knowledge/taiwan-media-landscape.md`
- `docs/tech-report-research/knowledge/date-citation-rules.md`
- `docs/tech-report-research/knowledge/report-format.md`
- `docs/tech-report-research/knowledge/fetch-gotchas.md`

## 初始決策
- 報告日期採目前工作階段的 Asia/Taipei 日期：2026-06-20。
- 來源範圍採近 15 天：2026-06-06 至 2026-06-20。
- 以台灣媒體、官方公告、權威科技媒體與研究機構為優先。
- 不覆寫既有 `tech/2026-06-13/` 與 `weekly-tech-report-007`。

--- 2026-06-20 第 2 次更新筆記 ---
## 來源整理
已整理 12 筆正式來源與 3 筆淘汰來源到 `source.md`。正式來源涵蓋所有必要分類：

- AI 科技：Google DeepMind AI Control Roadmap。
- 軟體工程：GitHub 因 AI coding 需求轉向多雲容量支援。
- 軟硬體資訊安全：Microsoft Defender zero-day。
- 硬體或軟硬整合：Nvidia AI 平台需求推動 PCIe 6.0 SSD 路線。
- 網路/伺服器等基礎：FERC 要求電網業者處理 AI data center 接電規則。
- 金融科技：Visa 將支付網路接入 ChatGPT。
- 醫療科技：Midjourney Medical 全身超音波掃描構想。
- 運輸物流：Waymo robotaxi 召回與施工區辨識問題。
- 房地產與室內外裝潢：YC real estate / construction cohort 的 AI agent 趨勢。
- 現場表演藝術：Edinburgh Festival 2026 的 AI 主題舞作。
- 影視音樂：Runway AI Festival。
- 其他領域科技應用突破：愛沙尼亞 AI bot 身分號碼規劃。

## 淘汰判斷
- TechRadar AWS AgentCore：日期落在 2025，窗外。
- Tom's Hardware Nvidia server plant：日期落在 2025，窗外。
- GENIUS Act 維基條目：非本期新聞，且已有 AP Visa 支付來源替代。

## 綜合發現
- 本期主軸是 AI agent 從工具走向可授權、可付款、可治理的執行主體。
- AI 對軟體工程與基礎設施的影響已延伸到 GitHub 容量、資料中心接電與本機 I/O 路線圖。
- 垂直產業案例集中在醫療掃描、自駕、PropTech、表演藝術與影視內容。

--- 2026-06-20 第 3 次更新筆記 ---
## 完成前檢查
- 分類完整性：12 個必要分類皆有至少 1 筆正式來源。
- 資訊權重：正式來源以 AP、Axios、The Verge、The Guardian、Business Insider、Tom's Hardware、MarketScale、Omni 為主；低權重或窗外來源已移至淘汰來源。
- 搜尋時間範圍：正式來源皆落在 2026-06-06 至 2026-06-20。
- 資料來源正確性：`source.md` 與 `report.md` 的來源網址、發布日期、分類已對齊。
- 引用一致性：以 regex 檢查 `report.md`，文中引用與參考資料表錨點皆為 1 至 12，結果一致。
- 錯誤修正狀態：未發現需修正的錯誤來源；`prompt.md` 中的 `YYYY-MM-DD` 為規格描述，不是正文 placeholder。
