# 任務計劃：科技服務資訊週記

## 目標
完成一份符合本 repo 規格的科技服務資訊週記，並輸出完整研究過程與交付檔案。

## 執行模式
一次完成

## 階段
- [x] 階段 1：確認日期範圍與分類
  - [x] 讀取 skill、規格、模板與知識庫
  - [x] 確認報告日期為 2026-06-05，來源時間範圍為 2026-05-22 至 2026-06-05
  - [ ] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 2：蒐集來源並整理 source.md
  - [x] 確認每筆來源日期與分類
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 3：依權重篩選正式參考資料
  - [x] 優先保留台灣主流媒體、官方公告、權威科技來源與原始資料
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 4：檢查各分類是否缺漏
  - [x] 必要分類缺資料時補搜或註明缺漏原因
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 5：撰寫總結、亮點、趨勢分析
  - [x] 依 `assets/weekly-report-template.md` 完成 `report.md`
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 6：整理參考資料表與引用
  - [x] 使用 `[[編號. 來源名稱]](#ref-編號)` 格式
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 7：完成前檢查
  - [x] 檢查分類完整性
  - [x] 檢查資訊權重
  - [x] 檢查搜尋時間範圍
  - [x] 檢查資料來源正確性
  - [x] 檢查內文引用編號與參考資料編號一致性
  - [x] 檢查錯誤修正狀態
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 8：依模板完成 report.md
  - [x] 移除模板註解與占位文字
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 9：複製交付物到 `tech/2026-06-05/`
  - [x] 複製 `report.md`、`source.md`、`task_plan.md`、`notes.md`
  - [x] 建立正式參考資料清單 `references.md`
  - [x] 執行任務檔案與完成驗證
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md

## 關鍵問題
1. 哪些分類目前資料不足，需要補搜？
2. 哪些來源雖然相關，但應因日期或可信度而排除？
3. 內文引用與參考資料編號是否完全一致？

## 已做決策
- 預設任務名稱：`weekly-tech-report`
- 報告模板來源：`assets/weekly-report-template.md`
- 報告日期：2026-06-05
- 交付資料夾：`tech/2026-06-05/`
- 作者欄位：Codex

## 遇到的錯誤
- `references/` 與 `scripts/` 不在 repo 根目錄：改用 skill 目錄 `/Users/lazyjerry/.ai-global/skills/tech-report-research/` 內的 references、assets 與 scripts。

## 狀態
**完成** - 已產出研究資料夾與 `tech/2026-06-05/` 交付物
