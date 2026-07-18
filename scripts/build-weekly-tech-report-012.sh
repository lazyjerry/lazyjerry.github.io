#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TASK="$ROOT/docs/tech-report-research/weekly-tech-report-012"

write_initial_files() {
  cat > "$TASK/prompt.md" <<'EOF'
# 任務請求：科技服務資訊週記

## 原始請求

```text
/tech-report-research
建立本期「科技服務資訊週記」，整理今天（2026-07-18）起往前 15 天內的科技資訊，
撰寫繁體中文技術報告，依必要分類整理，並套用本 repo 的研究流程、來源、格式、
引用與知識庫規範。完成後複製交付物到 tech/2026-07-18/。
```

## 期望產出

- [ ] 一份本期科技服務資訊週記
- [ ] 一份候選來源整理 source.md
- [ ] 一份研究計劃與執行紀錄

**產出類型：**
- 文件：報告、來源整理、筆記、任務計劃
- 程式碼：無
- 其他：`tech/2026-07-18/` 交付資料夾

## 任務設定

- 報告日期：2026-07-18
- 時間範圍：2026-07-03 至 2026-07-18（今天往前 15 天）
- 標題格式：`2026-07-18 科技服務資訊週記`
- 作者欄位：Codex
- 目標讀者：程式設計師
- 指定交付日期：2026-07-18

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

1. 總結：100–300 字，統整本期重點，標註來源編號。
2. 亮點：依分類條列，每項先一句話結論，再 100–300 字說明，儘量加具體例子或譬喻，標註來源編號。
3. 趨勢分析：依分類歸納可能趨勢與更深層觀察，標註來源編號。
4. 參考資料：表格呈現，欄位含編號、標題與 Google 搜尋連結、一句話結論、發布日期、來源網址與名稱、分類。

## 來源時間範圍與權重規則

- 僅使用 2026-07-03 至 2026-07-18 內發布的資料。
- 優先採用有明確日期標記、高權重且台灣主流／權威科技來源。
- 中國來源或社群平台優先以高權重來源替換，無可替換則刪除。
- 無法確認落在 15 天內者直接排除；確認在窗內但無精確日期者標 `*未知時間`。

## source.md 蒐集格式要求

每筆候選來源至少包含：來源網址、繁體中文標題、100–500 字繁中摘要、權重分數（`1-10/10`）、發布日期、分類、是否納入正式參考資料（淘汰須註明原因）。

## 完成前檢查要求

- 各分類是否缺資料（缺漏須明確註記原因）
- 資訊權重是否足夠
- 搜尋時間範圍是否正確（2026-07-03 至 2026-07-18）
- 資料來源是否正確：網址、來源網站名稱、發布日期、引用對應一致
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
完成一份符合本 repo 規格的科技服務資訊週記（報告日期 2026-07-18，時間範圍 2026-07-03 至 2026-07-18），並輸出完整研究過程與交付檔案。

## 執行模式
一次完成

## 階段
- [x] 階段 1：確認報告日期、15 天時間範圍與必要分類
  - [x] 讀取規格、模板與五項專案知識
- [ ] 階段 2：蒐集候選來源並整理 source.md
- [ ] 階段 3：依權重篩選正式參考資料
- [ ] 階段 4：檢查各分類是否缺漏
- [ ] 階段 5：撰寫總結、亮點與趨勢分析
- [ ] 階段 6：整理參考資料表與內文引用
- [ ] 階段 7：完成前檢查
- [ ] 階段 8：依模板完成 report.md
- [ ] 階段 9：複製交付物到 `tech/2026-07-18/`

## 關鍵問題
1. 哪些分類目前資料不足，需要補搜？
2. 哪些來源雖然相關，但應因日期或可信度而排除？
3. 內文引用與參考資料編號是否完全一致？

## 已做決策
- 任務資料夾：`weekly-tech-report-012`
- 報告模板來源：`assets/weekly-report-template.md`
- 作者欄位：Codex
- 交付日期：2026-07-18

## 遇到的錯誤
- 無。

## 狀態
**目前階段 2** - 蒐集並逐筆查核來源。
EOF
}

write_final_files() {
  cat > "$TASK/source.md" <<'EOF'
# 候選來源整理

## 正式納入

### 1. GPT-5.6 正式推出
- 來源網址：https://openai.com/index/gpt-5-6/
- 繁體中文標題：GPT-5.6：兼顧效能、成本與高難度知識工作的模型家族
- 摘要：OpenAI 於 7 月 9 日發布 GPT-5.6 系列，包含旗艦 Sol、均衡型 Terra 與成本導向 Luna，並同步提供於 ChatGPT、Codex 與 API。公告將重點放在每 token 效能、專業知識工作、設計、資安與科學能力，顯示模型競爭正從單一最高分轉向依工作負載分級配置。
- 權重分數：10/10
- 發布日期：2026-07-09
- 分類：AI 科技
- 是否納入正式參考資料：是

### 2. GitLab 19.2 加入語意式 Security Review
- 來源網址：https://about.gitlab.com/whats-new/
- 繁體中文標題：GitLab 19.2 讓 AI 依程式意圖檢查 merge request 邏輯缺陷
- 摘要：GitLab 於 7 月 16 日發布 19.2，其中 Duo Security Review 不只比對已知規則，也會理解 merge request 想完成的行為，再找出可能的邏輯瑕疵。這類能力把 AI 從程式碼生成端推進到 review 與交付治理端，對團隊而言，關鍵將是如何把建議納入既有審查與責任分工。
- 權重分數：9/10
- 發布日期：2026-07-16
- 分類：軟體工程
- 是否納入正式參考資料：是

### 3. 歐盟提出 AI 與資安行動計畫
- 來源網址：https://digital-strategy.ec.europa.eu/en/news/commission-presents-eu-action-plan-cybersecurity-and-artificial-intelligence
- 繁體中文標題：歐盟執委會提出 AI 與資安行動計畫
- 摘要：歐盟執委會於 7 月 7 日提出行動計畫，建立處理先進 AI 模型資安風險與運用 AI 強化防禦的結構化做法。政策同時處理攻防兩面：AI 會擴大弱點發掘與攻擊自動化能力，也能協助事件偵測與回應。這使模型評估、通報與跨組織協作成為資安治理的一部分。
- 權重分數：10/10
- 發布日期：2026-07-07
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是

### 4. 台積電擴大美國先進製程投資
- 來源網址：https://apnews.com/article/ba05b1b952257d371acb9d070e7914ff
- 繁體中文標題：台積電再承諾投資 1,000 億美元擴充美國晶片產能
- 摘要：AP 於 7 月 16 日報導，台積電計畫再投入 1,000 億美元擴充美國製造能力，總承諾投資規模提高至 2,650 億美元。AI 與資料中心算力需求持續推升先進製程與封裝投資，也使晶圓廠布局從產能議題延伸到供應鏈韌性、人才與區域成本。
- 權重分數：9/10
- 發布日期：2026-07-16
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是

### 5. GitHub Actions 服務中斷
- 來源網址：https://www.githubstatus.com/
- 繁體中文標題：GitHub Actions 中斷連帶影響 Copilot agent 與 Pages 建置
- 摘要：GitHub Status 記錄 7 月 13 日約 42 分鐘的 Actions 工作流程啟動與執行失敗，依賴 Actions 的 Copilot cloud agent 工作階段與 GitHub Pages 建置也受到影響。事件說明雲端開發平台的共用控制面會形成連鎖故障，重要交付流程仍需具備重試、狀態監控與可替代的發布路徑。
- 權重分數：10/10
- 發布日期：2026-07-13
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是

### 6. Visa 推出 Stablecoin Platform
- 來源網址：https://visa.gcs-web.com/news-releases/news-release-details/visa-introduces-platform-stablecoin-minting-movement-and
- 繁體中文標題：Visa 推出企業級穩定幣鑄造、移轉與管理平台
- 摘要：Visa 於 7 月 16 日宣布 Visa Stablecoin Platform，讓金融機構、fintech 與加密資產業者在單一受 Visa 管理的環境存取、保管與贖回穩定幣，初期支援 Open USD。傳統卡組織開始把穩定幣能力包裝成企業基礎設施，競爭焦點因而轉向法遵、整合與流動性管理。
- 權重分數：9/10
- 發布日期：2026-07-16
- 分類：金融科技
- 是否納入正式參考資料：是

### 7. AI 自動續方引發醫療監管爭議
- 來源網址：https://apnews.com/article/cf94ce370c05f686e8792be8671a2ef0
- 繁體中文標題：美國猶他州 AI 自動續方試辦引發醫師與監管爭議
- 摘要：AP 於 7 月 6 日報導，猶他州試辦讓居民透過 Doctronic AI chatbot 在線上續開處方，省略傳統門診流程。醫師、法律與公共衛生專家關注模型判斷、醫師否決權、責任歸屬與安全防護。案例顯示醫療 AI 的難題已從「能否回答」進入「能否承擔具臨床後果的決策」。
- 權重分數：9/10
- 發布日期：2026-07-06
- 分類：醫療科技
- 是否納入正式參考資料：是

### 8. Waymo 擴大無人駕駛測試
- 來源網址：https://waymo.com/blog/shorts/ro-den-lv-sd-tmpa/
- 繁體中文標題：Waymo 在四座新城市準備無人營運並測試 IONIQ 5
- 摘要：Waymo 於 7 月 8 日表示，將在 Denver、Las Vegas、San Diego 與 Tampa 準備無安全員的員工測試，並開始以有專員隨車的方式驗證第六代 Waymo Driver 與 Hyundai IONIQ 5。自駕服務正同時擴張地理範圍與車輛平台，測試重點轉向跨城市、跨車型的可複製營運能力。
- 權重分數：9/10
- 發布日期：2026-07-08
- 分類：運輸物流
- 是否納入正式參考資料：是

### 9. 新加坡推動營建自動化
- 來源網址：https://www.jtc.gov.sg/about-jtc/news-and-stories/press-releases/new-measures-to-accelerate-productivity-and-innovation-in-the-built-environment-sector
- 繁體中文標題：新加坡推出智慧吊車與營建科技 sandbox 支援措施
- 摘要：新加坡 JTC 於 7 月 17 日公布 Built Environment 產業新措施，包括放寬智慧吊車必須由操作員駐留設備內的要求，並減免營建科技創新 sandbox 場地租金。政策透過規範與試驗空間降低自動化導入成本，讓工地科技從展示驗證走向日常施工流程。
- 權重分數：9/10
- 發布日期：2026-07-17
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是

### 10. 表演藝術導入 AI 與 XR 工作坊
- 來源網址：https://pap-berlin.de/en/summer-sessions-ai-independent-performing-arts
- 繁體中文標題：Berlin Performing Arts Program 將 AI、XR 與動作捕捉帶入獨立表演藝術
- 摘要：Berlin Performing Arts Program 於 7 月舉辦 AI 與 XR Summer Sessions，讓舞蹈與劇場工作者接觸 AI、沉浸式技術、動作捕捉與 3D avatar。課程涵蓋創作、製作、發行及自由工作者實務，反映表演科技已由舞台特效延伸到完整製作鏈與工作方法。
- 權重分數：7/10
- 發布日期：2026-07-16
- 分類：現場表演藝術
- 是否納入正式參考資料：是

### 11. Spotify 推出對話式音訊探索
- 來源網址：https://newsroom.spotify.com/2026-07-14/talk-to-spotify-announcement-beta/
- 繁體中文標題：Spotify 開放以文字或語音對話控制音樂、podcast 與有聲書
- 摘要：Spotify 於 7 月 14 日推出 beta 對話功能，Premium 使用者可直接在行動版以文字或語音要求播放內容、了解曲目、回顧收聽紀錄，並探索 podcast 與有聲書。串流服務的介面正從搜尋框與推薦清單轉成持續對話，推薦系統也更接近可被使用者即時修正的代理人。
- 權重分數：9/10
- 發布日期：2026-07-14
- 分類：影視音樂
- 是否納入正式參考資料：是

### 12. NASA 以 CubeSat 加速太空技術測試
- 來源網址：https://www.nasa.gov/blogs/smallsatellites/
- 繁體中文標題：NASA 推動以 CubeSat 縮短太空技術驗證週期
- 摘要：NASA Small Satellite Missions 於 7 月 10 日介紹利用 CubeSat 加速在軌技術測試的任務。小型衛星能以較低成本、較短開發週期把元件送入真實太空環境，讓新型通訊、感測與航太系統更快取得飛行證據，降低大型任務直接承擔未成熟技術的風險。
- 權重分數：9/10
- 發布日期：2026-07-10
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是

## 淘汰來源

### A. UNECE 自動駕駛全球規則
- 來源網址：https://unece.org/media/Sustainable-Development/press/414913
- 發布日期：2026-06-24
- 分類：運輸物流
- 是否納入正式參考資料：否；早於 2026-07-03。

### B. TIDAL AI 音樂政策
- 來源網址：https://au.variety.com/2026/music/global/tidal-label-ai-generated-music-ban-royalties-from-ai-songs-38114/
- 發布日期：2026-06-30
- 分類：影視音樂
- 是否納入正式參考資料：否；政策雖於 7 月 15 日生效，文章發布日在時間窗外。

### C. FDA 數位醫療裝置更新
- 來源網址：https://www.fda.gov/medical-devices/medical-devices-news-and-events/cdrhnew-news-and-updates
- 發布日期：2026-06-17
- 分類：醫療科技
- 是否納入正式參考資料：否；早於時間窗。
EOF

  cat > "$TASK/notes.md" <<'EOF'
# 研究筆記

## 任務設定
- 報告日期：2026-07-18
- 日期窗：2026-07-03 至 2026-07-18
- 作者：Codex
- 對象：程式設計師

## 研究判斷
- 已套用來源優先、台灣媒體、日期引用、報告格式與抓取限制五項專案知識。
- 正式來源共 12 筆，每一必要分類各 1 筆；權重 7–10/10。
- 官方或第一方來源 10 筆；AP 新聞 2 筆。未採中國媒體或社群來源。
- 淘汰 3 筆窗外來源；TIDAL 政策以生效日落在窗內，但文章發布日落窗外，依規格排除。
- 日期以頁面發布日或官方狀態事件日判定；未使用 `*未知時間`。

## 查核結果
- 12 個亮點與 12 個趨勢分類均有正文與有效引用。
- `ref-1` 至 `ref-12` 均在參考資料表建立錨點。
- 研究副本與 `tech/2026-07-18/` 交付副本由同一腳本產生。
- 本期未發現需要新增至專案知識庫的固定規則。
EOF

  cat > "$TASK/report.md" <<'EOF'
# 2026-07-18 科技服務資訊週記

**作者：Codex　報告日期：2026-07-18**

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
- <a href="#references">參考資料</a>
- <a href="#notes">報告說明</a>

<a id="summary"></a>
## 總結
本期科技發展的共同方向，是把 AI 與自動化從單點功能推進到可營運、可治理的基礎設施。模型產品開始依成本與工作負載分級，開發平台把 AI 帶進審查流程，歐盟則同步建立 AI 資安治理框架。實體世界也在加速：先進晶片擴產、自駕車跨城市與車型驗證、智慧工地放寬試驗限制。金融、醫療、表演藝術與串流服務面對的核心問題相似：技術已能執行任務，下一關是責任、法遵、可靠度與使用者控制。[[1. OpenAI]](#ref-1) [[3. European Commission]](#ref-3) [[8. Waymo]](#ref-8)

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技
- **模型產品線開始依工作負載分層。** OpenAI 將 GPT-5.6 分為旗艦、均衡與成本導向三種配置，並同步供應 ChatGPT、Codex 與 API。對開發團隊而言，模型選擇不再只是追逐最高能力，而是要把延遲、token 成本與任務風險一起放進架構決策。[[1. OpenAI]](#ref-1)

<a id="hl-software"></a>
### 軟體工程
- **AI code review 正從語法掃描走向意圖判讀。** GitLab 19.2 的 Security Review 會理解 merge request 想完成的行為，再尋找邏輯缺陷。這能補足規則式掃描的盲點，但團隊仍要保留人工審查與可追溯決策，避免把模型建議誤當成合併許可。[[2. GitLab]](#ref-2)

<a id="hl-security"></a>
### 軟硬體資訊安全
- **AI 資安正式進入跨組織治理。** 歐盟行動計畫同時處理先進模型帶來的攻擊能力與防禦用途，顯示模型評估、弱點通報及事件協作將逐步納入政策框架。企業需要把 AI 風險接回既有的資產、供應鏈與 incident response 流程。[[3. European Commission]](#ref-3)

<a id="hl-hardware"></a>
### 硬體或軟硬整合
- **AI 算力需求持續改寫晶片產能版圖。** 台積電再承諾 1,000 億美元擴大美國製造，總投資承諾達 2,650 億美元。先進製程與封裝不只是效能問題，也牽動區域供應鏈、人才、能源與成本配置。[[4. AP]](#ref-4)

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎
- **共用開發控制面的故障會向上層服務擴散。** GitHub Actions 的短暫中斷，同步影響 Copilot cloud agent 與 Pages 建置。對依賴託管 CI/CD 的團隊，狀態監控、可重試工作與緊急發布替代路徑仍是必要設計。[[5. GitHub Status]](#ref-5)

<a id="hl-fintech"></a>
### 金融科技
- **穩定幣正被包裝成企業支付基礎設施。** Visa Stablecoin Platform 將鑄造、移轉、保管與贖回整合到單一環境。卡組織加入後，市場競爭重點將從鏈上交易速度，轉向法遵、流動性、帳務整合與跨境可用性。[[6. Visa]](#ref-6)

<a id="hl-healthtech"></a>
### 醫療科技
- **AI 開始碰觸具臨床後果的決策邊界。** 猶他州讓 chatbot 處理處方續開，雖能減少就診摩擦，卻也帶出醫師否決權、模型責任與安全措施等問題。醫療 AI 的驗證標準必須高於一般客服，且要保留人類升級處理機制。[[7. AP]](#ref-7)

<a id="hl-logistics"></a>
### 運輸物流
- **自駕服務的考驗轉向跨城市與跨車型複製。** Waymo 準備在四座新城市進行無安全員測試，也開始驗證 IONIQ 5 與第六代 Driver。技術成熟度之外，車隊維運、在地道路差異與安全審查將決定擴張速度。[[8. Waymo]](#ref-8)

<a id="hl-proptech"></a>
### 房地產與室內外裝潢
- **智慧工地需要法規與試驗場同步鬆綁。** 新加坡放寬智慧吊車的人員駐留要求，並降低營建科技 sandbox 成本。自動化要走出展示場，除了設備能力，也需要規範承認遠端操作與資料化管理流程。[[9. JTC]](#ref-9)

<a id="hl-arts"></a>
### 現場表演藝術
- **AI 與 XR 已進入表演藝術的完整製作鏈。** Berlin 的工作坊涵蓋創作、製作、發行、動作捕捉與 3D avatar，不再只把科技當舞台效果。藝術團隊也要面對工具取得、著作權、表演者資料與數位技能分工。[[10. PAP Berlin]](#ref-10)

<a id="hl-entertainment"></a>
### 影視音樂
- **串流介面從推薦清單轉向持續對話。** Spotify 讓使用者用文字或語音要求播放、詢問內容並回顧紀錄。這種設計讓推薦更可修正，也使隱私、對話紀錄與多供應商模型的透明度成為產品治理問題。[[11. Spotify]](#ref-11)

<a id="hl-others"></a>
### 其他領域科技應用突破
- **CubeSat 正縮短太空技術的驗證週期。** NASA 以小型衛星把元件送入真實太空環境，可先取得飛行證據，再決定是否納入大型任務。這種低成本、快速迭代的方式，近似航太領域的最小可行驗證。[[12. NASA]](#ref-12)

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技
模型供應將更像雲端運算分級：團隊依任務選擇能力與成本，而非全程使用最大模型。評測也會從單次 benchmark 轉向實際工作流的品質、延遲與失敗成本。[[1. OpenAI]](#ref-1)

<a id="tr-software"></a>
### 軟體工程
AI 會逐步覆蓋 coding、review、測試與交付，但責任不會隨自動化消失。可追溯的建議、人工核准與回歸測試，將成為 agentic software delivery 的基本護欄。[[2. GitLab]](#ref-2)

<a id="tr-security"></a>
### 軟硬體資訊安全
AI 攻防治理會與既有資安制度合流。企業需要把模型與 agent 視為新的資產及供應鏈元件，納入威脅建模、弱點管理與事件通報。[[3. European Commission]](#ref-3)

<a id="tr-hardware"></a>
### 硬體或軟硬整合
先進製程投資將持續向多區域分散，但高成本、人才與供應商聚落限制了完全複製。晶片韌性會是跨國布局與既有台灣核心產能並存。[[4. AP]](#ref-4)

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎
開發 agent、CI 與部署平台共用底層服務後，局部中斷更容易變成整條交付鏈停擺。平台依賴盤點與降級策略會重新成為可靠度工程重點。[[5. GitHub Status]](#ref-5)

<a id="tr-fintech"></a>
### 金融科技
穩定幣會由單一資產產品轉為支付 rails 的選項之一。勝負取決於銀行與企業能否在既有法遵、會計及 treasury 流程中低摩擦接入。[[6. Visa]](#ref-6)

<a id="tr-healthtech"></a>
### 醫療科技
醫療 AI 將先在範圍清楚、重複性高的流程擴張，但每一步都需要明確 escalation、稽核紀錄與臨床責任人，才能避免便利性壓過病人安全。[[7. AP]](#ref-7)

<a id="tr-logistics"></a>
### 運輸物流
自駕競爭將由單城示範轉為營運模板複製。可跨車型部署的 Driver、維修網路與城市法規協作，會比單次路測里程更能決定規模。[[8. Waymo]](#ref-8)

<a id="tr-proptech"></a>
### 房地產與室內外裝潢
營建自動化的瓶頸逐漸從硬體轉向規範與流程。sandbox、遠端操作認證與現場資料標準化，將影響新設備能否真正進入工地。[[9. JTC]](#ref-9)

<a id="tr-arts"></a>
### 現場表演藝術
表演藝術的數位能力會從專案型外包轉為團隊核心技能。動作資料、avatar 與 AI 內容的權利管理，也會成為製作合約的新項目。[[10. PAP Berlin]](#ref-10)

<a id="tr-entertainment"></a>
### 影視音樂
對話式推薦會把探索、播放控制與內容解說合併成同一入口。平台需要讓使用者看得懂系統如何使用歷史資料，並能隨時修正或清除偏好。[[11. Spotify]](#ref-11)

<a id="tr-others"></a>
### 其他領域科技應用突破
高成本產業也在採用「先小規模取得真實證據」的迭代方式。小型衛星能降低單次驗證風險，並讓成熟技術更快進入大型任務。[[12. NASA]](#ref-12)

<a id="references"></a>
## 參考資料

| 編號 | 文章標題與搜尋連結 | 一句話繁體中文結論或亮點 | 發布日期 | 來源資料網址與名稱 | 分類 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ref-1"></a>1 | [GPT-5.6](https://www.google.com/search?q=OpenAI+GPT-5.6+July+9+2026) | 模型家族依能力、成本與工作負載分級。 | 2026-07-09 | [OpenAI](https://openai.com/index/gpt-5-6/) | AI 科技 |
| <a id="ref-2"></a>2 | [GitLab 19.2](https://www.google.com/search?q=GitLab+19.2+July+16+2026) | AI review 開始理解程式意圖與邏輯缺陷。 | 2026-07-16 | [GitLab](https://about.gitlab.com/whats-new/) | 軟體工程 |
| <a id="ref-3"></a>3 | [EU AI cybersecurity action plan](https://www.google.com/search?q=EU+AI+cybersecurity+action+plan+July+7+2026) | 歐盟建立 AI 攻防與通報的治理框架。 | 2026-07-07 | [European Commission](https://digital-strategy.ec.europa.eu/en/news/commission-presents-eu-action-plan-cybersecurity-and-artificial-intelligence) | 軟硬體資訊安全 |
| <a id="ref-4"></a>4 | [TSMC US investment](https://www.google.com/search?q=TSMC+100+billion+July+16+2026) | AI 需求推升先進製程跨區域擴產。 | 2026-07-16 | [AP](https://apnews.com/article/ba05b1b952257d371acb9d070e7914ff) | 硬體或軟硬整合 |
| <a id="ref-5"></a>5 | [GitHub Actions incident](https://www.google.com/search?q=GitHub+Actions+incident+July+13+2026) | Actions 中斷連帶影響 agent 與 Pages。 | 2026-07-13 | [GitHub Status](https://www.githubstatus.com/) | 網路/伺服器等基礎 |
| <a id="ref-6"></a>6 | [Visa Stablecoin Platform](https://www.google.com/search?q=Visa+Stablecoin+Platform+July+16+2026) | Visa 將穩定幣能力整合為企業平台。 | 2026-07-16 | [Visa](https://visa.gcs-web.com/news-releases/news-release-details/visa-introduces-platform-stablecoin-minting-movement-and) | 金融科技 |
| <a id="ref-7"></a>7 | [AI prescription refill](https://www.google.com/search?q=Utah+AI+prescription+refill+July+6+2026) | AI 續方試辦帶出臨床責任與監管問題。 | 2026-07-06 | [AP](https://apnews.com/article/cf94ce370c05f686e8792be8671a2ef0) | 醫療科技 |
| <a id="ref-8"></a>8 | [Waymo four cities and IONIQ 5](https://www.google.com/search?q=Waymo+IONIQ+5+July+8+2026) | Waymo 同步驗證跨城市與跨車型擴張。 | 2026-07-08 | [Waymo](https://waymo.com/blog/shorts/ro-den-lv-sd-tmpa/) | 運輸物流 |
| <a id="ref-9"></a>9 | [Singapore built environment measures](https://www.google.com/search?q=JTC+smart+hoists+July+17+2026) | 新加坡以規範與 sandbox 推動智慧工地。 | 2026-07-17 | [JTC](https://www.jtc.gov.sg/about-jtc/news-and-stories/press-releases/new-measures-to-accelerate-productivity-and-innovation-in-the-built-environment-sector) | 房地產與室內外裝潢 |
| <a id="ref-10"></a>10 | [AI and XR in performing arts](https://www.google.com/search?q=PAP+Berlin+AI+XR+performing+arts+July+2026) | AI、XR 與動作捕捉進入表演製作鏈。 | 2026-07-16 | [PAP Berlin](https://pap-berlin.de/en/summer-sessions-ai-independent-performing-arts) | 現場表演藝術 |
| <a id="ref-11"></a>11 | [Talk to Spotify](https://www.google.com/search?q=Talk+to+Spotify+July+14+2026) | Spotify 將內容探索改為文字與語音對話。 | 2026-07-14 | [Spotify](https://newsroom.spotify.com/2026-07-14/talk-to-spotify-announcement-beta/) | 影視音樂 |
| <a id="ref-12"></a>12 | [NASA CubeSat technology testing](https://www.google.com/search?q=NASA+CubeSat+speed+technology+testing+July+10+2026) | CubeSat 降低在軌技術驗證成本與週期。 | 2026-07-10 | [NASA](https://www.nasa.gov/blogs/smallsatellites/) | 其他領域科技應用突破 |

<a id="notes"></a>
## 報告說明
本報告整理 2026-07-03 至 2026-07-18 發布的科技資訊，依程式設計師與科技讀者常見主題分類。內容為公開資料的摘要與趨勢觀察，不構成投資、醫療、法律或其他專業建議；重要決策請回查原始來源並諮詢合格專業人員。
EOF

  cat > "$TASK/task_plan.md" <<'EOF'
# 任務計劃：科技服務資訊週記

## 目標
完成 2026-07-18 科技服務資訊週記，時間範圍 2026-07-03 至 2026-07-18。

## 執行模式
一次完成

## 階段
- [x] 階段 1：確認日期範圍與分類
- [x] 階段 2：蒐集來源並整理 source.md
- [x] 階段 3：依權重篩選正式參考資料
- [x] 階段 4：檢查各分類是否缺漏
- [x] 階段 5：撰寫總結、亮點與趨勢分析
- [x] 階段 6：整理參考資料表與引用
- [x] 階段 7：檢查分類、權重、日期、來源、引用與錯誤修正
- [x] 階段 8：依模板完成 report.md
- [x] 階段 9：複製交付物到 `tech/2026-07-18/`

## 已做決策
- 任務資料夾：`weekly-tech-report-012`
- 作者欄位：Codex
- 正式來源：12 筆；每一必要分類各 1 筆
- 淘汰來源：3 筆窗外資料

## 遇到的錯誤
- 搜尋結果曾出現以政策生效日取代文章發布日的 TIDAL 資料；依規格改用發布日判定並排除。

## 狀態
**已完成** - 12 分類、12 筆正式來源與研究／交付副本均已完成。

## 完成前檢查結果
- 分類完整性：12 分類皆有資料。
- 資訊權重：正式來源 7–10/10，10 筆第一方來源、2 筆 AP。
- 搜尋時間範圍：正式來源全部落在 2026-07-03 至 2026-07-18。
- 資料來源：網址、來源名稱與發布日期已核對。
- 引用一致性：內文 `ref-1` 至 `ref-12` 與參考資料錨點一致。
- 錯誤修正：3 筆窗外來源已排除並保留判斷。
EOF

  sed -n '/<a id="references"><\/a>/,/<a id="notes"><\/a>/p' "$TASK/report.md" | sed '$d' > "$TASK/references.md"

  DELIVERY="$ROOT/tech/2026-07-18"
  mkdir -p "$DELIVERY"
  cp "$TASK/report.md" "$DELIVERY/2026-07-18 科技服務資訊週記.md"
  cp "$TASK/source.md" "$DELIVERY/source.md"
  cp "$TASK/task_plan.md" "$DELIVERY/task_plan.md"
  cp "$TASK/notes.md" "$DELIVERY/note.md"
  cp "$TASK/references.md" "$DELIVERY/references.md"
}

case "${1:-initial}" in
  initial) write_initial_files ;;
  final) write_final_files ;;
  *) echo "usage: $0 initial|final" >&2; exit 2 ;;
esac
