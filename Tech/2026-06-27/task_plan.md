# 任務計劃：科技服務資訊週記

## 目標
完成一份符合本 repo 規格的科技服務資訊週記，並輸出完整研究過程與交付檔案。

## 執行模式
一次完成

## 階段
- [x] 階段 1：確認日期範圍與分類
  - [x] 報告日期：2026-06-27
  - [x] 搜尋範圍：2026-06-13 至 2026-06-27
  - [x] 讀取 skill 規格、模板與知識庫
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 2：蒐集來源並整理 `source.md`
  - [x] 確認每筆來源日期與分類
  - [x] 淘汰日期不符、來源權重不足或無法確認日期的候選來源
  - [x] ✅ 階段檢核：更新 notes.md → source.md → task_plan.md
- [x] 階段 3：依權重篩選正式參考資料
  - [x] 優先使用台灣主流媒體、官方公告、權威科技媒體與研究機構
  - [x] 補搜資料不足分類
  - [x] ✅ 階段檢核：更新 notes.md → source.md → task_plan.md
- [x] 階段 4：檢查各分類是否缺漏
  - [x] AI 科技
  - [x] 軟體工程
  - [x] 軟硬體資訊安全
  - [x] 硬體或軟硬整合
  - [x] 網路/伺服器等基礎
  - [x] 金融科技
  - [x] 醫療科技
  - [x] 運輸物流
  - [x] 房地產與室內外裝潢
  - [x] 現場表演藝術
  - [x] 影視音樂
  - [x] 其他領域科技應用突破
  - [x] ✅ 階段檢核：更新 notes.md → source.md → task_plan.md
- [x] 階段 5：撰寫總結、亮點、趨勢分析
  - [x] 依 `assets/weekly-report-template.md` 保留錨點與段落順序
  - [x] 所有內容標註來源編號
  - [x] ✅ 階段檢核：更新 notes.md → report.md → task_plan.md
- [x] 階段 6：整理參考資料表與引用
  - [x] 文中引用格式：`[[{數字}. {資料來源名稱}]](#ref-{數字})`
  - [x] 參考資料表包含 `ref-{數字}` 錨點
  - [x] ✅ 階段檢核：更新 notes.md → report.md → task_plan.md
- [x] 階段 7：完成前檢查
  - [x] 分類完整性
  - [x] 資訊權重
  - [x] 搜尋時間範圍
  - [x] 資料來源正確性
  - [x] 內文引用編號與參考資料編號一致性
  - [x] 錯誤修正狀態
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 8：依模板完成 `report.md`
  - [x] 報告日期與作者欄位替換完成
  - [x] 報告說明更新為 2026-06-13 至 2026-06-27
  - [x] ✅ 階段檢核：更新 notes.md → report.md → task_plan.md
- [x] 階段 9：複製交付物到 `tech/2026-06-27/`
  - [x] `report.md` 複製並改名為 `2026-06-27 科技服務資訊週記.md`
  - [x] `source.md` 複製到交付資料夾
  - [x] `task_plan.md` 複製到交付資料夾
  - [x] `notes.md` 另存為 `note.md`
  - [x] 正式參考資料清單另存為 `references.md`
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 10：查核參考資料並補搜缺漏
  - [x] 逐筆核對標題、發布日期、來源網址與內文主張
  - [x] 修正來源 1、3、10、11、13、14、16 的 metadata 或過度主張
  - [x] 新增來源 17（GPT-5.6 受限釋出）
  - [x] 新增來源 18（OpenAI 與 Broadcom 的 Jalapeño 推論晶片）
  - [x] 同步調整總結、亮點、趨勢分析、來源清單與交付副本
  - [x] 通過必要檔案、日期範圍、引用、錨點、模板殘留與雙份同步檢查
  - [x] ✅ 階段檢核：更新 notes.md → source.md／report.md → task_plan.md

## 關鍵問題
1. 哪些分類目前資料不足，需要補搜？
2. 哪些來源雖然相關，但應因日期或可信度而排除？
3. 內文引用與參考資料編號是否完全一致？

## 已做決策
- 預設任務名稱：`weekly-tech-report`
- 報告模板來源：`assets/weekly-report-template.md`
- 任務資料夾：`docs/tech-report-research/weekly-tech-report-009`
- 交付資料夾：`tech/2026-06-27`
- 目前使用工具：GitHub Copilot
- 優先參考專案知識：`source-priority`、`taiwan-media-landscape`、`date-citation-rules`、`report-format`、`fetch-gotchas`

## 遇到的錯誤
- 無

## 狀態
**完成** - 已完成來源查核、缺漏補搜、內容修正與 `tech/2026-06-27/` 交付同步
