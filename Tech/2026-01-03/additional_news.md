# 補充科技新聞整理

## AI 科技

### OpenAI 與 Anthropic 共同創立 Agentic AI Foundation
- **來源**: OpenAI 官方部落格
- **日期**: 2025-12-09
- **URL**: https://openai.com/index/agentic-ai-foundation/
- **權重評估**: 高權重（官方發布 + 直接影響開發者 + 明確日期）
- **關鍵內容**:
  - OpenAI、Anthropic 和 Block 共同創立 Agentic AI Foundation (AAIF)，隸屬於 Linux Foundation
  - 獲得 Google、Microsoft、AWS、Bloomberg 和 Cloudflare 的支持
  - OpenAI 貢獻 AGENTS.md 標準格式，為 AI 代理提供專案特定的指令與上下文
  - Anthropic 貢獻 Model Context Protocol (MCP)，Block 貢獻 goose
  - AGENTS.md 自 2025 年 8 月發布以來，已被超過 60,000 個開源專案採用
  - 支援的工具包括：Amp、Codex、Cursor、Devin、Factory、Gemini CLI、Github Copilot、Jules 和 VS Code
  - 目標：建立開放、可互操作的基礎設施，防止 AI 代理生態系統碎片化
  - Linux Foundation 提供中立治理，確保沒有單一公司控制方向

---

### Google 發布 Gemini 3 Flash 與 12 月 AI 更新
- **來源**: Google 官方部落格
- **日期**: 2025-12-29
- **URL**: https://blog.google/technology/ai/google-ai-updates-december-2025/
- **權重評估**: 高權重（官方發布 + 直接影響開發者 + 明確日期）
- **關鍵內容**:
  - 發布 Gemini 3 Flash：結合前沿智能與高速運算，成本顯著降低
  - Gemini 3 Flash 已成為 Gemini app 和 AI Mode in Search 的預設模型
  - 在 Gemini app 中新增 AI 影片驗證工具，可上傳最多 100MB 或 90 秒的影片，使用 SynthID 浮水印技術分析
  - 推出 Disco 瀏覽體驗與 GenTabs 實驗，將分散的瀏覽器分頁整合為互動式網頁應用
  - 升級 Gemini 2.5 Flash Native Audio，支援更自然的語音互動
  - 在 Google Translate app 中推出即時語音翻譯測試版，支援 70+ 種語言
  - 發布新的 Gemini Deep Research agent，透過 Interactions API 提供給開發者
  - 開源 DeepSearchQA benchmark，用於測試研究代理的效能
  - 擴展 Gemini 3 Pro 和 Nano Banana Pro 至近 120 個國家和地區的 AI Mode in Search
  - 推出虛擬試穿工具更新，只需自拍照即可生成全身數位形象

---

## 軟體工程

### TypeScript 7 開發進度報告（Project Corsa）
- **來源**: Microsoft TypeScript 官方部落格
- **日期**: 2025-12-02
- **URL**: https://devblogs.microsoft.com/typescript/progress-on-typescript-7-december-2025/
- **權重評估**: 高權重（官方發布 + 直接影響開發者 + 明確日期）
- **關鍵內容**:
  - TypeScript 團隊正將編譯器與語言服務移植至原生程式碼（Project Corsa），即將成為 TypeScript 7.0
  - 原生預覽版已可在 VS Code Marketplace 下載，每日更新
  - 語言服務已實作大部分核心功能：自動完成（含自動匯入）、跳轉定義、重新命名、尋找所有參考等
  - 編譯器已發布每日預覽版本，套件名稱為 @typescript/native-preview
  - 型別檢查幾乎完成：在約 20,000 個測試案例中，僅 74 個案例與 TypeScript 6.0 有差異
  - 支援 --incremental、專案參考與 --build 模式
  - 效能提升顯著：相較於 TypeScript 6.0，完整建置速度提升近 10 倍
    - sentry: 133.08s → 16.25s (8.19x)
    - vscode: 89.11s → 8.74s (10.2x)
    - typeorm: 15.80s → 1.06s (9.88x)
    - playwright: 9.30s → 1.24s (7.51x)
  - TypeScript 7.0 將移除 TypeScript 6.0 中計畫棄用的功能：
    - --strict 將預設啟用
    - --target 預設為最新穩定的 ECMAScript 目標
    - 移除 --target es5，最低支援 es2015
    - 移除 --baseUrl
    - 移除 --moduleResolution node10
  - TypeScript 6.0 將是最後一個基於 JavaScript 的版本

---

### TSMC 開始量產業界最先進的 2nm 晶片
- **來源**: AFP / Yahoo Finance
- **日期**: 2025-12-30
- **URL**: https://finance.yahoo.com/news/tsmc-says-started-mass-production-003648419.html
- **權重評估**: 高權重（權威通訊社 + 重大產業突破 + 明確日期）
- **關鍵內容**:
  - TSMC 宣布其 2nm (N2) 製程技術已於 2025 年第四季如期開始量產
  - 這是半導體產業在密度與能源效率方面最先進的技術
  - 採用領先的奈米片電晶體結構（nanosheet transistor structure），提供完整節點的效能與功耗優勢
  - 生產地點：新竹的 Fab 20 與高雄的 Fab 22
  - TSMC 的客戶包括 NVIDIA 和 Apple
  - 全球超過半數的半導體，以及幾乎所有用於 AI 技術的最先進晶片，都在台灣製造
  - AI 相關支出預計在 2025 年達到約 1.5 兆美元，2026 年將超過 2 兆美元（接近全球 GDP 的 2%）
  - TSMC 已在美國、日本和德國投資晶片製造設施，但最先進的晶片仍計畫在台灣本土生產

---


## 待補充領域整理

### 現場表演藝術
- 搜尋結果顯示此領域在指定時間範圍內缺乏高權重來源
- 大部分來源為教育機構活動或地方性展演，不符合權重標準
- 建議：此領域暫不納入報告

### 其他領域科技應用突破
- Forbes 文章因網站限制無法訪問
- Google 2025 年研究突破回顧（已在搜尋結果中）
- Axios AI 驅動的科學突破報導

### 已確認高權重新聞（待補充至報告）

#### AI 科技
1. OpenAI 與 Anthropic 共同創立 Agentic AI Foundation (2025-12-09) ✓ 已記錄
2. Google Gemini 3 Flash 發布與 12 月 AI 更新 (2025-12-29) ✓ 已記錄

#### 軟體工程
1. TypeScript 7 開發進度報告 (2025-12-02) ✓ 已記錄

#### 硬體或軟硬整合
1. TSMC 開始量產 2nm 晶片 (2025-12-30) ✓ 已記錄

#### 軟硬體資訊安全
1. Top CVEs of December 2025（Strobes Security，2026-01-02）- 待瀏覽
2. Microsoft December 2025 Patch Tuesday（多個來源）- 待瀏覽

#### 網路/伺服器等基礎
1. Palo Alto Networks 與 Google Cloud 合作（2025-12-19）- 待瀏覽
2. AWS European Sovereign Cloud 啟動（2025-12 Brandenburg）- 待瀏覽

#### 金融科技
- 已在原報告中涵蓋穩定幣監管發展

#### 醫療科技
1. HHS 發布 AI 戰略（2025-12-04）- 已在原報告中涵蓋
2. FDA 推出 agentic AI 平台（2025-12-01）- 待補充
3. 47 州推出醫療 AI 法案（2025-12-17）- 待補充

---

### Palo Alto Networks 與 Google Cloud 擴大戰略合作，強化 AI 與雲端安全
- **來源**: Google Cloud 官方新聞稿
- **日期**: 2025-12-19
- **URL**: https://www.googlecloudpresscorner.com/2025-12-19-Palo-Alto-Networks-and-Google-Cloud-Forge-Landmark-Agreement-to-Help-Customers-Securely-Accelerate-Cloud-and-AI-Initiatives
- **權重評估**: 高權重（官方發布 + 重大企業合作 + 明確日期）
- **關鍵內容**:
  - Palo Alto Networks 與 Google Cloud 宣布大幅擴展戰略合作關係
  - 結合 Google Cloud 的 AI 與基礎設施能力，以及 Palo Alto Networks 的 Prisma AIRS AI 安全平台
  - Palo Alto Networks 2025 年 12 月發布的雲端安全報告顯示：99% 的受訪者在過去一年中至少遭受一次 AI 基礎設施攻擊
  - 合作內容包括：
    - 端到端 AI 安全：保護 Google Cloud 上的 AI 工作負載，包括 Vertex AI 和 Agent Engine
    - Prisma AIRS 提供 AI 態勢管理、AI 執行時期安全、AI 代理安全、AI 紅隊測試和 AI 模型安全
    - AI 驅動的新一代軟體防火牆：VM-Series 防火牆深度整合 Google Cloud
    - AI 驅動的 SASE 平台：Prisma SASE 在 Google 網路上運行
  - 雙方已有超過 75 個聯合整合，透過 Google Cloud Marketplace 創造 20 億美元銷售額
  - Palo Alto Networks 將關鍵內部工作負載遷移至 Google Cloud，達成數十億美元的新協議
  - Palo Alto Networks 使用 Google Cloud 的 Vertex AI 平台和 Gemini LLM 來驅動其 Co-pilots

---

