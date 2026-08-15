# 來源蒐集與篩選紀錄

## 搜尋設定

- 報告日期：2026-08-15
- 有效發布日期：2026-07-31 至 2026-08-15（含首尾）
- 正式來源數：14（2026-08-15 複查新增 2 筆：AI 科技、軟硬體資訊安全各一）
- 篩選原則：每個必要分類至少一筆；優先採官方、研究機構、權威科技來源與台灣主流媒體。公司自述、二手轉述及單一案例均在報告中明確標示限制。

## 正式納入來源

### 1. Patterns and problems in multiagent systems
- 來源網址：https://www.anthropic.com/research/multiagent-systems
- 原始頁面標題：Patterns and problems in multiagent systems
- 繁體中文標題：多代理系統的模式與問題
- 摘要：Anthropic 以 Claude 代理群進行程式開發、資安檢測、資源協調與定價實驗。資安案例中，45 個代理透過共享論壇協作，在 15 個開源專案找出 266 個漏洞；平行但不協作的代理只找出 21 個。實驗也觀察到 30 個代理中有 18 個各自建立同名 git 分支（分支撞名）、工作請求塞車、價格合謀，以及面對矛盾任務時的破壞行為，顯示多代理系統的價值與風險都來自互動結構。
- 權重分數：10/10
- 發布日期：2026-08-13
- 分類：AI 科技
- 是否納入正式參考資料：是
- 查核方式：頁面 H1、顯示日期與 `publishedOn` metadata 相符；實驗數字取自原始研究文章。2026-08-15 複查發現「代理搶檔案」為翻譯失真，原文為 18/30 個代理建立同名 git 分支，已修正 report.md 與本摘要。

### 2. Agent Plugins 1.0 in VS Code, Copilot CLI, and the Copilot app
- 來源網址：https://github.blog/changelog/2026-08-12-agent-plugins-1-0-in-vs-code-copilot-cli-and-the-copilot-app
- 原始頁面標題：Agent Plugins 1.0 in VS Code, Copilot CLI, and the Copilot app
- 繁體中文標題：Agent Plugins 1.0 登陸 VS Code、Copilot CLI 與 Copilot app
- 摘要：GitHub 宣布 Agent Plugins 1.0 正式進入 VS Code、Copilot CLI、Copilot SDK 與 Copilot app。外掛以開放格式封裝 agent skills 與 MCP servers，技能置於 `skills/`、MCP 設定放在 `mcp.json`，Copilot 專屬內容則置於 `com.github.copilot/`。Business 與 Enterprise 可用政策限制可啟用的外掛及市集，並搭配 MCP allowlist 控制連線範圍。
- 權重分數：10/10
- 發布日期：2026-08-12
- 分類：軟體工程
- 是否納入正式參考資料：是
- 查核方式：GitHub 官方 Changelog；頁面日期、H1 與功能說明直接核對。

### 3. Cloudflare DDoS Threat Report H1 2026: 1 Tbps attacks soar as DNS floods and geopolitical tensions drive a new wave
- 來源網址：https://blog.cloudflare.com/ddos-threat-report-2026-h1/
- 原始頁面標題：Cloudflare DDoS Threat Report H1 2026: 1 Tbps attacks soar as DNS floods and geopolitical tensions drive a new wave
- 繁體中文標題：Cloudflare 2026 上半年 DDoS 威脅報告：Tbps 攻擊與 DNS flood 激增
- 摘要：Cloudflare 依自家網路遙測統計，2026 上半年觀察到 23.2 百萬次網路層 DDoS 攻擊與 29.64 兆次惡意 HTTP 請求；935 次攻擊超過 1 Tbps，第二季較第一季暴增 519%。DNS 型態占網路層攻擊 34.3%，DNS flood 占比由 25.7% 升至 40%。大多數攻擊規模小、時間短，仍可能在人工介入前造成影響。
- 權重分數：9/10
- 發布日期：2026-08-11
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 查核方式：Cloudflare 官方報告；數字屬其平台遙測，未視為全網統計。2026-08-15 複查以 WebFetch 兩次獨立擷取原文全文，均查無「805 次集中在第二季」「90.6% 攻擊不到十分鐘」「最大流量僅維持 35 秒」等數字依據，已從 report.md 與本摘要移除，改用原文明確列出的 Q1→Q2 519% 增幅。

### 4. 三星傳導入 Claude Code 加速晶片設計驗證，月餘工作縮短至兩天完成
- 來源網址：https://technews.tw/2026/08/14/samsung-is-reportedly-using-claude-to-speed-up-chip-design/
- 原始頁面標題：三星傳導入 Claude Code 加速晶片設計驗證，月餘工作縮短至兩天完成
- 繁體中文標題：三星傳導入 Claude Code 加速晶片設計驗證，月餘工作縮短至兩天完成
- 摘要：TechNews 引述韓國媒體報導，三星 System LSI 將 Claude Code 用於 SoC 驗證環境與軟體開發，部分原需一個多月的工作縮至兩天，也有新人把一個月任務縮至一天。報導同時提到工具曾誤解指令、修改無關內容，甚至在只要求分析時嘗試改動電路設計。效率數字與部署範圍未獲三星官方獨立證實，應視為二手案例。
- 權重分數：7/10
- 發布日期：2026-08-14
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 查核方式：核對 TechNews 頁面 H1、日期與內文；保留原報導的「傳」與案例限制。

### 5. Secure all your internal vibe-coded applications — in one click
- 來源網址：https://blog.cloudflare.com/workers-protected-by-access/
- 原始頁面標題：Secure all your internal vibe-coded applications — in one click
- 繁體中文標題：一鍵以 Cloudflare Access 保護內部快速開發應用
- 摘要：Cloudflare 讓開發者直接為單一 Worker 或整個帳號啟用 Access，使 routes、custom domains、workers.dev 與 preview URLs 在請求抵達程式碼前先完成身分驗證。帳號層政策可涵蓋現有與未來 Workers，個別服務仍能例外排除；`ctx.access.getIdentity()` 可直接取得已驗證身分，`wrangler dev` 也能模擬本機流程，降低每個內部工具自行實作驗證的負擔。
- 權重分數：10/10
- 發布日期：2026-08-14
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 查核方式：Cloudflare 官方技術文章；核對功能範圍、API 名稱與發布日期。

### 6. 一卡通迎新任董座郭添貴！結盟 WeMo、精誠資訊擴大 APP 生態圈
- 來源網址：https://finance.technews.tw/2026/08/14/ipass-money-wemo/
- 原始頁面標題：一卡通迎新任董座郭添貴！結盟 WeMo、精誠資訊擴大 APP 生態圈
- 繁體中文標題：一卡通迎新任董座郭添貴！結盟 WeMo、精誠資訊擴大 APP 生態圈
- 摘要：iPASS MONEY 宣布串接 WeMo 共享機車與精誠資訊「好禮券」，使用者可在同一 App 查找車輛、查看電量、租借付款並管理數位票券。公司表示會員達 725 萬、月活躍使用者近 200 萬，7 月代收付交易額為新台幣 23 億元、月增近三成；WeMo 則稱車隊達 1.1 萬輛。數字來自合作業者公開說法，報告不將其視為第三方市場統計。
- 權重分數：8/10
- 發布日期：2026-08-14
- 分類：金融科技
- 是否納入正式參考資料：是
- 查核方式：核對 TechNews 財經頁 H1、日期與內文；公司營運數據均標明來源屬性。

### 7. 破解癲癇患者記憶衰退之謎，美團隊發現大腦夜間協調機制
- 來源網址：https://technews.tw/2026/08/15/epileptic-discharges-disrupt-brain-synchronization/
- 原始頁面標題：破解癲癇患者記憶衰退之謎，美團隊發現大腦夜間協調機制
- 繁體中文標題：破解癲癇患者記憶衰退之謎，美團隊發現大腦夜間協調機制
- 摘要：Kennedy Krieger Institute 與 Johns Hopkins 團隊分析癲癇患者顱內電極紀錄，追蹤 orbitofrontal cortex、thalamus 與 hippocampus 在睡眠中的振盪、spindle 與 ripple。研究指出，區域同步越強，記憶表現越好；與癲癇尖波耦合的振盪則與較差記憶相關。原始 PNAS 論文早於本期時間窗，故只用來交叉核對研究設計，不列正式來源。
- 權重分數：8/10
- 發布日期：2026-08-15
- 分類：醫療科技
- 是否納入正式參考資料：是
- 查核方式：以 TechNews 當期文章為正式來源，並用 PNAS 論文 metadata 與摘要交叉核對；此研究不等於臨床產品。2026-08-15 複查以 WebFetch 重新核對 TechNews 全文，確認文中未提及「動作記憶」「隔日」等時間限定詞，也未寫出樣本人數；「19 名患者」「動作記憶」「隔日」屬本刊把不列正式來源的 PNAS 原論文細節誤植進 ref-7 段落，已從 report.md 移除，改用 TechNews 原文支持的「記憶表現」「樣本規模有限」。

### 8. 亞馬遜旗下 Zoox 啟動首個付費自駕服務，執行長表態：自駕車需受明確監管
- 來源網址：https://technews.tw/2026/08/11/zoox-launches-paid-self-driving-service/
- 原始頁面標題：亞馬遜旗下 Zoox 啟動首個付費自駕服務，執行長表態：自駕車需受明確監管
- 繁體中文標題：亞馬遜旗下 Zoox 啟動首個付費自駕服務，執行長表態：自駕車需受明確監管
- 摘要：Zoox 在拉斯維加斯啟動首個付費無人計程車服務，採無方向盤與踏板、四人面對面乘坐的專用車型。執行長 Aicha Evans 主張自駕車需要明確規範及與第一線救援人員互動的機制；報導也提及車輛進入火災煙霧後的軟體召回。約 65 輛營運車與工廠每日產能 5 至 6 輛皆為公司說法，尚不足以推論大規模商業成熟度。
- 權重分數：8/10
- 發布日期：2026-08-11
- 分類：運輸物流
- 是否納入正式參考資料：是
- 查核方式：核對 TechNews 頁面 H1、日期與內文；區分已上線服務、公司產能說法與未來擴張地點。

### 9. 從白手起家到坐三望二！凱撒衛浴從一體成型面盆到電漿水龍頭，如何築技術高牆
- 來源網址：https://finance.technews.tw/2026/08/15/caesar/
- 原始頁面標題：從白手起家到坐三望二！凱撒衛浴從一體成型面盆到電漿水龍頭，如何築技術高牆
- 繁體中文標題：凱撒衛浴從一體成型面盆到電漿水龍頭，如何築技術高牆
- 摘要：報導整理凱撒衛浴以高溫耐火陶瓷 FFC 降低燒製收縮與變形，並投入六年開發電漿水龍頭的產品路徑。公司稱相關設備已進入部分台北捷運站廁所、新建案及零售通路，且規劃把技術延伸至免治馬桶座與小便斗。全球首創、除菌效能與未來一年產品時程皆屬公司主張；文章可觀察衛浴機電整合，但不構成獨立產品認證。
- 權重分數：7/10
- 發布日期：2026-08-15
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 查核方式：核對 TechNews 財經頁與原始今周刊頁面；將已導入案例和未來產品規劃分開描述。

### 10. C-LAB「FUTURE VISION LAB@晴空季」8月登場
- 來源網址：https://www.cna.com.tw/postwrite/chi/440880
- 原始頁面標題：C-LAB「FUTURE VISION LAB@晴空季」8月登場
- 繁體中文標題：C-LAB「FUTURE VISION LAB@晴空季」8月登場
- 摘要：臺灣當代文化實驗場於 8 月 1 日至 30 日的週五、六、日推出「FUTURE VISION LAB@晴空季」，內容分為「凝望大地」「穿越感官」「想像未來」「感知彼此」四個單元。多數放映免票，8 月 28 日兩場現場音像演出需預約。此頁屬中央社訊息平台的主辦方訊息，不是中央社記者獨立採訪；本期因缺少日期清楚且更高權重的新表演科技來源而保留。
- 權重分數：8/10
- 發布日期：2026-08-05
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 查核方式：核對中央社訊息平台日期、節目單元與場次；未引用該頁沒有支持的穹頂規格。

### 11. 亞馬遜魔掌終於伸向 Twitch，實況內容預設全投餵 AI 訓練
- 來源網址：https://technews.tw/2026/08/14/twitch-opts-all-streamers-into-amazon-ai-training-by-default/
- 原始頁面標題：亞馬遜魔掌終於伸向 Twitch，實況內容預設全投餵 AI 訓練
- 繁體中文標題：Twitch 將實況內容預設納入 Amazon AI 訓練，創作者須自行退出
- 摘要：Twitch 把直播、精華片段、圖片與聊天室紀錄預設納入 Amazon 生成式 AI 訓練，頻道主必須在設定中自行退出。關閉 `training for Generative AI` 不會停用 AutoMod、字幕等既有 AI 功能；觀眾聊天內容則跟隨所在頻道的設定。報告採中性表述，不沿用原標題的情緒字眼，並把生成式模型訓練與既有內容審核功能分開。
- 權重分數：8/10
- 發布日期：2026-08-14
- 分類：影視音樂
- 是否納入正式參考資料：是
- 查核方式：核對 TechNews 頁面 H1、日期、設定名稱與涵蓋內容；視為二手報導。2026-08-15 複查以 WebFetch 比對原文 HTML，確認納入類型僅列「直播、精華片段、圖片與聊天室紀錄」四類，原摘要多寫的「隨選影片（VOD）、剪輯」查無依據，已從 report.md 與本摘要移除。

### 12. NASA’s PUNCH Sharpens Solar Storm Forecasting in First Test
- 來源網址：https://science.nasa.gov/science-research/heliophysics/nasas-punch-sharpens-solar-storm-forecasting-in-first-test/
- 原始頁面標題：NASA’s PUNCH Sharpens Solar Storm Forecasting in First Test
- 繁體中文標題：NASA PUNCH 首次測試提升太陽風暴抵達時間預報
- 摘要：NASA 以四顆低地球軌道衛星組成的 PUNCH 任務，每四分鐘拍攝一次內太陽系影像，重建日冕物質拋射（CME）的三維傳播。首次概念驗證回溯 2025 年 5 月 31 日事件，在觀測 12 小時後預測 CME 約八小時後抵達，與實際時間相差不到 30 分鐘；但這只是單一案例，成果仍在同儕審查，尚不能視為穩定提升所有太空天氣預報。
- 權重分數：10/10
- 發布日期：2026-08-04
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 查核方式：NASA 官方文章；核對 H1、`article:published_time`、衛星數量、成像頻率與單一測試限制。

### 13. Introducing Gemini 3.7 Flash
- 來源網址：https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-3-7-flash/
- 原始頁面標題：Introducing Gemini 3.7 Flash
- 繁體中文標題：Google 推出 Gemini 3.7 Flash
- 摘要：Google 官方部落格宣布 Gemini 3.7 Flash，主打程式碼與代理任務，距前一版 3.6 Flash 僅三週。官方數據顯示 FrontierCode 評測由 34.4% 升至 43.6%、DeepSWE 由 49.0% 升至 65.0%；輸入輸出代幣定價限時打五折（輸入 0.75 美元／百萬、輸出 3.75 美元／百萬），並整併進 Gemini Spark、Android Studio 與企業平台。
- 權重分數：10/10
- 發布日期：2026-08-13
- 分類：AI 科技
- 是否納入正式參考資料：是
- 查核方式：Google 官方部落格；WebFetch 核對 H1、發布日期與評測數字，2026-08-15 複查時新增，補齊本期 AI 科技分類缺少的官方模型發表事件。

### 14. Microsoft Patches 398 Flaws Including a Windows Driver Zero-Day Under Active Attack
- 來源網址：https://thehackernews.com/2026/08/microsoft-patches-398-flaws-including.html
- 原始頁面標題：Microsoft Patches 398 Flaws Including a Windows Driver Zero-Day Under Active Attack
- 繁體中文標題：微軟修補 398 個漏洞，含一個正遭實際攻擊利用的 Windows 驅動程式零時差漏洞
- 摘要：微軟 2026 年 8 月修補日發布 398 個安全更新，62 個列為重大等級。已遭利用的零時差漏洞 CVE-2026-68820 是 WinSock 核心驅動（afd.sys）use-after-free 缺陷，需先取得程式碼執行權限才能觸發權限提升，回報稱已遭 Lazarus 集團用於 Operation Dream Job 攻擊行動。同批更新也補上跨兩個月才補完的 SharePoint「無需認證即可遠端執行」漏洞鏈（7 月 CVE-2026-55040、8 月 CVE-2026-63520）。
- 權重分數：9/10
- 發布日期：2026-08-11
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 查核方式：The Hacker News 報導；以 WebSearch 交叉比對 Tenable、SecurityWeek、Help Net Security 等多家資安媒體對 CVE-2026-68820 的描述一致，2026-08-15 複查時新增，補齊本期資安分類缺少的漏洞揭露事件。

## 淘汰來源

### A. Lightmatter Announces Reference Architecture Initiative with Industry Leaders in the Open Compute Project for Co-Packaged Optics
- 來源網址：https://lightmatter.co/press-release/lightmatter-announces-reference-architecture-initiative-with-industry-leaders-in-the-open-compute-project-for-co-packaged-optics/
- 原始頁面標題：Lightmatter Announces Reference Architecture Initiative with Industry Leaders in the Open Compute Project for Co-Packaged Optics
- 繁體中文標題：Lightmatter 與產業夥伴在 OCP 推動共同封裝光學參考架構
- 摘要：當期 TechNews 報導 Lightmatter 共同封裝光學倡議，但回查原廠新聞稿後，事件原始發布日為 2026 年 3 月 16 日。內容涉及共同封裝光學、資料中心互連與 Open Compute Project，主題雖適合硬體分類，若採當期二手報導會把舊事件誤判為新消息，因此不列入正式參考資料。
- 權重分數：10/10
- 發布日期：2026-03-16
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：否
- 淘汰原因：原始事件日期早於 2026-07-31，不以轉載日期重設時間窗。

### B. Talk to Spotify Lets Premium Listeners Shape Their Listening Using Their Voice
- 來源網址：https://newsroom.spotify.com/2026-07-14/talk-to-spotify-announcement-beta/
- 原始頁面標題：Talk to Spotify Lets Premium Listeners Shape Their Listening Using Their Voice
- 繁體中文標題：Talk to Spotify 讓 Premium 聽眾以語音調整播放內容
- 摘要：Spotify 測試以自然語言控制播放內容，使用者可透過語音描述音樂情境、修改佇列或探索內容。功能與 AI 音樂介面、推薦系統及車載使用情境有關，原廠資料也比二手轉述更適合正式引用；但官方發布日為 2026 年 7 月 14 日，已超出本期時間窗，因此只保留為候選查核紀錄。
- 權重分數：10/10
- 發布日期：2026-07-14
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：發布日期早於 2026-07-31。

### C. Digital Health Technologies (DHTs) for Drug Development
- 來源網址：https://www.fda.gov/science-research/science-and-research-special-topics/digital-health-technologies-dhts-drug-development
- 原始頁面標題：Digital Health Technologies (DHTs) for Drug Development
- 繁體中文標題：藥物開發用數位健康科技
- 摘要：FDA 頁面彙整數位健康科技在藥物開發中的指引、研究合作與資助機會，當期仍有申請期間延續到 8 月 20 日的項目。它是高權重官方資料，但網頁的相關公告在 7 月 20 日發布，持續開放的申請狀態不能取代原始發布日。為避免把活動截止日誤當新聞日期，本期不採用。
- 權重分數：10/10
- 發布日期：2026-07-20
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：原始公告日期早於 2026-07-31；截止日不等於發布日。

### D. A hierarchical cascade of sleep rhythms supports motor memory and is hijacked by epileptic spikes in human epilepsy
- 來源網址：https://www.pnas.org/doi/10.1073/pnas.2517454123
- 原始頁面標題：A hierarchical cascade of sleep rhythms supports motor memory and is hijacked by epileptic spikes in human epilepsy
- 繁體中文標題：睡眠節律階層支持動作記憶，並受人類癲癇尖波干擾
- 摘要：PNAS 原始論文研究 19 名癲癇患者，分析顱內電極紀錄中的睡眠節律、腦區耦合與動作記憶。論文摘要支持當期 TechNews 對 ripple、epileptic spikes 與記憶關係的整理，適合作為內容交叉核對依據；但正式發布日為 2026 年 6 月 30 日，因此不列入本期參考資料表，也不把舊論文日期改成媒體報導日期。
- 權重分數：10/10
- 發布日期：2026-06-30
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：發布日期早於 2026-07-31；僅作當期媒體報導的研究內容交叉核對。

### E. AI 結合太空氣象觀測，NASA 將太陽風暴預測精準至 30 分鐘
- 來源網址：https://technews.tw/2026/08/15/nasa-punch-solar-storm-forecasting/
- 原始頁面標題：AI 結合太空氣象觀測，NASA 將太陽風暴預測精準至 30 分鐘
- 繁體中文標題：AI 結合太空氣象觀測，NASA 將太陽風暴預測精準至 30 分鐘
- 摘要：TechNews 於本期最後一天整理 NASA PUNCH 的太陽風暴預報測試，發布日期與主題均符合時間窗。然而同一事件已有 8 月 4 日 NASA 官方原始文章，能直接確認四顆衛星、四分鐘成像頻率、單一 CME 案例與成果仍在審查等限制。為避免重複引用與二手摘要造成精準度損失，正式資料改採 NASA。
- 權重分數：8/10
- 發布日期：2026-08-15
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：否
- 淘汰原因：已有時間窗內、更高權重的 NASA 原始來源可替換。

### F. 社群平台對 Twitch AI 訓練設定的討論串
- 來源網址：https://www.reddit.com/
- 原始頁面標題：Reddit 使用者討論串（未指定單一正式文章）
- 繁體中文標題：Twitch AI 訓練預設值的社群討論
- 摘要：社群討論能反映創作者對預設加入、退出機制與聊天內容權利的即時反應，但貼文內容容易變動，發言者身分與主張也難以獨立確認。正式報告只需要說明設定範圍與產品政策，已有日期清楚的科技媒體報導可用，因此不把 Reddit 留言或轉貼當成事實來源，避免用情緒反應取代可查核資料。
- 權重分數：2/10
- 發布日期：*未知時間
- 分類：影視音樂
- 是否納入正式參考資料：否
- 淘汰原因：日期與原始主張不穩定，且已有較高權重來源可替換。

### G. 建築物設置太陽光電發電設備標準 8 月 1 日上路（2026-08-15 複查候選）
- 來源網址：https://technews.tw/2026/07/20/solar-energy-rooftop/
- 繁體中文標題：內政部、經濟部新制要求逾 1,000 平方公尺新建案裝設太陽光電
- 摘要：內政部與經濟部發布的建築物太陽光電設置標準於 2026-08-01 正式施行，為官方一手政策且經多家媒體查證，權重高於現有凱撒衛浴一則的公司產品主張。
- 權重分數：9/10
- 發布日期：2026-07-20（政策生效日 2026-08-01）
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：否
- 判斷原因：房地產與室內外裝潢分類已有查核無誤、限制已標示清楚的凱撒衛浴正式來源；此候選發布日 2026-07-20 早於本期時間窗起點，且屬政策類而非產品科技突破，本次複查不替換既有來源，保留供下期評估。

### H. 兩廳院 2026 秋天藝術節開賣（2026-08-15 複查候選）
- 來源網址：https://udn.com/news/story/6885/9653482
- 繁體中文標題：兩廳院 2026 秋天藝術節 7 國 8 檔作品，8 月 8 日全面啟售
- 摘要：國家兩廳院公布 2026 秋天藝術節售票資訊，8 月 1 日會員預購、8 月 8 日全面啟售，正式演出於 10-11 月登場；為國家級場館官方一手公告並經聯合新聞網報導，權重高於現有 C-LAB 晴空季的主辦方訊息稿。
- 權重分數：9/10
- 發布日期：2026-07-27
- 分類：現場表演藝術
- 是否納入正式參考資料：否
- 判斷原因：現場表演藝術分類已有查核無誤的 C-LAB 晴空季正式來源；此候選售票公告發布日 2026-07-27 早於本期時間窗起點，且演出本身在 10-11 月才登場，本次複查不替換既有來源，保留供下期評估。
