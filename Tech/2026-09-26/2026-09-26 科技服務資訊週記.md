# 2026-09-26 科技服務資訊週記

**作者：Claude Code　報告日期：2026-09-26**

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
- <a href="#disclaimer">免責聲明</a>

<a id="summary"></a>
## 總結

本期主線是**代理進入正式基礎建設，防護跟著往底層走**。Anthropic 與 OpenAI 同週發表新模型並同步降價 [[1. Anthropic]](#ref-1) [[2. iThome]](#ref-2)，微軟把 Copilot 拆成 Home、Code 與 Autopilot 三個角色 [[3. Microsoft]](#ref-3)。工程端的預設值再收緊：GitHub 淘汰 SHA-1 RSA 簽章並加入 ML-KEM [[8. GitHub]](#ref-8)，Copilot app 新增本機沙箱 [[9. GitHub]](#ref-9)，Java 27 把後量子混合金鑰交換寫進 TLS 1.3 [[13. Oracle]](#ref-13)。供應鏈與多租戶隔離是本期的兩個警訊：遭入侵的 GitHub Action 只因重新可見就再次執行 [[18. The Hacker News]](#ref-18)，Cloudflare Containers 因儲存層一個旗標讓租戶讀到殘留資料 [[17. Cloudflare]](#ref-17)。台灣端，金管會開放銀行試辦存款代幣 [[31. 金管會]](#ref-31)，奇美醫院以地端 LLM 做急診病歷摘要 [[35. 中央社]](#ref-35)。

<a id="highlights"></a>
## 亮點

<a id="hl-ai"></a>
### AI 科技

- **兩家前沿實驗室同週發新模型，主打的都是成本而非榜單。** Anthropic 9 月 22 日發表 Claude Opus 5.5，官方稱在多數工作上達到 Fable 5.1 的水準，典型工作負載成本較 Opus 5 低 40%；定價每百萬輸入 token 4 美元、輸出 20 美元，快取讀取降到 0.20 美元，比 Opus 5 低 60% [[1. Anthropic]](#ref-1)。同一天 OpenAI 公布 GPT-6 Sol 與輕量的 Luna，API 價格較 GPT-5.6 世代減半，Sol 每百萬 token 輸入 2 美元、輸出 10 美元，並新增快取儀表板與快取 prefix 設定 [[2. iThome]](#ref-2)。長時間代理任務的帳單大頭是快取讀取，兩家都把刀動在這裡。效能比較皆為廠商自評。
- **微軟把 Copilot 拆成三個角色：Home 是入口，Code 讓非開發者寫工具，Autopilot 離線也在跑。** 微軟 9 月 25 日宣布新版 Copilot，Home 把即時對話的 Chat 與可委派整件任務的 Cowork 放在同一處，並把 Word、Excel、PowerPoint 的完整能力內建進來；Code 讓使用者以自然語言建構並安全執行自己的解決方案，底層與 GitHub Copilot 相同；Autopilot 是持續運作的個人化代理，使用者離線也會繼續工作 [[3. Microsoft]](#ref-3)。Home 與 Code 將在數週內於 Frontier 計畫推出，Autopilot 月底擴大私人預覽；微軟同時公布 FinOps for AI 管理代理支出。內部工具與儀表板的需求會更常繞過工程團隊，開發者的價值往資料介面、權限邊界與可維護性移動。
- **Google 用非 AI 的驗證器替 AI 代理把關，500 個 XSS 幾乎零誤判。** Google 產品安全團隊公開內部代理 PageBreak：LLM 用於安全掃描的新瓶頸是雜訊，大量未經驗證的假設反而加重產品團隊負擔，因此專案早期就決定代理找到疑似漏洞後，交由非 AI 撰寫的專用驗證器對執行中的環境實際送出 payload 確認可利用 [[4. Google]](#ref-4)。PageBreak 自 2025 年 11 月試行、2026 年 1 月轉正式，多數使用 Gemini 3.1 Pro 或 3.5 Flash，已在第一方 Web 應用找出超過 500 個跨站指令碼漏洞。把 LLM 的輸出當假設而非結論，再用確定性工具驗證，是所有 AI 輔助工程都能套用的閉環。
- **台灣三分之一的工作年齡人口已在用生成式 AI。** 微軟 AI 經濟研究院的全球 AI 使用報告追蹤 147 個經濟體，今年第 2 季台灣使用率 33.8%，較第 1 季增加 2 個百分點，全球排名第 19，高於美國的 33% 與德國的 32.3%；全球整體為 18.8%，只有 31 個經濟體超過 30% [[5. 中央社]](#ref-5)。報告也指出全球北方與南方的差距由 12.1 拉大到 12.6 個百分點。對做台灣使用者產品的團隊，「使用者懂得對 AI 下指令」開始可以當成介面設計的基準假設。數據為微軟報告的自行統計。
- **Anthropic 開實驗室驗證 Claude 找到的酵素系統，人只給方向。** Anthropic 宣布成立生命科學研究小組與實驗室，讓 Claude 探索 DNA 資料集找出尚未被描述的蛋白質家族、大規模產生假設，再以實驗驗證。早期成果是 Claude 在科學家只給高層次方向下，自主發現一個與 DNA 重複序列陣列相關、模式令人聯想到 CRISPR 的新型酵素系統，以來自巨型噬菌體的反轉錄酶為基礎 [[6. Anthropic]](#ref-6)。Anthropic 明說尚不清楚其功能，成果為公司自述。這是「代理跑大規模探索、人只驗證候選」的科學版，套到程式碼庫就是讓代理掃整個 monorepo 找模式異常。

<a id="hl-software"></a>
### 軟體工程

- **GitHub Actions 硬切到 Node 24，沒有環境變數可以拖延。** GitHub 9 月 23 日發出最終通知，Node 20 已不再提供於 Actions runner，JavaScript actions 一律以 Node 24 執行，先前的退出選項 `ACTIONS_ALLOW_USE_UNSECURE_NODE_VERSION` 也已移除；action 作者要把 `runs.using` 改為 `node24` 並發布新版，Node 24 與 macOS 13.4 以前及 ARM32 不相容，使用這些平台的自架 runner 不再受支援 [[7. GitHub]](#ref-7)。CI 突然壞掉的第一件事，是查 pinned 的第三方 action 是否還在用 node20。
- **GitHub 的 SSH 進入後量子時代，三個日期要記。** GitHub 移除以 SHA-1 的 RSA 簽章與 `diffie-hellman-group-exchange-sha256` 交換機制，10 月 14 日起新上傳的 RSA 金鑰至少 3072 位元，同日啟用後量子金鑰交換 `mlkem768x25519-sha256`；11 月 4 日與 12 月 9 日各有一次 brownout [[8. GitHub]](#ref-8)。Java 27 同期把 JEP 527 後量子混合金鑰交換寫進 TLS 1.3，並預設啟用精簡物件標頭與 G1 垃圾回收器，Jipher 20 加入 ML-KEM 與 ML-DSA [[13. Oracle]](#ref-13)。老舊 CI 映像檔與嵌入式裝置裡的 SSH 客戶端，最容易在 brownout 當天出事。
- **代理的沙箱從「加一層」變成「沒沙箱就不跑」。** GitHub Copilot app 推出本機沙箱公開預覽，以專案為單位設定可讀寫與拒絕存取的資料夾、對外與本機網路、Git 與 GitHub CLI 憑證；若作業系統無法強制執行所請求的政策，沙箱 shell 直接失敗而不是降級執行，功能預設關閉，可用 `/sandbox on` 只對單一工作階段啟用 [[9. GitHub]](#ref-9)。Docker 則把本機的 Docker Sandboxes 延伸到雲端，每個沙箱是獨立微型虛擬機，`sbx move` 可在本機與雲端間搬移沙箱但不保留執行中的行程與金鑰，按秒計費、單次最長 24 小時 [[12. iThome]](#ref-12)。長時間代理任務要設計成可從檔案系統狀態重啟。
- **Node.js 與 VS Code 的例行版本，各有一件對日常工作有感的事。** Node.js 26.10.0 新增 `crypto.parsePKCS12()`、`util.debounce` 與 `util.throttle`、`SlidingWindowHistogram`，並讓內建 sqlite 把 `undefined` 綁定為 `NULL` [[10. Node.js]](#ref-10)。VS Code 1.139 讓代理可在 SSH、Tunnel 與 WSL 主機上專案的 Dev Container 內執行，並加快大量代理工作階段清單的載入 [[11. VS Code]](#ref-11)。debounce 進標準庫，代表這類小工具不必再拉相依套件；代理進遠端 Dev Container，等於讓 AI 用專案自帶的工具鏈建置與測試，少掉「在我機器上可以跑」的落差。

<a id="hl-security"></a>
### 軟硬體資訊安全

- **CISA 一次列入四個邊界設備漏洞，並把「修補前先查有沒有被打」寫進要求。** 9 月 22 日 KEV 新增 Check Point 兩個漏洞（憑證驗證不當與路徑遍歷）、Arista VeloCloud Orchestrator 輸入驗證不當與 F5 BIG-IP APM 堆積緩衝區溢位；公告引用 BOD 26-04，要求聯邦機關優先修補對外曝露且被利用後可完全控制資產的漏洞，並建立修補前的入侵檢查 [[14. CISA]](#ref-14)。同週台灣網通廠 D-Link 公告 DIR-822A 路由器兩個漏洞，udhcpcd 的堆疊溢位 CVSS 10.0 且已有公開 PoC，狀態仍為調查中，官方建議關閉不必要的公網曝露與遠端管理 [[19. D-Link]](#ref-19)。
- **資安署的案例：根因不是設備老，是交接文件沒有 EOS 這一欄。** 資安署月報揭露某機關監視系統前端的防火牆遭駭，攻擊者竄改最高管理者帳號密碼並連進內網；追查發現業務交接只完成書面移交，沒有同步確認版本、原廠維護狀態與汰換時程，接手單位也未盤點，因此不知道設備已過原廠支援期限 [[15. iThome]](#ref-15)。建議包括獨立網段隔離、管理介面不直接對外、遠端維運「原則禁止、例外允許」並搭配零信任與來源 IP 白名單。資產清冊裡缺「EOS 日期」這一欄，就是整起事件的根因。
- **從一台 NAS 上的 Gitea 打到整個 Proxmox 叢集。** Acronis 揭露 Red Heron 利用 Gitea 遠端程式碼執行漏洞 CVE-2026-60004，在公開 PoC 出現後數日內武器化為自動化框架，掃描七國 1,386 個實例，另備一份含 477 個台灣系統的清單並於 8 月 3 日對 50 個目標批次攻擊；在一個台灣環境中，攻擊者從執行 Gitea 的 Synology NAS 取得三節點 Proxmox 叢集的 root 權限並啟動虛擬機備份 [[16. Acronis]](#ref-16)。報告同時揭露 C++ 植入程式 JITTERLY 與新的 LD_PRELOAD rootkit SIXZUT。自架 Gitea 的團隊要確認已升到 1.27.1 以上，並檢查 NAS 或 Proxmox 上的 Git 服務是否直接對外。
- **多租戶隔離可以被儲存層一個效能旗標打穿。** Cloudflare 說明 Containers 的跨租戶資料曝露：使用 Linux device mapper 的 thin provisioning 並啟用 `skip_block_zeroing`，新區塊配置時略過歸零，一次寫入小於 64 KiB 區塊時剩餘部分保留前一個擁有者的資料；漏洞由 HackerOne 回報，研究人員在六個正式環境位置辨識出 2,700 個不屬於自己的目錄 inode。Cloudflare 全機隊移除該設定、汰換所有執行中的容器磁碟並移除緩解前的映像快照，9 月 19 日完成清理，稱除授權測試外無遭利用證據 [[17. Cloudflare]](#ref-17)。自建精簡配置儲存的維運者可以直接檢查自家有沒有同樣設定。
- **供應鏈攻擊不需要新程式碼，儲存庫「重新可見」就夠了。** 兩個 actions-cool 組織的 action 在 5 月 Mini Shai-Hulud 事件中遭植入竊取 CI/CD 憑證的程式碼並停用，9 月 16 日再度變成可存取，但發行標籤未清理仍指向惡意內容，以版本標籤引用的工作流程下次執行就重新下載酬載；目前已被 GitHub 第二次停用，原因不明 [[18. The Hacker News]](#ref-18)。釘選到 5 月 18 日之前完整 commit SHA 的工作流程不受影響。建議把 `actions-cool/issues-helper@v2.2.1` 視為受影響、輪替曝露的密鑰，並檢查執行紀錄中長期「Set up job」失敗後突然成功的執行。

<a id="hl-hardware"></a>
### 硬體或軟硬整合

- **聯發科先喊出 2 奈米旗艦，裝置端目標是 30B 模型。** Dimensity 9600 Pro 採 2 奈米製程，聯發科自稱是第一家宣布達到此節點的業者；2+3+3 全大核，官方稱單核效能提升最多 17%、多核功耗降低 61%；雙 NPU 架構讓常時 AI 功耗降低 40%，NPU 1090 的 LLM prefill 效能提升 51%、每瓦 token 產生量提升 55%，支援最高 30B 參數的裝置端模型，並首度支援 LPDDR6 與 UFS 5.0 [[20. MediaTek]](#ref-20)。首批手機預計本季上市。效能數字為聯發科實驗室 demo 機測得，開發者應等實機再評估。
- **台積電在美「核准出資」與「宣布投資」差了六倍。** 投審司 7 度核准台積電赴美投資，累計核准股本 440 億美元，最近一次是今年 7 月的 200 億美元；投審司說明審查的是對美國子公司的股本金額，不是全部投資支出，台積電宣布的在美投資總額為 2,650 億美元，預期未來仍會有新案 [[21. 中央社]](#ref-21)。成熟製程則往新加坡走：世界先進與恩智浦合資的 VSMC 從平地到建成只花 22 個月，首批 40 奈米良率逾 99%，2027 年第 1 季量產且產能已預售一空，聯電新加坡 P4 規劃提供矽光子產能、2028 年下半年量產 [[23. 中央社]](#ref-23)。
- **Meta 把 AI 裝置做成 43 公克的眼鏡。** Ray-Ban Meta Audio 售價 349 美元起，續航最高 12 小時、充電盒再提供 48 小時，10 月 13 日出貨；Ray-Ban Meta Gen 3 的 6 麥克風陣列可消除超過 90% 背景噪音；Meta 預告年底前 Ray-Ban、Oakley 與 Meta Glasses 三大系列合計超過 100 種眼鏡選擇，全部連結個人 AI 代理 Muse [[22. Meta]](#ref-22)。無螢幕、語音優先的互動設計會是下一個平臺議題。
- **人形機器人第一次有官方統計：7,000 台，多數在收資料。** IFR 首次在工業與服務型機器人之外統計人形機器人，2025 年全球售出約 7,000 台；IFR 秘書長指出其中許多台並未從事生產性工作，而是被研究機構或企業買來產生資料以改善 AI 模型，汽車製造商以個位數或雙位數台數試驗 [[24. 中央社]](#ref-24)。相較之下 2024 年安裝了約 54 萬 2,000 台工業機器人；美國銀行估 2026 年人形機器人出貨 9 萬台。現階段瓶頸在資料與 AI，不在機構。

<a id="hl-infrastructure"></a>
### 網路/伺服器等基礎

- **Cloudflare 終於處理 HTTP 最難看的部分：Vary。** Cache Rules 現在可對來源伺服器宣告的每個 Vary 標頭選擇三種動作：Normalize 正規化（`Accept`、`Accept-Language`、`Accept-Encoding` 自動套用）、Passthrough 以精確值作為快取鍵、Bypass 不快取；Cloudflare 分析有近 3,000 個網站在四個以上欄位上 Vary，部分達 47 個，功能對所有方案開放 [[25. Cloudflare]](#ref-25)。同週 Python Workers 正式發布，Cloudflare 提出 PEP 783 標準化 PyEmscripten 平臺並在 cibuildwheel 加入支援，FastAPI、Django、Flask 可經 WSGI／ASGI 連接器執行，不需 JavaScript 膠水程式碼 [[26. Cloudflare]](#ref-26)。做多語系或 A/B 內容的開發者值得重新檢視快取規則。
- **QUERY 是 2010 年以來第一個新 HTTP 動詞，WAF 規則還沒跟上。** SANS ISC 指出 RFC 10008 定義的 QUERY 介於 GET 與 POST 之間，安全、冪等、可快取，查詢放在本文；Nginx 會代理但不快取，Django 的 View 類別直接拒絕；只綁定 POST 的 WAF 簽章可被 QUERY 本文繞過，快取鍵未納入本文可能造成快取投毒，CSRF 中介層也可能忽略會改變狀態的 QUERY 端點 [[28. SANS ISC]](#ref-28)。作者尚未在日誌看到正式環境使用，但建議現在就把方法白名單加上 QUERY。
- **一條海纜的容量翻倍，靠的是多芯光纖而不是更多電力。** Meta 宣布 Petal 跨大西洋海纜，設計容量每秒 1 petabit，是目前最先進跨洋海纜的兩倍，長約 7,000 公里連接美國與法國，合作夥伴為 NEC、住友電工與 Orange；多芯光纖讓容量翻倍而不需等比例增加電力或實體設施，預計 2029 年啟用 [[27. Meta]](#ref-27)。「首條」與「有史以來最大」為 Meta 自評。
- **AI 算力採購連帶鎖定記憶體，台灣電力則走到再運轉審查的下一關。** Anthropic 承諾 7 年支付 Akamai 116 億美元購買雲端服務，並取得最高 5% 股權的認股權證；Akamai 2026 年資本支出因此增加約 17 億美元，且已授權捷普採購約 17 億美元記憶體零組件 [[30. 中央社]](#ref-30)。台灣端，核安會經 3 回合審查、589 項意見後核定核三廠再運轉計畫，台電後續須提交執行結果報告，核安會強調仍有多項程序與安全管制作業 [[29. 中央社]](#ref-29)。原頁未提及重啟時程或供電量。

<a id="hl-fintech"></a>
### 金融科技

- **金管會開放存款代幣試辦，法律上仍是存款，技術上要交代帳本怎麼對。** 金管會 9 月 22 日開放銀行依「金融業申請業務試辦作業要點」申請試辦存款代幣，定性為以區塊鏈等新型態方式表彰或記錄的銀行存款；營業計畫書須說明試辦範圍、發行／移轉／贖回／銷毀流程與現行匯款作業的差異、存款帳務與代幣帳本的勾稽對帳機制、技術架構（節點、錢包、智能合約）與試辦結束時的客戶權益保障 [[31. 金管會]](#ref-31)。同日金管會督導證交所與櫃買中心的「臺股儀表板」上線，整合授信、違約與營收三大面向指標，預設顯示最近 5 個交易日走勢 [[34. 金管會]](#ref-34)。對開發者，營業計畫書的五項事項就是一份系統整合的需求規格。
- **玉山把行內 API 全面 Agent 化，SOP 寫成技能檔。** 玉山金控首度公開預計 9 月底上線的 GENIE 3.0：統一的 Root Agent 判讀意圖，再透過 REST API 或 MCP 呼叫行內服務或各類 Agent；2.0 的 Prompt 模板庫在 3.0 變成技能與工具儲存庫，把業務單位 SOP 寫成技能檔，讓 LLM 知道流程需要哪些 API 或工具；所有 Agent 應用與工具都須依玉山自訂的 Agentic Framework 開發並上架登記 [[32. iThome]](#ref-32)。Root Agent、MCP 閘道與技能儲存庫的三層結構，和開發者社群寫 agent skills 的路徑幾乎一致。
- **SEC 把 AMM 流動性池寫進正式命令。** SEC 9 月 17 日發布暫時性、附條件的「創新豁免」，讓代幣化證券交易場所不落入 1934 年證券交易法的交易所定義，可用經許可的自動做市商與流動性池交易代幣化的 NMS 股票，並暫時豁免以自有資本提供流動性者的交易商認定；委員會同時徵求公眾意見 [[33. SEC]](#ref-33)。對做券商或 DeFi 系統的人，豁免條件就是合規檢查清單。

<a id="hl-healthtech"></a>
### 醫療科技

- **奇美急診用地端 LLM，掛號後 30 秒生成一頁病歷摘要。** 奇美醫院與數位產業署、工研院合作的智慧急診病歷摘要系統，運用地端醫療專用大語言模型與邊緣運算，病人掛號後即開始整理病歷，約 30 秒生成一頁式摘要，醫師看診前一鍵開啟並可追問細節；系統不與外部網路連結，敏感資訊留在院內，定位為醫療資訊助手，解讀與決策仍由醫師負責 [[35. 中央社]](#ref-35)。過去醫師要登入多個系統逐一查詢，再花 5 至 10 分鐘人工彙整。地端 LLM 加邊緣運算加病歷追問，是醫療場域「不出院」部署的典型架構。
- **健康幣把預防保健做成點數系統，掛在健保快易通上。** 行政院會 9 月 17 日聽取衛福部規劃，健康幣 10 月 1 日上線，民眾在健保快易通 APP 填寫生活型態量表或完成健檢、癌症篩檢、疫苗即可累積，滿 1,000 幣可至指定通路兌換商品、醫療服務與運動課程；院長要求注意高齡與數位落差族群，研議與運動幣整合，並重視個資保護與資料治理 [[36. 衛福部]](#ref-36)。跨通路兌換與個資治理是這類公部門積分系統最難的兩段。
- **大模型做離線工具，小模型上線推論：MIT 的自殺風險詞庫。** MIT McGovern 腦研究所團隊先用 AI 產生與 49 項風險因子相關的詞句、每項約 60 個詞，人工與臨床專家審核後建成詞庫，再以輕量、可解釋的機器學習模型在 Crisis Text Line 約 16,000 則去識別化對話上預測三級風險；提及致命手段與物質使用者比表達憂鬱情緒者更可能屬最高風險組，模型可在個人電腦執行並標示觸發詞句，詞庫與軟體套件已公開 [[37. MIT News]](#ref-37)。團隊強調臨床使用前須充分驗證且需有人在迴路。
- **放射科 AI 每一版仍要走 510(k)。** FDA 在聯邦公報刊登最終命令，正式駁回將放射科電腦輔助偵測／診斷與電腦輔助分診通知等四類軟體豁免上市前通知的請願；駁回決定本身在 4 月 1 日作出，9 月 17 日刊登並生效 [[38. Federal Register]](#ref-38)。模型更新的發布節奏受法規流程約束，做醫療 AI 的團隊要把送審週期算進迭代計畫。
- **可以吞下去、也會自己消失的電池。** MIT 以鎂與三氧化鉬電極、離子液體凝膠電解質做出可生物吸收的微型電池，輸出 1.84 伏特，在模擬胃酸中可正常運作約三天、數週內完全分解；動物實驗中可驅動胃部電刺激膠囊連續三天，20 分鐘刺激讓飢餓素提高約 50%，也可讓 RFID 膠囊從腸胃道持續發送訊號達 1.5 公尺 [[39. MIT News]](#ref-39)。研究刊於《Nature Chemical Engineering》，臨床試驗預計約兩年後啟動。

<a id="hl-logistics"></a>
### 運輸物流

- **臺鐵帶著自己開發的平交道偵測去柏林。** InnoTrans 2026 臺鐵首度參展，展出已實際營運的兩項系統：以 AI 影像辨識車型並自動切換洗車模式的智慧化列車自動洗車設備，以及以熱影像攝影機與毫米波雷達雙重偵測、24 小時掃描平交道淨空區並以無線電告警通知司機員的平交道障礙物自動偵測系統，皆為國內自主開發、未來可自行升級軟體 [[40. 臺鐵]](#ref-40)。交通部長陳世凱受訪時表示台灣首度設立國家館，AI、資通訊與數位孿生是業者進軍海外的競爭優勢，但車輛設計、系統整合與測試驗證能力仍需補強 [[41. 中央社]](#ref-41)。
- **Level 3 的關鍵不是車會不會開，是系統能不能確認駕駛接得回來。** 車輛中心的高抗遮蔽 AI 駕駛視線追蹤技術同步分析頭部姿態、注視方向與眼睛開閉狀態，戴口罩、墨鏡或在低光源隧道、強逆光下仍可辨識，對應 UN R171 駕駛專注監測與 R157 接管能力法規，只需約 10 TOPS 的邊緣算力即可即時運作，已導入國內首輛 Level 3 自駕電動巴士 [[42. 自由財經]](#ref-42)。10 TOPS 的算力預算與法規對應，是嵌入式視覺系統很具體的規格參考。
- **Waymo 的安全報告更新到 2.7 億英里，同時再開一個城市。** 截至 6 月底的五個服務區數據顯示，不論肇責歸屬，Waymo Driver 涉及的受傷事故比人類駕駛少 841 起、減少 82%，嚴重受傷以上減少 95%，涉及行人的受傷事故減少 93% [[43. Waymo]](#ref-43)。9 月 14 日拉斯維加斯開放公眾乘車，服務區約 24 英里，與丹佛、聖地牙哥同為首批以搭載第 6 代 Driver 的 Ojai 車款為主力的城市 [[44. Waymo]](#ref-44)。數據為廠商自評，但方法論公開。

<a id="hl-proptech"></a>
### 房地產與室內外裝潢

- **建研所把智慧工地與立面光電放進同一個近零碳框架。** 建研所 9 月 16 日在高雄舉辦智慧節能創新技術跨域交流，企業代表分享智慧工地與立面彩繪光電；內政部的近零碳建築減碳旗艦行動計畫從擴大建築能效、老宅延壽及社會住宅、綠領人才培育三大主軸推動，由公有建築率先示範，並串聯環境部、教育部、勞動部與經濟部資源 [[45. 建研所]](#ref-45)。做建築 IoT 或能源管理平台的人可以留意這條政策線，工地感測、能耗監測與光電發電量的整合需求已被預告。
- **AI 供應鏈的實體需求正直接轉成廠房交易。** 第一太平戴維斯統計，前三季大型商用不動產交易 2,577 億元創新高、年增 109%，第 3 季廠房交易 602 億元占近七成；指標案包括廣達以 197 億元購入華亞廠房布局 AI 伺服器產線，凱基人壽 206 億元購入潤泰玉成廣場且輝達等科技企業已承租逾半棟，廠房熱區為苗栗與桃園 [[46. 聯合新聞網]](#ref-46)。數據為顧問公司報告。開發者平常只看到雲端算力，這則提醒背後的不動產也是 AI 供應鏈的一環。
- **把交通攝影機當感測器、把影像當資料集。** MIT Senseable City Lab 曾以機器學習辨識紐約 331 支交通攝影機中的車輛類型並估算排放；新書《How AI Sees the City》說明視覺 AI 可回答路口哪裡最危險、公園哪裡最吸引人，也列出大規模視覺監控的侵入性與 AI 強化偏見的風險 [[47. MIT News]](#ref-47)。開發都市分析系統時要把資料治理設計在前面。

<a id="hl-arts"></a>
### 現場表演藝術

- **光雕投影對準的是戲台幾何和操偶節奏。** 文總與證交所創新板的影像企劃「創新辦桌」第 4 集回顧新勝景掌中劇團：動畫導演朱祥溥 2018 年把光雕投影帶回家中劇團，為白晝之夜製作純白景片讓大雪、烈火等光影特效在戲台流轉，作品 2019 年赴北美巡演、2025 年前進大阪 We Taiwan 活動 [[48. 中央社]](#ref-48)。光雕要對準戲台幾何、又要與操偶節奏同步，本質上是即時渲染與內容排程問題。內容基於文總新聞稿。
- **衛武營 8 週年 Open House 把 AI 放進雙人舞。** 戲劇院推出「探戈：擁抱之間」，結合 AI 科技與探戈舞步；公共空間另有法國藝術家 Alexandre LÉVY 以雕塑觸覺與聲音片段構成的互動裝置展「Miedka：野性面容」[[49. 中央社]](#ref-49)。原頁對 AI 的描述只有一句，技術細節未知。

<a id="hl-entertainment"></a>
### 影視音樂

- **AI 樂手要跟得上真人臨場變速，重點是低延遲而不是生成。** 資策會在經濟部科技專案下研發 AI 音樂理解與智慧協奏技術，四項能力為環境降噪與多聲源分離、辨識節奏和弦曲風的音樂理解模型、AI 音色建模，以及動態跟拍即時調整速度；「AI 一人成團」以吉他示範，演奏者加速、放慢或改變節奏時虛擬樂手能動態調整伴奏，將於 9 月 29 日至 30 日的 ICT TechDay 展出 [[50. 聯合新聞網]](#ref-50)。原頁未提及模型架構或延遲數字。
- **YouTube 的肖像偵測進手機，並要把聲紋疊上臉部比對。** Made On YouTube 2026 公布數十億個頻道已符合資格申請自動化深偽偵測，肖像偵測將直接在行動 App 提供設定、檢視與處置；YouTube 表示肖像也包括聲音，今年稍晚開始把說話聲音偵測與臉部偵測整合，以提升比對準確度 [[51. YouTube]](#ref-51)。平台級身分保護正從被動申訴走向主動偵測與通知。
- **取得授權的 AI 聲音，觀眾不一定買單。** Netflix 實境秀「Wonka's The Golden Ticket」以 ElevenLabs 生成已故演員 Gene Wilder 的聲音擔任旁白，製作方表示獲得遺產管理方與遺孀明確同意，並翻閱數小時有聲書捕捉其節奏與語氣；影迷關注焦點卻是這個決定本身 [[52. NBC News]](#ref-52)。技術可行、授權齊備，揭露方式仍要一起設計。

<a id="hl-others"></a>
### 其他領域科技應用突破

- **第一顆專門量植物螢光的衛星升空。** ESA 的 FLEX 與 Copernicus Sentinel-3C 9 月 15 日搭乘 Vega-C 一箭雙星升空，FLEX 的螢光成像光譜儀偵測植物吸收陽光時發出的極微弱螢光，直接反映植被把陽光與二氧化碳轉換成能量的效率，用於評估植物健康與生態系生產力 [[53. ESA]](#ref-53)。NASA 同週選定 PRIMA 遠紅外線望遠鏡為 Probe Explorers 新任務級別首案，成本上限 12 億美元、2033 年發射、規劃執行五年，由 JPL 主導並有八個國際夥伴 [[54. NASA]](#ref-54)。
- **Google 先問 TPU 在太空活不活得下來，再談架構。** Project Suncatcher 首次在軌測試與 Planet 合作打造原型衛星，搭乘 SpaceX Transporter-18 升空，目的是蒐集 TPU 承受發射振動、最高 10 倍重力持續加速度、輻射與真空散熱的實測資料；地面輻射測試顯示 Trillium 世代 TPU 在超過五年任務累積劑量下表現良好，下一步是 2027 年部署兩顆衛星測試雷射互連 [[55. Google]](#ref-55)。對做極端環境運算的人，輻射、熱與振動三個維度的實測資料比任何模擬都值錢。原頁未載明發射日期與衛星規格。
- **企業問研究團隊的不是酷不酷，是技術成熟度與導入條件。** 國科會 2026 未來科技館閉幕，集結 84 件未來科技獎成果，3 天逾 5 萬人次進場、150 場技術洽談與 27 件技術發表；國科會指出企業關心技術成熟度、驗證成果、導入條件與開發時程，讓交流從「認識技術」往「如何使用技術」推進 [[56. 中央社]](#ref-56)。想把研究成果做成產品的人，先準備可驗證的 demo 與整合路徑。

<a id="trends"></a>
## 趨勢分析

<a id="tr-ai"></a>
### AI 科技

**價格戰打到快取層，代理成本結構正在重寫。** Opus 5.5 把快取讀取降到 Opus 5 的四成 [[1. Anthropic]](#ref-1)，GPT-6 Sol 與 Luna 把 API 價格砍半並附上快取儀表板 [[2. iThome]](#ref-2)。長時間代理任務的帳單主要是重複讀取上下文，兩家同時往這裡降價，說明競爭焦點已從單次推論轉向代理工作流的總成本。同時，微軟把 Copilot 拆成入口、程式與離線代理三個角色 [[3. Microsoft]](#ref-3)，代理產品的形狀逐漸固定下來。

**「AI 找、確定性工具驗」成為可信賴的工程模式。** PageBreak 把代理找到的漏洞交給非 AI 驗證器實際送 payload 確認 [[4. Google]](#ref-4)，Anthropic 讓 Claude 產生假設、再在自有實驗室以實驗驗證 [[6. Anthropic]](#ref-6)，MIT 用 LLM 產生詞庫、再用輕量可解釋模型上線 [[37. MIT News]](#ref-37)。三個案例的共通點是 LLM 的輸出只當假設，最後一哩交給可重現的驗證。台灣三分之一工作年齡人口已在用生成式 AI [[5. 中央社]](#ref-5)，這套模式會越來越常出現在一般產品裡。

<a id="tr-software"></a>
### 軟體工程

**平台把不安全的預設值直接拔掉，緩衝期越來越短。** Node 20 的退出環境變數已移除 [[7. GitHub]](#ref-7)，SSH 的 SHA-1 RSA 簽章排定兩次 brownout 後移除 [[8. GitHub]](#ref-8)，Java 27 直接把 G1 與精簡物件標頭設為預設 [[13. Oracle]](#ref-13)。對維護老專案的團隊，「不升級就不動」的策略成本在上升；CI 映像檔、嵌入式裝置與 pinned 的第三方 action 是最常被遺忘的三個角落。

**代理的執行環境本身成為產品。** Copilot app 的本機沙箱以 fail closed 為原則 [[9. GitHub]](#ref-9)，Docker 把沙箱做成可在本機與雲端搬移的微型虛擬機 [[12. iThome]](#ref-12)，VS Code 讓代理進遠端 Dev Container [[11. VS Code]](#ref-11)。競爭點從「代理多聰明」移到「代理在哪裡跑、能碰什麼、斷線怎麼辦」。Node.js 把 debounce 與 PKCS#12 解析收進標準庫 [[10. Node.js]](#ref-10)，則是另一種減少相依的方式。

<a id="tr-security"></a>
### 軟硬體資訊安全

**邊界設備與供應鏈是本期反覆出現的兩個入口。** CISA 一次列入四個防火牆、SD-WAN 與存取閘道漏洞 [[14. CISA]](#ref-14)，D-Link 路由器的 DHCP 溢位 CVSS 滿分 [[19. D-Link]](#ref-19)，資安署的案例則是過了支援期限的防火牆成為內網跳板 [[15. iThome]](#ref-15)。供應鏈端，遭入侵的 GitHub Action 只因儲存庫重新可見就再次執行 [[18. The Hacker News]](#ref-18)，Red Heron 從自架 Gitea 一路打到虛擬化叢集 [[16. Acronis]](#ref-16)。兩條線的共同解法很老：資產清冊要有 EOS 日期，第三方引用要釘到 commit SHA。

**多租戶平台的隔離要往儲存層檢查。** Cloudflare Containers 的問題不在容器，而在 dm-thin 一個略過歸零的效能旗標 [[17. Cloudflare]](#ref-17)。自建精簡配置儲存的維運者可以直接檢查自家有沒有同樣設定。BOD 26-04 把「修補前是否已遭入侵」寫成要求 [[14. CISA]](#ref-14)，也代表修補作業的定義正在擴大。

<a id="tr-hardware"></a>
### 硬體或軟硬整合

**裝置端 AI 的天花板由記憶體與製程一起拉高。** 天璣 9600 Pro 以 2 奈米製程、LPDDR6 與 UFS 5.0 把裝置端模型上限推到 30B 參數 [[20. MediaTek]](#ref-20)，Meta 把 AI 代理裝進 43 公克的眼鏡 [[22. Meta]](#ref-22)。兩者都是「模型往裝置搬」的硬體前提，行動端 AI 應用的設計假設要跟著更新，但效能數字皆為廠商自評。

**台灣半導體的地理布局有兩個時間軸。** 先進製程在美國的核准出資 440 億美元，離宣布的 2,650 億美元還很遠 [[21. 中央社]](#ref-21)；成熟製程與矽中介層則在新加坡快速落地，VSMC 22 個月建成、2027 年第 1 季量產 [[23. 中央社]](#ref-23)。人形機器人的首份官方統計顯示多數機器在收資料而非工作 [[24. 中央社]](#ref-24)，機器人軟體團隊可以從資料管線的角度看這個市場。

<a id="tr-infrastructure"></a>
### 網路/伺服器等基礎

**HTTP 這一層還在變，快取與方法白名單要重新檢視。** Cloudflare 把 Vary 做成可設定的正規化、直通與略過 [[25. Cloudflare]](#ref-25)，QUERY 方法則讓只認 GET 與 POST 的 WAF、CSRF 中介層與快取鍵出現盲點 [[28. SANS ISC]](#ref-28)。做多語系、A/B 內容或 API 閘道的團隊，本期值得把快取規則與方法白名單各看一遍。Python Workers 正式版與 PEP 783 [[26. Cloudflare]](#ref-26)，則讓 Python 應用可以不改寫成 JavaScript 就部署到邊緣。

**算力擴張的瓶頸從 GPU 擴到記憶體、海纜與電力。** Anthropic 與 Akamai 的 116 億美元合約直接帶動 17 億美元的記憶體預購 [[30. 中央社]](#ref-30)，Meta 用多芯光纖讓跨洋海纜容量翻倍而不等比例增加供電 [[27. Meta]](#ref-27)，台灣的核三再運轉計畫核定後進入執行與後續審查 [[29. 中央社]](#ref-29)。這些都是 2027 年之後才會影響延遲、頻寬與供電條件的變數。

<a id="tr-fintech"></a>
### 金融科技

**監管機關開始用試辦與豁免把鏈上機制納入既有法規。** 金管會把存款代幣定性為存款、以試辦要點開放 [[31. 金管會]](#ref-31)，SEC 以暫時豁免讓 AMM 流動性池成為受監管的交易場所 [[33. SEC]](#ref-33)。兩者都不是新法，而是既有框架的延伸；對開發者，營業計畫書與豁免條件本身就是系統需求規格。金管會的臺股儀表板 [[34. 金管會]](#ref-34) 則是主管機關把風險指標做成公開資料面。

**銀行內部的代理架構開始標準化。** 玉山的 Root Agent、MCP 閘道與技能儲存庫三層結構 [[32. iThome]](#ref-32)，把行內 API 目錄變成代理可讀的工具清單，SOP 變成技能檔。金融業的合規要求會讓這類框架的權限控管與稽核軌跡比一般企業更早成熟。

<a id="tr-healthtech"></a>
### 醫療科技

**醫療 AI 的部署形狀是地端、可解釋、人在迴路。** 奇美的急診摘要系統不連外網 [[35. 中央社]](#ref-35)，MIT 的自殺風險模型可在個人電腦執行並標示觸發詞句 [[37. MIT News]](#ref-37)，FDA 維持放射科 AI 每版都要走 510(k) [[38. Federal Register]](#ref-38)。三者指向同一件事：醫療場域的 AI 不會走「雲端大模型、頻繁更新」的路，而是小模型、本地部署、法規節奏。健康幣把預防保健做成點數系統 [[36. 衛福部]](#ref-36)，可吸收電池讓吞服裝置整顆可降解 [[39. MIT News]](#ref-39)，則是醫療科技往「日常」與「無痕」兩端延伸。

<a id="tr-logistics"></a>
### 運輸物流

**台灣軌道產業的出口敘事從硬體轉向軟體與資料。** 臺鐵展出的平交道偵測與 AI 洗車都強調國內自主開發、可自行升級 [[40. 臺鐵]](#ref-40)，交通部長點名 AI、資通訊與數位孿生為競爭優勢 [[41. 中央社]](#ref-41)。車輛中心的視線追蹤以 10 TOPS 邊緣算力對應 UN R171 與 R157 [[42. 自由財經]](#ref-42)，說明自駕的法規合規正在變成具體的嵌入式規格。

**自駕的安全數據開始像可靠度報告。** Waymo 以不分肇責的比較基準與公開方法論更新 2.7 億英里的數據 [[43. Waymo]](#ref-43)，並以第 6 代 Driver 與 Ojai 車款作為新城市的預設配置 [[44. Waymo]](#ref-44)。做任何自動化系統的人都可以參考它怎麼定義基線與指標。

<a id="tr-proptech"></a>
### 房地產與室內外裝潢

**建築的科技需求來自政策與 AI 供應鏈兩端。** 政策端，建研所把智慧工地與立面光電放進近零碳建築計畫 [[45. 建研所]](#ref-45)；需求端，AI 伺服器產線與資料中心讓廠房交易占商用不動產近七成 [[46. 聯合新聞網]](#ref-46)。城市尺度的視覺 AI 分析 [[47. MIT News]](#ref-47) 則提醒，這些空間資料一旦大規模蒐集，隱私與偏見治理要先設計。

<a id="tr-arts"></a>
### 現場表演藝術

**窗內可用的仍是製作技術的側寫，而非新系統。** 新勝景的光雕布袋戲是動畫工具進入傳統戲台的長期案例 [[48. 中央社]](#ref-48)，衛武營的 AI 探戈只有一句描述 [[49. 中央社]](#ref-49)。本分類連續四期缺乏高權重來源，趨勢觀察外推性有限。

<a id="tr-entertainment"></a>
### 影視音樂

**AI 在影音的戰場分成即時互動與身分保護兩條。** 資策會的協奏技術重點是低延遲的節拍追蹤與聲源分離 [[50. 聯合新聞網]](#ref-50)，與離線生成是不同的工程問題。身分保護端，YouTube 把聲紋疊上臉部比對並進手機 [[51. YouTube]](#ref-51)，Netflix 的 Wilder 聲音案例則顯示授權齊備仍會遇到觀眾反彈 [[52. NBC News]](#ref-52)。「同意、署名、揭露」三件事要一起設計。

<a id="tr-others"></a>
### 其他領域科技應用突破

**太空任務的關鍵詞從「更大」變成「先驗證、設上限」。** FLEX 量的是極微弱的植物螢光 [[53. ESA]](#ref-53)，PRIMA 是有 12 億美元成本上限的新任務級別 [[54. NASA]](#ref-54)，Suncatcher 先量 TPU 能不能活過發射與輻射再談算力 [[55. Google]](#ref-55)。國科會的閉幕說明企業問的是技術成熟度與導入條件 [[56. 中央社]](#ref-56)，研究成果要先準備可驗證的 demo 與整合路徑。

<a id="references"></a>
## 參考資料

| 編號 | 文章標題與搜尋連結 | 一句話繁體中文結論或亮點 | 發布日期 | 來源資料網址與名稱 | 分類 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ref-1"></a>1 | [Introducing Claude Opus 5.5](https://www.google.com/search?q=Anthropic+Introducing+Claude+Opus+5.5) | 以 Opus 5 六成成本達到 Fable 5.1 水準，快取讀取降價 60%。 | 2026-09-22 | [Anthropic](https://www.anthropic.com/claude-opus-5-5) | AI 科技 |
| <a id="ref-2"></a>2 | [OpenAI 公布 GPT-6 Sol、Luna，價格較前代降低一半](https://www.google.com/search?q=OpenAI+GPT-6+Sol+Luna+價格+降低一半+iThome) | Sol 與 Luna 的 API 價格較 GPT-5.6 世代減半，並新增快取儀表板。 | 2026-09-23 | [iThome](https://www.ithome.com.tw/news/179160) | AI 科技 |
| <a id="ref-3"></a>3 | [Introducing the new Copilot with Home, Code and Autopilot](https://www.google.com/search?q=Microsoft+new+Copilot+Home+Code+Autopilot) | Copilot 新增 Home、Code 與 Autopilot，離線也持續運作的代理進入私人預覽。 | 2026-09-25 | [Microsoft Official Blog](https://blogs.microsoft.com/blog/2026/09/25/introducing-the-new-copilot-with-home-code-and-autopilot/) | AI 科技 |
| <a id="ref-4"></a>4 | [Agentic Hacks, Real Proofs: Inside Google's PageBreak Project](https://www.google.com/search?q=Google+PageBreak+agentic+XSS+deterministic+validation) | AI 代理找漏洞、非 AI 驗證器實際打 payload 確認，找出逾 500 個 XSS。 | 2026-09-24 | [Google Security Blog](https://blog.google/security/agentic-hacks-real-proofs-inside-googles-pagebreak-project/) | AI 科技 |
| <a id="ref-5"></a>5 | [台灣 AI 使用率升至 33.8%　躍居全球第 19 名](https://www.google.com/search?q=台灣+AI使用率+33.8+全球第19名+微軟+中央社) | 台灣工作年齡人口生成式 AI 使用率 33.8%，全球排名第 19。 | 2026-09-22 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609220112.aspx) | AI 科技 |
| <a id="ref-6"></a>6 | [Claude discovers a novel enzyme system](https://www.google.com/search?q=Anthropic+Claude+discovers+novel+enzyme+system+life+sciences) | Anthropic 成立生命科學實驗室，Claude 自主發現具 CRISPR 式重複序列的新型酵素系統。 | 2026-09-23 | [Anthropic](https://www.anthropic.com/news/claude-discovers-novel-enzyme-system) | AI 科技 |
| <a id="ref-7"></a>7 | [Node 20 is no longer available in GitHub Actions](https://www.google.com/search?q=GitHub+Actions+Node+20+no+longer+available+node24) | Runner 一律以 Node 24 執行 JavaScript actions，退出選項已移除。 | 2026-09-23 | [GitHub Changelog](https://github.blog/changelog/2026-09-23-node-20-is-no-longer-available-in-github-actions) | 軟體工程 |
| <a id="ref-8"></a>8 | [Security improvements for SSH](https://www.google.com/search?q=GitHub+changelog+security+improvements+SSH+ML-KEM+RSA+3072) | 淘汰 SHA-1 RSA 簽章與舊式 DH，新 RSA 金鑰至少 3072 位元，新增 ML-KEM 交換。 | 2026-09-22 | [GitHub Changelog](https://github.blog/changelog/2026-09-22-security-improvements-for-ssh) | 軟體工程 |
| <a id="ref-9"></a>9 | [Local sandboxing in the GitHub Copilot app](https://www.google.com/search?q=GitHub+Copilot+app+local+sandboxing+public+preview) | 以專案為單位限制代理的檔案、網路與憑證存取，OS 無法強制執行時直接失敗。 | 2026-09-23 | [GitHub Changelog](https://github.blog/changelog/2026-09-23-local-sandboxing-in-the-github-copilot-app) | 軟體工程 |
| <a id="ref-10"></a>10 | [Node.js 26.10.0 (Current)](https://www.google.com/search?q=Node.js+26.10.0+release+parsePKCS12+util.debounce) | 新增 crypto.parsePKCS12()、util.debounce／throttle 與 SlidingWindowHistogram。 | 2026-09-22 | [Node.js](https://nodejs.org/en/blog/release/v26.10.0) | 軟體工程 |
| <a id="ref-11"></a>11 | [Visual Studio Code 1.139](https://www.google.com/search?q=Visual+Studio+Code+1.139+release+remote+dev+container+agent+sessions) | 代理可在 SSH、Tunnel 與 WSL 主機的 Dev Container 內執行。 | 2026-09-23 | [Visual Studio Code](https://code.visualstudio.com/updates/v1_139) | 軟體工程 |
| <a id="ref-12"></a>12 | [Docker Cloud Sandboxes 上線，AI 代理環境可在本機與雲端雙向搬移](https://www.google.com/search?q=Docker+Cloud+Sandboxes+sbx+move+iThome) | 代理沙箱可用 sbx move 在本機與雲端搬移，按秒計費、單次最長 24 小時。 | 2026-09-25 | [iThome](https://www.ithome.com.tw/news/179227) | 軟體工程 |
| <a id="ref-13"></a>13 | [Oracle Releases Java 27 and Strengthens Post-Quantum Cryptography Support](https://www.google.com/search?q=Oracle+Java+27+release+post-quantum+JEP+527) | 九項 JEP，TLS 1.3 後量子混合金鑰交換、精簡物件標頭與 G1 成為預設。 | 2026-09-15 | [Oracle](https://www.oracle.com/news/announcement/oracle-releases-java-27-and-strengthens-post-quantum-cryptography-support-2026-09-15/) | 軟體工程 |
| <a id="ref-14"></a>14 | [CISA Adds Four Known Exploited Vulnerabilities to Catalog](https://www.google.com/search?q=CISA+KEV+September+22+2026+Check+Point+Arista+F5+BIG-IP+APM) | Check Point、Arista VeloCloud、F5 BIG-IP APM 四個漏洞因遭利用列入 KEV。 | 2026-09-22 | [CISA](https://www.cisa.gov/news-events/alerts/2026/09/22/cisa-adds-four-known-exploited-vulnerabilities-catalog) | 軟硬體資訊安全 |
| <a id="ref-15"></a>15 | [資安署揭機關老舊防火牆遭駭事件，設備交接不全、未掌握 EOS 成內網破口](https://www.google.com/search?q=資安署+老舊防火牆+遭駭+EOS+設備交接+iThome) | 防火牆超過原廠支援期限仍在用，根因是交接只有書面移交、沒有資產盤點。 | 2026-09-22 | [iThome](https://www.ithome.com.tw/news/179118) | 軟硬體資訊安全 |
| <a id="ref-16"></a>16 | [Red Heron exploits Gitea n-day flaw in multinational campaign, exposing new Linux rootkit](https://www.google.com/search?q=Acronis+Red+Heron+Gitea+CVE-2026-60004+SIXZUT+rootkit) | 利用 Gitea 漏洞掃描 1,386 個實例，另備 477 個台灣系統清單並批次攻擊。 | 2026-09-13 | [Acronis](https://www.acronis.com/en/tru/posts/red-heron-exploits-gitea-n-day-flaw-in-multinational-campaign-exposing-new-linux-rootkit/) | 軟硬體資訊安全 |
| <a id="ref-17"></a>17 | [How Cloudflare addressed a cross-tenant data exposure vulnerability in Containers](https://www.google.com/search?q=Cloudflare+Containers+cross-tenant+data+exposure+skip_block_zeroing) | dm-thin 的 skip_block_zeroing 讓區塊殘留他人資料，全機隊移除設定並汰換磁碟。 | 2026-09-24 | [Cloudflare Blog](https://blog.cloudflare.com/containers-cross-tenant-vulnerability/) | 軟硬體資訊安全 |
| <a id="ref-18"></a>18 | [Compromised GitHub Actions Came Back Online and Resumed Executing Mini Shai-Hulud Malware](https://www.google.com/search?q=actions-cool+issues-helper+Mini+Shai-Hulud+GitHub+Actions+back+online) | 遭入侵的 action 儲存庫重新可見，版本標籤仍指向惡意內容，工作流程再次執行。 | 2026-09-25 | [The Hacker News](https://thehackernews.com/2026/09/compromised-github-actions-came-back.html) | 軟硬體資訊安全 |
| <a id="ref-19"></a>19 | [(Non-US) DIR-822A – Stack-Based Buffer Overflow Vulnerability Reported](https://www.google.com/search?q=D-Link+DIR-822A+SAP10516+CVE-2026-86296+CVE-2026-86510) | 兩個漏洞 CVSS 最高 10.0 且已有公開 PoC，回報狀態仍為調查中。 | 2026-09-18 | [D-Link Security Advisory](https://supportannouncement.us.dlink.com/security/publication.aspx?name=SAP10516) | 軟硬體資訊安全 |
| <a id="ref-20"></a>20 | [MediaTek Dimensity 9600 Pro Sets New Standard for Flagship Smartphone Chips](https://www.google.com/search?q=MediaTek+Dimensity+9600+Pro+2nm+LPDDR6+UFS+5.0) | 2 奈米製程，裝置端支援最高 30B 參數模型，首度支援 LPDDR6 與 UFS 5.0。 | 2026-09-15 | [MediaTek](https://www.mediatek.com/press-room/mediatek-dimensity-9600-pro-sets-new-standard-for-flagship-smartphone-chips) | 硬體或軟硬整合 |
| <a id="ref-21"></a>21 | [台積電赴美投資核准達 440 億美元　經部：預期持續送件審查](https://www.google.com/search?q=台積電+赴美投資+核准+440億美元+投審司+中央社) | 投審司 7 度核准累計 440 億美元股本，與宣布的 2,650 億美元總額仍有差距。 | 2026-09-25 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609250036.aspx) | 硬體或軟硬整合 |
| <a id="ref-22"></a>22 | [Introducing Ray-Ban Meta Audio and More AI Glasses Styles](https://www.google.com/search?q=Ray-Ban+Meta+Audio+glasses+Meta+Connect+2026+Muse) | 43 公克音訊眼鏡 349 美元起，續航 12 小時，年底前逾 100 種眼鏡選擇。 | 2026-09-23 | [Meta Newsroom](https://about.fb.com/news/2026/09/introducing-ray-ban-meta-audio-glasses-new-styles-plus-muse/) | 硬體或軟硬整合 |
| <a id="ref-23"></a>23 | [多元產能需求驅動　台灣半導體廠擴大新加坡布局](https://www.google.com/search?q=世界先進+恩智浦+VSMC+新加坡+開幕+聯電+擴產+中央社) | VSMC 22 個月建成、首批 40 奈米良率逾 99%，2027 年 Q1 量產且產能預售一空。 | 2026-09-25 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609250084.aspx) | 硬體或軟硬整合 |
| <a id="ref-24"></a>24 | [2025 全球售出 7000 台人形機器人　美銀估今年 9 萬台](https://www.google.com/search?q=IFR+人形機器人+7000台+2025+美銀+9萬台+中央社) | IFR 首次統計人形機器人，2025 年售出約 7,000 台，多數用於產生訓練資料。 | 2026-09-21 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609210133.aspx) | 硬體或軟硬整合 |
| <a id="ref-25"></a>25 | [We just shipped support for the ugliest part of HTTP: Vary](https://www.google.com/search?q=Cloudflare+Cache+Rules+Vary+header+support) | Cache Rules 可對每個 Vary 標頭選擇正規化、直通或略過快取。 | 2026-09-22 | [Cloudflare Blog](https://blog.cloudflare.com/vary-support/) | 網路/伺服器等基礎 |
| <a id="ref-26"></a>26 | [Python Workers are now generally available](https://www.google.com/search?q=Cloudflare+Python+Workers+generally+available+PEP+783) | Python 成為 Workers 第一級語言，提出 PEP 783 標準化 PyEmscripten 平臺。 | 2026-09-21 | [Cloudflare Blog](https://blog.cloudflare.com/python-workers-ga/) | 網路/伺服器等基礎 |
| <a id="ref-27"></a>27 | [Announcing Petal, a First-of-its-Kind Transoceanic Subsea Cable](https://www.google.com/search?q=Meta+Petal+subsea+cable+1+petabit+transatlantic) | 設計容量每秒 1 petabit、長約 7,000 公里的美法海纜，預計 2029 年啟用。 | 2026-09-21 | [Meta Newsroom](https://about.fb.com/news/2026/09/announcing-petal-meta-petabit-transoceanic-cable/) | 網路/伺服器等基礎 |
| <a id="ref-28"></a>28 | [HTTP QUERY Method: The Grey Zone Between GET And POST.](https://www.google.com/search?q=SANS+ISC+HTTP+QUERY+method+RFC+10008) | RFC 10008 定義的 QUERY 方法可繞過只綁定 POST 的 WAF 與 CSRF 規則。 | 2026-09-18 | [SANS Internet Storm Center](https://isc.sans.edu/diary/33352) | 網路/伺服器等基礎 |
| <a id="ref-29"></a>29 | [核安會核定核三再運轉計畫　台電後續須提交執行結果報告](https://www.google.com/search?q=核安會+核定+核三+再運轉計畫+589項+審查意見) | 3 回合審查、589 項意見後核定計畫，後續仍有多項安全管制程序。 | 2026-09-24 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609240313.aspx) | 網路/伺服器等基礎 |
| <a id="ref-30"></a>30 | [Anthropic 砸百億美元擴算力　Akamai 拿下雲端大單](https://www.google.com/search?q=Anthropic+Akamai+116億美元+雲端+認股權證+中央社) | 7 年 116 億美元算力合約，Akamai 2026 年資本支出增加約 17 億美元預購記憶體。 | 2026-09-25 | [中央社 CNA](https://www.cna.com.tw/news/ait/202609250065.aspx) | 網路/伺服器等基礎 |
| <a id="ref-31"></a>31 | [金管會開放銀行申請試辦存款代幣業務](https://www.google.com/search?q=金管會+開放+銀行+試辦+存款代幣) | 存款代幣法律性質仍屬存款，營業計畫書須說明帳本勾稽與技術架構。 | 2026-09-22 | [金融監督管理委員會](https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202609220001&dtable=News) | 金融科技 |
| <a id="ref-32"></a>32 | [【AI 轉型實例 1 下篇】玉山銀行打造全行 AI 代理入口，首度揭露新一代 GENIE 關鍵 Agentic 技術框架](https://www.google.com/search?q=玉山銀行+GENIE+3.0+Agentic+Root+Agent+MCP+iThome) | Root Agent 統一判讀意圖，經 REST API 或 MCP 呼叫行內服務，SOP 寫成技能檔。 | 2026-09-22 | [iThome](https://www.ithome.com.tw/news/179124) | 金融科技 |
| <a id="ref-33"></a>33 | [SEC Issues “Innovation Exemption” to Facilitate the Trading of Tokenized NMS Stock and Request for Comment](https://www.google.com/search?q=SEC+innovation+exemption+tokenized+NMS+stock+AMM+liquidity+pools) | 暫時豁免代幣化證券交易場所的交易所認定，可用 AMM 流動性池交易代幣化美股。 | 2026-09-17 | [SEC](https://www.sec.gov/newsroom/press-releases/2026-90-sec-issues-innovation-exemption-facilitate-trading-tokenized-nms-stock-request-comment) | 金融科技 |
| <a id="ref-34"></a>34 | [金管會督導證交所及櫃買中心建置「臺股儀表板」上線 揭示三大面向資訊](https://www.google.com/search?q=金管會+臺股儀表板+證交所+櫃買中心+授信+違約+營收) | 整合授信、違約與營收三大面向指標，預設顯示最近 5 個交易日走勢。 | 2026-09-22 | [金融監督管理委員會](https://www.fsc.gov.tw/ch/home.jsp?id=96&parentpath=0,2&mcustomize=news_view.jsp&dataserno=202609220002&dtable=News) | 金融科技 |
| <a id="ref-35"></a>35 | [奇美推 AI 助急診醫師　30 秒生成病歷摘要還可追問](https://www.google.com/search?q=奇美醫院+急診+AI+病歷摘要+30秒+地端+中央社) | 地端醫療 LLM 與邊緣運算，掛號後 30 秒生成一頁式病歷摘要。 | 2026-09-21 | [中央社 CNA](https://www.cna.com.tw/news/ahel/202609210087.aspx) | 醫療科技 |
| <a id="ref-36"></a>36 | [「健康幣」10/1 上線 卓揆盼養成國人健康習慣新模式 促進國人健康、落實「健康台灣」願景](https://www.google.com/search?q=健康幣+10月1日+上線+健保快易通+衛福部+卓榮泰) | 健保快易通 APP 累積健康幣，滿 1,000 幣可兌換商品與服務。 | 2026-09-17 | [衛生福利部](https://www.mohw.gov.tw/cp-16-88024-1.html) | 醫療科技 |
| <a id="ref-37"></a>37 | [Estimating suicide risk from text](https://www.google.com/search?q=MIT+estimating+suicide+risk+from+text+lexicon+Crisis+Text+Line) | LLM 產生詞庫、人工審核後，以輕量可解釋模型從危機簡訊估風險。 | 2026-09-24 | [MIT News](https://news.mit.edu/2026/estimating-suicide-risk-from-text-0924) | 醫療科技 |
| <a id="ref-38"></a>38 | [Medical Devices; Exemption From Premarket Notification: Radiology Computer-Aided Detection and/or Diagnosis Devices and Computer-Aided Triage and Notification Devices](https://www.google.com/search?q=FDA+federal+register+radiology+CAD+CADt+510k+exemption+petition+denied) | FDA 正式刊登駁回放射科 CAD 與 CADt 軟體免 510(k) 請願的最終命令。 | 2026-09-17 | [Federal Register](https://www.federalregister.gov/documents/2026/09/17/2026-19074/medical-devices-exemption-from-premarket-notification-radiology-computer-aided-detection-andor-diagnosis-devices-and-computer-aided-triage-and-notification-devices) | 醫療科技 |
| <a id="ref-39"></a>39 | [Batteries that safely break down in the GI tract could improve ingestible devices](https://www.google.com/search?q=MIT+bioresorbable+battery+ingestible+magnesium+molybdenum+trioxide) | 鎂與三氧化鉬電極的可吸收電池輸出 1.84 伏特，可驅動胃內 RFID 與電刺激膠囊。 | 2026-09-21 | [MIT News](https://news.mit.edu/2026/batteries-safely-break-down-in-gi-tract-could-improve-ingestible-devices-0921) | 醫療科技 |
| <a id="ref-40"></a>40 | [臺鐵智慧鐵道成果亮相柏林國際軌道交通技術展 AI 洗車、平交道智慧偵測展現國產研發實力](https://www.google.com/search?q=臺鐵+InnoTrans+2026+AI洗車+平交道+障礙物+偵測) | 熱影像與毫米波雷達雙重偵測平交道障礙物，AI 影像辨識車型切換洗車模式。 | 2026-09-23 | [臺灣鐵路公司](https://www.railway.gov.tw/tra-tip-web/tip/tip009/tip911/newsDtl?newsNo=8ae4cac3a0ca8f5401a0cdffd69507c1&page=0) | 運輸物流 |
| <a id="ref-41"></a>41 | [柏林軌道展台灣產業拚國際　陳世凱：AI、資通訊是競爭優勢](https://www.google.com/search?q=柏林軌道展+台灣館+陳世凱+AI+資通訊+數位孿生+中央社) | 台灣首設國家館，交通部長點名 AI、資通訊與數位孿生為出口優勢。 | 2026-09-24 | [中央社 CNA](https://www.cna.com.tw/news/ahel/202609240330.aspx) | 運輸物流 |
| <a id="ref-42"></a>42 | [ARTC 智慧座艙監控技術 導入國內首輛 Level 3 自駕電動巴士](https://www.google.com/search?q=ARTC+智慧座艙+視線追蹤+Level+3+自駕+電動巴士+自由財經) | 抗遮蔽視線追蹤只需約 10 TOPS 邊緣算力，對應 UN R171 與 R157。 | 2026-09-17 | [自由財經](https://ec.ltn.com.tw/article/breakingnews/5577137) | 運輸物流 |
| <a id="ref-43"></a>43 | [From the road — September 24, 2026](https://www.google.com/search?q=Waymo+safety+data+270+million+miles+September+2026) | 2.7 億英里數據：受傷事故減少 82%，嚴重受傷以上減少 95%。 | 2026-09-24 | [Waymo](https://waymo.com/blog/shorts/safetydata-september26/) | 運輸物流 |
| <a id="ref-44"></a>44 | [Vegas, Deal Us In! We’re welcoming riders today](https://www.google.com/search?q=Waymo+Las+Vegas+welcoming+riders+Ojai+sixth+generation) | 拉斯維加斯開放公眾乘車，服務區約 24 英里，以 Ojai 車款為主力。 | 2026-09-14 | [Waymo](https://waymo.com/blog/2026/09/ride-in-las-vegas/) | 運輸物流 |
| <a id="ref-45"></a>45 | [智慧節能創新技術跨域交流 為近零碳建築注入轉型動能](https://www.google.com/search?q=建研所+智慧節能創新技術+跨域交流+智慧工地+立面彩繪光電) | 建研所把智慧工地與立面光電納入近零碳建築旗艦行動計畫。 | 2026-09-16 | [內政部建築研究所](https://www.abri.gov.tw/News_Content.aspx?n=752&s=340910) | 房地產與室內外裝潢 |
| <a id="ref-46"></a>46 | [AI 供應鏈擴廠熱 前三季商用市場交易衝 2,500 億新高 全年挑戰 3,000 億](https://www.google.com/search?q=第一太平戴維斯+前三季+商用不動產+2577億+廠房+AI+聯合新聞網) | 前三季大型商用不動產交易 2,577 億元創新高，廠房占單季近七成。 | 2026-09-24 | [聯合新聞網](https://udn.com/news/story/7240/9775639) | 房地產與室內外裝潢 |
| <a id="ref-47"></a>47 | [The promise and peril of using visual AI to study cities](https://www.google.com/search?q=MIT+Senseable+City+Lab+How+AI+Sees+the+City+visual+AI) | 331 支交通攝影機估算紐約排放，新書同時列出監控與偏見風險。 | 2026-09-24 | [MIT News](https://news.mit.edu/2026/studying-cities-using-visual-ai-fabio-duarte-martina-mazzarello-carlo-ratti-fan-zhang-book-0924) | 房地產與室內外裝潢 |
| <a id="ref-48"></a>48 | [「創新辦桌」上菜 一窺新勝景光雕布袋戲創新歷程](https://www.google.com/search?q=新勝景掌中劇團+光雕投影+布袋戲+創新辦桌+中央社) | 動畫導演把光雕投影帶回布袋戲台，作品已巡演北美與大阪。 | 2026-09-23 | [中央社 CNA](https://www.cna.com.tw/news/acul/202609230269.aspx) | 現場表演藝術 |
| <a id="ref-49"></a>49 | [衛武營 8 週年慶 Open House　邀全民免費入席](https://www.google.com/search?q=衛武營+8週年+Open+House+探戈+擁抱之間+AI+中央社) | 戲劇院「探戈：擁抱之間」結合 AI 科技與探戈舞步，另有互動裝置展。 | 2026-09-18 | [中央社 CNA](https://www.cna.com.tw/news/acul/202609180037.aspx) | 現場表演藝術 |
| <a id="ref-50"></a>50 | [經濟部科技專案讓 AI 聽懂音樂…資策會打造智慧協奏技術 實現一人成團](https://www.google.com/search?q=資策會+AI+音樂理解+智慧協奏+一人成團+ICT+TechDay) | AI 虛擬樂手可跟上真人臨場變速，四項技術涵蓋聲源分離到動態跟拍。 | 2026-09-22 | [聯合新聞網](https://udn.com/news/story/7240/9771299) | 影視音樂 |
| <a id="ref-51"></a>51 | [New tools to power your creation journey from start to finish](https://www.google.com/search?q=YouTube+Made+On+YouTube+2026+likeness+detection+voice+mobile+app) | 肖像偵測進入行動 App，今年稍晚整合說話聲音偵測與臉部偵測。 | 2026-09-23 | [YouTube Official Blog](https://blog.youtube/news-and-events/made-on-youtube-new-tools-power-creation-journey/) | 影視音樂 |
| <a id="ref-52"></a>52 | [Netflix turns Willy Wonka’s chocolate factory into a real-life ‘social experiment’](https://www.google.com/search?q=Netflix+Wonka+Golden+Ticket+AI+Gene+Wilder+voice+ElevenLabs+NBC) | 以 ElevenLabs 生成 Gene Wilder 聲音旁白，取得遺產管理方同意仍引發反彈。 | 2026-09-23 | [NBC News](https://www.nbcnews.com/pop-culture/pop-culture-news/netflix-willy-wonka-golden-ticket-reality-show-ai-gene-wilder-rcna598920) | 影視音樂 |
| <a id="ref-53"></a>53 | [FLEX and Sentinel-3C launched](https://www.google.com/search?q=ESA+FLEX+Sentinel-3C+launched+Vega-C+VV30) | Vega-C 一箭雙星，FLEX 為首顆專測植物光合作用螢光的衛星。 | 2026-09-15 | [ESA](https://www.esa.int/Applications/Observing_the_Earth/FLEX_and_Sentinel-3C_launched) | 其他領域科技應用突破 |
| <a id="ref-54"></a>54 | [NASA Selects Far-Infrared Telescope as First in New Mission Class](https://www.google.com/search?q=NASA+PRIMA+far-infrared+telescope+Probe+Explorers+first+mission) | PRIMA 成為 Probe Explorers 首案，成本上限 12 億美元、2033 年發射。 | 2026-09-23 | [NASA](https://www.nasa.gov/news-release/nasa-selects-far-infrared-telescope-as-first-in-new-mission-class/) | 其他領域科技應用突破 |
| <a id="ref-55"></a>55 | [Behind Project Suncatcher, our moonshot to put AI in space](https://www.google.com/search?q=Google+Behind+Project+Suncatcher+moonshot+AI+in+space+TPU) | 首次在軌測試驗證 TPU 對發射應力、輻射與真空散熱的耐受性。 | 2026-09-24 | [Google The Keyword](https://blog.google/innovation-and-ai/models-and-research/google-research/google-project-suncatcher-facts/) | 其他領域科技應用突破 |
| <a id="ref-56"></a>56 | [國科會：未來科技館閉幕　加速科研成果走向市場應用](https://www.google.com/search?q=國科會+未來科技館+閉幕+84件+未來科技獎+150場+技術洽談) | 84 件未來科技獎成果、逾 5 萬人次進場、150 場技術洽談。 | 2026-09-19 | [中央社 CNA](https://www.cna.com.tw/news/afe/202609190216.aspx) | 其他領域科技應用突破 |

<a id="notes"></a>
## 報告說明

本期報告的時間範圍為 2026-09-11 至 2026-09-26（今天起往前 15 天，含首尾）。來源優先序為官方公告與一手技術部落格 > 權威科技媒體 > 台灣主流媒體 > 二手轉載；中國來源與社群平台內容優先以高權重來源替換，無可替換者刪除。本期共蒐集候選來源 132 筆，採用 56 筆為正式參考資料、淘汰 76 筆，筆數以 `source.md` 的條目數為準。正式來源逐筆以原頁核對標題、發布日期、來源網站名稱與內文主張；原頁無法取得或來源內部矛盾者直接淘汰，不挑一邊採信。

本期窗期與上一期（2026-09-19，窗期 2026-09-04 至 2026-09-19）重疊九天，與 2026-09-13 期重疊三天，因此篩選前先比對兩期的 `references.md` 建立已引用名單。同一事件即使換一家媒體報導也淘汰，例如 Gemini 3.8 Live Avatar 屬前期已引用的 Gemini 3.8 Live 系列、Duke 心衰竭 AI 聯盟已於前期引用；同一來源站的不同事件仍可採用，例如 GitHub、Cloudflare、CISA、MIT News、Waymo 與中央社本期採用的皆為前兩期未引用的另一批公告。

<a id="limitations"></a>
### 資料限制與判讀提醒

- **現場表演藝術與影視音樂的來源權重偏低。** 表演藝術經 9 輪補搜，窗內只找到文總新聞稿的媒體版本 [[48. 中央社]](#ref-48) 與對 AI 只有一句描述的衛武營週年活動報導 [[49. 中央社]](#ref-49)；影視音樂經 9 輪補搜，Suno v6 與 UMG 和 ElevenLabs 的合作公告都落在 9 月 10 日、窗外一天。這兩個分類的趨勢觀察外推性有限。
- **供應商自評數字未經第三方驗證。** Opus 5.5 的效能與安全成績 [[1. Anthropic]](#ref-1)、GPT-6 Sol 與 Luna 的基準比較 [[2. iThome]](#ref-2)、PageBreak 的誤判率 [[4. Google]](#ref-4)、天璣 9600 Pro 的效能百分比 [[20. MediaTek]](#ref-20)、Meta 眼鏡與 Petal 海纜的「首款」與「首條」[[22. Meta]](#ref-22) [[27. Meta]](#ref-27)、Cloudflare 的功能公告與事故時間軸 [[17. Cloudflare]](#ref-17) [[25. Cloudflare]](#ref-25) [[26. Cloudflare]](#ref-26)、Waymo 的安全數據 [[43. Waymo]](#ref-43) [[44. Waymo]](#ref-44)，皆屬公司自行揭露，本報告照原文引用並標明出處。
- **非一手來源的使用。** GPT-6 Sol 與 Luna 以 iThome 為來源，因 openai.com 對抓取回 403、無法在原頁確認發布日 [[2. iThome]](#ref-2)；Docker Cloud Sandboxes 為 iThome 轉述 [[12. iThome]](#ref-12)；Akamai 合約與 IFR 統計為中央社編譯外電 [[30. 中央社]](#ref-30) [[24. 中央社]](#ref-24)；商用不動產數據為顧問公司報告的媒體轉述 [[46. 聯合新聞網]](#ref-46)；Netflix 案例為娛樂媒體報導 [[52. NBC News]](#ref-52)。
- **研究階段與計畫階段。** Claude 發現的酵素系統功能尚未確認 [[6. Anthropic]](#ref-6)；MIT 自殺風險模型尚未臨床部署 [[37. MIT News]](#ref-37)；可吸收電池仍在動物實驗，臨床試驗約兩年後 [[39. MIT News]](#ref-39)；Suncatcher 的首次在軌測試尚未發射 [[55. Google]](#ref-55)；PRIMA 進入初步設計階段、2033 年發射 [[54. NASA]](#ref-54)；核三再運轉只完成計畫核定 [[29. 中央社]](#ref-29)。
- **未來事件與已發生事件的區別。** GitHub RSA 金鑰長度要求 10 月 14 日生效、SSH brownout 在 11 月 4 日與 12 月 9 日 [[8. GitHub]](#ref-8)、GENIE 3.0 預計 9 月底上線 [[32. iThome]](#ref-32)、健康幣 10 月 1 日上線 [[36. 衛福部]](#ref-36)、VSMC 9 月 28 日開幕 [[23. 中央社]](#ref-23)、Ray-Ban Meta Audio 10 月 13 日出貨 [[22. Meta]](#ref-22)、Petal 海纜 2029 年啟用 [[27. Meta]](#ref-27)，皆晚於本報告日期；本報告引用的是窗內的公告或報導，並非已完成的事實。
- **原頁未提供的數據一律不補。** Suncatcher 的發射日期、衛星名稱與 TPU 數量只見於二手報導 [[55. Google]](#ref-55)；CISA 公告未載四個漏洞的 CVSS 分數 [[14. CISA]](#ref-14)；Anthropic 酵素研究動用的代理數量與時數只見於中文媒體 [[6. Anthropic]](#ref-6)；VS Code 1.139 的工作階段載入秒數只見於 iThome 報導 [[11. VS Code]](#ref-11)。以上皆不以搜尋摘要或其他報導的數字替代。
- **日期判定的特例。** 金管會兩則新聞稿頁尾的「更新日期」為網站更新時間，發布日以正文「今日（22 日）」與列表編號為準 [[31. 金管會]](#ref-31) [[34. 金管會]](#ref-34)；SEC 新聞稿無日期 meta，取頁面日期列 [[33. SEC]](#ref-33)；臺鐵內文頁無日期，以官網列表頁日期為準 [[40. 臺鐵]](#ref-40)；Waymo 安全數據頁無日期 meta，以標題所載日期為準 [[43. Waymo]](#ref-43)；D-Link 公告 9 月 18 日發布、9 月 21 日更新，採發布日 [[19. D-Link]](#ref-19)。

<a id="disclaimer"></a>
## 免責聲明

本報告由 AI 工具彙整公開資訊而成，內容僅供參考，不構成投資、法律、醫療或任何專業建議。所有數據與敘述均以參考資料所列來源為準，讀者應自行回溯原始來源確認。報告中涉及的產品規格、價格、時程與政策內容可能隨時變動，實際情形請以各官方公告為準。
