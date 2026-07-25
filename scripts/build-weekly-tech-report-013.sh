#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TASK="$ROOT/docs/tech-report-research/weekly-tech-report-013"

write_initial_files() {
  cat > "$TASK/prompt.md" <<'EOF'
# 任務請求：科技服務資訊週記

## 原始請求

```text
/tech-report-research
建立本期「科技服務資訊週記」，整理今天（2026-07-25）起往前 15 天內的科技資訊，
撰寫繁體中文技術報告，依必要分類整理，並套用本 repo 的研究流程、來源、格式、
引用與知識庫規範。完成後複製交付物到 tech/2026-07-25/。
```

## 期望產出

- [ ] 一份本期科技服務資訊週記
- [ ] 一份候選來源整理 source.md
- [ ] 一份研究計劃與執行紀錄

**產出類型：**
- 文件：報告、來源整理、筆記、任務計劃
- 程式碼：固定產生與同步上述文件的 shell script
- 其他：`tech/2026-07-25/` 交付資料夾

## 任務設定

- 報告日期：2026-07-25
- 時間範圍：2026-07-10 至 2026-07-25（今天往前 15 天）
- 標題格式：`2026-07-25 科技服務資訊週記`
- 作者欄位：Codex
- 目標讀者：程式設計師
- 指定交付日期：2026-07-25

## 必要分類

- AI 科技
- 軟體工程
- 軟硬體資訊安全
- 硬體或軟硬整合
- 網路/伺服器等基礎
- 金融科技
- 醫療科技
- 運輸物流
- 房地產與室內外裝潢
- 現場表演藝術
- 影視音樂
- 其他領域科技應用突破

## 四大段落要求

1. 總結：100 至 300 字，統整本期重點，標註來源編號。
2. 亮點：依分類條列，每項先一句話結論，再補 100 至 300 字說明，儘量加入具體例子或譬喻，並標註來源編號。
3. 趨勢分析：依分類歸納可能趨勢與更深層觀察，儘量加入具體例子或譬喻，並標註來源編號。
4. 參考資料：表格欄位包含編號、標題與 Google 搜尋連結、一句話結論、發布日期、來源網址與名稱、分類。

## 來源時間範圍與權重規則

- 僅使用 2026-07-10 至 2026-07-25 內發布的資料。
- 優先採用日期明確、高權重且來自台灣主流媒體或權威科技來源的資料。
- 中國來源或社群平台優先以高權重來源替換，無可替換者刪除。
- 無法確認落在 15 天內者直接排除；確認在窗內但無精確日期者標記 `*未知時間`。

## source.md 蒐集格式要求

每筆候選來源至少包含：來源網址、繁體中文標題、100 至 500 字繁體中文摘要、權重分數（`1-10/10`）、發布日期、分類、是否納入正式參考資料。淘汰來源須註明原因。

## 完成前檢查要求

- 各分類是否缺少資料；缺漏須明確註記原因
- 資訊權重是否足夠
- 搜尋時間範圍是否正確（2026-07-10 至 2026-07-25）
- 資料來源的網址、來源網站名稱、發布日期與引用對應是否一致
- 內文引用編號與參考資料表編號是否一致
- 錯誤來源或整理內容是否已修正

## 參考文件

| 檔案路徑 | 引用範圍描述 |
|----------|--------------|
| `references/report-spec.md` | 完整規格 |
| `references/file-structure.md` | 任務資料夾與必要檔案 |
| `references/rules.md` | 執行規則與反模式 |
| `references/knowledge-base.md` | 知識庫使用規範 |
| `assets/weekly-report-template.md` | 報告模板 |
| `docs/tech-report-research/knowledge/*` | 專案客製知識 |
EOF

  cat > "$TASK/task_plan.md" <<'EOF'
# 任務計劃：科技服務資訊週記

## 目標
完成符合本 repo 規格的科技服務資訊週記（報告日期 2026-07-25，時間範圍 2026-07-10 至 2026-07-25），並輸出完整研究過程與交付檔案。

## 執行模式
一次完成

## 階段
- [x] 階段 1：確認報告日期、15 天時間範圍與必要分類
  - [x] 讀取規格、模板與五項專案知識
  - [ ] 階段檢核：更新 notes.md → task_plan.md
- [ ] 階段 2：蒐集候選來源並整理 source.md
- [ ] 階段 3：依權重篩選正式參考資料
- [ ] 階段 4：檢查各分類是否缺漏
- [ ] 階段 5：撰寫總結、亮點與趨勢分析
- [ ] 階段 6：整理參考資料表與內文引用
- [ ] 階段 7：完成前檢查
- [ ] 階段 8：依模板完成 report.md
- [ ] 階段 9：複製交付物到 `tech/2026-07-25/`

## 關鍵問題
1. 哪些分類目前資料不足，需要補搜？
2. 哪些來源雖然相關，但應因日期或可信度而排除？
3. 內文引用與參考資料編號是否完全一致？

## 已做決策
- 任務資料夾：`weekly-tech-report-013`
- 報告模板來源：`assets/weekly-report-template.md`
- 作者欄位：Codex
- 交付日期：2026-07-25

## 遇到的錯誤
- 無。

## 狀態
**目前階段 2** - 蒐集並逐筆查核來源。
EOF
}

write_final_files() {
  cat > "$TASK/source.md" <<'EOF'
# 候選來源整理

## 正式納入來源

### 1. OpenAI 推出 Presence 企業代理
- 來源網址：https://openai.com/index/introducing-openai-presence/
- 繁體中文標題：OpenAI Presence 將企業 AI 代理帶入受治理的正式營運
- 摘要：OpenAI 於 7 月 22 日推出 Presence，讓企業針對客服、理賠與內部 IT 等明確工作部署 AI 代理。產品把模型與權限、政策、防護、模擬評測、人工轉接及上線後監控整合，變更也須先與正式版本比較測試再核准。這顯示企業代理的競爭焦點已從示範能力轉向可控制、可評測與可持續改善的營運系統。
- 權重分數：10/10
- 發布日期：2026-07-22
- 分類：AI 科技
- 是否納入正式參考資料：是

### 2. iThome 查核 Presence 的實際使用情境
- 來源網址：https://www.ithome.com.tw/news/177578
- 繁體中文標題：OpenAI 推出 Presence 企業 AI 代理，自家電話客服 75% 案件無須真人處理
- 摘要：iThome 於 7 月 23 日整理 Presence 的權限、人工核准、上線前模擬與漸進部署機制，並補充 OpenAI 英文電話客服已有 75% 來電不需真人介入。報導提供台灣技術讀者較容易核對的產品脈絡，也提醒此服務目前只對符合資格的企業有限度供應，並非一般使用者可自行開通的產品。
- 權重分數：9/10
- 發布日期：2026-07-23
- 分類：AI 科技
- 是否納入正式參考資料：是

### 3. GitHub Code Quality 正式供應
- 來源網址：https://github.blog/changelog/2026-07-20-github-code-quality-is-now-generally-available/
- 繁體中文標題：GitHub Code Quality 將確定性分析、AI 偵測與品質門檻整合進 pull request
- 摘要：GitHub 於 7 月 20 日正式推出 Code Quality，結合 CodeQL 確定性分析、AI 輔助偵測與 Copilot Autofix，針對可維護性和可靠性問題提出修正。正式版加入組織儀表板、測試涵蓋率、ruleset 品質門檻及 API。這讓 AI 產碼後的品質治理能在合併前形成可量測、可逐步導入的固定流程。
- 權重分數：10/10
- 發布日期：2026-07-20
- 分類：軟體工程
- 是否納入正式參考資料：是

### 4. Oracle 2026 年 7 月 Critical Patch Update
- 來源網址：https://www.oracle.com/security-alerts/cpujul2026.html
- 繁體中文標題：Oracle 7 月 Critical Patch Update 提供 1,449 項新安全修補
- 摘要：Oracle 於 7 月 21 日發布季度 Critical Patch Update，涵蓋 32 個產品家族並提供 1,449 項新安全修補。其中 Oracle E-Business Suite 就有 410 項修補，45 項可在未驗證身分下從網路遠端利用。官方再次要求客戶維持受支援版本並儘速套用更新，顯示大型企業套件的修補工作必須依暴露面和無需驗證風險排序。
- 權重分數：10/10
- 發布日期：2026-07-21
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是

### 5. iThome 解析 Oracle 修補規模
- 來源網址：https://www.ithome.com.tw/news/177555
- 繁體中文標題：Oracle 發布 2026 年 7 月關鍵安全修補更新，共修補 1,235 個漏洞
- 摘要：iThome 於 7 月 23 日比對 Oracle 官方更新與資安業者分析，區分 1,449 項更新程式和 1,235 個漏洞，並指出其中 261 個屬重大漏洞、10 個 CVSS 分數達 10.0。報導補足產品家族分布與實際優先順序，避免把「修補程式數」和「漏洞數」混為同一個數字。
- 權重分數：9/10
- 發布日期：2026-07-23
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是

### 6. Intel 與 Fortinet 合作開發 SP6
- 來源網址：https://newsroom.intel.com/manufacturing/intel-and-fortinet-collaborate-to-advance-cybersecurity-innovation-and-strengthen-global-supply-chain-resilience
- 繁體中文標題：Intel 與 Fortinet 合作開發 Security Processor 6
- 摘要：Intel 與 Fortinet 於 7 月 21 日宣布合作開發 Fortinet Security Processor 6（SP6），整合 Fortinet 的專用 ASIC 經驗與 Intel 的晶片設計、先進封裝及製造能力。合作同時追求資安處理效能和供應鏈韌性，反映高流量資安設備仍需以專用硬體處理封包、內容檢查與加密工作，而非把所有工作交給通用 CPU。
- 權重分數：10/10
- 發布日期：2026-07-21
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是

### 7. iThome 補充 SP6 的台灣產業脈絡
- 來源網址：https://www.ithome.com.tw/news/177514
- 繁體中文標題：Intel 攜手 Fortinet 開發 Security Processor 6，推進資安專用 ASIC 晶片布局
- 摘要：iThome 於 7 月 22 日說明 SP6 是 Intel Foundry 對外宣布的重要客戶合作案例，並回顧 Fortinet 既有 FortiSP5 將網路與內容處理整合於單晶片的技術方向。報導將晶圓代工、專用資安晶片和供應鏈多元化放在同一條產業鏈上，補強官方公告未展開的背景。
- 權重分數：9/10
- 發布日期：2026-07-22
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是

### 8. AMD 發表 MI400、EPYC 9006 與 Helios
- 來源網址：https://www.ithome.com.tw/news/177584
- 繁體中文標題：AMD 發表最新 AI 加速器及第六代 EPYC 處理器，挾 Helios 機櫃搶攻 AI 工廠市場
- 摘要：iThome 於 7 月 24 日現場報導 AMD 發表 Instinct MI430X、MI455X、第六代 EPYC 9006 與 Helios 機櫃。AMD 將代理式 AI 拆成執行 agent、供應 GPU 資料和企業服務三種 CPU 工作，說明 AI 基礎建設已由單顆 GPU 比較轉向 CPU、GPU、網路、記憶體與軟體共同最佳化的機櫃級系統。
- 權重分數：9/10
- 發布日期：2026-07-24
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是

### 9. iThome 解析 Amazon EKS 版本回復
- 來源網址：https://www.ithome.com.tw/news/177573
- 繁體中文標題：Amazon EKS 升級增加退路，Kubernetes 控制平面 7 天內可回復前一版本
- 摘要：iThome 於 7 月 23 日整理 Amazon EKS 的 Kubernetes 版本回復機制。管理者可在就地升級後 7 天內將控制平面退回前一個次要版本，系統會檢查 API、節點、附加元件與叢集健康；一般叢集仍需自行處理資料平面，EKS Auto Mode 才能協調節點回復。此功能降低升級的單向門風險，但不能取代相容性測試與備援。
- 權重分數：9/10
- 發布日期：2026-07-23
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是

### 10. Microsoft 與 Mistral 擴大歐洲主權 AI 合作
- 來源網址：https://news.microsoft.com/source/2026/07/21/microsoft-and-mistral-expand-strategic-partnership-to-give-enterprises-and-regulated-industries-frontier-ai-they-can-control/
- 繁體中文標題：Microsoft 與 Mistral 將歐洲 AI 運算延伸到雲端、邊緣與完全隔離環境
- 摘要：Microsoft 與 Mistral 於 7 月 21 日擴大合作，Microsoft 將採用 Mistral 在歐洲擴充的 GPU 容量，並把模型帶入 Microsoft Foundry、Copilot Studio 與 Sovereign Cloud。部署選項涵蓋公有雲、客戶控制環境與完全離線環境，顯示受監管產業對 AI 基礎設施的要求已同時包含模型能力、資料位置、營運控制與離線可用性。
- 權重分數：10/10
- 發布日期：2026-07-21
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是

### 11. Mastercard 擴充企業虛擬卡平臺
- 來源網址：https://www.mastercard.com/news/ap/en/newsroom/press-releases/en/2026/mastercard-expands-virtual-card-platform-with-new-security-controls-embedded-payments-network-and-single-api-access/
- 繁體中文標題：Mastercard 以單一 API、控制規則與嵌入式網路擴充企業虛擬卡
- 摘要：Mastercard 於 7 月 24 日擴充 In Control 虛擬卡平臺，加入發卡端與清算端控制、嵌入式支付合作網路及單一 API 存取。平臺已支援 43 個國家和地區、174 種貨幣。企業支付的數位化不只把卡號虛擬化，也把用途、金額、供應商和清算階段的規則寫進交易流程，以降低詐欺與人工對帳成本。
- 權重分數：10/10
- 發布日期：2026-07-24
- 分類：金融科技
- 是否納入正式參考資料：是

### 12. FDA 選出 TEMPO 首位數位醫療參與者
- 來源網址：https://www.fda.gov/news-events/press-announcements/fda-announces-first-participant-selected-tempo-digital-health-devices-pilot
- 繁體中文標題：FDA 選出 Dexcom 參與 TEMPO 數位健康裝置試辦
- 摘要：FDA 於 7 月 22 日選出 Dexcom 成為 TEMPO 首位參與者，評估 Glucose Health Program 如何以即時資料與 AI 洞察協助糖尿病前期和第二型糖尿病管理。試辦與 CMS ACCESS 支付模式協作，製造商須持續蒐集、監控和回報真實世界資料。監管焦點因此從一次性上市審查延伸到實際成效與支付結果。
- 權重分數：10/10
- 發布日期：2026-07-22
- 分類：醫療科技
- 是否納入正式參考資料：是

### 13. 日本補助自動駕駛卡車落地
- 來源網址：https://www.mlit.go.jp/report/press/tokatsu01_hh_001026.html
- 繁體中文標題：日本國土交通省啟動自動駕駛卡車實裝支援第二次徵件
- 摘要：日本國土交通省於 7 月 13 日啟動補助計畫第二次徵件，支援自動駕駛卡車採購、物流據點改造、運行系統整合與首年營運。補助範圍也涵蓋一對多遠端監控、混合交通及自動裝卸設備串接。政策把車輛、場站、軟體與營運費用一起納入，說明自動物流的瓶頸在完整服務鏈，而非只有車輛能否自行行駛。
- 權重分數：10/10
- 發布日期：2026-07-13
- 分類：運輸物流
- 是否納入正式參考資料：是

### 14. 新加坡推動智慧吊車與營建科技 sandbox
- 來源網址：https://www1.bca.gov.sg/resources/newsroom/new-measures-to-accelerate-productivity-and-innovation-in-the-built-environment-sector/
- 繁體中文標題：新加坡以智慧吊車規範與營建科技 sandbox 加速 Built Environment 創新
- 摘要：新加坡 Building and Construction Authority 於 7 月 17 日公布 Built Environment 新措施，包括在安全條件下放寬智慧吊車必須配置機內操作員的要求，並減免營建科技創新 sandbox 場地租金。政策同時調整法規、試驗場域和成本，讓自動化設備能從展示案進入工地流程。
- 權重分數：10/10
- 發布日期：2026-07-17
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是

### 15. SIGGRAPH 展示即時數位舞蹈工作室
- 來源網址：https://s2026.conference-schedule.org/presentation/?id=gensub_494&sess=sess244
- 繁體中文標題：Impulse 以動作捕捉與 mixed reality 建立即時數位舞蹈工作室
- 摘要：SIGGRAPH 2026 於 7 月 20 日起展示 Impulse: Dawn of the Digital Dance Studio。這套由藝術家打造的 Unreal Engine 工具讓使用者即時擷取動作、套用到多名數位舞者，並在 mixed reality 中調整空間編舞。工具把動作捕捉從昂貴的後期製作設備變成可互動、可反覆試作的創作介面。
- 權重分數：8/10
- 發布日期：2026-07-20
- 分類：現場表演藝術
- 是否納入正式參考資料：是

### 16. Spotify 推出對話式音訊探索
- 來源網址：https://newsroom.spotify.com/2026-07-14/talk-to-spotify-announcement-beta/
- 繁體中文標題：Spotify 開放以文字與語音持續調整音樂、podcast 和有聲書推薦
- 摘要：Spotify 於 7 月 14 日推出 beta 對話功能，成年 Premium 使用者可用文字或語音要求播放內容、查詢收聽紀錄、了解曲目並持續修正推薦。產品把搜尋、播放控制和推薦解釋合併成同一段對話，代表串流服務正從單次查詢轉向可被使用者即時校正的代理式介面。
- 權重分數：9/10
- 發布日期：2026-07-14
- 分類：影視音樂
- 是否納入正式參考資料：是

### 17. NSF 投資 AI 可程式化雲端實驗室
- 來源網址：https://www.nsf.gov/tip/updates/nsf-announces-400m-investment-new-national-network-ai
- 繁體中文標題：NSF 投資 4 億美元建立 AI 可程式化雲端實驗室網路
- 摘要：NSF 於 7 月 22 日宣布投入 3.8 億美元給 20 個團隊，並搭配 Astera Institute 最多 2,000 萬美元，建立全美 AI 自動化實驗室網路。計畫要求重視開放科學、可重用性、可重現性與資料 AI-ready，目標是讓 AI 不只分析既有資料，也能協調儀器、執行實驗並快速發布結果。
- 權重分數：10/10
- 發布日期：2026-07-22
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是

### 18. Google 發表 Gemini 3.6 Flash 等三款模型
- 來源網址：https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-6-flash-3-5-flash-lite-3-5-flash-cyber/
- 繁體中文標題：Google 發表 Gemini 3.6 Flash、3.5 Flash-Lite 與 3.5 Flash Cyber
- 摘要：Google 於 7 月 21 日發表 Gemini 3.6 Flash，主打程式、知識工作與多模態能力，並依 Artificial Analysis Index 比 3.5 Flash 減少 17% 輸出 token（部分基準達 65%），定價為每百萬輸入 token 1.5 美元、輸出 token 7.5 美元。同時推出速度達每秒 350 token 的 3.5 Flash-Lite，以及針對找出並修補資安漏洞微調、僅透過 CodeMender 有限釋出給政府與可信夥伴的 3.5 Flash Cyber。此發布顯示 frontier 模型的競爭已從單純能力比拚轉向「每項任務成本」與任務專用化。
- 權重分數：10/10
- 發布日期：2026-07-21
- 分類：AI 科技
- 是否納入正式參考資料：是

## 淘汰來源

### A. Amazon EKS 官方版本回復公告
- 來源網址：https://aws.amazon.com/about-aws/whats-new/2026/07/amazon-eks-version-rollback/
- 發布日期：2026-07-01
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：否；官方公告早於 2026-07-10，改採時間窗內的 iThome 查核報導。

### B. Waymo 四城市無人駕駛測試
- 來源網址：https://waymo.com/blog/shorts/ro-den-lv-sd-tmpa/
- 發布日期：2026-07-08
- 分類：運輸物流
- 是否納入正式參考資料：否；早於時間窗。

### C. NHTSA 自駕車與第一線應變人員互動要求
- 來源網址：https://www.nhtsa.gov/press-releases/av-developers-automated-vehicle-that-cannot-safely-interact-first-responders-danger
- 發布日期：2026-07-08
- 分類：運輸物流
- 是否納入正式參考資料：否；早於時間窗。

### D. Doris Duke Foundation 表演藝術科技補助
- 來源網址：https://www.dorisduke.org/news/doris-duke-foundation-announces-new-grants-supporting-technology-infrastructure-in-the-performing-arts
- 發布日期：2026-07-06
- 分類：現場表演藝術
- 是否納入正式參考資料：否；早於時間窗。

### E. Spotify Labs 個人化音訊 Studio
- 來源網址：https://newsroom.spotify.com/2026-05-21/studio-by-spotify-labs-launch/
- 發布日期：2026-05-21
- 分類：影視音樂
- 是否納入正式參考資料：否；雖在 7 月 20 日更新 rollout 狀態，原始文章發布日不在時間窗。

### F. Visa Stablecoin Platform
- 來源網址：https://usa.visa.com/about-visa/newsroom/press-releases.releaseId.22591.html
- 發布日期：2026-07-16
- 分類：金融科技
- 是否納入正式參考資料：否；日期符合，但上一期已採用，本期改用 7 月 24 日 Mastercard 虛擬卡更新以避免重複。
EOF

  cat > "$TASK/notes.md" <<'EOF'
# 研究筆記

## 任務設定
- 報告日期：2026-07-25
- 日期窗：2026-07-10 至 2026-07-25
- 作者：Codex、Claude Code
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
EOF

  cat > "$TASK/report.md" <<'EOF'
# 2026-07-25 科技服務資訊週記

**作者：Codex、Claude Code　報告日期：2026-07-25**

## 大綱
- <a href="#summary">總結</a>
- <a href="#highlights">亮點</a>
  - <a href="#hl-ai">AI 科技</a>
  - <a href="#hl-software">軟體工程</a>
  - <a href="#hl-security">軟硬體資訊安全</a>
  - <a href="#hl-hardware">硬體或軟硬整合</a>
  - <a href="#hl-infrastructure">網路/伺服器等基礎</a>
  - <a href="#hl-fintech">金融科技</a>
  - <a href="#hl-healthtech">醫療科技</a>
  - <a href="#hl-logistics">運輸物流</a>
  - <a href="#hl-proptech">房地產與室內外裝潢</a>
  - <a href="#hl-arts">現場表演藝術</a>
  - <a href="#hl-entertainment">影視音樂</a>
  - <a href="#hl-others">其他領域科技應用突破</a>
- <a href="#trends">趨勢分析</a>
  - <a href="#tr-ai">AI 科技</a>
  - <a href="#tr-software">軟體工程</a>
  - <a href="#tr-security">軟硬體資訊安全</a>
  - <a href="#tr-hardware">硬體或軟硬整合</a>
  - <a href="#tr-infrastructure">網路/伺服器等基礎</a>
  - <a href="#tr-fintech">金融科技</a>
  - <a href="#tr-healthtech">醫療科技</a>
  - <a href="#tr-logistics">運輸物流</a>
  - <a href="#tr-proptech">房地產與室內外裝潢</a>
  - <a href="#tr-arts">現場表演藝術</a>
  - <a href="#tr-entertainment">影視音樂</a>
  - <a href="#tr-others">其他領域科技應用突破</a>
- <a href="#references">參考資料</a>
- <a href="#notes">報告說明</a>

<a id="summary"></a>
## 總結
本期的共同訊號是：科技產品正在把「可用」往「可治理、可回復、可量測」推進。OpenAI 把企業代理包進權限、評測與人工轉接流程；GitHub 將程式品質門檻放進 pull request；Oracle 的大型修補則提醒團隊，產碼加速後，漏洞排序與更新能力也要同步擴充。硬體、雲端、醫療、物流、營建與科學實驗都出現相同方向，單點功能正被整合成能在真實制度和營運環境持續運作的系統。[[1. OpenAI]](#ref-1) [[3. GitHub]](#ref-3) [[4. Oracle]](#ref-4) [[12. FDA]](#ref-12) [[17. NSF]](#ref-17)

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技
- **企業代理的門檻已從模型能力轉為營運控制。** OpenAI Presence 讓代理只取得特定工作所需的資料和工具權限，並在上線前用模擬與 grader 檢查政策遵循、工具使用和人工轉接。上線後還能從轉接與品質訊號找出問題，再以受控 rollout 更新。iThome 補充，OpenAI 英文電話客服已有 75% 來電可在不需真人協助下處理，但服務目前仍是有限度正式供應。[[1. OpenAI]](#ref-1) [[2. iThome]](#ref-2)
- **frontier 模型的競爭轉向「每項任務成本」與專用化。** Google 同週發表 Gemini 3.6 Flash，主打程式與多模態能力，並在 Artificial Analysis Index 上比 3.5 Flash 少用 17% 輸出 token；同時推出每秒 350 token 的 3.5 Flash-Lite，以及專為找出並修補漏洞微調、僅有限釋出給政府與可信夥伴的 3.5 Flash Cyber。對開發團隊而言，模型選擇不再只看單一旗艦分數，而要按任務把準確度、延遲與 token 成本分層，並評估專用化模型能否接手通用模型的部分工作。[[18. Google]](#ref-18)

<a id="hl-software"></a>
### 軟體工程
- **Code review 開始同時檢查可維護性、可靠性與測試涵蓋率。** GitHub Code Quality 結合 CodeQL 的確定性分析、AI 輔助偵測和 Copilot Autofix，並能透過 ruleset 設定品質門檻。團隊可先用 evaluate mode 觀察而不阻擋合併，再逐步啟用強制規則。這比單純多一個 AI review bot 更接近工程制度，因為掃描、修正、計量和組織治理都在同一條 pull request 流程內。[[3. GitHub]](#ref-3)

<a id="hl-security"></a>
### 軟硬體資訊安全
- **Oracle 這季修補量暴增，企業需要先按無驗證遠端風險排序。** 官方公告列出 1,449 項新安全修補，iThome 進一步整理為 1,235 個漏洞，其中 261 個屬重大漏洞、10 個 CVSS 分數達 10.0。Oracle E-Business Suite 就有 410 項修補，45 項可在沒有帳密的情況下從網路利用。面對這種規模，做法不能只是「全部排進維護窗」，而要先辨識外曝服務、無驗證攻擊路徑與已停止支援版本。[[4. Oracle]](#ref-4) [[5. iThome]](#ref-5)

<a id="hl-hardware"></a>
### 硬體或軟硬整合
- **AI 與資安運算都轉向專用晶片和機櫃級共同設計。** Intel 與 Fortinet 合作開發 SP6，把 ASIC、封裝和製造能力整合，目標是以專用硬體處理高吞吐資安工作。另一邊，AMD 發表 MI400、EPYC 9006 和 Helios，將代理執行、GPU 資料供應及企業服務拆成不同 CPU 工作。兩項發展都說明，效能競爭已不只是單顆晶片跑分，而是處理器、記憶體、網路、軟體與供應鏈能否一起擴充。[[6. Intel]](#ref-6) [[7. iThome]](#ref-7) [[8. iThome]](#ref-8)

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎
- **基礎設施產品同時補上回復路徑與主權部署選項。** Amazon EKS 允許就地升級後 7 天內回復前一個 Kubernetes 次要版本，並先檢查 API、節點和附加元件相容性；一般叢集仍要自行處理資料平面。Microsoft 與 Mistral 則把 AI 部署範圍延伸到公有雲、客戶控制環境和完全隔離環境。前者處理變更失敗，後者處理資料與營運邊界，兩者都是正式環境不可缺的控制面。[[9. iThome]](#ref-9) [[10. Microsoft]](#ref-10)

<a id="hl-fintech"></a>
### 金融科技
- **企業虛擬卡正從卡號替代品變成可程式化支付控制層。** Mastercard 擴充 In Control，讓發卡機構與企業能透過單一 API 設定用途、金額、交易對象及清算控制，並接入嵌入式支付夥伴網路。平臺已涵蓋 43 個國家和地區、174 種貨幣。對開發團隊而言，價值不只在即時發卡，而是把財務政策寫進交易前後的機器規則，減少共用公司卡、人工核准和事後對帳造成的風險。[[11. Mastercard]](#ref-11)

<a id="hl-healthtech"></a>
### 醫療科技
- **數位醫療的驗證開始把監管、支付與真實世界資料綁在一起。** FDA 選出 Dexcom 參與 TEMPO，評估 Glucose Health Program 如何以連續資料與 AI 洞察協助糖尿病前期和第二型糖尿病管理。參與者須持續蒐集、監控並回報實際使用資料，CMS ACCESS 則以病患成效建立支付路徑。這種設計不像一次性的功能審查，更像在受控環境中觀察軟體、裝置與照護流程長期是否有效。[[12. FDA]](#ref-12)

<a id="hl-logistics"></a>
### 運輸物流
- **自動駕駛卡車的落地支援已涵蓋車、站、系統與營運。** 日本國土交通省的補助不只支援車輛採購，也涵蓋物流據點改造、一對多遠端監控、混合交通、自動裝卸串接及首年運行費用。這種範圍反映真正的瓶頸是端到端作業：卡車即使能在高速公路自動行駛，若場站沒有適合的車位、裝卸設備與調度介面，仍無法形成穩定服務。[[13. 日本國土交通省]](#ref-13)

<a id="hl-proptech"></a>
### 房地產與室內外裝潢
- **營建自動化需要法規與試驗場域一起改。** 新加坡放寬符合安全條件的智慧吊車必須配置機內操作員的要求，並減免營建科技 sandbox 的場地租金。這兩項措施分別降低制度與試作成本，使自動化設備能在真實工地驗證。對 PropTech 團隊而言，產品設計要同時回答感測失效、遠端接管、責任紀錄和現場人員動線，而不只是證明機器能完成單次操作。[[14. Singapore BCA]](#ref-14)

<a id="hl-arts"></a>
### 現場表演藝術
- **動作捕捉正在從後期製作設備變成編舞者可直接操作的即時介面。** SIGGRAPH 展示的 Impulse 以 Unreal Engine、動作捕捉和 mixed reality，讓使用者記錄動作、套用到多名數位舞者，並即時調整空間構圖。創作者可以像排練實體舞者一樣反覆試作虛擬群舞，而不必等技術團隊完成離線輸出。技術價值因此從「做出特效」轉向縮短創作回饋迴圈。[[15. SIGGRAPH 2026]](#ref-15)

<a id="hl-entertainment"></a>
### 影視音樂
- **串流推薦介面正從清單轉向可持續修正的對話。** Spotify beta 讓使用者用文字或語音要求播放、查詢收聽紀錄、了解歌曲脈絡，再用後續對話調整方向。推薦系統不再只靠被動點擊推測偏好，而是接受明確意圖與即時更正。對產品設計而言，下一個難題是讓使用者看懂系統使用哪些歷史資料、如何撤回指令，以及語音操作造成誤播時怎麼快速復原。[[16. Spotify]](#ref-16)

<a id="hl-others"></a>
### 其他領域科技應用突破
- **AI 正從分析科學資料走向協調實驗設備與自動化工作流。** NSF 投資 20 個團隊建立 AI 可程式化雲端實驗室，並要求資料具備開放、可重用、可重現和 AI-ready 特性。這類實驗室可讓 agent 排程儀器、測試假設和整理結果，但研究品質仍依賴清楚的 metadata、版本追蹤及失敗實驗紀錄。沒有可追溯資料，自動化只會更快產生無法重現的結果。[[17. NSF]](#ref-17)

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技
企業 AI 代理將以「工作單位」部署，而非先買一個通用 agent 再找用途。Presence 每次部署先鎖定帳務、理賠或 IT 支援等具體工作，權限、評測和人工轉接也跟著工作邊界設定。這會讓代理上線更像新增一項受監控的服務，而不是發一個聊天工具給全公司。同一週 Google 發表 Gemini 3.6 Flash、3.5 Flash-Lite 與資安專用的 3.5 Flash Cyber，顯示 frontier 模型的競爭正從旗艦能力轉向「每項任務成本」與任務專用化；代理部署會愈來愈常在同一流程內按工作切換不同模型，成本與延遲成為與準確度並列的設計參數。[[1. OpenAI]](#ref-1) [[2. iThome]](#ref-2) [[18. Google]](#ref-18)

<a id="tr-software"></a>
### 軟體工程
AI 提高程式碼產量後，品質工具會從提示型助理轉為組織級門檻。GitHub 把 maintainability、reliability、coverage、ruleset 與 API 放在同一產品，代表平台開始用可量測指標約束 AI 產出。團隊仍需保留人工判斷，避免把工具分數誤當成架構品質本身。[[3. GitHub]](#ref-3)

<a id="tr-security"></a>
### 軟硬體資訊安全
季度修補批次會愈來愈難用單一維護窗消化，修補治理必須資料化。資產暴露、可否無驗證利用、產品支援狀態與業務影響應共同決定優先序；同時要分清楚漏洞數、修補數與受影響產品數，避免管理報表用錯分母。[[4. Oracle]](#ref-4) [[5. iThome]](#ref-5)

<a id="tr-hardware"></a>
### 硬體或軟硬整合
硬體廠商將更常以完整系統而非單顆晶片交付效能。SP6 把資安演算法與製程封裝共同設計，Helios 則整合 CPU、GPU、記憶體、網路和 ROCm。開發者評估新平臺時，需要把驅動、編譯器、模型相容性與供應鏈納入基準測試。[[6. Intel]](#ref-6) [[8. iThome]](#ref-8)

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎
雲端控制面正補上兩種企業需求：變更可以回復，工作負載可以留在指定邊界。Kubernetes rollback 降低升級風險，主權 AI 則讓部署能跨公有雲到完全離線環境。兩者都會增加測試矩陣，因此 Infrastructure as Code、版本紀錄和相容性驗證要能覆蓋每種部署型態。[[9. iThome]](#ref-9) [[10. Microsoft]](#ref-10)

<a id="tr-fintech"></a>
### 金融科技
B2B 支付會把更多財務規則前移到 API。虛擬卡可在交易前限制金額、用途和對象，比事後稽核更接近 policy-as-code。接下來的競爭會集中在跨系統身分、例外核准、清算可見性與既有 ERP 整合，而非只有支付速度。[[11. Mastercard]](#ref-11)

<a id="tr-healthtech"></a>
### 醫療科技
數位醫療監管會更重視真實世界成效與支付是否對齊。TEMPO 讓裝置在受控試辦中蒐集資料，ACCESS 則依成果建立支付路徑。工程團隊因此要把資料品質、族群偏差、模型更新和不良事件回報視為產品生命週期功能。[[12. FDA]](#ref-12)

<a id="tr-logistics"></a>
### 運輸物流
自動物流的投資單位將從車輛改為路線和場站系統。日本補助同時涵蓋車、據點、調度、自動裝卸與首年營運，說明成功條件是整條鏈能持續運作。API、遠端監控和異常接管會成為車輛之外的主要整合成本。[[13. 日本國土交通省]](#ref-13)

<a id="tr-proptech"></a>
### 房地產與室內外裝潢
營建科技的擴散速度取決於監管 sandbox 能否產出可複製的安全規則。智慧吊車若能用感測、遠端控制與稽核紀錄取代固定人力要求，類似模式也可能延伸到巡檢、搬運和危險區作業。產品必須從試驗一開始就留下事故調查需要的資料。[[14. Singapore BCA]](#ref-14)

<a id="tr-arts"></a>
### 現場表演藝術
即時工具會讓數位舞者成為排練素材，而不只是演出完成後的視覺效果。當編舞者能直接調整動作映射與空間構圖，技術人員的角色也會從代為製作轉為建立穩定、低延遲且可重複使用的創作系統。[[15. SIGGRAPH 2026]](#ref-15)

<a id="tr-entertainment"></a>
### 影視音樂
對話式推薦讓使用者能主動修改演算法的理解，推薦產品將需要「可解釋、可更正、可撤回」三種能力。這也會提高跨音樂、podcast 和有聲書的資料整合需求，並使隱私設定和歷史紀錄控制直接影響產品信任。[[16. Spotify]](#ref-16)

<a id="tr-others"></a>
### 其他領域科技應用突破
自動化科學的真正基礎不是 agent，而是可互通的資料、儀器介面和實驗紀錄。NSF 把開放科學與可重現性列入投資條件，顯示未來研究平臺會像 CI 一樣保存輸入、環境、步驟與結果，讓機器加速探索時仍能被人類查核。[[17. NSF]](#ref-17)

<a id="references"></a>
## 參考資料

| 編號 | 文章標題與搜尋連結 | 一句話繁體中文結論或亮點 | 發布日期 | 來源資料網址與名稱 | 分類 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ref-1"></a>1 | [Introducing OpenAI Presence](https://www.google.com/search?q=Introducing+OpenAI+Presence) | 企業代理以工作邊界、權限、評測、人工轉接與受控更新進入正式營運。 | 2026-07-22 | [OpenAI](https://openai.com/index/introducing-openai-presence/) | AI 科技 |
| <a id="ref-2"></a>2 | [OpenAI 推出 Presence 企業 AI 代理，自家電話客服 75% 案件無須真人處理](https://www.google.com/search?q=OpenAI+Presence+企業AI代理+iThome) | 台灣媒體補充 Presence 的實際成效、限制與有限度供應狀態。 | 2026-07-23 | [iThome](https://www.ithome.com.tw/news/177578) | AI 科技 |
| <a id="ref-3"></a>3 | [GitHub Code Quality is now generally available](https://www.google.com/search?q=GitHub+Code+Quality+generally+available+July+20+2026) | GitHub 將確定性分析、AI 偵測、coverage 和品質門檻整合進 pull request。 | 2026-07-20 | [GitHub Changelog](https://github.blog/changelog/2026-07-20-github-code-quality-is-now-generally-available/) | 軟體工程 |
| <a id="ref-4"></a>4 | [Oracle Critical Patch Update Advisory - July 2026](https://www.google.com/search?q=Oracle+Critical+Patch+Update+July+2026) | Oracle 釋出 1,449 項新安全修補，企業應先處理外曝與無驗證遠端風險。 | 2026-07-21 | [Oracle](https://www.oracle.com/security-alerts/cpujul2026.html) | 軟硬體資訊安全 |
| <a id="ref-5"></a>5 | [Oracle 發布 2026 年 7 月關鍵安全修補更新，共修補 1,235 個漏洞](https://www.google.com/search?q=Oracle+2026年7月+1235個漏洞+iThome) | 報導區分 1,449 項修補與 1,235 個漏洞，並整理重大漏洞分布。 | 2026-07-23 | [iThome](https://www.ithome.com.tw/news/177555) | 軟硬體資訊安全 |
| <a id="ref-6"></a>6 | [Intel and Fortinet Collaborate to Advance Cybersecurity Innovation](https://www.google.com/search?q=Intel+Fortinet+Security+Processor+6+2026) | Intel 與 Fortinet 共同設計、封裝及製造新一代資安專用處理器 SP6。 | 2026-07-21 | [Intel Newsroom](https://newsroom.intel.com/manufacturing/intel-and-fortinet-collaborate-to-advance-cybersecurity-innovation-and-strengthen-global-supply-chain-resilience) | 硬體或軟硬整合 |
| <a id="ref-7"></a>7 | [Intel 攜手 Fortinet 開發 Security Processor 6](https://www.google.com/search?q=Intel+Fortinet+SP6+iThome) | 台灣報導補足 Fortinet ASIC 沿革與 Intel Foundry 客戶合作脈絡。 | 2026-07-22 | [iThome](https://www.ithome.com.tw/news/177514) | 硬體或軟硬整合 |
| <a id="ref-8"></a>8 | [AMD 發表最新 AI 加速器及第六代 EPYC 處理器](https://www.google.com/search?q=AMD+MI455X+EPYC+9006+Helios+iThome) | AMD 以 MI400、EPYC 9006、Helios 和 ROCm 組成機櫃級 AI 基礎設施。 | 2026-07-24 | [iThome](https://www.ithome.com.tw/news/177584) | 硬體或軟硬整合 |
| <a id="ref-9"></a>9 | [Amazon EKS 升級增加退路，Kubernetes 控制平面 7 天內可回復前一版本](https://www.google.com/search?q=Amazon+EKS+7天+版本回復+iThome) | EKS 提供有限制的控制平面 rollback，但一般叢集仍要自行處理節點與附加元件。 | 2026-07-23 | [iThome](https://www.ithome.com.tw/news/177573) | 網路/伺服器等基礎 |
| <a id="ref-10"></a>10 | [Microsoft and Mistral expand strategic partnership](https://www.google.com/search?q=Microsoft+Mistral+strategic+partnership+July+21+2026) | 受監管產業可在公有雲、客戶控制或完全隔離環境部署 Mistral 模型。 | 2026-07-21 | [Microsoft Source](https://news.microsoft.com/source/2026/07/21/microsoft-and-mistral-expand-strategic-partnership-to-give-enterprises-and-regulated-industries-frontier-ai-they-can-control/) | 網路/伺服器等基礎 |
| <a id="ref-11"></a>11 | [Mastercard expands virtual card platform](https://www.google.com/search?q=Mastercard+expands+virtual+card+platform+July+24+2026) | 虛擬卡以單一 API、交易控制與嵌入式網路支援跨國 B2B 支付。 | 2026-07-24 | [Mastercard Newsroom](https://www.mastercard.com/news/ap/en/newsroom/press-releases/en/2026/mastercard-expands-virtual-card-platform-with-new-security-controls-embedded-payments-network-and-single-api-access/) | 金融科技 |
| <a id="ref-12"></a>12 | [FDA Announces First Participant Selected for TEMPO](https://www.google.com/search?q=FDA+TEMPO+Dexcom+July+22+2026) | FDA 與 CMS 以真實世界資料和成效支付共同驗證 Dexcom 數位健康方案。 | 2026-07-22 | [FDA](https://www.fda.gov/news-events/press-announcements/fda-announces-first-participant-selected-tempo-digital-health-devices-pilot) | 醫療科技 |
| <a id="ref-13"></a>13 | [自動運転トラック実装支援事業の二次公募開始](https://www.google.com/search?q=自動運転トラック実装支援事業+令和8年7月13日) | 日本同時補助車輛、場站、系統和首年營運，加速自動物流服務落地。 | 2026-07-13 | [日本國土交通省](https://www.mlit.go.jp/report/press/tokatsu01_hh_001026.html) | 運輸物流 |
| <a id="ref-14"></a>14 | [New measures to accelerate productivity and innovation in the Built Environment Sector](https://www.google.com/search?q=Singapore+Built+Environment+smart+hoists+July+17+2026) | 新加坡以智慧吊車規範與低成本 sandbox 降低營建自動化導入門檻。 | 2026-07-17 | [Singapore BCA](https://www1.bca.gov.sg/resources/newsroom/new-measures-to-accelerate-productivity-and-innovation-in-the-built-environment-sector/) | 房地產與室內外裝潢 |
| <a id="ref-15"></a>15 | [Impulse: Dawn of the Digital Dance Studio](https://www.google.com/search?q=SIGGRAPH+2026+Impulse+Dawn+Digital+Dance+Studio) | Unreal Engine、動作捕捉與 mixed reality 讓編舞者即時操作數位舞群。 | 2026-07-20 | [SIGGRAPH 2026](https://s2026.conference-schedule.org/presentation/?id=gensub_494&sess=sess244) | 現場表演藝術 |
| <a id="ref-16"></a>16 | [Just Say the Word: A More Personal Way to Ask, Discover, and Listen](https://www.google.com/search?q=Talk+to+Spotify+July+14+2026) | Spotify 以文字和語音對話整合內容探索、播放控制與推薦修正。 | 2026-07-14 | [Spotify Newsroom](https://newsroom.spotify.com/2026-07-14/talk-to-spotify-announcement-beta/) | 影視音樂 |
| <a id="ref-17"></a>17 | [NSF announces $400M investment in AI-programmable cloud laboratories](https://www.google.com/search?q=NSF+400M+AI-programmable+cloud+laboratories+July+22+2026) | NSF 建立 AI 自動化實驗室網路，並把開放、重現與 AI-ready 資料列為核心條件。 | 2026-07-22 | [U.S. National Science Foundation](https://www.nsf.gov/tip/updates/nsf-announces-400m-investment-new-national-network-ai) | 其他領域科技應用突破 |
| <a id="ref-18"></a>18 | [Introducing Gemini 3.6 Flash, 3.5 Flash-Lite, and 3.5 Flash Cyber](https://www.google.com/search?q=Gemini+3.6+Flash+3.5+Flash-Lite+3.5+Flash+Cyber+July+21+2026) | Google 同週發表 Gemini 3.6 Flash 等三款模型，聚焦每項任務成本與資安專用化。 | 2026-07-21 | [Google Blog](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-6-flash-3-5-flash-lite-3-5-flash-cyber/) | AI 科技 |

<a id="notes"></a>
## 報告說明
本報告由 Codex、Claude Code 於 2026-07-25 彙整近 15 天內（2026-07-10 至 2026-07-25）的全球科技新聞、官方公告與台灣科技媒體報導，再依程式設計師與科技讀者較常關注的主題整理成分類摘要與趨勢觀察。來源日期以文章或公告的實際發布日為準；只有更新日期落在範圍內的舊文不列入正式參考資料。
EOF

  cat > "$TASK/task_plan.md" <<'EOF'
# 任務計劃：科技服務資訊週記

## 目標
完成符合本 repo 規格的科技服務資訊週記（報告日期 2026-07-25，時間範圍 2026-07-10 至 2026-07-25），並輸出完整研究過程與交付檔案。

## 執行模式
一次完成

## 階段
- [x] 階段 1：確認報告日期、15 天時間範圍與必要分類
  - [x] 讀取規格、模板與五項專案知識
  - [x] 階段檢核：已依序更新 notes.md、source.md、report.md 與 task_plan.md
- [x] 階段 2：蒐集候選來源並整理 source.md
- [x] 階段 3：依權重篩選正式參考資料
- [x] 階段 4：檢查各分類是否缺漏
- [x] 階段 5：撰寫總結、亮點與趨勢分析
- [x] 階段 6：整理參考資料表與內文引用
- [x] 階段 7：完成前檢查
- [x] 階段 8：依模板完成 report.md
- [x] 階段 9：複製交付物到 `tech/2026-07-25/`

## 關鍵問題與結果
1. 哪些分類目前資料不足，需要補搜？
   - 現場表演藝術與運輸物流較少，補搜後分別採用 SIGGRAPH 與日本國土交通省來源。
2. 哪些來源雖然相關，但應因日期或可信度而排除？
   - 排除 4 筆窗外來源、1 筆只有更新日期落窗內的舊文；另以較新題材取代上一期已採用的 Visa 報導。
3. 內文引用與參考資料編號是否完全一致？
   - 已驗證 `ref-1` 至 `ref-18` 均雙向對應。

## 已做決策
- 任務資料夾：`weekly-tech-report-013`
- 報告模板來源：`assets/weekly-report-template.md`
- 作者欄位：Codex
- 交付日期：2026-07-25
- 正式來源：18 筆，權重 8 至 10/10（稽核補搜後新增 Google Gemini 3.6 Flash）

## 遇到的錯誤
- Amazon EKS 官方公告早於時間窗，改採 7 月 23 日 iThome 查核報導。
- 搜尋結果曾把 Oracle 修補數與漏洞數混用，已依官方與 iThome 資料分開表述。
- GPT-5.6 預覽（07-09）與 Google Cloud Next '26 Gemini Enterprise（04-22）落在窗外，改採窗內第一方 Gemini 3.6 Flash 發布。

## 狀態
**已完成** - 研究、報告、引用檢查與交付同步完成。
EOF

  DELIVERY="$ROOT/tech/2026-07-25"
  mkdir -p "$DELIVERY"
  cp "$TASK/report.md" "$DELIVERY/2026-07-25 科技服務資訊週記.md"
  cp "$TASK/source.md" "$DELIVERY/source.md"
  cp "$TASK/task_plan.md" "$DELIVERY/task_plan.md"
  cp "$TASK/notes.md" "$DELIVERY/note.md"
  sed -n '/<a id="references"><\/a>/,/<a id="notes"><\/a>/p' "$TASK/report.md" | sed '$d' > "$DELIVERY/references.md"
}

case "${1:-all}" in
  initial)
    write_initial_files
    ;;
  all)
    write_initial_files
    write_final_files
    ;;
  *)
    echo "用法：$0 [initial|all]" >&2
    exit 2
    ;;
esac
