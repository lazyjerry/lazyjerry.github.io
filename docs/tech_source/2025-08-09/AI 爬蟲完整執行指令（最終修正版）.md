# AI 爬蟲完整執行指令（最終修正版）

## 動態時間系統設定
```
時間基準: {TODAY} = 執行當天
時間範圍: {DAYS_RANGE} = 15 (可調整)
開始日期: {START_DATE} = {TODAY} - {DAYS_RANGE} 天
結束日期: {END_DATE} = {TODAY}
當前年份: {CURRENT_YEAR} = 執行當年
當前月份: {CURRENT_MONTH} = 執行當月
```

## 重要修正說明
```
✅ 時間動態化: 使用變數而非固定日期
✅ 移除關鍵字限制: 官方網站全面爬取
✅ 增加權威媒體: 包含台灣主流媒體
✅ 驗證來源可靠性: 確認日期可獲取性
```

---

## 第一階段：官方網站全面爬取指令

> **策略變更**: 全面爬取，不限制關鍵字，避免資料過度狹隘

### 優先級 A (AI/ML 領域) - 立即執行
```
CRAWL_ALL https://huggingface.co/blog TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "所有技術更新、產品發布、社群動態" TYPE "official_website" ID "A1"

CRAWL_ALL https://openai.com/news/ TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "所有產品發布、研究成果、企業動態" TYPE "official_website" ID "A2" NOTE "使用英文版"

CRAWL_ALL https://www.anthropic.com/news TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "所有研究發布、產品更新、安全相關內容" TYPE "official_website" ID "A3"

CRAWL_ALL https://manus.im/updates TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "所有平台功能、產品發布、技術創新" TYPE "official_website" ID "A4"
```

### 優先級 B (開發工具) - 次要執行
```
CRAWL_ALL https://github.com/features/copilot/whats-new TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "所有功能發布、整合更新、開發者工具" TYPE "official_website" ID "B1"

CRAWL_ALL https://github.com/newsroom TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "所有平台政策、功能更新、社群動態" TYPE "official_website" ID "B2"

CRAWL_ALL https://github.com/trending?since=weekly&spoken_language_code= TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "週度熱門專案、新興技術、開源動態" TYPE "official_website" ID "B3"

SEARCH_RELATED https://you.com TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "find_news_sections" FOCUS "產品更新、功能發布、技術創新" TYPE "official_website" ID "B4"
```

### 優先級 C-E (其他官方網站) - 標準執行
```
CRAWL_ALL https://www.apple.com/newsroom/ TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "所有產品發布、軟體更新、企業動態" TYPE "official_website" ID "C1"

CRAWL_ALL https://news.microsoft.com/source TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "所有產品更新、企業服務、技術創新" TYPE "official_website" ID "C2"

CRAWL_ALL https://azure.microsoft.com/en-us/blog/ TIMERANGE "{START_DATE} to {END_DATE}" STRATEGY "comprehensive" FOCUS "所有雲端服務、企業解決方案、技術更新" TYPE "official_website" ID "C3"

[... 其他 C、D、E 級任務，使用相同的 CRAWL_ALL 策略]
```

---

## 第二階段：動態關鍵字新聞搜尋指令

### 動態搜尋模板系統

#### 基本搜尋模板
```
SEARCH_DYNAMIC "{KEYWORD}" 新聞 最近{DAYS_RANGE}天 SITES "{TARGET_SITES}" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "{TASK_ID}"
```

#### 進階搜尋模板
```
SEARCH_TIMERANGE "{KEYWORD}" after:{START_DATE} before:{END_DATE} SITES "{TARGET_SITES}" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "{TASK_ID}"

SEARCH_MONTHLY "{KEYWORD}" 新聞 {CURRENT_YEAR}年{CURRENT_MONTH}月 SITES "{TARGET_SITES}" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "{TASK_ID}"

SEARCH_SITE_SPECIFIC site:techcrunch.com OR site:theverge.com OR site:ithome.com.tw "{KEYWORD}" TIMERANGE "{START_DATE} to {END_DATE}" TYPE "keyword_search" ID "{TASK_ID}"
```

### 高優先級關鍵字搜尋 (AI/ML 相關)
```
SEARCH_DYNAMIC "Hugging Face" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,iThome,科技新報,聯合新聞網" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S1"

SEARCH_DYNAMIC "OpenAI" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,Wired,iThome,數位時代" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S2"

SEARCH_DYNAMIC "Anthropic" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,VentureBeat,科技新報,風傳媒" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S3"

SEARCH_DYNAMIC "YouAI" OR "You.com AI" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,VentureBeat,INSIDE,關鍵評論網" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S4"

SEARCH_DYNAMIC "GitHub Copilot" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,InfoWorld,iThome,T客邦" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S5"

SEARCH_DYNAMIC "Manus AI" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,VentureBeat,科技新報,數位時代" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S6"

SEARCH_DYNAMIC "Grok AI" OR "xAI Grok" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,Wired,iThome" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S7"
```

### 科技巨頭關鍵字搜尋
```
SEARCH_DYNAMIC "Apple" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,Engadget,數位時代,聯合新聞網" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S8"

SEARCH_DYNAMIC "Microsoft" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,ZDNet,ComputerWorld,iThome,中時新聞網" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S9"

SEARCH_DYNAMIC "Microsoft Azure" 新聞 最近{DAYS_RANGE}天 SITES "InfoWorld,ZDNet,CIO,iThome,商業周刊" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S10"

SEARCH_DYNAMIC "Nvidia" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,Ars Technica,T客邦,科技新報" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S11"

SEARCH_DYNAMIC "Tesla" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,Electrek,科技新報,自由電子報" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S12"

SEARCH_DYNAMIC "Meta" OR "Facebook" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,VentureBeat,數位時代,ETtoday" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S13"

SEARCH_DYNAMIC "Google" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,The Verge,Ars Technica,iThome,聯合新聞網" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S17"
```

### 其他服務關鍵字搜尋
```
SEARCH_DYNAMIC "Cloudflare" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,ZDNet,InfoWorld,iThome" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S14"

SEARCH_DYNAMIC "Perplexity AI" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,VentureBeat,The Verge,科技新報" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S15"

SEARCH_DYNAMIC "Amazon AWS" 新聞 最近{DAYS_RANGE}天 SITES "InfoWorld,ZDNet,CIO,ComputerWorld,天下雜誌" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S16"

SEARCH_DYNAMIC "Vultr" 新聞 最近{DAYS_RANGE}天 SITES "TechRadar,InfoWorld,iThome" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S18"

SEARCH_DYNAMIC "DigitalOcean" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,InfoWorld,iThome,INSIDE" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S19"

SEARCH_DYNAMIC "Kamatera" 新聞 最近{DAYS_RANGE}天 SITES "InfoWorld,TechRadar,科技新報" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S20"

SEARCH_DYNAMIC "Ollama AI" 新聞 最近{DAYS_RANGE}天 SITES "TechCrunch,GitHub,開發者社群,iThome" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S21"
```

### 綜合搜尋
```
SEARCH_DYNAMIC "AI 人工智慧" OR "雲端運算" OR "科技新聞" 新聞 最近{DAYS_RANGE}天 SITES "綜合新聞媒體,科技媒體,台灣主流媒體" FOCUS "所有相關新聞報導" TYPE "keyword_search" ID "S22"
```

---

## 權威媒體網站清單（已驗證）

### 國際科技媒體 ✅
```
VERIFIED_INTERNATIONAL_SITES [
  "https://techcrunch.com/",      # 權威、有日期
  "https://www.theverge.com/",    # 權威、有日期
  "https://arstechnica.com/",     # 權威、有日期
  "https://www.wired.com/",       # 權威、有日期
  "https://venturebeat.com/",     # 權威、有日期
  "https://www.techradar.com/",   # 權威、有日期
  "https://www.engadget.com/"     # 權威、有日期
]
```

### 台灣科技媒體 ✅
```
VERIFIED_TAIWAN_TECH_SITES [
  "https://www.ithome.com.tw/",   # 權威、有日期
  "https://technews.tw/",         # 權威、有日期
  "https://www.inside.com.tw/",   # 權威、有日期
  "https://www.bnext.com.tw/",    # 權威、有日期
  "https://www.techbang.com/"     # 權威、有日期
]
```

### 台灣主流新聞媒體 ✅
```
VERIFIED_TAIWAN_MAINSTREAM_SITES [
  "https://udn.com",              # 聯合新聞網 - 權威、有日期
  "https://www.chinatimes.com",   # 中時新聞網 - 權威、有日期
  "https://news.ltn.com.tw",      # 自由電子報 - 權威、有日期
  "https://www.ettoday.net",      # ETtoday 新聞雲 - 權威、有日期
  "https://www.storm.mg",         # 風傳媒 - 權威、有日期
  "https://www.thenewslens.com"   # 關鍵評論網 - 權威、有日期
]
```

### 企業與財經媒體 ✅
```
VERIFIED_BUSINESS_SITES [
  "https://www.infoworld.com/",           # 權威、有日期
  "https://www.zdnet.com/",               # 權威、有日期
  "https://www.computerworld.com/",       # 權威、有日期
  "https://www.cio.com/",                 # 權威、有日期
  "https://www.businessweekly.com.tw/",   # 商業周刊 - 權威、有日期
  "https://www.cw.com.tw/",               # 天下雜誌 - 權威、有日期
  "https://www.businesstoday.com.tw/"     # 今周刊 - 權威、有日期
]
```

---

## 動態輸出格式指令
```
OUTPUT_DYNAMIC_FORMAT {
  "title": "新聞標題",
  "date": "{DETECTED_DATE} 或 *未知時間",
  "url": "完整網址",
  "content_summary": "內容摘要（不限制關鍵字）",
  "rating": "1-5星重要性",
  "task_type": "official_website 或 keyword_search",
  "task_id": "任務編號 (如 A1, S1)",
  "source_type": "官方網站 或 新聞媒體",
  "source_authority": "權威性評級",
  "time_range": "{START_DATE} to {END_DATE}",
  "collection_strategy": "comprehensive 或 keyword_based"
}
```

---

## 動態過濾與整合規則
```
DYNAMIC_FILTER_RULES {
  "date_range": "{START_DATE} to {END_DATE}",
  "time_expressions": [
    "最近{DAYS_RANGE}天",
    "{CURRENT_YEAR}年{CURRENT_MONTH}月",
    "本週", "本月", "近期", "最新"
  ],
  "content_strategy": {
    "official_websites": "comprehensive_no_keyword_limits",
    "news_searches": "keyword_based_with_full_coverage",
    "filtering_basis": "time_and_authority_not_keywords"
  },
  "time_handling": {
    "有明確日期": "優先使用",
    "無日期但近期": "標記*未知時間",
    "無法確定": "忽略"
  },
  "deduplication": {
    "same_title": "保留最權威來源",
    "same_content": "合併多個來源",
    "official_vs_news": "優先保留官方來源",
    "comprehensive_vs_keyword": "優先保留全面爬取結果"
  }
}
```

---

## 執行順序與品質保證
```
EXECUTION_ORDER [
  "1. 設定動態時間變數 ({TODAY}, {START_DATE}, {END_DATE})",
  "2. 執行官方網站全面爬取 (A1-E4) - 無關鍵字限制",
  "3. 執行高優先級關鍵字搜尋 (S1-S7)",
  "4. 執行其他關鍵字搜尋 (S8-S22)",
  "5. 整合結果並智能去重",
  "6. 按重要性和時間排序",
  "7. 品質檢查和來源驗證"
]

QUALITY_ASSURANCE {
  "時間動態性": "確認所有時間變數正確替換",
  "內容完整性": "確認官方網站無關鍵字限制",
  "來源權威性": "僅使用已驗證的權威媒體",
  "日期可獲取性": "確認所有來源能提供發布日期",
  "去重智能化": "基於內容和權威性，非簡單重複",
  "覆蓋範圍": "確保不因關鍵字限制遺漏重要內容"
}

ERROR_HANDLING {
  "時間變數錯誤": "使用預設值並記錄",
  "官方網站無回應": "記錄並稍後重試",
  "搜尋無結果": "嘗試不同時間表達方式",
  "日期無法獲取": "按規則標記或忽略",
  "內容過濾失敗": "保留原始內容，後續人工檢查"
}
```

