# 任務計劃：科技服務資訊週記

## 目標
完成報告日期 2026-08-22、時間範圍 2026-08-07 至 2026-08-22 的科技服務資訊週記，保留研究判斷、候選與正式來源，並完成 `tech/2026-08-22/` 交付。

## 執行模式
一次完成

## 階段
- [x] 階段 1：確認日期範圍與 12 個必要分類
  - [x] 讀取 skill 規格、模板、共用知識庫索引與五項專案知識
  - [x] 撰寫 prompt.md 與 task_plan.md，並通過 validate-task-files.sh
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md
- [x] 階段 2：蒐集來源並整理 `source.md`
  - [x] 依 12 分類逐項搜尋，逐筆以原始頁面查核發布日期
  - [x] 保留 15 筆正式來源與 10 筆淘汰來源的判斷依據
  - [x] ✅ 階段檢核：更新 notes.md → source.md → task_plan.md
- [x] 階段 3：依權重篩選正式參考資料
  - [x] 官方公告與一手技術部落格優先，其次為權威科技媒體與台灣主流媒體
  - [x] 公司宣稱、二手轉載與研究機構估算均在來源備註標明限制
  - [x] ✅ 階段檢核：更新 notes.md → source.md → task_plan.md
- [x] 階段 4：檢查各分類是否缺漏
  - [x] 12 個必要分類皆有正式來源；資安、硬體、網路基礎各 2 筆
  - [x] ✅ 階段檢核：更新 notes.md → source.md → task_plan.md
- [x] 階段 5：撰寫總結、亮點、趨勢分析
  - [x] 12 個亮點分類與 12 個趨勢分類完成，每段標註來源編號
  - [x] ✅ 階段檢核：更新 notes.md → report.md → task_plan.md
- [x] 階段 6：整理參考資料表與引用
  - [x] 內文引用、HTML 錨點與參考資料表編號一致（ref-1 至 ref-17）
  - [x] ✅ 階段檢核：更新 notes.md → report.md → task_plan.md
- [x] 階段 7：完成前第二次稽核
  - [x] 逐筆核對來源標題、日期、網站名稱、網址與內容主張
  - [x] 檢查分類完整性、資訊權重、搜尋時間範圍、引用一致性與錯誤修正狀態
  - [x] ✅ 階段檢核：更新 notes.md → source.md／report.md → task_plan.md
- [x] 階段 8：依模板完成 `report.md`
  - [x] 保留目錄、錨點、四大段落、報告說明與免責聲明
  - [x] ✅ 階段檢核：更新 notes.md → report.md → task_plan.md
- [x] 階段 9：複製交付物到 `tech/2026-08-22/`
  - [x] 透過 `scripts/deliver-weekly-tech-report.sh` 同步五份交付物
  - [x] 執行 validate-task-files.sh、validate-task-completion.sh 與引用一致性驗證
  - [x] ✅ 階段檢核：更新 notes.md → task_plan.md

## 關鍵問題與答案
1. 哪些分類資料不足需補搜？醫療科技、金融科技、房地產與室內外裝潢、現場表演藝術四類皆需二至三輪補搜；前三類最終各以窗內事件補齊，房地產僅能找到權重 5/10 的業者發布資訊。
2. 哪些來源因日期或可信度排除？共 10 筆，主因是發布日落在 2026-08-07 之前（兩廳院 AR 導覽、ETtoday 室內設計、Edinburgh Fringe、屋頂光電新制、C-LAB），以及上一期已引用（Cloudflare Access for Workers、GitHub Agent Plugins 1.0）。
3. 內文引用與參考資料編號是否一致？是，ref-1 至 ref-17 全部在內文出現且編號對應。

## 已做決策
- 任務資料夾：`weekly-tech-report-017`
- 報告作者欄位：Claude Code、Codex
- 時間窗採含首尾：2026-08-07 至 2026-08-22
- 以 `scripts/build-weekly-tech-report-017.sh` 作為本期內容唯一來源
- 交付沿用既有腳本 `scripts/deliver-weekly-tech-report.sh`，未新增交付腳本
- 稽核後：資安 3 筆，AI、硬體、網路基礎各 2 筆，其餘 8 類各 1 筆，合計 17 筆
- 來源 15 改採 EPFL 官方研究發布，不再使用二手科技媒體報導

## 遇到的錯誤與修正
- `https://www.ithome.com.tw/security` WebFetch 回 HTTP 403，與 `knowledge/fetch-gotchas.md` 記載一致；改由其他來源補齊資安分類。
- 第一輪搜尋在醫療、房地產、表演藝術三類回傳大量年度趨勢文與長檔期活動頁，逐篇查核後多數落在窗外，已全部記入 `source.md` 淘汰區。
- Fortinet 漏洞的 CVSS 分數外部說法（9.8）與 SecurityWeek 標示的嚴重度不一致，改為不引用單一評分數字，只描述可利用條件與影響。
- Spotify 事件原先命中台灣二手報導（udn／台灣醒報，2026-08-16），依來源優先序改採 Spotify 官方原文（2026-08-11）。
- 第二次稽核發現總結超過 300 字、`source.md` 標題格式無法被共用驗證器辨識，且部分正式來源被誤判為無發布日期；已縮寫總結並統一改為 `### 數字. 標題`。
- 第二次稽核更正來源 11 合作方、來源 13 人名與節目關係，並重新校準 6 筆來源權重。

- [x] 階段 10：2026-08-22 第 3 次來源稽核
  - [x] 逐筆重新開啟 17 筆正式來源原文，複驗第 2 次稽核的全部改動
  - [x] 補搜後新增 ref-16（OpenAI 放慢模型開發節奏）與 ref-17（VMware vCenter 遭利用）
  - [x] openai.com 回 403，改以第三方報導交叉核對後採用官方引用
  - [x] 免責聲明改採前幾期既有慣例措辭
  - [x] ✅ 階段檢核：更新 notes.md → source.md／report.md → 同步 tech/2026-08-22/ → 重新驗證

## 狀態
**已完成**：研究、報告、交付同步與驗證均通過。作者：Claude Code、Codex。
