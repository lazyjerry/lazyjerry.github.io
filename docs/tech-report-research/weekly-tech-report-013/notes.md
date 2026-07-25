# 研究筆記

## 任務設定
- 報告日期：2026-07-25
- 日期窗：2026-07-10 至 2026-07-25
- 作者：Codex
- 對象：程式設計師

## 研究判斷
- 已重新讀取來源優先、台灣媒體、日期引用、報告格式與抓取限制五項專案知識。
- 正式來源共 18 筆，12 個必要分類皆至少有 1 筆，權重為 8 至 10/10。
- 來源以 OpenAI、GitHub、Oracle、Intel、Microsoft、Mastercard、FDA、日本國土交通省、新加坡 BCA、SIGGRAPH、Spotify、NSF 與 Google 等第一方資料為主。
- 稽核補搜後新增來源 18（Google Gemini 3.6 Flash／3.5 Flash-Lite／3.5 Flash Cyber，blog.google，2026-07-21，10/10）；此為窗內第一方 frontier 模型發布，權重與 AI 分類既有選材相當且題材互補，故納入。GPT-5.6 Sol/Terra/Luna 預覽（2026-07-09）與 Google Cloud Next '26 Gemini Enterprise（2026-04-22）皆落在時間窗外，不採用。
- AI、資安、硬體與基礎設施加入 iThome 查核或台灣產業脈絡；未使用中國媒體或社群來源。
- Oracle 官方的 1,449 是「新安全修補數」，iThome 整理的 1,235 是「漏洞數」，報告分開表述。
- Amazon EKS 官方公告日期為 7 月 1 日，落在時間窗外；本期只把 7 月 23 日發布的 iThome 查核報導列為正式來源。
- Spotify Labs 舊文雖於 7 月 20 日更新 rollout 狀態，仍以原始發布日判斷並排除。
- 正式來源均有精確日期，未使用 `*未知時間`。

## 分類完整性
- AI 科技：來源 1、2、18
- 軟體工程：來源 3
- 軟硬體資訊安全：來源 4、5
- 硬體或軟硬整合：來源 6、7、8
- 網路/伺服器等基礎：來源 9、10
- 金融科技：來源 11
- 醫療科技：來源 12
- 運輸物流：來源 13
- 房地產與室內外裝潢：來源 14
- 現場表演藝術：來源 15
- 影視音樂：來源 16
- 其他領域科技應用突破：來源 17

## 完成前檢查
- [x] 12 個必要分類皆有正式來源。
- [x] 全部正式來源發布日均在 2026-07-10 至 2026-07-25。
- [x] 來源網站名稱、網址、日期與標題已逐筆核對。
- [x] 文中只使用 `ref-1` 至 `ref-18`，參考資料表均有對應錨點。
- [x] 淘汰來源保留日期、替換與重複題材理由。
- [x] research 與 delivery 檔案由同一腳本產生並同步。

## 來源查核（2026-07-25 稽核）
逐筆核對 18 筆正式來源的標題、發布日期、媒體名稱與網址；官方頁被擋（403/404）者以官方投資人頁、通訊社與權威科技媒體交叉確認。

- 來源 1 OpenAI Presence：官方頁 403，經 VentureBeat／Bloomberg Law／CX Today 交叉確認，2026-07-22、75% 自動處理、限度 GA 屬實。
- 來源 3 GitHub Code Quality：官方 changelog 直取，2026-07-20、CodeQL＋AI＋Autofix＋coverage＋ruleset evaluate mode 均符。
- 來源 4／5 Oracle CPU：官方頁 403，經 Qualys／Tenable／CSO 交叉確認，1,449 修補、EBS 410、261 重大、10 個 CVSS 10.0、2026-07-21 均符；修補數與漏洞（CVE）數分開表述正確。
- 來源 6 Intel×Fortinet SP6：官方 newsroom 直取，2026-07-21。
- 來源 8 AMD MI400／EPYC 9006／Helios：經 HotHardware／Fierce／TechPowerUp 交叉確認。
- 來源 9 Amazon EKS：官方 What's New 標 2026-07-01（窗外），維持採 2026-07-23 iThome 查核報導。
- 來源 10 Microsoft×Mistral：官方 Source 直取，2026-07-21。
- 來源 11 Mastercard：官方頁 403，經 investor.mastercard.com／Financial IT 交叉確認，43 國、174 幣別、單一 API。
- 來源 12 FDA TEMPO：官方頁一度 404，經 FDA 標題頁與 Dexcom 投資人頁交叉確認，2026-07-22。
- 來源 13／14／15：日本國土交通省（令和8年7月13日）、新加坡 BCA（2026-07-17）、SIGGRAPH Impulse（2026-07-20 起）官方頁直取。
- 來源 16 Spotify（2026-07-14）、17 NSF（2026-07-22）官方頁直取，數字均符。
- 來源 18 Google Gemini 3.6 Flash：官方 blog.google 直取，2026-07-21、17% token 縮減、3.5 Flash-Lite 每秒 350 token、3.5 Flash Cyber 經 CodeMender 有限釋出均符。
- 台灣媒體來源 2、5、7、9 之關鍵數字皆由第一方或權威來源反向確認一致。

查核結果：18 筆全部通過，發布日均落在 2026-07-10 至 2026-07-25，無標題、日期、媒體或網址錯誤，無來源未支持的數字或因果；補搜後新增 Google Gemini 3.6 Flash 一筆，未淘汰既有來源。

## 固定規則評估
本次未發現需要新增到專案知識庫的固定規則。
