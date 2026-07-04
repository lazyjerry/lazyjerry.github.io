# 任務計劃：科技服務資訊週記

## 目標
完成一份符合本 repo 規格的科技服務資訊週記，並輸出完整研究過程與交付檔案。

## 執行模式
一次完成

## 階段
- [x] 階段 1：確認日期範圍與分類
  - [x] 報告日期：2026-07-04
  - [x] 搜尋時間範圍：2026-06-20 至 2026-07-04
  - [x] 必要分類依 `references/report-spec.md` 保留完整
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 2：蒐集來源並整理 `source.md`
  - [x] 每筆來源記錄網址、標題、摘要、權重、發布日期、分類、是否納入正式參考資料
  - [x] 日期不符、權重不足或無法驗證者保留淘汰原因
  - [x] 依使用者要求完成 2026-06-20 至 2026-06-27 二次補搜
  - [x] 依使用者要求再次檢查 `source.md`，新增符合權重的 Anthropic、The Hacker News 與 Reuters 來源
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 3：依權重篩選正式參考資料
  - [x] 優先採用官方公告、權威科技媒體、台灣主流媒體與財經媒體
  - [x] 排除日期不明、窗外或低權重且可替代來源
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
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
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 5：撰寫總結、亮點、趨勢分析
  - [x] 所有內文主張標註來源編號
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 6：整理參考資料表與引用
  - [x] 參考資料表包含編號、標題與搜尋連結、一句話結論、發布日期、來源網址與名稱、分類
  - [x] 使用 `[[數字. 來源名稱]](#ref-數字)` 引用格式
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 7：完成前檢查
  - [x] 分類完整性
  - [x] 資訊權重
  - [x] 搜尋時間範圍
  - [x] 資料來源正確性
  - [x] 內文引用編號與參考資料編號一致性
  - [x] 追加來源後重新驗證 `#ref-1` 至 `#ref-23`
  - [x] 錯誤來源或整理內容修正狀態
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 8：依模板完成 `report.md`
  - [x] 使用 `assets/weekly-report-template.md` 的目錄、錨點、段落順序與表格欄位
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 9：複製交付物到 `tech/2026-07-04/`
  - [x] `report.md` 複製為 `tech/2026-07-04/2026-07-04 科技服務資訊週記.md`
  - [x] `source.md` 複製到 `tech/2026-07-04/source.md`
  - [x] `task_plan.md` 複製到 `tech/2026-07-04/task_plan.md`
  - [x] `notes.md` 另存為 `tech/2026-07-04/note.md`
  - [x] 正式參考資料清單另存為 `tech/2026-07-04/references.md`
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md

## 關鍵問題
1. 哪些分類目前資料不足，需要補搜？
2. 哪些來源雖然相關，但應因日期或可信度而排除？
3. 內文引用與參考資料編號是否完全一致？

## 已做決策
- 預設任務名稱：`weekly-tech-report`
- 報告模板來源：`assets/weekly-report-template.md`
- 本期任務資料夾：`docs/tech-report-research/weekly-tech-report-010`
- 作者欄位：GitHub Copilot

## 遇到的錯誤
- [錯誤]：repo 內未存在 `.agents/skills/tech-report-research/references/`。
  - [解決方案]：改讀取使用者目錄中的 skill 規格 `/Users/lazyjerry/.copilot/skills/tech-report-research/`，並沿用 repo 內 `docs/tech-report-research/knowledge/`。

## 狀態
**已完成** - 任務檔案、正式報告與 `tech/2026-07-04/` 交付物準備完成
