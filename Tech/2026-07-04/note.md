# 筆記：2026-07-04 科技服務資訊週記

--- 2026-07-04 第 1 次更新筆記 ---

## 任務摘要

- 報告日期：2026-07-04。
- 搜尋時間範圍：2026-06-20 至 2026-07-04。
- 目標讀者：程式設計師與科技服務讀者。
- 任務資料夾：`docs/tech-report-research/weekly-tech-report-010`。
- 研究規格：依 `references/report-spec.md`、`assets/weekly-report-template.md` 與 `docs/tech-report-research/knowledge/` 執行。

## 蒐集與查核紀錄

- 已先讀取 `docs/tech-report-research/knowledge/index.md`，套用 `source-priority.md`、`date-citation-rules.md`、`report-format.md`、`fetch-gotchas.md` 與 `taiwan-media-landscape.md`。
- 初次蒐集涵蓋 2026-06-27 至 2026-07-04 的 AI、軟體工程、資安、資料中心、金融科技、醫療科技、運輸物流、PropTech、現場表演、影視音樂與 AI agent 身分治理候選。
- 使用者補充要求：2026-06-20 至 2026-06-27 的來源除了沿用以外，需在蒐集完成後再確認是否有新資料。
- 已執行 2026-06-20 至 2026-06-27 的二次補搜，新增或替換候選包含 Gartner AI coding 成本預測、OpenAI agents 工作型態研究、OpenAI/Broadcom Jalapeno 推論晶片、Bank of England stablecoin 草案、Cadence/Anthropic 醫療 AI、Neolix 自主配送、Higharc homebuilding AI、WVXU BorderLight AI 表演藝術、Biometric Update AI agent 身分治理等。
- 查核修正：上一期的 2026-06-18、2026-06-19 來源已超出本期 15 天窗，正式報告不沿用；僅保留於 `source.md` 淘汰區作為排除紀錄。
- 追加查核：再次檢查 `source.md` 後，新增 Anthropic Sonnet 5、Anthropic Claude Science、The Hacker News MCP tool description poisoning、Reuters UK stablecoin final rulebook。新增理由是官方或權威媒體來源、發布日期符合時間窗，且能補強 AI/軟體工程、醫療科技、agent 資安與金融科技。

## 綜合發現

### AI 科技

- OpenAI 的 Codex 使用資料顯示，agentic AI 正從工程部門擴散到法務、財務、招募與營運等非工程工作，任務也從短問答走向長時程、多步驟委派。
- Anthropic Mythos 受限釋出與 OpenAI agents 工作型態研究共同顯示，模型能力已和部署治理、權限管理、資料主權與組織流程設計綁在一起。
- Anthropic Sonnet 5 追加補強 agentic coding 與模型成本效能主題，讓 AI 科技分類不只討論 agent 採用，也涵蓋可實際部署的模型供應與安全評估。

### 軟體工程

- Gartner 於 2026-06-24 的 AI coding 成本預測指出，token 消耗可能使 AI coding 成本在 2028 年超過平均開發者薪資，代表開發平台必須開始管理 agent 使用量、工作拆分與成本可觀測性。
- Anthropic Sonnet 5 公告將 Claude Code、effort level、API 價格與 agentic coding 能力放在一起，補強「成本可觀測性」不只是帳單問題，也牽涉模型選型與驗證品質。

### 軟硬體資訊安全

- Cordyceps 讓 300 多個 GitHub repository 暴露於 CI/CD 供應鏈攻擊，Bad Epoll 則顯示 Linux kernel 與 Android 仍會因底層 race condition 暴露高風險權限提升。
- OpenAI Daybreak 與其他企業資安 AI 來源顯示，AI 正被嵌入漏洞發現、修補排序與企業安全工作流，但高權限自動化也增加稽核需求。
- The Hacker News 的 MCP tool description poisoning 報導可直接補強 agent 供應鏈安全：工具描述需當作 system prompt 與供應鏈資產審查，agent 也要有身分、行為監控與最小代理能力。

### 硬體或軟硬整合

- OpenAI/Broadcom Jalapeno 推論晶片是本期硬體主軸，顯示模型公司正走向晶片、網路、機架與 serving 系統的全端最佳化。

### 網路/伺服器等基礎

- AI data center 議題從 GPU 採購擴大到水資源、電力、土地開發、主權運算與跨國投資。Microsoft 水資源文章、Reuters Ukraine/Italy data center 報導可共同支撐此分類。

### 金融科技

- Reuters 的金融監理 AI 報導與 Bank of England stablecoin 草案顯示，金融科技正把 AI 與 stablecoin 風險帶進監理科技與支付基礎設施設計。
- Reuters UK stablecoin final rulebook 追加補強 stablecoin 從草案進入更具體資本與合規要求。

### 醫療科技

- Anthropic 進入 AI drug discovery 及 Cadence 慢性病照護 AI agent 募資，顯示醫療科技的 AI 主軸從診斷展示轉向藥物研發與遠距慢病流程自動化。
- Anthropic Claude Science 官方公告可直接支撐生命科學 AI 工作台趨勢，重點在可稽核 artifacts、可重現研究流程、HPC/SSH 與敏感資料留在既有基礎設施。

### 運輸物流

- Neolix 以 L4 自主配送車切入歐洲零售場景，重點從自駕乘客體驗轉向物流單位經濟、資料治理與跨市場部署。

### 房地產與室內外裝潢

- Higharc 與 MarketScale 的 construction tech 報導補足本期 PropTech：AI 正進入 homebuilding 設計、營建品管、設備連線與保險誘因。

### 現場表演藝術

- WVXU 的 BorderLight Theatre Festival 報導顯示 AI 已成現場劇場節目與策展題材，正式取代上一期窗外的 Edinburgh Festival 來源。

### 影視音樂

- Music Ally 的 Eros Music Worlds 與 Udio/Sony lawsuit 報導顯示，AI 音樂已進入角色 IP、虛擬歌手、授權素材與訴訟邊界。

### 其他領域科技應用突破

- Biometric Update 指出 AI agents 使雲端環境中非人類身分與權限事件規模暴增，傳統定期審查需要改為連續治理。

## 06-20 至 06-27 二次確認結論

- 已完成二次補搜，不只沿用上一期來源。
- 正式新增：OpenAI agents、Gartner AI coding costs、OpenAI/Broadcom Jalapeno、Bank of England stablecoin、Neolix、Biometric Update 等 06-20 至 06-27 來源。
- 正式排除：2026-06-18、2026-06-19 的 AI/自駕/表演/影展來源，因超出本期時間範圍。
- 部分來源由 Google News RSS 確認日期與媒體，原站直接抓取遇到 401、403 或 404 時，已在 `source.md` 備註。

--- 2026-07-04 來源查核（audit-tech-weekly-report）---

## 逐筆查核結果

- 23 筆正式來源全部以 WebSearch／WebFetch 對照原站標題、發布日期與媒體，皆屬實且日期落在 2026-06-20 至 2026-07-04：
  - 直接核對通過：ref-5 Bad Epoll（CVE-2026-46242）、ref-6 OpenAI/Broadcom Jalapeno（06-24）、ref-20 Claude Sonnet 5（06-30）、ref-16 WVXU BorderLight（06-30 發佈頁 200，AI 作品為 Amir Yatziv「Peter Is Back」）。
  - 交叉查核通過：ref-1 OpenAI agents、ref-2 Anthropic Mythos（原文為 Mythos 5，屬暫停後部分解禁）、ref-3 Gartner（標題與 06-24 日期完全相符）、ref-4 Cordyceps（Novee Security，300+ repo）、ref-7 Kyivstar/VEON 主權 AI 資料中心 MoU、ref-8 Kuok €5.3B 米蘭資料中心、ref-10 FINMA/IOSCO Amstad hackathon、ref-11 BoE 系統性 stablecoin 政策草案、ref-12 CNBC Anthropic 藥物發現（06-30）、ref-13 Neolix（21,000 車、15+ 國、1.7 億公里）、ref-14 Higharc $95M C 輪、ref-17 Eros Music Worlds、ref-18 Sony/Udio（駁回加入 30,442 錄音、維持 333 件）、ref-19 Biometric Update、ref-21 Claude Science、ref-22 MCP tool poisoning、ref-23 FCA final crypto rulebook（stablecoin 資本 2%→1%）。

## 修正項目

- 總結第三句引用不符：原句列舉「醫療、物流、房地產、表演藝術與音樂產業」，卻引用 [[23]]（英國 stablecoin，屬金融科技），且未引用已點名的房地產與表演藝術來源。已改為 [[13]][[14]][[16]][[17]][[19]][[21]]，移除不相符的 [[23]]，補上 [[14]] 房地產與 [[16]] 表演藝術。report.md 與 tech/2026-07-04 交付副本同步修正。

## 敘述收斂（依使用者指示）

- ref-1 亮點「1 小時甚至 8 小時」→「甚至數小時」，貼合原文「minutes or hours」。
- ref-7 亮點「國防、企業與文化資料」→「國防、公共行政與研發資料」，貼合 live 來源（defence、public administration、financial services、R&D）。
- report.md 與 tech/2026-07-04 交付副本同步。

## 完成前檢查結果

- 分類完整性：12 個必要分類皆已填入正式來源或補強來源。
- 資訊權重：正式來源以 OpenAI、Anthropic、Reuters、Microsoft、The Hacker News、Music Ally、Automotive World 等官方或專業媒體為主；以 Google News RSS 確認的來源已降權並備註。
- 搜尋時間範圍：正式來源皆落在 2026-06-20 至 2026-07-04；上一期窗外來源已列入淘汰區。
- 引用一致性：`report.md` 內 `#ref-1` 至 `#ref-23` 與參考資料錨點一致。
- 錯誤修正狀態：已修正沿用 2026-06-18、2026-06-19 窗外來源的問題，改用 06-20 之後來源。