# 任務計劃

- 任務名稱：weekly-tech-report-020
- 報告日期：2026-09-13
- 時間範圍：2026-08-30 至 2026-09-13
- 執行模式：一次完成
- 內容單一來源：`scripts/build-weekly-tech-report-020.sh`

## 階段

| # | 階段 | 狀態 |
|---|------|------|
| 1 | 確認日期範圍與分類 | 完成 |
| 2 | 蒐集來源並整理 source.md | 完成（正式 34 筆、淘汰 31 筆） |
| 3 | 依權重篩選正式參考資料 | 完成（比對 `tech/2026-09-05/references.md` 做跨期去重，淘汰 13 筆重複事件） |
| 4 | 檢查各分類是否缺漏 | 完成（12 分類皆有資料；現場表演藝術與影視音樂各僅 1 筆，已在報告說明註記補搜過程） |
| 5 | 撰寫總結、亮點、趨勢分析 | 完成 |
| 6 | 整理參考資料表與引用 | 完成（ref-1 至 ref-34 與內文一一對應） |
| 7 | 六項完成前檢查 | 完成 |
| 8 | 依模板完成 report.md | 完成 |
| 9 | 複製交付物到 tech/2026-09-13/ | 完成 |

## 完成前檢查項目

- [x] 分類完整性：12 個必要分類皆有資料；現場表演藝術、影視音樂各 1 筆，補搜輪次與缺漏原因記於 `notes.md` 與報告說明
- [x] 資訊權重：正式來源以官方公告（Anthropic、CISA、Cloudflare、GitHub、MIT News）與台灣權威媒體（中央社、科技新報、ETtoday、Newtalk）為主；ref-6、ref-26、ref-27、ref-30、ref-31 權重壓低並在報告說明逐筆註明限制
- [x] 搜尋時間範圍：34 筆正式來源發布日期皆落在 2026-08-30 至 2026-09-13
- [x] 資料來源正確性：網址、來源網站名稱、發布日期、標題逐筆回原頁核對；無法核對者淘汰
- [x] 引用一致性：內文 `(#ref-n)` 與參考資料 `<a id="ref-n">` 皆為 1 至 34，一一對應且每個編號至少被引用一次
- [x] 錯誤修正狀態：CISA 高權重缺漏、Anthropic 當前 H1、穩定幣法規語氣、銀行放款因果、HITMAN 給藥方式、無人機業配屬性、Roadster 推測內容與 AI 短劇延伸閱讀數字均已處理

## 已知風險與對策

- iThome、openai.com、inside.com.tw 等站 WebFetch 回 403：改以 WebSearch 摘要與第三方報導交叉核對，URL 仍指向原文
- `technews.tw` 文章頁會 301 轉址到 `cdn.technews.tw`：WebFetch 不跟隨跨網域轉址，需以轉址後網址重抓
- 趨勢型與活動預告文章常落在窗外：逐篇查核實際發布日期，不以搜尋排序判斷新舊
- 現場表演藝術、影視音樂、房地產分類稀疏：預留補搜輪次
- 專有名詞（人名、職稱、機構全名、論文標題）不可靠 WebFetch 摘要：回原頁要求 verbatim 引述
- 跨期重疊七天：先建立 2026-09-05 期來源網址名單再篩選
- 淘汰來源的細節會污染正式來源摘要：同一事件有窗內與窗外兩則報導時，逐句確認原頁是否真有該敘述

## 錯誤記錄

| 項目 | 狀況 | 處置 |
|------|------|------|
| `technews.tw` 文章頁 | 301 轉址到 `cdn.technews.tw`，WebFetch 不自動跟隨 | 以轉址後網址重抓；參考資料仍採用 `technews.tw` 正式網址 |
| `blog.cloudflare.com` slug | 依列表頁標題推測的 slug（`post-quantum-dnssec`、`automatic-key-exchange`、`casb-automatic-remediation`）皆回 404 | 改用站內搜尋取得正確 slug（`post-quantum-dnssec-1111`、`automatic-key-exchange-for-origins`、`casb-policies`） |
| `anthropic.com` slug | `improving-alignment-security` 回 404 | 正確網址為 `improving-alignment-security-efforts` |
| Anthropic 威脅情資報告 | 報告頁本身未標示發布日期 | 以 `anthropic.com/news` 列表頁標示的 2026-09-10 為準 |
| 特斯拉 Roadster 2 | 標題「再次正式發表」易被誤讀為車輛已發表 | 回原頁確認是預告 10 月 1 日發表會的報導，報告中改寫為「宣布發表會日期」 |
| 假訊息研究 | 受測模型為 GPT-3.5、Claude 3.5 Sonnet 等前一世代模型，不能寫成當期模型的表現 | 摘要與亮點明確標註受測模型世代，並壓低權重 |
| MIT 氨轉氫 | 新聞標題與論文標題不同 | 參考資料採用新聞標題，內文引述論文標題與期刊《Nature》 |
| Spotify AI Persona 標籤 | 官方公告日 2026-08-11、台灣報導 2026-08-16，皆落在窗外 | 淘汰，影視音樂改以窗內的 AI 短劇衝擊報導為唯一來源 |
| Suno 與華納音樂授權協議 | 為 2025-11 事件 | 淘汰 |
| 高雄電影節 XR 競賽入圍名單 | `inside.com.tw` 回 403 無法查證，搜尋摘要稱「9 月 26 日公布」與今日 2026-09-13 矛盾 | 淘汰，不挑一邊採信 |
| npm 供應鏈攻擊 Shai-hulud | 搜尋結果混入 2025 年 9 月事件 | 淘汰，資安改採 GitHub 兩則窗內 npm 與 secret scanning 變更 |
