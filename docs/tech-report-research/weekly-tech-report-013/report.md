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
這期各類產品都在處理同一件事：技術除了能用，還得管得住、出錯能回復，也要能檢查實際效果。OpenAI 為企業代理加上權限、評測與人工轉接；GitHub 把程式品質門檻放進 pull request；Oracle 一次釋出大量修補，也提醒團隊，產碼變快之後，漏洞排序與更新速度不能停在原地。硬體、雲端、醫療、物流、營建與科學實驗亦然。單一功能要進入正式環境，最後都得接上既有制度與日常營運。[[1. OpenAI]](#ref-1) [[3. GitHub]](#ref-3) [[4. Oracle]](#ref-4) [[12. FDA]](#ref-12) [[17. NSF]](#ref-17)

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技
- **企業導入代理，難題已不在模型本身，而在怎麼管。** OpenAI Presence 只讓代理取得特定工作需要的資料與工具權限，上線前再用模擬和 grader 檢查政策遵循、工具使用及人工轉接。正式運作後，團隊可從轉接與品質訊號找問題，確認後才透過受控 rollout 更新。iThome 補充，OpenAI 英文電話客服已有 75% 來電不需真人協助；不過 Presence 目前仍只對符合資格的企業有限度供應。[[1. OpenAI]](#ref-1) [[2. iThome]](#ref-2)
- **模型選擇開始按工作計算成本。** Google 同週發表 Gemini 3.6 Flash，主打程式與多模態能力；在 Artificial Analysis Index 上，它比 3.5 Flash 少用 17% 輸出 token。Google 也推出每秒 350 token 的 3.5 Flash-Lite，以及專門找出並修補漏洞、目前只有限提供給政府與可信夥伴的 3.5 Flash Cyber。開發團隊不能再只看旗艦模型的單一分數，還要依工作比較準確度、延遲與 token 成本，判斷哪些任務適合交給專用模型。[[18. Google]](#ref-18)

<a id="hl-software"></a>
### 軟體工程
- **GitHub 把 Code review 的品質指標與合併規則放進同一套流程。** GitHub Code Quality 結合 CodeQL 的確定性分析、AI 輔助偵測和 Copilot Autofix，ruleset 則可設定品質門檻。團隊可以先用 evaluate mode 觀察結果，不必立刻阻擋合併，確認規則合用後再逐步強制執行。這套產品把掃描、修正與計量接進現有的 pull request 流程，比單獨增加 AI review bot 多了一層組織管理。[[3. GitHub]](#ref-3)

<a id="hl-security"></a>
### 軟硬體資訊安全
- **Oracle 這季一次釋出 1,449 項安全修補。** iThome 進一步整理出 1,235 個漏洞，其中 261 個屬重大漏洞，另有 10 個 CVSS 分數達 10.0。光是 Oracle E-Business Suite 就有 410 項修補，45 項可在沒有帳密的情況下從網路利用。企業很難把這些項目全塞進同一個維護時段，得先找出外曝服務、無驗證攻擊路徑與已停止支援的版本。[[4. Oracle]](#ref-4) [[5. iThome]](#ref-5)

<a id="hl-hardware"></a>
### 硬體或軟硬整合
- **Intel 與 AMD 都把焦點放在整套系統。** Intel 和 Fortinet 合作開發 SP6，整合 ASIC、封裝與製造能力，用專用硬體處理高吞吐資安工作。AMD 則發表 MI400、EPYC 9006 和 Helios，把代理執行、GPU 資料供應及企業服務分配給不同 CPU。評估效能時，單顆晶片跑分已經不夠；處理器、記憶體、網路、軟體與供應鏈能否一起擴充，才會決定系統實際能交付多少算力。[[6. Intel]](#ref-6) [[7. iThome]](#ref-7) [[8. iThome]](#ref-8)

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎
- **EKS 增加升級退路，Microsoft 與 Mistral 則擴大主權 AI 的部署範圍。** Amazon EKS 允許叢集就地升級後，在 7 天內回復前一個 Kubernetes 次要版本，並先檢查 API、節點和附加元件相容性；一般叢集的資料平面仍得自行處理。Microsoft 與 Mistral 提供的選項涵蓋公有雲、客戶控制環境及完全隔離環境。一項處理升級失敗，另一項處理資料放在哪裡、由誰管理。[[9. iThome]](#ref-9) [[10. Microsoft]](#ref-10)

<a id="hl-fintech"></a>
### 金融科技
- **企業虛擬卡不再只是換一組卡號。** Mastercard 擴充 In Control，讓發卡機構與企業透過單一 API 限制用途、金額、交易對象及清算方式，並接入嵌入式支付夥伴網路。這套平臺已涵蓋 43 個國家和地區、174 種貨幣。即時發卡只是其中一環；企業還能把財務政策寫進交易規則，降低共用公司卡、人工核准與事後對帳帶來的風險。[[11. Mastercard]](#ref-11)

<a id="hl-healthtech"></a>
### 醫療科技
- **數位醫療的審查開始看實際使用成效。** FDA 選出 Dexcom 參與 TEMPO，評估 Glucose Health Program 能否利用連續資料與 AI 洞察，協助管理糖尿病前期和第二型糖尿病。參與者必須持續蒐集、監控並回報實際使用資料，CMS ACCESS 再依病患成效建立支付路徑。審查不會在功能通過後就結束，軟體、裝置與照護流程長期是否有效，也在觀察範圍內。[[12. FDA]](#ref-12)

<a id="hl-logistics"></a>
### 運輸物流
- **日本的補助範圍顯示，自駕卡車不是買車就能上路。** 國土交通省除了補助車輛採購，也涵蓋物流據點改造、一對多遠端監控、混合交通、自動裝卸串接及首年運行費用。卡車即使能在高速公路自行駕駛，場站若缺少合適的車位、裝卸設備與調度介面，服務仍很難穩定運作。[[13. 日本國土交通省]](#ref-13)

<a id="hl-proptech"></a>
### 房地產與室內外裝潢
- **新加坡同時調整智慧吊車規範與試驗成本。** 符合安全條件的智慧吊車不再強制配置機內操作員，營建科技 sandbox 的場地租金也獲得減免。自動化設備因此能用較低成本進入真實工地測試。PropTech 團隊除了證明機器能完成操作，還得處理感測失效、遠端接管、責任紀錄與現場人員動線。[[14. Singapore BCA]](#ref-14)

<a id="hl-arts"></a>
### 現場表演藝術
- **Impulse 讓編舞者直接操作動作捕捉結果。** 這套 SIGGRAPH 展示作品結合 Unreal Engine、動作捕捉與 mixed reality，可記錄動作、套用到多名數位舞者，並即時調整空間構圖。創作者能反覆試作虛擬群舞，不必每次都等技術團隊完成離線輸出，修改動作與看到結果之間的等待時間也跟著縮短。[[15. SIGGRAPH 2026]](#ref-15)

<a id="hl-entertainment"></a>
### 影視音樂
- **Spotify 把推薦清單改成可以來回修正的對話。** 測試中的 beta 功能接受文字或語音指令，使用者可以要求播放、查詢收聽紀錄或了解歌曲背景，再透過後續對話改變方向。系統除了從點擊推測偏好，也能接收使用者明確說出的意圖。產品接下來得說清楚用了哪些歷史資料，並讓使用者能撤回指令，在語音誤播時快速復原。[[16. Spotify]](#ref-16)

<a id="hl-others"></a>
### 其他領域科技應用突破
- **AI 可程式化實驗室的難題，是留下可追溯的研究紀錄。** NSF 投資 20 個團隊建立雲端實驗室，並要求資料開放、可重用、可重現且適合 AI 使用。Agent 可以排程儀器、測試假設和整理結果，但 metadata、版本追蹤及失敗實驗紀錄仍得由研究流程確實保存。缺少這些資料，自動化只會更快產生無法重現的結果。[[17. NSF]](#ref-17)

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技
企業部署 AI 代理時，較實際的做法是先圈定一項工作，而不是買進通用 agent 之後再找用途。Presence 以帳務、理賠或 IT 支援等工作劃分權限、評測和人工轉接，代理上線後也能比照其他正式服務持續監控。同一週，Google 發表 Gemini 3.6 Flash、3.5 Flash-Lite 與資安專用的 3.5 Flash Cyber。團隊之後很可能在同一流程裡依工作切換模型，準確度之外，成本與延遲也會直接影響選擇。[[1. OpenAI]](#ref-1) [[2. iThome]](#ref-2) [[18. Google]](#ref-18)

<a id="tr-software"></a>
### 軟體工程
AI 讓程式碼產量增加，團隊也得把品質檢查提前到合併之前。GitHub 將 maintainability、reliability、coverage、ruleset 與 API 放進同一項產品，方便組織設定共同門檻。不過工具分數只能指出線索，不能代替人對架構品質的判斷。[[3. GitHub]](#ref-3)

<a id="tr-security"></a>
### 軟硬體資訊安全
面對上千項季度修補，單一維護時段很難全部處理完。排序時至少要看資產是否外曝、漏洞能否在未驗證身分下利用、產品是否仍受支援，以及停機對業務的影響。管理報表也得分清楚漏洞數、修補數與受影響產品數，否則很容易拿錯數字比較。[[4. Oracle]](#ref-4) [[5. iThome]](#ref-5)

<a id="tr-hardware"></a>
### 硬體或軟硬整合
硬體效能已經取決於整套系統的配合。SP6 把資安演算法、製程與封裝一起設計，Helios 則整合 CPU、GPU、記憶體、網路和 ROCm。開發者評估新平臺時，基準測試不能只跑晶片分數，驅動、編譯器、模型相容性與供應狀況也要一起算進去。[[6. Intel]](#ref-6) [[8. iThome]](#ref-8)

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎
企業現在要求雲端控制面處理兩件事：升級失敗時可以回復，工作負載也能留在指定邊界。Kubernetes rollback 降低版本升級的風險，主權 AI 則提供公有雲、客戶控制環境到完全離線的選項。部署方式一多，測試組合也跟著增加；Infrastructure as Code、版本紀錄和相容性驗證都得涵蓋實際採用的環境。[[9. iThome]](#ref-9) [[10. Microsoft]](#ref-10)

<a id="tr-fintech"></a>
### 金融科技
B2B 支付正在把財務規則搬到 API。虛擬卡可在交易前限制金額、用途和對象，做法很接近 policy-as-code，也比事後稽核更早攔下不合規交易。支付速度之外，跨系統身分、例外核准、清算可見性與既有 ERP 能否順利整合，會影響企業是否採用。[[11. Mastercard]](#ref-11)

<a id="tr-healthtech"></a>
### 醫療科技
數位醫療監管已把真實世界成效和支付方式放在一起檢驗。TEMPO 讓裝置在受控試辦中蒐集資料，ACCESS 則依成果建立支付路徑。資料品質、族群偏差、模型更新與不良事件回報因而不能等產品上市後再補，而要從開發階段就納入。[[12. FDA]](#ref-12)

<a id="tr-logistics"></a>
### 運輸物流
自動物流不能只按車輛計算投資。日本的補助同時涵蓋車輛、據點、調度、自動裝卸與首年營運，因為任何一段接不起來，整條路線就無法穩定運作。除了車輛本身，API、遠端監控和異常接管也會占去不少整合成本。[[13. 日本國土交通省]](#ref-13)

<a id="tr-proptech"></a>
### 房地產與室內外裝潢
營建科技走出 sandbox 之前，試驗結果得轉成其他工地也能採用的安全規則。智慧吊車若能以感測、遠端控制與稽核紀錄取代固定人力要求，巡檢、搬運和危險區作業也可能採用類似做法。產品從試驗第一天起，就要保留事故調查會用到的資料。[[14. Singapore BCA]](#ref-14)

<a id="tr-arts"></a>
### 現場表演藝術
數位舞者已能直接參與排練，不必等到演出完成後才作為視覺效果加入。編舞者可以自行調整動作映射與空間構圖，技術人員則要確保系統穩定、延遲夠低，而且下次排練仍能重現同樣的結果。[[15. SIGGRAPH 2026]](#ref-15)

<a id="tr-entertainment"></a>
### 影視音樂
對話式推薦讓使用者直接修正演算法對自己的理解。推薦產品因此要說明依據，允許更正，也得讓指令可以撤回。音樂、podcast 和有聲書的紀錄如何串接，隱私設定又能控制到什麼程度，都會影響使用者願不願意繼續對話。[[16. Spotify]](#ref-16)

<a id="tr-others"></a>
### 其他領域科技應用突破
自動化科學能否可靠運作，取決於資料、儀器介面與實驗紀錄是否互通。NSF 已把開放科學和可重現性列入投資條件。研究平臺若能像 CI 一樣保存輸入、環境、步驟與結果，機器加速探索之後，人仍有資料可以查核。[[17. NSF]](#ref-17)

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
本報告由 Codex、Claude Code 整理 2026-07-10 至 2026-07-25 的全球科技新聞、官方公告與台灣科技媒體報導，內容依程式設計師及科技讀者關注的主題分類。來源日期以文章或公告的實際發布日為準；舊文若只有更新日期落在範圍內，不列入正式參考資料。
