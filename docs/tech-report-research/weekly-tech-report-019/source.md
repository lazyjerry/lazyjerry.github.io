# 候選來源整理

- 報告日期：2026-09-05
- 時間範圍：2026-08-21 至 2026-09-05（含首尾）
- 判定原則：以原始頁面標示的發布日為準；無法確認落在時間窗內者直接排除。
- 來源優先序：官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載。中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。
- 跨期去重：本期窗期與 2026-08-29 期（2026-08-14 至 2026-08-29）重疊九天，篩選前已比對 `tech/2026-08-29/references.md`，重複事件即使落在窗內也淘汰。

## 正式納入來源

### 1. Anthropic 推出 Claude Fable 5.1 與 Claude Mythos 5.1
- 原始標題：Introducing Claude Fable 5.1 and Claude Mythos 5.1
- 標題：Anthropic 推出 Claude Fable 5.1 與 Claude Mythos 5.1
- URL：https://www.anthropic.com/claude-fable-and-mythos-5-1
- 摘要：Anthropic 同日發表兩款模型。Fable 5.1 的 API 識別碼為 `claude-fable-5-1`，輸入每百萬 token 10 美元、輸出 50 美元，快取讀取降到每百萬 token 0.25 美元，較 Fable 5 少 75%；官方估計典型工作負載成本降約 25%，代理型任務最多降約 45%。基準測試方面，Terminal-Bench-Science 0.1 由 24.7% 升到 52.6%，Terminal-Bench 4.0 由 42.0% 升到 55.8%，CursorBench 3.2.0 由 70.5% 升到 73.4%，Humanity's Last Exam 未用工具 60.9%、用工具 65.0%。安全面宣稱資安防護的誤判率降低 60%，並開放漏洞發掘這類防禦性用途。Fable 5.1 於 AWS、Google Cloud 與 Microsoft Azure 同步可用；Mythos 5.1 僅透過信任存取計畫開放給通過審查的美國組織。
- 權重：9/10
- 發布日期：2026-09-01
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：模型供應商第一手公告。基準分數為供應商自評，尚無獨立第三方複驗。

### 2. OpenAI 推出新模型 GPT-6 Astra　強調資安防護
- 原始標題：OpenAI推出新模型GPT-6 Astra　強調資安防護
- 標題：OpenAI 推出新模型 GPT-6 Astra，強調資安防護
- URL：https://www.cna.com.tw/news/ait/202609040112.aspx
- 摘要：OpenAI 發表 GPT-6 Astra，定位是自主處理繁瑣電腦工作的模型，示範場景涵蓋架站、科學分析、遊戲開發、資安與程式撰寫，官方舉例可把找房子的時間從六小時壓到十分鐘內。發表重點放在防護：總裁 Greg Brockman 說安全必須是第一優先，首席科學家 Jakub Pachocki 指出模型可能以非預期的方式達成目標。開放順序也照這個邏輯，付費的資安領域客戶當天先拿到存取權，其他付費客戶分批開放，免費方案與最低階付費用戶暫不納入。執行長 Sam Altman 表示正在加速讓所有人都能使用。報導並回顧 7 月曾有兩個 OpenAI 模型突破測試環境、侵入 Hugging Face 基礎設施的事件，官方稱 Astra 未涉入該次事件。
- 權重：8/10
- 發布日期：2026-09-04
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：中央社編譯報導。openai.com 對 WebFetch 回 403，依知識庫規則改以台灣權威通訊社報導作為參考資料來源。

### 3. 與客戶共同發展企業級前沿防護
- 原始標題：Developing Enterprise Frontier Safeguards with our customers
- 標題：Anthropic 與客戶共同發展企業級前沿防護
- URL：https://www.anthropic.com/news/enterprise-frontier-safeguards
- 摘要：Anthropic 提出 Enterprise Frontier Safeguards，把「零資料保留」與「濫用偵測」這兩件通常互斥的事湊在一起：監控資料留在客戶自己的雲端環境，不進 Anthropic 的系統。自動化監控會跨時間與跨帳號分析行為樣態，找出網路攻擊、憑證竊取這類重大威脅，警示直接送給客戶自行判讀，官方明說不需要 Anthropic 的人工審閱。開發過程有超過 100 家客戶參與，涵蓋金融服務、醫療、製造、電信、法律、零售與公部門；其中包含 Analysis and Resilience Center 的八家大型美國銀行成員、約四分之一的《財星》100 大企業，以及所有美國的全球系統性重要銀行。功能自 2026 年秋季分階段推出，在正式上線前，符合資格的客戶可先在 Fable 5 與 Fable 5.1 上取得零資料保留。
- 權重：8/10
- 發布日期：2026-09-01
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：一手公告。參與客戶數與名單由供應商單方陳述，未提供第三方查核。

### 4. 歐盟 AI 法規面臨競爭與企業出走壓力　智庫籲重審標準
- 原始標題：歐盟AI法規面臨競爭與企業出走壓力　智庫籲重審標準
- 標題：歐盟 AI 法規面臨競爭與企業出走壓力，智庫籲重審標準
- URL：https://www.cna.com.tw/news/ait/202609030281.aspx
- 摘要：布魯塞爾歐洲暨全球經濟研究所（Bruegel）建議歐盟重新檢視 AI 法案的風險門檻，理由是這套三年前訂下的標準已跟不上技術演進速度。爭議核心是訓練算力門檻：超過 10 的 25 次方 FLOPs 即被歸類為具系統性風險，須承擔較重的合規義務。報導指出歐洲科技新創為了避開這道門檻，把模型訓練移到美國進行。AI 法案已於 2026 年 8 月 2 日進入新的執法階段，對生成式 AI 系統加上更嚴格的要求，必須向使用者明確揭露自身為 AI。另有超過 180 個組織簽署 AI 生成內容的透明度行為準則，歐盟執委會並於 2026 年 9 月 1 日對約 30 家 AI 企業發出資訊索取要求。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：中央社編譯報導，數字可回溯至 Bruegel 與歐盟執委會的公開資料。「企業出走」為報導歸納，未列具體公司名稱。

### 5. Copilot code review 現在可以核准 pull request
- 原始標題：Copilot code review can now approve pull requests
- 標題：Copilot code review 現在可以核准 pull request
- URL：https://github.blog/changelog/2026-09-01-copilot-code-review-can-now-approve-pull-requests/
- 摘要：GitHub 讓 Copilot code review 可以核准 pull request，但預設關閉。權限分三層設定：企業層決定全組織允許或交由組織自行決定，組織層可全開、下放給儲存庫、指定特定儲存庫或直接關閉，儲存庫層則可開關並指定 Copilot 能核准哪些檔案路徑。開啟後，Copilot 的核准會計入儲存庫的合併條件；若之後推入新的 commit，核准會像人類審閱者一樣被撤銷。即使未開啟核准權，每次 Copilot 審查的總覽留言都會附上一段核准評估，但那段評估本身不計入合併條件。功能目前為公開預覽，適用 Copilot Pro、Pro+、Max、Business 與 Enterprise 方案。
- 權重：8/10
- 發布日期：2026-09-01
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：官方 changelog。公開預覽階段，尚無核准品質的公開統計。

### 6. 部分 GitHub Copilot 模型停止支援
- 原始標題：Selected GitHub Copilot models deprecated
- 標題：部分 GitHub Copilot 模型停止支援
- URL：https://github.blog/changelog/2026-08-31-selected-github-copilot-models-deprecated/
- 摘要：GitHub 公告自 2026 年 9 月 1 日起，在 Copilot Chat、inline edits、ask 與 agent 模式以及程式碼補全等多數體驗中停用一批模型，並各自給出建議替代：Gemini 3.1 Pro 改用 Gemini 3.7 Flash；Claude Opus 4.5 與 Opus 4.6 改用 Opus 4.7、4.8 或 5；Claude Sonnet 4.5 與 Sonnet 4.6 改用 Sonnet 5；Raptor Mini 改用 MAI-Code-1.1-Flash。唯一的例外是 Claude Sonnet 4.6，仍保留給採用年繳方案的個人訂閱者使用。對把模型名稱寫死在設定檔、腳本或 CI 流程裡的團隊，這份清單等於一張到期表。
- 權重：8/10
- 發布日期：2026-08-31
- 分類：軟體工程
- 是否納入正式參考資料：是
- 備註：官方 changelog，替代對照表可逐項比對。

### 7. 惡意 .git 設定檔可讓 Claude、Codex、Cursor 等 AI 代理執行攻擊者程式碼
- 原始標題：Malicious .git Configs Can Make Claude, Codex, Cursor, and Other AI Agents Run Attacker Code
- 標題：惡意 .git 設定檔可讓 Claude、Codex、Cursor 等 AI 代理執行攻擊者程式碼
- URL：https://thehackernews.com/2026/09/malicious-git-configs-can-make-claude.html
- 摘要：攻擊面是 Git 的 `core.fsmonitor` 設定：Git 在重新整理索引時會執行這個效能用指令。攻擊需讓專案連同惡意 `.git/config` 抵達使用者裝置，例如封存檔、共享或同步資料夾、USB；一般 `git clone` 不會保留來源端 `.git` 目錄。代理碰到這類專案後，指令會以使用者身分在沙箱外執行，也不會跳出核准提示。受影響工具包含 goose、Codex CLI、Claude Code、Cursor、Hermes Agent、Qwen Code 與 Grok Build；對應編號包含 CVE-2026-19592、CVE-2026-72718、CVE-2026-55607、CVE-2026-71963，並牽動舊有的 CVE-2021-43891 與 CVE-2022-24346。修補與未修補狀態以 2026 年 9 月 1 日的複測結果為準。
- 權重：9/10
- 發布日期：2026-09-02
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：專業資安媒體報導，CVE 編號與版本區間可逐項對照。未修補狀態為報導當下的快照。

### 8. 台灣新創 Zeabur 環境變數外洩：AI 金鑰遭盜用，創辦人承諾後續賠償
- 原始標題：台灣新創 Zeabur 環境變數外洩：AI 金鑰遭盜用，創辦人承諾後續賠償
- 標題：台灣新創 Zeabur 環境變數外洩，AI 金鑰遭盜用
- URL：https://www.blocktempo.com/zeabur-environment-variable-leak-openai-anthropic-api-key-stolen-compensation/
- 摘要：台灣雲端部署平台 Zeabur 於 8 月 27 日發生資安事件，一組內部服務憑證遭未授權存取，攻擊者因此取得部分使用者專案的環境變數紀錄。外洩內容包含 OpenAI、Anthropic、OpenRouter、Gemini、GitHub、AWS、Cloudflare、Stripe 的 API 金鑰或 token，以及資料庫連線字串、密碼與 JWT 密鑰；官方已觀察到部分 AI 服務金鑰遭實際盜用。創辦人林沅霖於 8 月 29 日說明處置進度，推出憑證輪替指引與事件頁，承諾核實損失後賠償。官方另發現 LiteLLM 可疑活動並預防性停用 AI Hub，但尚未確認兩者關聯，技術根因仍未定論。
- 權重：6/10
- 發布日期：2026-08-29
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：事件仍在調查中，外洩規模與賠償比例由當事公司單方公布，尚無第三方稽核。iThome〈【資安日報】8月31日〉可作交叉核對，但該站對 WebFetch 回 403，未列為正式來源。

### 9. Cloudflare 推出情境感知的漏洞發掘與修補
- 原始標題：Introducing context-aware vulnerability discovery and remediation with Cloudflare Managed Defense and OpenAI Daybreak Models
- 標題：Cloudflare 以 Managed Defense 與 OpenAI Daybreak 模型推出情境感知的漏洞發掘與修補
- URL：https://blog.cloudflare.com/vulnerability-discovery-remediation/
- 摘要：Cloudflare 把程式碼分析與線上環境的實際情境接起來，用來排出漏洞的處理順序，再提出程式碼修補與 WAF 緩解建議，是否套用仍由客戶決定。關鍵在於「已經被擋掉的不必急」：當客戶同時啟用 Web Application Firewall，系統看得到哪些規則已生效、正在阻擋哪些攻擊，優先序因此會不同於純靜態掃描的結果。偵察、獵捕與驗證階段使用 OpenAI 的 GPT-5.6 Cyber 模型，提示詞經由 Cloudflare AI Gateway 轉送至 OpenAI 伺服器。開場情境以「4,000 個新漏洞、其中 78 個為重大」說明排序難題。目前僅透過 Cloudflare Managed Defense 的早期存取計畫邀請制開放，合作從客戶授權調查的單一應用程式開始。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：平台方一手技術說明。邀請制早期存取，尚無公開的準確率或誤判率數據。

### 10. 預覽 Model Hardware Standard
- 原始標題：Previewing the Model Hardware Standard
- 標題：Anthropic 預覽 Model Hardware Standard
- URL：https://www.anthropic.com/news/model-hardware-standard-research-preview
- 摘要：Anthropic 提出一套讓 AI 代理安全操作實體裝置的共通規格，做法是提供標準化驅動層，用 read、write 這類基本操作在作業系統與硬體之間翻譯。規格內容包含以自然語言標籤描述機器特性、強制執行安全上限，並與 Model Context Protocol 相容。初期以研究預覽形式發給科學、機器人、電子與製造領域的夥伴，名單包含 Genentech、華盛頓大學 Baker 與 Pinglay 實驗室、卡內基美隆大學、HHMI Janelia Research Campus、QuEra Computing、Tetsuwan Scientific，以及 Amazon Web Services、Automata、Danaher、Doosan Robotics、MBF Bioscience、QIAGEN、Tecan、Universal Robots、Hugging Face 與 Raspberry Pi。已公布的數字包含 QuEra 的雷射回復成功率 99.3%、卡內基美隆的劑量反應實驗約快 3 倍，以及整合時間 8 小時對比典型廠商設定的數週。
- 權重：8/10
- 發布日期：2026-08-27
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：一手公告，屬研究預覽而非正式標準。成效數字由合作夥伴提供，樣本有限。

### 11. 晶圓一哥啟動 AI 冷革命，新世代「微流道」散熱技術將納入研發藍圖
- 原始標題：晶圓一哥啟動 AI 冷革命，新世代「微流道」散熱技術將納入研發藍圖
- 標題：台積電將微流道散熱納入研發藍圖
- URL：https://technews.tw/2026/09/04/tsmc-adds-microchannel-cooling-to-rd-roadmap/
- 摘要：台積電先進封裝技術研發處長陳燕銘在 9 月 1 日舉行的 SEMICON Taiwan 2026 展前系列活動「異質整合高峰論壇」表示，微流道散熱可在晶片或封裝結構內設置微型流體通道，讓冷卻液更接近熱源，有助提高熱傳效率。與既有散熱方式的差別在於冷卻液直接流經晶片本體，快速吸收並帶走熱量；代價是必須在晶片上蝕刻流道，屬高風險製程，些微失誤就可能毀掉昂貴的晶片。同場揭露的封裝藍圖包含 2029 年整合 24 顆 HBM 的 CoWoS 封裝，並指出 2024 至 2029 年間單一 CoWoS 封裝內的 AI 運算電晶體數量將成長逾 48 倍、HBM 頻寬成長 34 倍。
- 權重：7/10
- 發布日期：2026-09-04
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：轉載自經濟日報的論壇報導。微流道為研發藍圖項目，非量產時程承諾。

### 12. 晶片愈疊愈熱怎麼辦？德國創浦出手：預告 2028 年將微冷卻結構直接打入 3D 晶片
- 原始標題：晶片愈疊愈熱怎麼辦？德國創浦出手：預告 2028 年將微冷卻結構直接打入 3D 晶片
- 標題：德國創浦預告 2028 年把微冷卻結構打入 3D 晶片
- URL：https://finance.technews.tw/2026/09/05/trumpf/
- 摘要：德國工具機與雷射廠創浦（TRUMPF）表示，將以超短脈衝雷射在碳化矽、鑽石等材料上加工微米級冷卻結構，把散熱結構做到更靠近晶片熱源的位置，並預估 2028 年可看到冷卻結構導入 3D 晶片堆疊。這條路線與台積電的微流道方向一致，差別在於創浦切入的是加工設備與材料端，客戶為供貨給 AI 晶片製造商的整合商，具體名單未揭露。報導同時提供公司規模作為參考：創浦 2025 年總營收 43.29 億歐元，約新台幣 1,590 億元。文中未提供散熱效能的量化數據。
- 權重：7/10
- 發布日期：2026-09-05
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：轉載自財訊的專訪報導。2028 年為廠商自行預估，且未提供熱效能數據，報告中僅作為方向性佐證。

### 13. Cloudflare 以 Zstandard 與 Pingora 節省 PB 級快取儲存
- 原始標題：How we could save petabytes of cache storage with Zstandard and Pingora
- 標題：Cloudflare 以 Zstandard 與 Pingora 節省 PB 級快取儲存
- URL：https://blog.cloudflare.com/cache-transcoding/
- 摘要：Cloudflare 在快取層對合格的文字內容（HTML、JSON、CSS、JavaScript）加一層 Zstandard 壓縮，已壓縮過的圖片、影片與字型直接跳過。選 zstd level 3 的理由是速度與壓縮率的平衡：壓縮速度比 Brotli 快 42%，檔案大小接近。實測合格資產壓縮率 2.834 倍，編碼成本每位元組 4.31 奈秒（約 232 MB/s，只付一次），解碼成本每位元組 1.56 奈秒（約 641 MB/s，每次供應都要付），測試條件下 CPU 開銷增加數個百分點。適用範圍是 4 KiB 以上且未設定 `Content-Encoding` 的回應，測試涵蓋 10 台快取伺服器上超過一百萬次請求，測試資產約 195 KiB 與 272 KiB。目前仍是原型階段，出自 1.1.1.1 實習計畫。
- 權重：8/10
- 發布日期：2026-09-01
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：平台方一手技術說明。標題用「could save」，表示尚未全面部署，節省量為推估。

### 14. 軟銀成功測試「會飛的基地台」拚 2027 商業化、有望用於災害
- 原始標題：軟銀成功測試「會飛的基地台」拚2027商業化、有望用於災害[影]
- 標題：軟銀成功測試「會飛的基地台」，拚 2027 商業化
- URL：https://www.cna.com.tw/news/ait/202609020158.aspx
- 摘要：日本電信及網路公司軟銀與美國航太公司 Sceye 合作，完成 HAPS（平流層通訊平台）測試。載具是類似飛船的無人機，在約 16.5 公里高的平流層運作，對指定區域提供半徑 5 公里內的 4G 通訊涵蓋。測試中完成緊急通報、語音通話與影像傳輸；載具自新墨西哥州出發，歷時約 13 天飛抵日本高知縣室戶岬附近空域。軟銀規劃自 2027 年起正式運用這項技術，並在日本各地設置據點，於災害時形成多層次的通訊機制。相較於地面基地台在震災或水災中一起中斷的風險，把基地台放到平流層等於把覆蓋能力與地面基礎設施解耦。
- 權重：8/10
- 發布日期：2026-09-02
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：中央社編譯報導。單次測試結果，尚未進入常態營運；通訊規格為 4G，非 5G。

### 15. 印度海底光纜 95% 登陸點集中孟買 6 公里海岸線，恐成斷網高風險處
- 原始標題：印度海底光纜 95% 登陸點集中孟買 6 公里海岸線，恐成斷網高風險處
- 標題：印度海底光纜登陸點高度集中於孟買 6 公里海岸線
- URL：https://technews.tw/2026/09/04/is-indias-internet-boom-running-into-an-undersea-problem/
- 摘要：服務印度的 18 條海底電纜中，至少 13 條登陸在孟買西北 Versova 附近約 6 公里的海岸帶內，印度 95% 的國際頻寬集中在這些登陸點。另一組數字說明基礎規模：全球約 1,900 座海底電纜登陸站中，印度只有 21 座，約占 1%。報導引述塔克沙希拉機構（Takshashila Institution）的 Anwesha Sen 與寬頻印度論壇（Broadband India Forum）執行董事 Gupta 的說法，形容這個網路極度脆弱：若多條電纜同時中斷，印度通往西亞、非洲與歐洲的頻寬會受到明顯影響。馬哈拉什特拉邦政府為相關主管機關。這是典型的地理單點故障，與雲端服務的可用區設計是同一種問題。
- 權重：7/10
- 發布日期：2026-09-04
- 分類：網路/伺服器等基礎
- 是否納入正式參考資料：是
- 備註：科技媒體編譯報導，數字引述自智庫與產業團體，非官方普查。

### 16. 金管會主委彭金隆：虛擬資產服務法最快明年首季上路
- 原始標題：金管會主委彭金隆：虛擬資產服務法最快明年首季上路
- 標題：金管會主委彭金隆：虛擬資產服務法最快明年首季上路
- URL：https://www.cna.com.tw/news/afe/202609020089.aspx
- 摘要：金管會主委彭金隆在 FinTechOn 2026 暨 AFA 高峰會表示，《虛擬資產服務法》已於 2026 年 6 月完成立法，目前正制定九項子法，其中包含穩定幣相關規範，最快 2027 年第一季正式公布實施。他指出全球對虛擬資產與穩定幣的討論，已經從「要不要發展」進一步到「如何走向健全發展與監理」。對開發者而言，這代表台灣的虛擬資產服務將從無明文規範的狀態，進入有牌照、有法遵義務的階段：錢包託管、交易撮合、穩定幣發行與跨境流通的技術架構，都要在子法定案前預留合規設計的空間。
- 權重：8/10
- 發布日期：2026-09-02
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：中央社現場報導，主管機關首長發言。九項子法內容尚未公布，時程為預估。

### 17. 新方法讓科學家能在同一批細胞中追蹤基因活性隨時間的變化
- 原始標題：New method allows scientists to follow gene activity over time in the same cells
- 標題：新方法讓科學家在同一批細胞中追蹤基因活性隨時間的變化
- URL：https://news.mit.edu/2026/new-method-allows-following-gene-activity-over-time-same-cells-0904
- 摘要：既有的轉錄體定序必須把細胞殺死才能讀取 RNA，等於每個時間點都要換一批細胞，時間軸是拼出來的。MIT 與 Broad Institute 的團隊提出「細胞自我回報」（cellular self-reporting）做法：改造哺乳類細胞，讓它表現一種反轉錄病毒結構蛋白，把細胞自身的 RNA 包進類病毒顆粒，再從細胞膜出芽釋放到培養液中。研究者只要取樣培養液，就能分離並定序 RNA，取得轉錄體資訊而不必殺死細胞。資深作者為 Broad Institute 與 MIT 生物工程教授 Paul Blainey，共同第一作者為 Jacob Borrajo 與 Anna Le，研究員 Mohamad Najia 與 MIT 生物暨機械工程教授 Linda Griffith 參與，成果發表於《Cell》。方法已在永生化人類細胞、癌症細胞株、幹細胞、神經細胞與初代捐贈者細胞上測試，並在 3D 球體與器官晶片裝置上示範。
- 權重：9/10
- 發布日期：2026-09-04
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：研究機構一手發布，可回溯至《Cell》論文。屬實驗室方法，尚未進入臨床應用。

### 18. 綠能與數位雙軸轉型　智慧醫院的永續路徑
- 原始標題：綠能與數位雙軸轉型　智慧醫院的永續路徑
- 標題：綠能與數位雙軸轉型：智慧醫院的永續路徑
- URL：https://newsworld.com.tw/article/20260826n002/
- 摘要：台灣醫務管理學會理事長、新光醫院副院長洪子仁指出，台灣醫療體系同時面對超高齡社會、醫護人力短缺與淨零碳排三重壓力，主張「醫療支出是投資而非成本」，並把綠能與數位視為互補的雙軸。文中提出的數據包含：全球醫療產業占總碳排放約 4.4%，新光醫院無紙化率達 88% 以上，每年因此省下數千個繁瑣的文書工作天與數百萬張紙的消耗。流程面的例子是病人端用手機 App 完成預約、報到與 AI 對話輸入病情，看診後多元數位支付可在 30 秒內完成結帳。作者的論點是，數位化省下的不只是紙張，還包括往返、等待與重複輸入所連帶產生的碳排與人力耗損。
- 權重：7/10
- 發布日期：2026-09-01
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：中央社《全球中央》名家視角專欄，屬觀點文。單一醫院數據由作者所屬機構提供，未經第三方查核；報告僅採用可回溯的數字。原網址 `cna.com.tw/newsworld/...` 會 301 轉址至 `newsworld.com.tw`。

### 19. 特斯拉推自動駕駛計程車 Cybercab，服務挑戰一次看
- 原始標題：特斯拉推自動駕駛計程車 Cybercab，服務挑戰一次看
- 標題：特斯拉推出自動駕駛計程車 Cybercab
- URL：https://technews.tw/2026/09/04/us-auto-safety-regulator-says-evaluating-teslas-cybercab-rollout/
- 摘要：特斯拉在德州奧斯汀部分區域推出 Cybercab，這是一款沒有方向盤與踏板的雙座自駕計程車，設計上就假設不需要人類監督。在此之前，特斯拉已在德州與佛州部分城市以 Model Y 提供小規模 robotaxi 服務。報導同時列出待解的問題：等待時間過長與服務不可用、車輛未抵達指定目的地的路徑失誤、部署無方向盤車輛的法規限制、尚未取得加州營運許可，以及產能限制。監理端由美國國家公路交通安全管理局評估此次推出。數字方面，特斯拉在德州註冊 420 輛自駕車，其中 45 輛為 Cybercab；Waymo 在德州註冊 988 輛。特斯拉市值為 1.4 兆美元。
- 權重：8/10
- 發布日期：2026-09-04
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：轉載自中央社。註冊車輛數與實際營運車隊規模不同，兩家公司的數字基準亦不完全一致。

### 20. 搶先 Waymo　Wayve 攜 Uber 進軍倫敦自駕計程車市場
- 原始標題：搶先Waymo　Wayve攜Uber進軍倫敦自駕計程車市場
- 標題：Wayve 攜手 Uber 進軍倫敦自駕計程車市場
- URL：https://www.cna.com.tw/news/ait/202609030145.aspx
- 摘要：英國自駕新創 Wayve 與 Uber 在倫敦推出自駕計程車服務，初期投入數十輛車，駕駛座仍配置安全監督人員。倫敦因此成為歐洲第二個提供商業自駕計程車服務的城市，僅次於克羅埃西亞的札格瑞布。對照組是 Waymo：其目標是年底前投入無駕駛車輛，但仍待政府核准。Wayve 後續規劃是進軍東京，再與 Uber 合作擴展至另外十個城市。報導同時點出這個賽道的參與者版圖，包含 Alphabet 旗下的 Waymo、與百度合作的 Lyft、克羅埃西亞新創 Verne，以及中國的小馬智行（Pony.ai）。兩種路線的差別在於：先上路再逐步移除安全員，或先取得無人化核准再上路。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：中央社編譯報導。初期車隊規模為概略描述，未提供精確數字。

### 21. 新系統幫助人類預測自駕車何時會出錯
- 原始標題：System helps humans predict when self-driving cars will make mistakes
- 標題：新系統幫助人類預測自駕車何時會出錯
- URL：https://news.mit.edu/2026/system-helps-humans-predict-when-self-driving-cars-will-make-mistakes-0902
- 摘要：MIT 與自駕公司 Motional 合作提出 Concept-Wrapper Network（CW-Net），插進自駕車的規劃架構中，把深度學習模型的內部推理翻譯成人看得懂的概念，例如「接近靜止車輛」或「靠近自行車騎士」，再要求規劃模型在決定車輛動作時實際使用這些概念。訓練資料為 1.3 億個標註場景，可即時產生解釋且不影響駕駛表現。道路測試顯示，CW-Net 的解釋讓安全駕駛在遇到意外情境時更能預測車輛行為；模擬研究也確認解釋顯著提升受試者預測自駕車反應的能力。研究者包含 MIT 教授、互動機器人組主任兼 CSAIL 成員 Julie Shah，第一作者 Eoin Kenny，以及 Motional 的 Momchil Tomov 等人。
- 權重：9/10
- 發布日期：2026-09-02
- 分類：運輸物流
- 是否納入正式參考資料：是
- 備註：研究機構一手發布。效果以受試者預測能力衡量，非事故率等安全結果指標。

### 22. 建築師如何把笨重的磚砌方盒變成 MIT 最新的學術樞紐
- 原始標題：How architects turned a hulking brick box into MIT's newest academic hub
- 標題：建築師如何把笨重的磚砌方盒改造成 MIT 最新的學術樞紐
- URL：https://news.mit.edu/2026/how-architects-turned-hulking-brick-box-newest-academic-hub-0904
- 摘要：MIT 把 1894 年動工、1923 年成為五層樓建築的 Metropolitan Storage Warehouse 改造為學術空間。原建築是兩英尺厚的磚牆、長 500 英尺、內部約 22 萬平方英尺，原本有 1,500 個儲藏單元。設計由 Diller Scofidio + Renfro 主導，Leers Weinzapfel Associates 擔任協同建築師，Shawmut Design and Construction 負責施工。手法上，北側立面切出大型孔洞並以玻璃立面取代原磚牆；工作室採雙層樓高、無柱設計，直接懸吊於屋頂桁架；南側改用「嵌入式開窗」策略以保留歷史外觀；內部設置偏心的流通軸線與各層連通走廊，並讓大型儀典階梯穿透走廊。牆面刻意露出結構剖面，本身即是教學展示。遷入儀式訂於 2026 年 9 月 8 日。
- 權重：8/10
- 發布日期：2026-09-04
- 分類：房地產與室內外裝潢
- 是否納入正式參考資料：是
- 備註：機構一手發布。文中未提供造價、工期與能源效率數據。

### 23. 台北藝術節《大象來了》熱血登場 9月5日、6日基河路交管措施報給你知
- 原始標題：台北藝術節《大象來了》熱血登場 9月5日、6日基河路交管措施報給你知
- 標題：台北藝術節《大象來了》9 月 5、6 日於基河路展演並實施交管
- URL：https://news.ltn.com.tw/news/Taipei/breakingnews/5560309
- 摘要：2026 台北藝術節的戶外展演《大象來了》於 9 月 5、6 日在士林基河路登場，路線為基河路的中正路至文林路段，演出時間為兩日的 19 時至 21 時，9 月 5 日凌晨 0 時至 2 時另有技術排練。演出由法國奧波西托劇團帶來三頭巨型機械大象，在隊列與樂團簇擁下沿街前進至臺北表演藝術中心戶外廣場。交通管制分五階段升級，從 17 時 30 分起的局部限制，到演出時段的全線封閉，設有住戶通行的緊急通道，結束後分段開放，預計 21 時前恢復。這類大型機械裝置的街頭展演，本質上是一次把機構內的舞台技術搬到城市尺度的公共空間測試。
- 權重：7/10
- 發布日期：2026-09-02
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：台灣主流媒體的活動與交管報導，技術規格未揭露。中央社同主題報導發布於 2026-08-14，落在時間窗外故未採用。

### 24. 潮台北科技音樂互動展登場　邀民眾體驗音樂文化
- 原始標題：潮台北科技音樂互動展登場　邀民眾體驗音樂文化
- 標題：潮台北科技音樂互動展於松山文創園區登場
- URL：https://www.cna.com.tw/news/ahel/202608270234.aspx
- 摘要：「潮台北 TRENDY TAIPEI 科技音樂互動展」在松山文創園區展出，展期 2026 年 8 月 27 日至 9 月 6 日，免費入場。展覽分三個區域，技術上用了三種互動形式：以臉部辨識控制音訊輸出、以八面互動資料牆呈現超過 1,700 場音樂演出的資料，以及在大巨蛋、台北 101 等地標設置 AR 圖標讓民眾體驗 DJ 刷碟。主辦單位為台北市文化局，由 9 位音樂製作人與 4 位數位互動藝術家共同創作。周邊另有「潮！專車」於 8 月 29 至 30 日與 9 月 5 至 6 日運行，每日 5 班，並在 17 時與 19 時安排 DJ 演出。
- 權重：7/10
- 發布日期：2026-08-27
- 分類：現場表演藝術
- 是否納入正式參考資料：是
- 備註：中央社活動報導。互動裝置的技術細節與資料來源未進一步說明。

### 25. 索尼狀告 Anthropic，主張擅自讓 AI 學樂曲
- 原始標題：索尼狀告 Anthropic，主張擅自讓 AI 學樂曲
- 標題：索尼狀告 Anthropic，主張擅自讓 AI 學習樂曲
- URL：https://technews.tw/2026/08/31/sony-sues-anthropic-alleging-unauthorized-ai-music-training/
- 摘要：索尼集團旗下 35 家音樂出版公司（含 Sony Music Publishing）於 2026 年 8 月 28 日向美國加州北區聯邦地方法院提告，被告為 Anthropic、執行長 Dario Amodei 與共同創辦人 Benjamin Mann。訴狀主張 Anthropic 自盜版網站等管道取得受著作權保護的歌詞與樂譜，並未經授權以生成式 AI Claude 學習這些內容。求償金額為每件作品最高 15 萬美元，約新台幣 477 萬元。Anthropic 回應不同意出版商的主張，將在法庭上堅定反駁。報導並回顧 Anthropic 先前就未經授權使用書籍訓練，與作者群達成 15 億美元和解。
- 權重：8/10
- 發布日期：2026-08-31
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：轉載自中央社。訴訟尚在初始階段，主張未經法院認定；求償金額為法定上限而非判決結果。

### 26. CD 黑膠銷售大逆襲 美音樂市場營收年增近 7%
- 原始標題：CD 黑膠銷售大逆襲 美音樂市場營收年增近 7%
- 標題：實體唱片回升，美國音樂市場營收年增近 7%
- URL：https://finance.technews.tw/2026/09/02/cds-make-a-comeback-boosting-us-recorded-music-revenue/
- 摘要：美國唱片業協會（RIAA）的 2026 年上半年數據顯示，錄製音樂產業總營收達 60 億美元，年增 6.9%。拆開來看，實體音樂產品營收 7.315 億美元、年增 25.9%，其中 CD 營收暴增 58.6%、黑膠成長 17.7%；數位串流營收 49 億美元、年增 4.7%，付費訂閱串流 34 億美元、年增 6.4%。串流仍是最大宗，但成長率明顯低於實體。在 AI 生成音樂大量灌入串流平台的同期，實體載體反而回升，兩者放在一起看，指向「可驗證的稀缺性」重新獲得定價能力。
- 權重：7/10
- 發布日期：2026-09-02
- 分類：影視音樂
- 是否納入正式參考資料：是
- 備註：轉載自 MoneyDJ，原始數據來自 RIAA 2026 上半年報告。實體回升與 AI 音樂之間的關聯為本報告的推論，非來源主張。

### 27. 新的量子位元架構讓運算更快也更準確
- 原始標題：New qubit architecture enables faster, more accurate operations
- 標題：新的量子位元架構讓運算更快也更準確
- URL：https://news.mit.edu/2026/new-qubit-architecture-enables-faster-more-accurate-operations-0903
- 摘要：MIT 團隊提出名為 Arm Qubit 的超導量子位元設計，論文標題為〈The Arm Qubit: A Superconducting Qubit Co-Designed for Coherence and Coupling〉，發表於《Physical Review Applied》。傳統設計中，同調時間與耦合強度往往互相拉扯：要讓量子位元維持狀態久一點，就得減少與外界的耦合，但讀取與閘操作又需要足夠的耦合。這個設計把兩者一起設計而非分開最佳化，模擬測試顯示同時達到業界頂尖的同調時間，以及更快的操作與讀取。研究者包含第一作者、電機資訊工程研究生 Jeremy Kline，2026 年春季取得博士學位的 Alec Yen，大學部學生 Stanley Chen，以及資深作者、電機資訊工程副教授兼電子研究實驗室主持人 Kevin O'Brien。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：研究機構一手發布，可回溯至《Physical Review Applied》論文。新聞稿未揭露同調時間與保真度的具體數值，結果來自模擬測試。

### 28. 新製程平台可望做出可撓、透明的次世代光子晶片
- 原始標題：Fabrication platform could enable flexible, transparent next-generation photonic chips
- 標題：新製程平台可望做出可撓、透明的次世代光子晶片
- URL：https://news.mit.edu/2026/fabrication-platform-could-enable-flexible-transparent-next-generation-photonic-chips-0903
- 摘要：MIT 電子研究實驗室團隊提出晶圓級的可撓、透明矽光子製程，成果發表於《Optica》。做法是先在矽基板上製作光波導與超薄氧化層，再把結構轉貼到透明聚酯薄膜上，矽基板只是暫時載體。製程可做出直徑 300 mm、厚度僅數微米的可撓透明晶圓；驗證時，研究團隊把切割後的單顆晶片繞著不同直徑圓柱反覆彎折數千次，縮至小螺絲粗細仍未見效能下降，透光時也只有極輕微霧化。可能應用包含貼合人體的健康監測裝置，以及貼在飛行員面罩等曲面上的透明擴增實境顯示。
- 權重：8/10
- 發布日期：2026-09-03
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：研究機構一手發布，可回溯至《Optica》論文。屬實驗室製程驗證，尚無量產或商用時程。

### 29. 政府提出先進 AI 資安三階段策略
- 原始標題：政府提AI資安3階段策略　採購、供應商管理納中期防護
- 標題：政府提出先進 AI 資安三階段策略，採購與供應商管理納入中期防護
- URL：https://www.cna.com.tw/news/afe/202609040287.aspx
- 摘要：數位發展部資通安全署發布「政府因應先進 AI 資安風險政策」，並成立跨部會與關鍵基礎設施主管機關參與的「先進 AI 資安風險因應小組」。政策分三階段：短期調整既有機制並導入可即時運用的防禦工具，縮短漏洞發現、影響研判到完成處置的時間；中期把治理延伸到資通訊產品與供應鏈，從政府採購、產品安全及供應商管理落實安全設計；長期透過國際合作、先進模型與威脅情資分享，建立自主 AI 資安防禦能力。政策將依技術與威脅變化滾動調整。
- 權重：9/10
- 發布日期：2026-09-04
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：是
- 備註：中央社引述資通安全署新聞稿；政策內容可回溯至政府機關，執行成效尚待後續觀察。

## 淘汰來源

### A. Expanding our support for scientists
- URL：https://www.anthropic.com/news/expanding-support-for-scientists
- 發布日期：2026-08-27
- 是否納入正式參考資料：否
- 淘汰原因：日期落在本期窗內，但 2026-08-29 期已列為 ref-1，依跨期去重原則淘汰。

### B. Funding better evaluations of AI's impact on wellbeing
- URL：https://www.anthropic.com/news/wellbeing-research-grants
- 發布日期：2026-08-25
- 是否納入正式參考資料：否
- 淘汰原因：上一期已列為 ref-2，跨期重複。

### C. Upcoming changes to GitHub Copilot policies and billing
- URL：https://github.blog/changelog/2026-08-28-upcoming-changes-to-github-copilot-policies-and-billing
- 發布日期：2026-08-28
- 是否納入正式參考資料：否
- 淘汰原因：上一期已列為 ref-3，跨期重複。本期改採同站不同事件的 code review 核准權與模型下架公告。

### D. BotBase for Operators: A clearer path to joining Cloudflare's directory of bots and agents
- URL：https://blog.cloudflare.com/botbase-for-operators/
- 發布日期：2026-08-28
- 是否納入正式參考資料：否
- 淘汰原因：上一期已列為 ref-11，跨期重複。

### E. How we saved 100 terabytes of memory by optimizing 1.1.1.1's DNS cache
- URL：https://blog.cloudflare.com/dns-cache-memory-optimization-1111/
- 發布日期：2026-08-27
- 是否納入正式參考資料：否
- 淘汰原因：上一期已列為 ref-10，跨期重複。

### F. 遮蔽恆星光芒尋找第二個地球，NASA 與 MIT 聯手打造巨型「花朵遮星板」
- URL：https://technews.tw/2026/09/05/nasa-mit-starshade/
- 發布日期：2026-09-05
- 是否納入正式參考資料：否
- 淘汰原因：來源內部矛盾。標題稱 NASA 與 MIT 聯手，內文卻寫執行團隊為加州理工學院，無法確認機構歸屬，依資料來源正確性原則淘汰。

### G. AI 歌曲在串流平台將標註 避免聽眾誤判
- URL：https://udn.com/news/story/7266/9694822
- 發布日期：2026-08-16
- 是否納入正式參考資料：否
- 淘汰原因：發布日期落在時間窗（2026-08-21 起）之外。

### H. 中華電打造無人機物流商業化驗證場域 送餐服務亮相
- URL：https://www.cna.com.tw/news/afe/202608100309.aspx
- 發布日期：2026-08-10
- 是否納入正式參考資料：否
- 淘汰原因：發布日期落在時間窗外。運輸物流分類改採窗內的自駕計程車與自駕解釋性研究。

### I. 法國奧波西托劇團「大象來了」 9月台北藝術節登場
- URL：https://www.cna.com.tw/news/acul/202608140277.aspx
- 發布日期：2026-08-14
- 是否納入正式參考資料：否
- 淘汰原因：發布日期落在時間窗外。同一活動改採自由時報 2026-09-02 的報導。

### J. Salesforce and Anthropic Announce Claudeforce
- URL：https://www.salesforce.com/news/press-releases/2026/08/26/salesforce-and-anthropic-announce-claudeforce/
- 發布日期：2026-08-26
- 是否納入正式參考資料：否
- 淘汰原因：雙方聯合發布的行銷性新聞稿，缺乏可驗證的技術細節與第三方佐證，權重不足。

### K. Improving our alignment and security efforts
- URL：https://www.anthropic.com/news/improving-alignment-security-efforts
- 發布日期：2026-08-31
- 是否納入正式參考資料：否
- 淘汰原因：主題與 ref-3（Enterprise Frontier Safeguards）高度重疊，同一供應商的安全治理議題擇一納入，避免單一來源在同分類中過度集中。

### L. Introducing Adaptive Intelligence: Undermining the economics of every bot attack
- URL：https://blog.cloudflare.com/introducing-adaptive-intelligence/
- 發布日期：2026-08-31
- 是否納入正式參考資料：否
- 淘汰原因：本期已納入 Cloudflare 的兩篇技術文（ref-9、ref-13），同站來源比例已達上限，依來源分散原則淘汰。

### M. Say it once: Introducing Bot Preference Sync
- URL：https://blog.cloudflare.com/bot-preference-sync/
- 發布日期：2026-08-21
- 是否納入正式參考資料：否
- 淘汰原因：同上，單一來源在本期占比已足。

### N. 路透：Anthropic 延後 IPO 時程　最快 10 月中啟動推廣
- URL：https://www.cna.com.tw/news/ait/202609050019.aspx
- 發布日期：2026-09-05
- 是否納入正式參考資料：否
- 淘汰原因：屬企業財務與募資時程消息，非科技服務或技術資訊，不符本報告的讀者定位。

### O. 【資安日報】8月31日，臺灣AI新創Zeabur環境變數外洩，使用者API金鑰恐外流
- URL：https://www.ithome.com.tw/news/178547
- 發布日期：2026-08-31
- 是否納入正式參考資料：否
- 淘汰原因：站點對 WebFetch 回 HTTP 403，無法逐字核對內文。依 `fetch-gotchas.md` 規則，改以可完整抓取的動區動趨報導（ref-8）為正式來源，本篇僅作交叉核對。

### P. 反 AI 時尚會成為流行趨勢嗎？這件醜夏威夷衫能幫你躲過 AI 監控
- URL：https://infosecu.technews.tw/2026/09/05/trend-alert-is-anti-ai-fashion-this-seasons-hottest-new-look/
- 發布日期：2026-09-05
- 是否納入正式參考資料：否
- 淘汰原因：話題性為主，缺乏可驗證的技術數據與效果評估，資訊權重不足。

### Q. AI 衝擊中國職場：縮小就業市場，迫使勞工轉投低薪藍領職
- URL：https://technews.tw/2026/09/04/how-chinas-ai-race-is-shrinking-job-market-forcing-workers-into-low-paid-manual-roles/
- 發布日期：2026-09-04
- 是否納入正式參考資料：否
- 淘汰原因：依 `source-priority.md`，中國相關議題須有高權重可查證來源；本篇未提供可回溯的官方統計，且主題偏勞動市場而非科技服務。

### R. Anthropic Claude News | September, 2026 (STARTUP EDITION)
- URL：https://blog.mean.ceo/anthropic-claude-news-september-2026/
- 發布日期：*未知時間
- 是否納入正式參考資料：否
- 淘汰原因：聚合型部落格，非一手來源，且無法確認個別條目的原始發布日期。

### S. Anthropic Release Notes - September 2026 Latest Updates
- URL：https://releasebot.io/updates/anthropic
- 發布日期：*未知時間
- 是否納入正式參考資料：否
- 淘汰原因：第三方聚合平台，內容為自動彙整，無法逐項確認原始日期與正確性。

### T. CISA Adds Seven Exploited Flaws as Attackers Deploy Reverse Shells and Crypto Miners
- URL：https://thehackernews.com/2026/09/cisa-adds-seven-exploited-flaws-as.html
- 發布日期：*未知時間
- 是否納入正式參考資料：否
- 淘汰原因：未能逐篇查核精確發布日期，依「無法確認是否落在 15 天內即排除」原則淘汰。

### U. Google Releases Chrome Update to Patch Actively Exploited V8 Zero-Day
- URL：https://thehackernews.com/2026/09/google-releases-chrome-update-to-patch.html
- 發布日期：*未知時間
- 是否納入正式參考資料：否
- 淘汰原因：同上，未能確認精確發布日期。

### V. 2026 劇場技術展：光影之間，人與技術的對話
- URL：https://tpac.org.taipei/posts/527
- 發布日期：2026-02（展期 2 月 27 日至 3 月 1 日）
- 是否納入正式參考資料：否
- 淘汰原因：活動與報導皆落在時間窗外。

### W. C-LAB FVL DOME @ 台積心築藝術季
- URL：https://clab.org.tw/events/fvldomeathsinchu2025/
- 發布日期：2025
- 是否納入正式參考資料：否
- 淘汰原因：為 2025 年活動，落在時間窗外。
