# AI 爬蟲完整結構化資料

## 基本資訊

| 項目         | 內容                                          |
| ------------ | --------------------------------------------- |
| **資料來源** | https://lazyjerry.github.io/docs/tech_source/ |
| **時間範圍** | 動態計算：{TODAY - 15 days} 至 {TODAY}        |
| **任務類型** | 官方網站全面爬取 + 關鍵字新聞搜尋             |
| **更新日期** | {TODAY}                                       |

## 動態時間變數系統

### 基本時間變數

```
{TODAY}           = 執行當天日期 (YYYY-MM-DD)
{DAYS_RANGE}      = 15 (可調整)
{START_DATE}      = {TODAY} - {DAYS_RANGE} 天
{END_DATE}        = {TODAY}
{CURRENT_YEAR}    = 執行當年
{CURRENT_MONTH}   = 執行當月
{LAST_MONTH}      = 上個月
```

### 時間表達方式

- **中文**: 最近{DAYS_RANGE}天、{CURRENT_YEAR}年{CURRENT_MONTH}月、本週、本月、近期、最新
- **英文**: last {DAYS_RANGE} days、{CURRENT_YEAR}-{CURRENT_MONTH}、this week、this month、recent、latest

---

## 第一部分：官方網站全面爬取任務（23 個）

> **重要修正**: 移除關鍵字限制，爬取所有相關內容，避免資料過度狹隘

### 優先級 A - AI/ML 領域

| ID  | 公司/服務        | 目標網址                       | 爬取策略         | 內容重點                             |
| --- | ---------------- | ------------------------------ | ---------------- | ------------------------------------ |
| A1  | **Hugging Face** | https://huggingface.co/blog    | 全面爬取所有文章 | 所有技術更新、產品發布、社群動態     |
| A2  | **OpenAI**       | https://openai.com/news/       | 全面爬取所有新聞 | 所有產品發布、研究成果、企業動態     |
| A3  | **Anthropic**    | https://www.anthropic.com/news | 全面爬取所有新聞 | 所有研究發布、產品更新、安全相關內容 |
| A4  | **Manus**        | https://manus.im/updates       | 全面爬取所有更新 | 所有平台功能、產品發布、技術創新     |

### 優先級 B - 開發工具與平台

| ID  | 公司/服務           | 目標網址                                                       | 爬取策略         | 內容重點                           |
| --- | ------------------- | -------------------------------------------------------------- | ---------------- | ---------------------------------- |
| B1  | **GitHub Copilot**  | https://github.com/features/copilot/whats-new                  | 全面爬取所有更新 | 所有功能發布、整合更新、開發者工具 |
| B2  | **GitHub**          | https://github.com/newsroom                                    | 全面爬取所有新聞 | 所有平台政策、功能更新、社群動態   |
| B3  | **GitHub Trending** | https://github.com/trending?since=weekly&spoken_language_code= | 爬取趨勢專案     | 週度熱門專案、新興技術、開源動態   |
| B4  | **You.com**         | https://you.com                                                | 搜尋相關新聞頁面 | 產品更新、功能發布、技術創新       |

### 優先級 C - 科技巨頭

| ID  | 公司/服務                 | 目標網址                                          | 爬取策略           | 內容重點                             |
| --- | ------------------------- | ------------------------------------------------- | ------------------ | ------------------------------------ |
| C1  | **Apple**                 | https://www.apple.com/newsroom/                   | 全面爬取所有新聞   | 所有產品發布、軟體更新、企業動態     |
| C2  | **Microsoft**             | https://news.microsoft.com/source                 | 全面爬取所有新聞   | 所有產品更新、企業服務、技術創新     |
| C3  | **Azure**                 | https://azure.microsoft.com/en-us/blog/           | 全面爬取所有部落格 | 所有雲端服務、企業解決方案、技術更新 |
| C4  | **Google Android/Chrome** | https://blog.google/products/android-chrome-play/ | 全面爬取相關文章   | 所有行動平台、瀏覽器、應用商店更新   |
| C5  | **Google 平台設備**       | https://blog.google/products/platforms-devices/   | 全面爬取相關文章   | 所有硬體發布、平台整合、設備更新     |
| C6  | **Google Cloud**          | https://blog.google/products/cloud/               | 全面爬取相關文章   | 所有雲端服務、企業解決方案、技術創新 |
| C7  | **Google 搜尋**           | https://blog.google/products/explore-get-answers/ | 全面爬取相關文章   | 所有搜尋功能、AI 整合、使用者體驗    |
| C8  | **Meta**                  | https://about.fb.com/news/                        | 全面爬取所有新聞   | 所有平台更新、VR/AR 技術、企業策略   |

### 優先級 D - 硬體與基礎設施

| ID  | 公司/服務      | 目標網址                       | 爬取策略           | 內容重點                             |
| --- | -------------- | ------------------------------ | ------------------ | ------------------------------------ |
| D1  | **Nvidia**     | https://nvidianews.nvidia.com/ | 全面爬取所有新聞   | 所有硬體發布、AI 技術、遊戲創新      |
| D2  | **Tesla**      | https://www.tesla.com/blog     | 全面爬取所有部落格 | 所有車輛更新、技術突破、能源解決方案 |
| D3  | **Cloudflare** | https://blog.cloudflare.com    | 全面爬取所有部落格 | 所有服務更新、安全技術、網路優化     |

### 優先級 E - 雲端服務提供商

| ID  | 公司/服務        | 目標網址                                    | 爬取策略           | 內容重點                         |
| --- | ---------------- | ------------------------------------------- | ------------------ | -------------------------------- |
| E1  | **Linode**       | https://www.linode.com/blog/                | 全面爬取所有部落格 | 所有服務更新、技術教學、產品發布 |
| E2  | **Vultr**        | https://www.vultr.com/news/                 | 全面爬取所有新聞   | 所有服務擴展、功能更新、技術創新 |
| E3  | **DigitalOcean** | https://www.digitalocean.com/press/releases | 全面爬取所有新聞稿 | 所有企業動態、產品發布、合作夥伴 |
| E4  | **Kamatera**     | https://www.kamatera.com/topics/news/       | 全面爬取所有新聞   | 所有服務更新、技術創新、市場擴展 |

---

## 第二部分：關鍵字新聞搜尋任務（22 個）

### 動態搜尋查詢模板

#### 中文搜尋模板

```
"{KEYWORD}" 新聞 最近{DAYS_RANGE}天
"{KEYWORD}" 新聞 {CURRENT_YEAR}年{CURRENT_MONTH}月
"{KEYWORD}" 最新消息 近期
```

#### 英文搜尋模板

```
"{KEYWORD}" news last {DAYS_RANGE} days
"{KEYWORD}" news {CURRENT_YEAR}-{CURRENT_MONTH}
"{KEYWORD}" latest updates recent
```

#### 進階搜尋模板

```
"{KEYWORD}" after:{START_DATE} before:{END_DATE}
site:techcrunch.com OR site:theverge.com "{KEYWORD}"
"{KEYWORD}" 新聞 OR "{KEYWORD}" 更新 OR "{KEYWORD}" 發布
```

### 關鍵字搜尋任務列表

| ID  | 關鍵字             | 動態搜尋查詢                                        | 目標網站類型               | 搜尋重點         |
| --- | ------------------ | --------------------------------------------------- | -------------------------- | ---------------- |
| S1  | **Hugging Face**   | "Hugging Face" 新聞 最近{DAYS_RANGE}天              | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S2  | **OpenAI**         | "OpenAI" 新聞 最近{DAYS_RANGE}天                    | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S3  | **Anthropic**      | "Anthropic" 新聞 最近{DAYS_RANGE}天                 | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S4  | **YouAI**          | "YouAI" OR "You.com AI" 新聞 最近{DAYS_RANGE}天     | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S5  | **GitHub Copilot** | "GitHub Copilot" 新聞 最近{DAYS_RANGE}天            | 科技媒體、開發者社群       | 所有相關新聞報導 |
| S6  | **Manus**          | "Manus AI" 新聞 最近{DAYS_RANGE}天                  | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S7  | **Grok**           | "Grok AI" OR "xAI Grok" 新聞 最近{DAYS_RANGE}天     | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S8  | **Apple**          | "Apple" 新聞 最近{DAYS_RANGE}天                     | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S9  | **Microsoft**      | "Microsoft" 新聞 最近{DAYS_RANGE}天                 | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S10 | **Azure**          | "Microsoft Azure" 新聞 最近{DAYS_RANGE}天           | 科技媒體、企業媒體         | 所有相關新聞報導 |
| S11 | **Nvidia**         | "Nvidia" 新聞 最近{DAYS_RANGE}天                    | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S12 | **Tesla**          | "Tesla" 新聞 最近{DAYS_RANGE}天                     | 科技媒體、汽車媒體         | 所有相關新聞報導 |
| S13 | **Meta**           | "Meta" OR "Facebook" 新聞 最近{DAYS_RANGE}天        | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S14 | **Cloudflare**     | "Cloudflare" 新聞 最近{DAYS_RANGE}天                | 科技媒體、網路安全媒體     | 所有相關新聞報導 |
| S15 | **Perplexity**     | "Perplexity AI" 新聞 最近{DAYS_RANGE}天             | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S16 | **AWS**            | "Amazon AWS" 新聞 最近{DAYS_RANGE}天                | 科技媒體、企業媒體         | 所有相關新聞報導 |
| S17 | **Google**         | "Google" 新聞 最近{DAYS_RANGE}天                    | 國際科技媒體、台灣科技媒體 | 所有相關新聞報導 |
| S18 | **Vultr**          | "Vultr" 新聞 最近{DAYS_RANGE}天                     | 科技媒體、雲端媒體         | 所有相關新聞報導 |
| S19 | **DigitalOcean**   | "DigitalOcean" 新聞 最近{DAYS_RANGE}天              | 科技媒體、開發者媒體       | 所有相關新聞報導 |
| S20 | **Kamatera**       | "Kamatera" 新聞 最近{DAYS_RANGE}天                  | 科技媒體、雲端媒體         | 所有相關新聞報導 |
| S21 | **Ollama**         | "Ollama AI" 新聞 最近{DAYS_RANGE}天                 | 科技媒體、開發者社群       | 所有相關新聞報導 |
| S22 | **綜合科技新聞**   | "AI 人工智慧" OR "雲端運算" 新聞 最近{DAYS_RANGE}天 | 綜合新聞媒體               | 所有相關新聞報導 |

---

## 第三部分：權威媒體網站清單

### 國際科技媒體（已驗證權威性）

- **TechCrunch**: https://techcrunch.com/ ✅ 權威、有日期
- **The Verge**: https://www.theverge.com/ ✅ 權威、有日期
- **Ars Technica**: https://arstechnica.com/ ✅ 權威、有日期
- **Wired**: https://www.wired.com/ ✅ 權威、有日期
- **VentureBeat**: https://venturebeat.com/ ✅ 權威、有日期
- **TechRadar**: https://www.techradar.com/ ✅ 權威、有日期
- **Engadget**: https://www.engadget.com/ ✅ 權威、有日期

### 台灣科技媒體（基於知識庫）

- **iThome**: https://www.ithome.com.tw/ ✅ 權威、有日期
- **科技新報**: https://technews.tw/ ✅ 權威、有日期
- **INSIDE**: https://www.inside.com.tw/ ✅ 權威、有日期
- **數位時代**: https://www.bnext.com.tw/ ✅ 權威、有日期
- **T 客邦**: https://www.techbang.com/ ✅ 權威、有日期

### 台灣主流新聞媒體（新增）

- **聯合新聞網**: https://udn.com ✅ 權威、有日期
- **中時新聞網**: https://www.chinatimes.com ✅ 權威、有日期
- **自由電子報**: https://news.ltn.com.tw ✅ 權威、有日期
- **ETtoday 新聞雲**: https://www.ettoday.net ✅ 權威、有日期
- **風傳媒**: https://www.storm.mg ✅ 權威、有日期
- **關鍵評論網**: https://www.thenewslens.com ✅ 權威、有日期

### 企業與雲端專業媒體

- **InfoWorld**: https://www.infoworld.com/ ✅ 權威、有日期
- **ZDNet**: https://www.zdnet.com/ ✅ 權威、有日期
- **ComputerWorld**: https://www.computerworld.com/ ✅ 權威、有日期
- **CIO**: https://www.cio.com/ ✅ 權威、有日期

### 財經媒體（新增）

- **商業周刊**: https://www.businessweekly.com.tw/ ✅ 權威、有日期
- **天下雜誌**: https://www.cw.com.tw/ ✅ 權威、有日期
- **今周刊**: https://www.businesstoday.com.tw/ ✅ 權威、有日期

---

## 執行規範

### 動態時間處理

```json
{
	"time_config": {
		"base_date": "{TODAY}",
		"range_days": "{DAYS_RANGE}",
		"start_date": "{START_DATE}",
		"end_date": "{END_DATE}",
		"flexible_expressions": ["最近{DAYS_RANGE}天", "{CURRENT_YEAR}年{CURRENT_MONTH}月", "本週", "本月", "近期", "最新"]
	}
}
```

### 日期處理規則（不變）

| 情況             | 處理方式 | 標記                  |
| ---------------- | -------- | --------------------- |
| 有明確日期       | 優先使用 | ✅                    |
| 無日期但確定近期 | 可使用   | ⚠️ 標記「\*未知時間」 |
| 無法確定時間     | 忽略     | ❌                    |

### 內容爬取策略

1. **官方網站**: 全面爬取，不限制關鍵字
2. **新聞搜尋**: 使用動態關鍵字，涵蓋所有相關報導
3. **內容篩選**: 基於時間和權威性，而非關鍵字限制
4. **去重處理**: 智能去重，保留最權威來源

### 執行順序建議

1. **第一階段**: 執行官方網站全面爬取（A1-E4）
2. **第二階段**: 執行高優先級關鍵字搜尋（S1-S7）
3. **第三階段**: 執行其他關鍵字搜尋（S8-S22）
4. **第四階段**: 整合、去重和品質檢查

### 品質保證機制

- **來源驗證**: 確認所有來源的權威性和日期可獲取性
- **內容完整性**: 確保不因關鍵字限制而遺漏重要內容
- **時間準確性**: 使用動態時間計算，確保時效性
- **去重智能化**: 基於內容相似度和來源權威性進行去重
