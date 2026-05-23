# 任務計劃：科技服務資訊週記

## 目標

完成一份符合本 repo 規格的 `2026-05-23 科技服務資訊週記`，整理 2026-05-09 至 2026-05-23 的科技服務資訊，並輸出完整研究過程與交付檔案。

## 執行模式

一次完成

## 階段

- [x] 階段 1：確認報告日期、15 天時間範圍與必要分類
  - [x] 讀取 skill 規格、report spec、模板與知識庫
  - [x] 確認報告日期為 2026-05-23
  - [x] 確認來源時間範圍為 2026-05-09 至 2026-05-23
  - [x] 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 2：蒐集候選來源並整理 source.md
  - [x] 確認每筆來源日期與分類
  - [x] 每筆候選來源補上摘要、權重與是否納入正式參考資料
  - [x] 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 3：依權重篩選正式參考資料
  - [x] 排除日期不符、權重不足或可信度不足的來源
  - [x] 檢查各必要分類是否缺漏
  - [x] 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 4：撰寫總結、亮點與趨勢分析
  - [x] 依模板完成 report.md
  - [x] 所有內容標註來源編號
  - [x] 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 5：整理參考資料表與引用
  - [x] 參考資料表包含來源編號、文章標題、Google 搜尋連結、一句話結論、發布日期、來源網址與名稱、分類
  - [x] 內文引用格式使用 `[[{數字}. {資料來源名稱}]](#ref-{數字})`
  - [x] 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 6：完成前檢查
  - [x] 檢查分類完整性
  - [x] 檢查資訊權重
  - [x] 檢查搜尋時間範圍
  - [x] 檢查來源網址、來源網站名稱、發布日期與引用對應
  - [x] 檢查內文引用編號與參考資料編號一致性
  - [x] 檢查錯誤來源或整理內容是否已修正
  - [x] 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 7：複製交付物到 `tech/2026-05-23/`
  - [x] `report.md` 複製為 `tech/2026-05-23/2026-05-23 科技服務資訊週記.md`
  - [x] `source.md` 複製到 `tech/2026-05-23/source.md`
  - [x] `task_plan.md` 複製到 `tech/2026-05-23/task_plan.md`
  - [x] `notes.md` 另存為 `tech/2026-05-23/note.md`
  - [x] 正式參考資料清單另存為 `tech/2026-05-23/references.md`
  - [x] 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 8：驗證任務資料夾與交付資料夾
  - [x] 執行 `validate-task-files.sh`
  - [x] 執行 `validate-task-completion.sh`
  - [x] 階段檢核：更新 notes.md → task_plan.md

## 關鍵問題

1. 哪些分類目前資料不足，需要補搜？
   - 已補齊 12 個必要分類。
2. 哪些來源雖然相關，但應因日期或可信度而排除？
   - 已排除社群來源、日期早於 2026-05-09 的來源與日期無法確認來源。
3. 內文引用與參考資料編號是否完全一致？
   - 已檢查 report.md 內文引用與參考資料表錨點。

## 已做決策

- 預設任務名稱：`weekly-tech-report`
- 本次任務資料夾：`docs/tech-report-research/weekly-tech-report-003`
- 報告模板來源：`assets/weekly-report-template.md`
- 報告日期：2026-05-23
- 交付資料夾：`tech/2026-05-23`
- 作者欄位：Codex
- 來源時間範圍：2026-05-09 至 2026-05-23
- 正式參考資料：18 筆

## 遇到的錯誤

- [已解決] workspace 根目錄沒有 `references/*.md`；改依 skill 目錄 `/Users/lazyjerry/.ai-global/skills/tech-report-research/` 讀取 workflow 文件。

## 狀態

**已完成** - 任務資料夾與交付資料夾驗證完成
