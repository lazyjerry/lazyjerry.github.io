# CLI AI 工具對照表：Claude Code vs Gemini CLI vs Cursor CLI vs Codex CLI

## 總結

本對照表詳細比較了四個主要的 **CLI AI 編程工具**：**Claude Code**、**Gemini CLI**、**Cursor CLI** 和 **Codex CLI**。這些工具都旨在將 AI 助手直接整合到開發者的終端機環境中，但在開源狀態、定價模式、功能特性和適用場景方面存在顯著差異。**Gemini CLI** 和 **Codex CLI** 採用開源策略，而 **Claude Code** 和 **Cursor CLI** 則為專有軟體。在定價方面，**Gemini CLI** 提供最慷慨的免費額度，**Claude Code** 採用訂閱制，**Cursor CLI** 提供多層級定價，**Codex CLI** 則與 ChatGPT 計劃整合。每個工具都有其獨特的技術優勢和目標用戶群體。

## 主要功能對照表

| 功能維度 | Claude Code | Gemini CLI | Cursor CLI | Codex CLI |
|---------|-------------|------------|------------|-----------|
| **開發商** | Anthropic [[1]](#ref-1) | Google [[2]](#ref-2) | Cursor (Anysphere) [[3]](#ref-3) | OpenAI [[4]](#ref-4) |
| **開源狀態** | 專有軟體 [[1]](#ref-1) | 開源 (Apache-2.0) [[2]](#ref-2) | 專有軟體 [[3]](#ref-3) | 開源 (Apache-2.0) [[4]](#ref-4) |
| **安裝方式** | npm install -g @anthropic-ai/claude-code [[1]](#ref-1) | 多種認證選項 [[2]](#ref-2) | curl https://cursor.com/install -fsS \| bash [[3]](#ref-3) | npm i -g @openai/codex 或 brew install codex [[4]](#ref-4) |
| **前置需求** | Node.js 18+ [[1]](#ref-1) | 無特殊需求 [[2]](#ref-2) | 無特殊需求 [[3]](#ref-3) | Node.js 18+ [[4]](#ref-4) |

## 技術規格對照表

| 技術維度 | Claude Code | Gemini CLI | Cursor CLI | Codex CLI |
|---------|-------------|------------|------------|-----------|
| **上下文長度** | 依 Claude 模型而定 [[1]](#ref-1) | 1M tokens (Gemini 2.5 Pro) [[2]](#ref-2) | 1M tokens (Max Mode) [[3]](#ref-3) | 依選用模型而定 [[4]](#ref-4) |
| **支援模型** | Claude 系列模型 [[1]](#ref-1) | Gemini 2.5 Pro [[2]](#ref-2) | GPT-5, Claude, Gemini 等 [[3]](#ref-3) | GPT-5 等 OpenAI 模型 [[4]](#ref-4) |
| **MCP 支援** | 是 [[1]](#ref-1) | 是 [[2]](#ref-2) | 是 [[3]](#ref-3) | 是 [[4]](#ref-4) |
| **沙盒環境** | 企業級安全 [[1]](#ref-1) | 內建工具保護 [[2]](#ref-2) | 自訂規則控制 [[3]](#ref-3) | 強大沙盒保護 [[4]](#ref-4) |

## 定價與成本對照表

| 定價維度 | Claude Code | Gemini CLI | Cursor CLI | Codex CLI |
|---------|-------------|------------|------------|-----------|
| **免費方案** | 無 [[5]](#ref-5) | 60 請求/分鐘，1,000 請求/天 [[2]](#ref-2) | 無 [[6]](#ref-6) | ChatGPT 計劃內包含 [[4]](#ref-4) |
| **付費方式** | 訂閱制 [[5]](#ref-5) | 免費 + 付費選項 [[2]](#ref-2) | 訂閱制 [[6]](#ref-6) | ChatGPT 計劃或 API 計費 [[4]](#ref-4) |
| **基本方案** | Pro: $17-20/月 [[5]](#ref-5) | 免費使用 [[2]](#ref-2) | Pro: $20/月 [[6]](#ref-6) | ChatGPT Plus: $20/月 [[4]](#ref-4) |
| **進階方案** | Max: $100+/月 [[5]](#ref-5) | Gemini Code Assist 授權 [[2]](#ref-2) | Ultra: $400/月 [[6]](#ref-6) | ChatGPT Pro/Team [[4]](#ref-4) |
| **企業方案** | 自訂定價 [[5]](#ref-5) | 企業版可用 [[2]](#ref-2) | Enterprise: 自訂 [[6]](#ref-6) | Enterprise 即將推出 [[4]](#ref-4) |

## 功能特性對照表

| 功能特性 | Claude Code | Gemini CLI | Cursor CLI | Codex CLI |
|---------|-------------|------------|------------|-----------|
| **自動化任務** | 修復 lint、解決合併衝突、撰寫發布說明 [[1]](#ref-1) | 修復錯誤、創建功能、改善測試覆蓋 [[2]](#ref-2) | 自動更新文檔、安全審查、自訂代理 [[3]](#ref-3) | 版本控制感知、工作區管理 [[4]](#ref-4) |
| **整合能力** | GitHub, GitLab, 命令列工具 [[1]](#ref-1) | Cloud Shell, VS Code [[2]](#ref-2) | IDE 整合、現有工作流程 [[3]](#ref-3) | 跨平台支援 [[4]](#ref-4) |
| **外部連接** | Google Drive, Figma, Slack [[1]](#ref-1) | 網路搜尋、網路抓取 [[2]](#ref-2) | 多種外部服務 [[3]](#ref-3) | 有限的外部訪問 [[4]](#ref-4) |
| **自主程度** | 高度自主 [[1]](#ref-1) | ReAct 循環 [[2]](#ref-2) | 即時引導控制 [[3]](#ref-3) | 可配置的自主級別 [[4]](#ref-4) |

## 適合場景對照表

| 使用場景 | Claude Code | Gemini CLI | Cursor CLI | Codex CLI |
|---------|-------------|------------|------------|-----------|
| **個人開發者** | 適合，但需付費 [[5]](#ref-5) | 非常適合，免費額度充足 [[2]](#ref-2) | 適合，多種定價選項 [[6]](#ref-6) | 適合，與 ChatGPT 整合 [[4]](#ref-4) |
| **小型團隊** | 適合 [[5]](#ref-5) | 適合 [[2]](#ref-2) | 適合，Teams 方案 [[6]](#ref-6) | 適合 [[4]](#ref-4) |
| **企業用戶** | 非常適合，企業級功能 [[1]](#ref-1) | 適合，企業版可用 [[2]](#ref-2) | 適合，Enterprise 方案 [[6]](#ref-6) | 適合，安全性強 [[4]](#ref-4) |
| **開源專案** | 不適合，非開源 [[1]](#ref-1) | 非常適合，開源且免費 [[2]](#ref-2) | 不適合，非開源 [[3]](#ref-3) | 適合，開源 [[4]](#ref-4) |
| **學習用途** | 適合，但有成本 [[5]](#ref-5) | 非常適合，免費使用 [[2]](#ref-2) | 適合，但有成本 [[6]](#ref-6) | 適合，ChatGPT 學生優惠 [[4]](#ref-4) |




## 亮點分析

### AI 科技領域

**開源策略成為競爭優勢**：**Gemini CLI** 和 **Codex CLI** 採用開源策略，大幅降低了開發者的使用門檻 [[2]](#ref-2)[[4]](#ref-4)。特別是 **Gemini CLI** 提供每天 1,000 次免費請求的慷慨額度，相比其他工具的付費模式，這種策略有效吸引了大量個人開發者和開源專案採用。開源模式不僅促進了社群貢獻，也讓開發者能夠根據自身需求客製化工具功能。

**上下文長度成為技術競爭焦點**：所有工具都支援 **1M token** 等級的長上下文處理能力 [[2]](#ref-2)[[3]](#ref-3)，這使得 AI 助手能夠理解和處理大型代碼庫。這項技術突破讓 CLI 工具從簡單的代碼生成器進化為能夠進行全專案分析和重構的智能助手，大幅提升了開發效率。

### 軟體工程領域

**MCP 協議成為標準配置**：四個工具都支援 **Model Context Protocol (MCP)** [[1]](#ref-1)[[2]](#ref-2)[[3]](#ref-3)[[4]](#ref-4)，這個協議讓 AI 工具能夠與外部系統無縫整合。例如，**Claude Code** 可以直接讀取 Google Drive 中的設計文檔，**Gemini CLI** 能夠執行網路搜尋，這種整合能力讓 AI 助手從孤立的工具變成了開發生態系統的中樞。

**沙盒安全成為必備功能**：每個工具都實作了不同程度的沙盒保護機制 [[1]](#ref-1)[[4]](#ref-4)。**Codex CLI** 的沙盒設計最為細緻，提供讀寫模式、唯讀模式等多種安全級別，確保 AI 代理在自主執行任務時不會對系統造成意外損害。這種安全設計讓企業用戶能夠放心地將 AI 工具整合到生產環境中。

### 商業模式與定價

**差異化定價策略明顯**：各工具採用截然不同的商業模式。**Gemini CLI** 的免費策略 [[2]](#ref-2) 與 **Cursor CLI** 的高端定價（最高 $400/月）[[6]](#ref-6) 形成鮮明對比。**Claude Code** 的訂閱制 [[5]](#ref-5) 和 **Codex CLI** 與 ChatGPT 的整合策略 [[4]](#ref-4) 各有優勢，反映了不同公司對市場定位和用戶群體的不同理解。

**使用量計費模式興起**：**Cursor CLI** 創新性地採用基礎訂閱費加 API 使用量的混合計費模式 [[6]](#ref-6)，這種模式讓輕度用戶能夠以較低成本使用服務，同時讓重度用戶為額外使用量付費。這種彈性定價模式可能成為未來 AI 工具定價的趨勢。

### 用戶體驗與整合

**終端機原生體驗成為核心**：所有工具都強調在終端機中的原生體驗，而非另開聊天視窗 [[1]](#ref-1)[[3]](#ref-3)。這種設計哲學讓開發者能夠在熟悉的工作環境中無縫使用 AI 助手，大幅降低了工作流程的切換成本。**Cursor CLI** 更進一步提供即時引導功能，讓開發者能夠在 AI 工作過程中進行即時調整。

## 趨勢分析

### AI 工具商品化趨勢

**CLI AI 工具正朝向商品化發展**，各家廠商都在基礎功能上趨於一致，如 MCP 支援、長上下文處理、沙盒安全等。未來的競爭將更多體現在使用者體驗的細節優化、特定領域的深度整合，以及生態系統的建構上。預期會看到更多針對特定程式語言、框架或開發流程的專業化 CLI 工具出現。

### 開源與專有軟體的分化

**開源策略與專有軟體策略將進一步分化**。開源工具如 **Gemini CLI** 和 **Codex CLI** 將吸引更多社群貢獻，發展出豐富的外掛生態系統；而專有工具如 **Claude Code** 和 **Cursor CLI** 則會專注於提供更精緻的用戶體驗和企業級功能。這種分化將讓不同需求的用戶都能找到適合的解決方案。

### 整合深度持續加深

**AI CLI 工具與開發環境的整合將更加深入**。未來可能看到這些工具直接整合到 IDE、CI/CD 流程、專案管理系統中，形成完整的 AI 驅動開發生態系統。**MCP 協議**的普及將加速這種整合，讓 AI 助手能夠訪問更多外部資源和服務。

### 安全性要求提升

隨著 AI 工具在企業環境中的廣泛採用，**安全性和合規性要求將持續提升**。預期會看到更細緻的權限控制、更強的資料隔離、以及更完善的稽核功能。**零資料保留 (ZDR)** 等隱私保護功能將成為企業級工具的標準配置。

### 定價模式創新

**混合定價模式將成為主流**，結合基礎訂閱費和使用量計費，讓不同使用強度的用戶都能找到合適的方案。同時，針對學生、開源專案、非營利組織的特殊定價方案也將更加普及，促進 AI 工具的廣泛採用。

<a id="ref-1"></a>
<a id="ref-2"></a>
<a id="ref-3"></a>
<a id="ref-4"></a>
<a id="ref-5"></a>
<a id="ref-6"></a>

## 參考資料

| 編號 | 文章標題 | 結論/亮點 | 發布日期 | 來源 |
|------|----------|-----------|----------|------|
| 1 | [Claude Code overview](https://www.google.com/search?q=Claude+Code+overview) | Anthropic 推出的終端機 AI 編程助手，支援企業級安全和 MCP 整合 | *未知時間 | [Anthropic API 文檔](https://docs.anthropic.com/en/docs/claude-code/overview) |
| 2 | [Gemini CLI: your open-source AI agent](https://www.google.com/search?q=Gemini+CLI+your+open-source+AI+agent) | Google 推出開源 AI 代理，提供慷慨免費額度和 1M token 上下文 | 2025-06-25 | [Google Blog](https://blog.google/technology/developers/introducing-gemini-cli-open-source-ai-agent/) |
| 3 | [Cursor CLI](https://www.google.com/search?q=Cursor+CLI) | Cursor 推出 Beta 版 CLI 工具，支援即時引導和多模型整合 | *未知時間 | [Cursor 官網](https://cursor.com/cli) |
| 4 | [OpenAI Codex CLI](https://www.google.com/search?q=OpenAI+Codex+CLI) | OpenAI 開源編程代理，提供強大沙盒保護和 ChatGPT 整合 | *未知時間 | [GitHub - openai/codex](https://github.com/openai/codex) |
| 5 | [Anthropic Pricing](https://www.google.com/search?q=Anthropic+Pricing) | Claude 訂閱制定價，Pro 方案 $17-20/月，Max 方案 $100+/月 | *未知時間 | [Anthropic 定價頁面](https://www.anthropic.com/pricing) |
| 6 | [Cursor Models & Pricing](https://www.google.com/search?q=Cursor+Models+Pricing) | Cursor 多層級定價，從 $20/月到 $400/月，採用混合計費模式 | *未知時間 | [Cursor 文檔](https://docs.cursor.com/en/account/pricing) |

