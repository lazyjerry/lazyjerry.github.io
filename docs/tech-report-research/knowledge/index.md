# 知識庫索引

本目錄儲存**專案客製化**的注意事項，供未來任務參考。

## 使用方式

1. **任務開始前**：根據下表的「觸發時機」判斷是否需要參考相關知識
2. **任務完成後**：如有客製化的注意事項，新增知識檔案並更新此索引

**何時產生知識檔案：**
- 發現專案特有的注意事項（非一般常見知識）
- 透過用戶互動修改後發現的重要事項
- 踩過的坑或特殊處理方式

**不需要產生：** 一般程式設計知識、框架標準用法、官方文件已說明的內容

## 知識清單

| 檔案 | 觸發時機 | 摘要 |
|------|----------|------|
| `knowledge/source-priority.md` | 搜集或篩選技術報告來源時 | 定義中國來源、社群來源的替換與刪除原則，並要求優先採用台灣媒體。 |
| `knowledge/taiwan-media-landscape.md` | 評估台灣新聞與財經媒體權重時 | 整理台灣主流媒體類型與代表網站，供來源選擇時參考。 |
| `knowledge/date-citation-rules.md` | 檢查 15 天時間範圍、文中引用與錨點時 | 定義日期判定、`*未知時間`、引用編號格式與錨點規則。 |
| `knowledge/report-format.md` | 撰寫 `report.md` 或交付前檢查時 | 定義四段式報告結構、Markdown 格式、台灣用語與 TODO 檢查項目。 |
| `knowledge/fetch-gotchas.md` | 以 WebFetch 或 curl 抓內文或查核發布日期時 | iThome、openai.com（連 curl 各種 UA 也擋）、inside.com.tw 常回 403；sec.gov 要用宣告式 UA；fsc.gov.tw 的更新日期與 MediaTek 列表頁日期都不是發布日；anthropic.com、nasa.gov、waymo shorts 無日期 meta；blog.google 用 curl 只抽到 CSS；qualcomm.com 正文要抓 `.model.json`；apple.com/newsroom 的 H1 比 og:title 長；technews.tw 會轉址到 cdn 網域且日期歸檔頁不全；blog.cloudflare.com 與 anthropic.com 的 slug 不可由標題推測；全球中央會 301 轉址且 URL 編號不等於發布日；活動預告的實施日不等於發布日；標題與內文矛盾的來源直接淘汰；WebFetch 摘要會改寫時間詞與補出日期，日期與數字改用 curl 取 JSON-LD 核對。 |
| `knowledge/window-overlap-dedup.md` | 篩選正式參考資料、懷疑來源與上一期重複時 | 15 天窗每期重疊約一半，需比對上一期 references.md 做跨期去重，並預留稀疏分類的補搜輪次。 |
| `knowledge/parallel-collection.md` | 以多組代理平行蒐集候選來源、收斂正式與淘汰名單時 | 四組分類拆法、候選檔格式、`converge-weekly-tech-report-candidates.py` 的用法，以及逐筆讀備註刪非原頁內容、摘要字數、跨組建議與分段解析的固定檢查。 |
