# 2026-07-11 科技服務資訊週記

**作者：Claude Code、Codex　報告日期：2026-07-11**

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
AI 競爭正在換戰場：OpenAI 公開 GPT-5.6 並推出 ChatGPT Work、GPT-Live [[1. CNBC]](#ref-1)，Anthropic 以較低成本的 Claude Sonnet 5 應戰 [[2. TechCrunch]](#ref-2)，Z.ai 則以 ZCode 搶攻 AI Coding IDE [[3. TechOrange]](#ref-3)。硬體端，人形機器人轉向規模部署 [[5. TechNews]](#ref-5)，南韓三星與 SK 海力士規劃投資 800 兆韓元擴建 AI 晶片聚落 [[6. AP]](#ref-6)。資安面，Pi 拍錢包傳出 350 萬名用戶個資外洩 [[4. iThome]](#ref-4)；金融科技則進入穩定幣系統性監管階段 [[8. Bank of England]](#ref-8)。

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技
- **兩大實驗室在同一週把「Agent」推成預設體驗。** OpenAI 在美國政府解除限制後公開 GPT-5.6 三階梯（旗艦 Sol、中階 Terra、低成本 Luna），並設為 ChatGPT 預設模型；同步推出的 **ChatGPT Work** 結合聊天與程式工具，**GPT-Live** 語音模型則能同時聽與說 [[1. CNBC]](#ref-1)。幾乎同時，Anthropic 於 6 月 30 日發布 **Claude Sonnet 5**，主打「最 Agent 化的 Sonnet」，效能逼近 Opus 4.8（SWE-bench Pro 63.2% vs. 69.2%）卻更便宜，並成為免費與 Pro 使用者的預設模型 [[2. TechCrunch]](#ref-2)。兩家公司都把重點放在多步驟任務：模型要能規劃工作、呼叫工具，還得把事情做完。

<a id="hl-software"></a>
### 軟體工程
- **AI Coding 的競爭從「模型多強」轉向「誰的 IDE 綁得住開發者」。** 繼 Claude Code、OpenAI Codex、Google Antigravity 之後，中國 Z.ai 於 7 月初推出 **ZCode**，免費下載、靠 **GLM Coding Plan** 訂閱變現（Lite 約每月 16.2 美元、Max 約 144 美元）[[3. TechOrange]](#ref-3)。廠商把模型、工作流程與訂閱綁在同一套產品裡。開發者若連寫程式、除錯和送 PR 都在同一款 IDE 完成，日後要換工具就不容易；工程團隊選型時也得評估資料能否匯出，以及更換供應商要付出多少成本。

<a id="hl-security"></a>
### 軟硬體資訊安全
- **一次外洩就是 350 萬筆個資，勒索集團還把戰果做成「檢測報告」。** PChome 旗下拍付國際經營的 **Pi 拍錢包** 遭新興勒索軟體組織 **Settra** 攻擊，駭客宣稱竊得 102 GB、含 350 萬名用戶個資，數位發展部數位產業署 7 月 1 日即進行實地行政檢查 [[4. iThome]](#ref-4)。Settra 採雙重勒索，還把入侵過程整理成類似資安稽核的「調查報告」，藉此向受害企業施壓。同週，日產（Nissan）的 Oracle PeopleSoft 系統遭駭，美洲員工薪資與人事資料外洩；兩起事件都牽涉企業外部系統。

<a id="hl-hardware"></a>
### 硬體或軟硬整合
- **人形機器人商業化與記憶體產能擴張，是本期軟硬整合的兩條主線。** Counterpoint 指出，人形機器人競爭正從動作展示轉向規模部署與生態建構，中國並提出萬台級部署目標 [[5. TechNews]](#ref-5)。另一邊，南韓政府、三星與 SK 海力士宣布在西南部建立大型晶片聚落，兩家公司規劃合計投資 800 兆韓元（約 5,180 億美元），涵蓋四座記憶體晶圓廠與相關供應鏈設施 [[6. AP]](#ref-6)。單顆晶片的規格之外，量產速度、先進封裝與區域供應鏈也會影響實際供貨。

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎
- **AI 的胃口大到要修法管電。** 經濟部預告修法草案，將 **AI 資料中心** 納入產業效益評估：台灣現有約 36 座資料中心（北部占 28 座），既有負載約 60 MW、僅占全台用電 0.16%，但國科會估至 2029 年 AI 資料中心規模將達 450 MW，經濟部更估至 2030 年新增用電需求突破 5 GW [[7. TechNews]](#ref-7)。政策要求 5 MW 以上的新設或擴建超大型／主機代管資料中心，在規劃階段就採「最佳可行技術（BAT）」並提能源使用說明書。新規定把能源效率提前到資料中心的規劃與審查階段。

<a id="hl-fintech"></a>
### 金融科技
- **穩定幣開始被當成系統性支付基礎設施監管。** Bank of England 於 7 月 7 日發布的金融政策委員會紀錄，明確歡迎英鎊計價系統性穩定幣政策聲明與規則草案 [[8. Bank of England]](#ref-8)。規則草案涵蓋儲備資產、流動性、營運韌性與跨機關監管。穩定幣若廣泛用於支付，發行人將受到接近金融市場基礎設施的要求。

<a id="hl-healthtech"></a>
### 醫療科技
- **生技產業把 AI 從「輔助工具」升級為「貫穿全鏈的核心」。** BIO Asia–Taiwan **2026 亞洲生技大會** 將於 7/15–19 在台北南港展覽館登場，集結 22 國、900 家企業、2,300 個攤位，主題「Speed to Patients—加速上市、造福病患」[[9. TechNews]](#ref-9)。大會議題涵蓋 AI 輔助新藥設計、臨床試驗、法規審查與商業化，目標是縮短開發時程。能否達成，仍取決於資料品質與後續臨床驗證。

<a id="hl-logistics"></a>
### 運輸物流
- **缺工與減碳，把「最後一哩」推向電動化與自駕。** 日本地區宅便、日祐與 glafit 自 2026 年 7 月起，在東京 23 區與川崎市啟動 **電動個人運具最後一哩配送實證**，驗證配送效率、CO2 減排與安全性；同時製藥業者與 T2 合作，在名神—東名高速約 450 公里區間進行 Level 2 自駕貨運，自動配送機器人也進入物流據點與門市 [[10. LNEWS]](#ref-10)。這些案例把長途幹線與社區末端拆開處理，分別測試自駕貨車和小型電動運具。

<a id="hl-proptech"></a>
### 房地產與室內外裝潢
- **PropTech 把「Google 式 AI 摘要」搬進看房流程。** 台灣潮居科技（inHom）於 7 月 4 日發表 **《AI 理家》**，以類似 AI 摘要的概念，為買家整合最新房產搜尋與資訊，發表會吸引吉美、新理想、茂德等建商與代銷高層出席 [[11. inHom]](#ref-11)。同期日本 AI 房產品牌 **RENOSY 利諾喜** 登台亮相台灣國際房地產博覽會（7/9–12）[[12. PChome]](#ref-12)，而 CBRE 數據顯示 2026 上半年全台商用不動產投資年增 92%、AI 帶動廠房與物流買賣年增 279%。這類服務先整理分散的物件與市場資訊，再交由買方判斷；資料是否完整、摘要是否偏誤，仍是實際使用時要檢查的問題。

<a id="hl-arts"></a>
### 現場表演藝術
- **AI 與空間音效走上舞台，天氣則考驗票務韌性。** 香港大館 6/25–8/2 呈獻 **「Wayne McGregor：異・地」** 沉浸式舞蹈裝置，全長 57 分鐘、結合人工智能與空間音效，由 Company Wayne McGregor 與香港芭蕾舞團舞者演繹 [[13. HK01]](#ref-13)。另一面，颱風「巴威」導致盧廣仲台北流行音樂中心演出 7/10 場次延至 7/13、Karencici 演唱會亦延後，主辦提供全額退票 [[14. NOWnews]](#ref-14)。一邊是技術進入舞台創作，另一邊則是颱風來臨時，票務、通知與退款系統能否即時處理改期。

<a id="hl-entertainment"></a>
### 影視音樂
- **當演員的臉與聲音都能被複製，產業開始搶建「數位替身」的規則。** 影視媒體產業週報彙整三則動態：CAA 掃描演員臉部、動作與聲音建立 **AI 數位分身** 協助藝人變現與掌控；《辛普森家庭》配音員 **Harry Shearer** 探尋法律保護，防止身後被 AI 重製聲音；Orbital Studios 將 **虛擬製作** 實驗室遷入 Television City，延續 LED 虛擬棚趨勢 [[15. Further & Better]](#ref-15)。數位分身能重製臉部、動作與聲音，授權範圍、使用期限和分潤方式都得重新寫進合約。

<a id="hl-others"></a>
### 其他領域科技應用突破
- **核能第一次以「商用衛星電源」上太空。** City Labs 製造、以 **氚（tritium）** 為電源的 **BOHR 衛星**，7 月 7 日搭乘 SpaceX Transporter-17 任務升空，成為全球第一顆核動力商用衛星示範，為未來核動力太空船鋪路 [[16. TechNews]](#ref-16)。核電池可在日照不足時持續供電，適合深空或長時間任務；這次發射先驗證它在商用小型衛星上的可行性。

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技
本期幾項產品更新都把重點放在 **Agent 與工作流程**。OpenAI 用 ChatGPT Work 把 Agent 變成上班族的預設入口、用 GPT-Live 讓語音互動更自然 [[1. CNBC]](#ref-1)；Anthropic 用「接近旗艦、價格更低」的 Sonnet 5 讓大規模跑 Agent 變得划算 [[2. TechCrunch]](#ref-2)。開發團隊接下來要比較的，是工具如何接入既有流程，以及成本、權限和失敗處理是否可控。

<a id="tr-software"></a>
### 軟體工程
AI Coding 進入 **平台化圈地** 階段。廠商不再只賣 API，而是自建 IDE、Agent 與訂閱方案，把開發者的日常工作綁進自家生態 [[3. TechOrange]](#ref-3)。免費下載搭配付費訂閱已成為常見的搶市方式，遷移成本也會隨使用時間增加。團隊選型時，資料可攜性、開放標準與退出成本，會和模型能力一樣重要。

<a id="tr-security"></a>
### 軟硬體資訊安全
攻擊者的 **心理戰與供應鏈化** 更明顯。Settra 把竊得資料包裝成「稽核報告」施壓，是把技術入侵升級成聲譽勒索 [[4. iThome]](#ref-4)；而 Pi 拍錢包與 Nissan 事件都指向身分、支付與 ERP 等高價值資料節點。數產署很快進場行政檢查。企業除了盤點第三方系統，也要縮小個資留存範圍，並定期演練外洩應變。

<a id="tr-hardware"></a>
### 硬體或軟硬整合
硬體競爭聚焦 **「具身智能落地」與「記憶體產能版圖」**。人形機器人從展示轉向規模部署與場景驗證 [[5. TechNews]](#ref-5)；南韓則以 800 兆韓元投資案擴建記憶體晶圓廠與供應鏈聚落 [[6. AP]](#ref-6)。演算法最終仍要靠量產、封裝、能源和供應商配合才能交貨。投資金額很大，但廠房能否按期投產，才會決定新增產能何時進入市場。

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎
**能源正成為 AI 基礎設施的硬約束。** 台灣把 AI 資料中心納入產業效益評估與 BAT 要求，也把用電效率列入前期審查 [[7. TechNews]](#ref-7)。當 AI 園區的用電足以影響區域電網，選址、餘熱回收、綠電採購與電網協調都會直接影響開發進度。工程團隊也會更常用每瓦算力評估設備。

<a id="tr-fintech"></a>
### 金融科技
金融科技進入 **「穩定幣制度化」** 階段。Bank of England 已把廣泛用於支付、可能影響金融穩定的穩定幣納入專門規則草案 [[8. Bank of England]](#ref-8)。產品團隊不能只處理鏈上轉帳，還要把儲備管理、贖回、流動性、營運持續性與監理報告納入系統設計。產品能否長期符合金融穩定要求，會比發行速度更難處理。

<a id="tr-healthtech"></a>
### 醫療科技
生技產業希望用 AI 實現 **「Speed to Patients」**，縮短開發時程。從藥物設計、臨床試驗到法規與商業化，AI 被定位為貫穿全鏈的加速器 [[9. TechNews]](#ref-9)。實務上的難題仍是資料品質、跨機構臨床資料互通與監理科學（regulatory science）。AI 模型若無法銜接真實世界臨床資料與法規流程，很難真正縮短開發時程。

<a id="tr-logistics"></a>
### 運輸物流
物流以 **「分層自動化」** 回應缺工與減碳。幹線用自駕貨車、末端用電動小型運具與配送機器人，形成互補分工 [[10. LNEWS]](#ref-10)。這類實證多以特定路段、特定場景先行（Level 2、限定區域），顯示落地策略是「先窄後寬」。這些實證能否轉為常態營運，要看法規許可、營運資料與實際減碳數據。

<a id="tr-proptech"></a>
### 房地產與室內外裝潢
PropTech 的近期主戰場是 **「資訊整合與決策輔助」**。生成式 AI 摘要把分散的房產資訊整併成可讀結論 [[11. inHom]](#ref-11)，而 AI 驅動的產業需求（廠房、物流地產）正實質推升不動產投資 [[12. PChome]](#ref-12)。目前產品仍以找房與摘要為主。估價、資產管理及建築能源最佳化是否跟進，取決於業者能取得哪些可信資料。

<a id="tr-arts"></a>
### 現場表演藝術
現場表演出現 **「感官擴張」與「營運韌性」** 兩股力量。AI 與空間音效讓沉浸式演出成為新型態作品 [[13. HK01]](#ref-13)；而極端天氣頻繁使改期、退票的數位營運能力成為必備 [[14. NOWnews]](#ref-14)。技術已同時進入舞台創作與演出營運。前者處理內容形式，後者則要讓票務、通知和退款系統能應付臨時改期。

<a id="tr-entertainment"></a>
### 影視音樂
影視音樂進入 **「數位替身治理」** 時代。當臉、聲音、表演都能被 AI 重建，產業的核心議題從「能不能做」轉為「誰授權、如何分潤、身後如何保護」[[15. Further & Better]](#ref-15)。經紀公司搶建數位分身平台、藝人尋求法律保護、製作端擴大虛擬製作，三者交織出新的權利與商業框架。創作與工程團隊因此得保留內容來源、授權紀錄與當事人的同意範圍。

<a id="tr-others"></a>
### 其他領域科技應用突破
跨域突破呈現 **「地面成熟技術上太空」** 的方向。核電池從地面應用跨界成為商用衛星電源，解決深空與背陽面的持續供電問題 [[16. TechNews]](#ref-16)。小型衛星與長時間任務適合先測試這類電源。後續是否擴大使用，要看在軌壽命、安全規範與發射成本。

<a id="references"></a>
## 參考資料

| 編號 | 文章標題與搜尋連結 | 一句話繁體中文結論或亮點 | 發布日期 | 來源資料網址與名稱 | 分類 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ref-1"></a>1 | [OpenAI 公開發布 GPT-5.6 並推出 ChatGPT Work 與 GPT-Live](https://www.google.com/search?q=OpenAI+GPT-5.6+ChatGPT+Work+GPT-Live) | 政府解禁後 GPT-5.6 全面開放，AI Agent 與語音模型成新戰線 | 2026-07-08 | [CNBC](https://www.cnbc.com/2026/07/08/openai-expanding-gpt-5point6-ai-model-release-ending-government-limits.html) | AI 科技 |
| <a id="ref-2"></a>2 | [Anthropic 發布 Claude Sonnet 5，主打低成本 Agent](https://www.google.com/search?q=Anthropic+Claude+Sonnet+5+launch) | 效能逼近 Opus 4.8 但更便宜，成免費與 Pro 預設模型 | 2026-06-30 | [TechCrunch](https://techcrunch.com/2026/06/30/anthropic-launches-claude-sonnet-5-as-a-cheaper-way-to-run-agents/) | AI 科技 |
| <a id="ref-3"></a>3 | [中國 Z.ai 推出 ZCode 挑戰 Claude Code](https://www.google.com/search?q=Z.ai+ZCode+Claude+Code) | AI Coding 戰場由模型能力轉向 IDE 與訂閱平台 | 2026-07-03 | [TechOrange 科技報橘](https://techorange.com/2026/07/03/z-ai-launches-zcode/) | 軟體工程 |
| <a id="ref-4"></a>4 | [PChome 旗下 Pi 拍錢包遭 Settra 勒索、350 萬個資外洩](https://www.google.com/search?q=Pi+拍錢包+Settra+勒索軟體+外洩) | 350 萬筆個資外洩，數產署行政檢查，勒索集團把戰果包裝成稽核報告 | 2026-07-01 | [iThome](https://www.ithome.com.tw/news/177011) | 軟硬體資訊安全 |
| <a id="ref-5"></a>5 | [調研：美中人形機器人競爭進入新階段](https://www.google.com/search?q=人形機器人+具身智能+Counterpoint+2026) | 競爭從展示轉向商業化與規模部署，全球部署達 160 萬台 | 2026-07-07 | [TechNews 科技新報](https://technews.tw/2026/07/07/humanoid-robot-embodied-ai/) | 硬體或軟硬整合 |
| <a id="ref-6"></a>6 | [南韓三星與 SK 海力士投資 800 兆韓元擴建 AI 晶片聚落](https://www.google.com/search?q=South+Korea+Samsung+SK+Hynix+800+trillion+won+chip+hub) | AI 硬體競爭擴大到記憶體產能、區域配置與供應鏈韌性 | 2026-06-29 | [AP](https://apnews.com/article/22352d95c7a821c5f4548b2d1a4ebde8) | 硬體或軟硬整合 |
| <a id="ref-7"></a>7 | [經濟部修法草案，AI 資料中心納入產業效益評估](https://www.google.com/search?q=經濟部+AI+資料中心+產業效益評估+修法) | 用電成 AI 基建硬約束，估 2030 年新增用電需求破 5 GW | 2026-07-01 | [TechNews 科技新報](https://technews.tw/2026/07/01/data-center-law-in-taiwan/) | 網路/伺服器等基礎 |
| <a id="ref-8"></a>8 | [Bank of England 金融政策委員會檢視系統性穩定幣監管進度](https://www.google.com/search?q=Bank+of+England+Financial+Policy+Committee+Record+July+2026+stablecoins) | 穩定幣監管由市場實驗走向支付基礎設施與金融穩定框架 | 2026-07-07 | [Bank of England](https://www.bankofengland.co.uk/financial-policy-committee-record/2026/july-2026) | 金融科技 |
| <a id="ref-9"></a>9 | [2026 亞洲生技大會 7/15 登場，AI 重塑新藥研發](https://www.google.com/search?q=2026+亞洲生技大會+Speed+to+Patients+AI+新藥) | AI 貫穿新藥設計到商業化全鏈，主題「加速上市、造福病患」 | 2026-07-03 | [TechNews 科技新報](https://technews.tw/2026/07/03/speed-to-patients/) | 醫療科技 |
| <a id="ref-10"></a>10 | [日本啟動電動個人運具最後一哩配送實證](https://www.google.com/search?q=glafit+電動+ラストワンマイル+配送+実証+2026) | 幹線自駕＋末端電動運具，分層自動化回應缺工與減碳 | 2026-07-06 | [LNEWS（日本物流媒體）](https://www.lnews.jp/2026/07/s0706102.html) | 運輸物流 |
| <a id="ref-11"></a>11 | [潮居科技發表《AI 理家》房產 AI 搜尋整合服務](https://www.google.com/search?q=潮居科技+inHom+AI理家+房地產) | PropTech 把 Google 式 AI 摘要導入看房決策 | 2026-07-04 | [潮居科技 inHom](https://www.inhom.ai/search-agent) | 房地產與室內外裝潢 |
| <a id="ref-12"></a>12 | [日本 PropTech 品牌 RENOSY 利諾喜登台](https://www.google.com/search?q=RENOSY+利諾喜+台灣+房地產博覽會+2026) | AI 帶動廠房物流投資年增 279%，PropTech 加速登台 | 2026-06-26 | [PChome 新聞](https://news.pchome.com.tw/public/morenews/20260626/index-78246955232471350016.html) | 房地產與室內外裝潢 |
| <a id="ref-13"></a>13 | [「Wayne McGregor：異・地」沉浸式 AI 舞蹈裝置](https://www.google.com/search?q=Wayne+McGregor+異地+大館+沉浸式+AI+舞蹈) | AI 與空間音效走上舞台，擴張現場表演的感官維度 | 2026-07-08 | [香港01](https://www.hk01.com/藝文/60366008/) | 現場表演藝術 |
| <a id="ref-14"></a>14 | [盧廣仲台北演唱會因颱風延期](https://www.google.com/search?q=盧廣仲+演唱會+颱風+延期+7月+北流) | 極端天氣考驗票務與退款系統的即時應變韌性 | 2026-07-07 | [NOWnews 今日新聞](https://www.nownews.com/news/6854220) | 現場表演藝術 |
| <a id="ref-15"></a>15 | [全球影視媒體產業週報：AI 數位分身與虛擬製作](https://www.google.com/search?q=CAA+AI+digital+doubles+Harry+Shearer+virtual+production+2026) | 產業搶建數位替身授權與分潤規則，聲音權成焦點 | 2026-07-08 | [Further & Better（產業週報）](https://furtherandbetter.substack.com/p/global-tv-film-and-media-industry-b96) | 影視音樂 |
| <a id="ref-16"></a>16 | [SpaceX 發射全球第一顆核動力商用衛星](https://www.google.com/search?q=SpaceX+核動力+商用衛星+City+Labs+BOHR+tritium) | 核電池上太空，解決深空與背陽面持續供電問題 | 2026-07-10 | [TechNews 科技新報](https://technews.tw/2026/07/10/spacex-just-launched-the-1st-ever-nuclear-powered-commercial-satellite/) | 其他領域科技應用突破 |

<a id="notes"></a>
## 報告說明
本報告由 Claude Code、Codex 於 2026-07-11 彙整與查核近 15 天內（2026-06-26 至 2026-07-11）的全球科技新聞與媒體報導，再依程式設計師與科技讀者較常關注的主題整理成分類摘要與趨勢觀察。來源以台灣主流與權威科技媒體優先，中國來源與社群平台已依規範替換或排除；凡無法確認落在近 15 天內的資料一律不採用，確認落在範圍內但發布時間不精確者於「發布日期」欄標註 `*未知時間`。完整候選來源與淘汰理由見同資料夾 `source.md`。
