# 任務請求：科技服務資訊週記

## 原始請求

```text
[$tech-report-research](/Users/lazyjerry/.ai-global/skills/tech-report-research/SKILL.md)
```

## 期望產出

- [ ] 一份本期科技服務資訊週記
- [ ] 一份候選來源整理 source.md
- [ ] 一份研究計劃與執行紀錄

**產出類型：**
- 文件：報告、來源整理、筆記、任務計劃
- 程式碼：無
- 其他：`tech/{指定日期}/` 交付資料夾

## 任務設定

- 報告日期：2026-06-13
- 時間範圍：2026-05-30 至 2026-06-13
- 標題格式：`YYYY-MM-DD 科技服務資訊週記`
- 作者欄位：Codex
- 目標讀者：程式設計師

## 必要分類

- AI 科技
- 軟體工程
- 軟硬體資訊安全
- 硬體或軟硬整合
- 網路/伺服器等基礎
- 金融科技
- 醫療科技
- 運輸物流
- 房地產與室內外裝潢
- 現場表演藝術
- 影視音樂
- 其他領域科技應用突破

## 參考文件

| 檔案路徑 | 引用範圍描述 |
|----------|--------------|
| `SKILL.md` | 完整工作流與交付要求 |
| `references/report-spec.md` | 完整規格 |
| `references/file-structure.md` | 任務資料夾與必要檔案 |
| `references/rules.md` | 執行規則與反模式 |
| `references/knowledge-base.md` | 知識庫使用規範 |
| `assets/weekly-report-template.md` | 報告模板 |
| `docs/tech-report-research/knowledge/index.md` | 專案客製化知識索引 |
| `docs/tech-report-research/knowledge/source-priority.md` | 來源優先順序 |
| `docs/tech-report-research/knowledge/taiwan-media-landscape.md` | 台灣媒體參考座標 |
| `docs/tech-report-research/knowledge/date-citation-rules.md` | 日期與引用規則 |
| `docs/tech-report-research/knowledge/report-format.md` | 報告格式與完成檢查 |
| `docs/tech-report-research/knowledge/fetch-gotchas.md` | 來源抓取踩坑 |

## 報告內容要求

- 固定四大段落：總結、亮點、趨勢分析、參考資料。
- 總結 100 至 300 字，依正式來源統整並標註來源編號。
- 亮點依分類條列，每個條列先寫一句話結論，再補 100 至 300 字說明，並標註來源編號。
- 趨勢分析依分類整理可能趨勢或更深層觀察，並標註來源編號。
- 參考資料表至少包含來源編號、文章標題、Google 搜尋快速連結、一句話繁體中文結論或亮點、文章發布日期、來源網址與來源網站名稱、分類。
- 文中引用格式使用 `[[{數字}. {資料來源名稱}]](#ref-{數字})`，並與參考資料表的 `ref-{數字}` 錨點一致。

## 來源與權重規則

- 僅使用 2026-05-30 至 2026-06-13 內發布，且日期可確認的來源。
- 以台灣主流媒體、官方公告、權威科技媒體與研究機構為優先。
- 中國來源與社群來源不優先採用；若無高權重來源可交叉確認，排除並記錄原因。
- 若分類資料不足，需補搜；仍不足時，在來源整理與報告中明確註記。
- 所有候選來源先記錄於 `source.md`，再決定是否納入正式參考資料。

## source.md 蒐集格式要求

每筆候選來源至少包含：

- 來源網址
- 繁體中文標題
- 100 至 500 字繁體中文摘要
- 權重分數（`1-10/10`）
- 發布日期
- 分類
- 是否納入正式參考資料
- 淘汰原因或補充說明

## 完成前檢查

- 各必要分類是否都有資料，或已明確註記缺漏原因。
- 資訊權重是否足夠，低權重來源是否已替換或排除。
- 搜尋時間範圍是否正確，是否全部落在 2026-05-30 至 2026-06-13。
- 資料來源是否正確，包含網址、來源網站名稱、發布日期與引用對應。
- 內文引用編號是否與參考資料表編號一致。
- 錯誤來源或整理內容是否已修正。
- `report.md`、`source.md`、`task_plan.md`、`notes.md` 已複製到 `tech/2026-06-13/`，且 `notes.md` 另存為 `note.md`。
