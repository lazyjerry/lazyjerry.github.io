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
