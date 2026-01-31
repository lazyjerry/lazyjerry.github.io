# 詳細資料筆記

## GitHub Copilot SDK (2026-01-22)

**來源**: https://github.blog/news-insights/company-news/build-an-agent-into-any-app-with-the-github-copilot-sdk/

**發布日期**: 2026-01-22 (更新於 2026-01-23)

**核心功能**:
- 現已進入技術預覽階段
- 允許開發者將 GitHub Copilot 的代理核心嵌入任何應用程式
- 提供程式化訪問與 GitHub Copilot CLI 相同的生產測試執行循環
- 支援多個 AI 模型、自訂工具定義、MCP 伺服器整合、GitHub 身份驗證和即時串流

**Copilot CLI 新功能**:
- 持久記憶、無限會話和智能壓縮
- 探索、規劃和審查工作流程，可在每個步驟選擇不同模型
- 自訂代理、代理技能、完整 MCP 支援和非同步任務委派

**實際應用案例**:
- YouTube 章節生成器
- 自訂代理 GUI
- 語音到命令工作流程
- AI 競技遊戲
- 摘要工具

**技術優勢**:
- 無需從頭構建代理工作流程
- 無需管理跨回合的上下文、編排工具和命令、在模型之間路由
- GitHub 處理身份驗證、模型管理、MCP 伺服器、自訂代理和聊天會話加串流

---

## Anthropic Claude for Healthcare & Life Sciences (2026-01-11)

**來源**: https://www.anthropic.com/news/healthcare-life-sciences

**發布日期**: 2026-01-11

### Claude for Healthcare

**新增連接器**:
1. **CMS Coverage Database** - 包含本地和國家覆蓋範圍決定
2. **ICD-10** - 診斷和程序代碼查詢
3. **National Provider Identifier Registry** - 提供者驗證和認證
4. **PubMed** - 超過 3500 萬篇生物醫學文獻

**新增 Agent Skills**:
- FHIR 開發技能
- 預授權審查技能範本

**醫療應用場景**:
1. **加速預授權審查** - 從數小時縮短審查時間
2. **支援理賠申訴** - 整合患者記錄、覆蓋政策、臨床指南
3. **協調護理和分類患者訊息** - 識別需要立即關注的事項
4. **支援醫療新創公司** - 開發新產品，如臨床文件的環境腳本

**個人健康數據整合** (Beta):
- HealthEx 連接器
- Function 連接器
- Apple Health 整合 (iOS app)
- Android Health Connect 整合 (Android app)
- 用戶可完全控制分享的資訊，隨時可斷開或編輯權限
- 不使用用戶健康數據訓練模型

### Claude for Life Sciences

**新增連接器**:
1. **Medidata** - 臨床試驗解決方案，提供歷史試驗註冊資訊
2. **ClinicalTrials.gov** - 美國臨床試驗註冊處
3. **ToolUniverse** - 超過 600 個經過審查的科學工具庫
4. **bioRxiv & medRxiv** - 生命科學預印本伺服器
5. **Open Targets** - 潛在治療藥物靶點識別
6. **ChEMBL** - 生物活性化合物和藥物數據庫
7. **Owkin** - 病理學探索代理，分析組織圖像

**現有連接器**:
- Benchling (現可透過 Claude.ai 網頁版訪問，支援 SSO)
- 10x Genomics
- PubMed
- BioRender
- Synapse.org
- Wiley Scholar Gateway

**新增 Agent Skills**:
- 科學問題選擇
- 儀器數據轉換為 Allotrope
- scVI-tools 生物資訊學技能包
- Nextflow 部署
- 臨床試驗方案草稿生成

**生命科學應用場景**:
1. **起草臨床試驗方案** - 考慮 FDA 和 NIH 要求
2. **臨床試驗運營** - 追蹤註冊和站點表現指標
3. **準備監管提交** - 識別監管文件中的差距，起草對機構查詢的回應

**模型改進**:
- Claude Opus 4.5 在醫療和科學任務的代理性能評估中取得重大進步
- 在誠實度評估套件中產生正確答案的改進，反映在事實幻覺方面的進展


---

## NVIDIA 與 Intel 合作 (2026-01-27)

**來源**: https://www.tweaktown.com/news/109914/nvidia-rumored-to-outsource-to-intel-in-2028-collaborate-on-next-gen-feynman-architecture/index.html

**發布日期**: 2026-01-27 (發布於 3 days ago)

**核心內容**:
- NVIDIA 計劃在 2028 年將部分 Feynman GPU 生產外包給 Intel
- 採用雙代工廠模式，分散供應風險
- 策略為「低產量、低階、非核心」為主

**技術細節**:
- GPU 晶片將外包給 TSMC
- I/O 晶片將「部分」採用 Intel 18A 或 Intel 14A 製程
- Intel 14A 將於 2028 年量產
- 使用 Intel 的 EMIB 進行先進封裝
- Intel 負責約 25% 的先進封裝，TSMC 負責約 75%

**背景**:
- NVIDIA 於 2025 年 9 月宣布對 Intel 投資 50 億美元
- 目標是配合川普政府的美國製造目標
- 在不損害與 TSMC 合作關係的前提下實現供應鏈多元化

**戰略意義**:
- 應對 TSMC 主導先進製程和先進封裝的風險
- 符合美國半導體製造的「重責大任」
- 解決成本問題和產能短缺

---

## Microsoft Office Zero-Day CVE-2026-21509 (2026-01-27)

**來源**: https://thehackernews.com/2026/01/microsoft-issues-emergency-patch-for.html

**發布日期**: 2026-01-27

**漏洞詳情**:
- CVE-2026-21509，CVSS 評分 7.8/10.0
- 高嚴重性 Microsoft Office 零日漏洞
- 正被積極利用於攻擊中
- 被描述為 Microsoft Office 中的安全功能繞過

**技術描述**:
- 繞過 Microsoft 365 和 Microsoft Office 中的 OLE 緩解措施
- 這些緩解措施原本保護用戶免受易受攻擊的 COM/OLE 控制項影響
- 依賴於 Microsoft Office 安全決策中的不可信輸入

**攻擊方式**:
- 攻擊者發送特製的 Office 文件
- 說服收件人打開文件
- 預覽窗格不是攻擊向量

**修補措施**:
1. **Office 2021 及更新版本**: 透過服務端變更自動保護，需重啟 Office 應用程式
2. **Office 2016 和 2019**: 需安裝更新
   - Office 2019 (32-bit): 16.0.10417.20095
   - Office 2019 (64-bit): 16.0.10417.20095
   - Office 2016 (32-bit): 16.0.5539.1001
   - Office 2016 (64-bit): 16.0.5539.1001

**緩解措施**: Windows Registry 變更（詳細步驟已提供）

**官方回應**:
- Microsoft Threat Intelligence Center (MSTIC) 發現
- Microsoft Security Response Center (MSRC) 參與
- Office Product Group Security Team 協助
- 未分享攻擊的性質和範圍

**監管要求**:
- 美國 CISA 已將此漏洞加入 KEV 目錄
- 要求聯邦民事行政部門機構在 2026 年 2 月 16 日前應用修補程式

---

## Cloudflare 收購 Astro (2026-01-16)

**來源**: https://www.cloudflare.com/press/press-releases/2026/cloudflare-acquires-astro-to-accelerate-the-future-of-high-performance-web-development/

**發布日期**: 2026-01-16

**收購詳情**:
- Cloudflare 收購 The Astro Technology Company 團隊
- Astro 將保持開源，確保長期成長和發展
- Cloudflare 承諾 Astro 成為內容驅動網站的最佳框架

**Astro 簡介**:
- 流行的 JavaScript 網頁框架
- 被 Unilever、Visa、NBC News 等主要品牌使用
- 數十萬開發者使用
- 用於構建快速、內容驅動的網站

**技術優勢**:
- 每個網頁僅載入顯示頁面所需的最關鍵代碼
- 優化速度和性能
- 搜尋引擎優先考慮快速載入、乾淨的頁面
- 依賴 JavaScript 進行初始渲染的網站常難以達到此速度

**Astro 6 Beta**:
- 本週推出 Astro 6 測試版
- 支援額外的 JavaScript 執行時
- 改善性能並加快構建時間

**現有應用**:
- Webflow 和 Wix 等成功平台已在 Cloudflare 上運行 Astro

**開源承諾**:
- 繼續支援開源貢獻
- 透過 Astro Ecosystem Fund 與產業夥伴合作
- 夥伴包括 Webflow、Netlify、Wix 和 Sentry

**CEO 聲明**:
- Matthew Prince (Cloudflare): 「保護和投資開源工具對於健康、自由和開放的互聯網至關重要」
- Fred Schott (Astro): 「加入 Cloudflare 讓我們能夠更快、更大規模地加速 Astro 的發展」

**戰略意義**:
- 確保 Astro 成為內容驅動網站的最佳網頁框架
- 不僅是現在，而是未來多年
- 開發者可以在 Cloudflare 或其他地方託管
