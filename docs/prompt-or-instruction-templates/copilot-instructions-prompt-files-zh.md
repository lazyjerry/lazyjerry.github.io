# 掌握 GitHub Copilot 在 Visual Studio Code 中的自訂設定：指令檔案與提示檔案

使用 Visual Studio Code 強大的自訂功能 - 指令檔案和提示檔案，讓您的 GitHub Copilot 體驗更上一層樓。這些工具讓您能夠建立一致且專案特定的 AI 回應，了解您的編碼標準、偏好和常見工作流程。

> **參考資料**: 本指南基於官方的 [Visual Studio Code Copilot 自訂設定文件](https://code.visualstudio.com/docs/copilot/copilot-customization)。如需最新的技術細節和 API 變更，請參考官方文件。

## 了解自訂設定生態系統

Visual Studio Code 提供三種主要方式來自訂 Copilot 回應：

1. **`.github/copilot-instructions.md`** - 全域專案指令
2. **`.instructions.md` 檔案** - 細緻化、情境特定的指令
3. **`.prompt.md` 檔案** - 常見任務的可重複使用提示範本

## 設定指令檔案

### 全域專案指令

在專案根目錄建立 `.github/copilot-instructions.md` 檔案，用於專案範圍的指導原則：

```markdown
---
# 範例: .github/copilot-instructions.md
---

# 專案編碼標準

## 一般指導原則

- 所有新的 JavaScript 程式碼都使用 TypeScript
- 盡可能遵循函數式程式設計模式
- 優先使用組合而非繼承
- 為所有公共 API 撰寫完整的 JSDoc 註解

## 測試需求

- 為所有業務邏輯加入單元測試
- 使用 Jest 作為測試框架
- 目標程式碼覆蓋率 80% 以上
- 為 API 端點撰寫整合測試

## 錯誤處理

- 在 React 元件中始終使用適當的錯誤邊界
- 使用結構化日誌記錄錯誤
- 向使用者返回有意義的錯誤訊息
- 使用適當的 try-catch 區塊處理非同步操作
```

**啟用全域指令:**

1. 開啟 Visual Studio Code 設定 (Ctrl+Shift+P → "Preferences: Open Settings")
2. 搜尋 `github.copilot.chat.codeGeneration.useInstructionFiles`
3. 設定為 `true`

### 細緻化指令檔案

為特定情況建立針對性的 `.instructions.md` 檔案：

#### 了解指令檔案命名和前置設定

指令檔案必須遵循命名慣例：`[名稱].instructions.md`

**檔案命名範例:**

- `react.instructions.md` - React 元件指導原則
- `database.instructions.md` - 資料庫開發模式
- `testing.instructions.md` - 測試最佳實務
- `api-endpoints.instructions.md` - API 開發標準
- `typescript.instructions.md` - TypeScript 編碼慣例
- `security.instructions.md` - 安全性檢查指導原則

**檔案位置選項:**

- **工作區**: `.github/instructions/` 資料夾 (預設)
- **使用者設定檔**: `%APPDATA%\Code\User\instructions\` (Windows)
- **自訂位置**: 透過 `chat.instructionsFilesLocations` 設定

`.instructions.md` 檔案頂部的前置設定區段使用 YAML 語法，支援幾個關鍵屬性：

```yaml
---
applyTo: "glob-pattern" # 必需: 指定要套用指令的檔案
description: "簡要描述" # 選用: 描述指令的功能
---
```

**關鍵前置設定屬性:**

- **`applyTo`**: 控制何時自動套用指令

  - `"**"` - 套用到工作區中的所有檔案
  - `"**/*.ts"` - 僅套用到 TypeScript 檔案
  - `"**/*.{tsx,jsx}"` - 套用到 React 元件檔案
  - `"**/tests/**/*.ts"` - 僅套用到測試檔案
  - `"src/components/**/*"` - 套用到特定目錄中的檔案

- **`description`**: 在聊天視圖中懸停指令檔案時顯示的簡要說明

**完整檔案範例與建議名稱:**

**檔案: `react.instructions.md`**

```yaml
---
applyTo: "**/*.{tsx,jsx}"
description: "React 元件開發指導原則"
---
# React 元件指令

## 元件結構
- 使用帶有 hooks 的函數式元件
- 使用 TypeScript 介面實作適當的 prop 驗證
- 為可重複使用的邏輯抽取自訂 hooks
- 在需要時使用 React.memo 進行效能最佳化

## 狀態管理
- 使用 useState 管理本地元件狀態
- 使用 useReducer 處理複雜狀態邏輯
- 為共享狀態邏輯實作自訂 hooks
- 避免 prop 鑽取 - 在適當時使用 Context API

## 樣式設計
- 使用 CSS Modules 或 styled-components
- 遵循 BEM 方法論進行類別命名
- 實作行動優先的響應式設計
- 使用 CSS 自訂屬性進行主題設計
```

**檔案: `database.instructions.md`**

```yaml
---
applyTo: "**/models/**/*.ts"
description: "資料庫模型和查詢指導原則"
---
# 資料庫開發指導原則

## Entity Framework 模式
- 使用儲存庫模式進行資料存取
- 實作適當的實體關係
- 包含稽核欄位 (CreatedAt, UpdatedAt, CreatedBy)
- 為複雜屬性使用值物件

## 查詢最佳化
- 始終使用參數化查詢
- 實作適當的索引策略
- 為所有資料庫操作使用非同步方法
- 為資料庫例外狀況加入適當的錯誤處理
```

### 透過 Visual Studio Code 建立指令檔案

**快速建立方法:**

1. 在 Visual Studio Code 中開啟聊天視圖
2. 點選「設定聊天」按鈕 (齒輪圖示)
3. 選取「指令」→「新增指令檔案」
4. 選擇工作區或使用者設定檔位置
5. 為檔案命名並開始撰寫指令

**指令選項板方法:**

- 按下 `Ctrl+Shift+P`
- 輸入「Chat: New Instructions File」
- 按照提示操作

## 掌握提示檔案

提示檔案 (`.prompt.md`) 是常見開發任務的可重複使用範本。

### 了解提示檔案命名和前置設定

提示檔案必須遵循命名慣例：`[名稱].prompt.md`

**檔案命名範例:**

- `create-react-component.prompt.md` - 產生 React 元件
- `security-review.prompt.md` - 執行安全性程式碼檢查
- `api-endpoint.prompt.md` - 建立 RESTful API 端點
- `generate-tests.prompt.md` - 建立單元和整合測試
- `refactor-code.prompt.md` - 程式碼重構工作流程
- `generate-docs.prompt.md` - 文件產生

**檔案位置選項:**

- **工作區**: `.github/prompts/` 資料夾 (預設)
- **使用者設定檔**: `%APPDATA%\Code\User\prompts\` (Windows)
- **自訂位置**: 透過 `chat.promptFilesLocations` 設定

提示檔案使用 YAML 前置設定來配置提示的執行方式：

```yaml
---
mode: "ask"|"edit"|"agent"        # 選用: 使用的聊天模式 (預設: "agent")
model: "gpt-4"|"gpt-3.5-turbo"    # 選用: 使用的特定 AI 模型
tools: ["tool1", "tool2"]         # 選用: 在代理程式模式中可用的工具
description: "簡要描述"           # 選用: 提示的功能描述
---
```

**前置設定屬性說明:**

- **`mode`**: 決定提示的操作方式

  - `"ask"` - 簡單問答模式
  - `"edit"` - 直接檔案編輯模式
  - `"agent"` - 具有工具存取權限的完整代理程式模式 (預設)

- **`model`**: 指定使用哪個 AI 模型

  - `"gpt-4"` - 適用於複雜任務的最強大模型
  - `"gpt-3.5-turbo"` - 適用於簡單任務的快速、經濟實惠選擇
  - 如果未指定，使用 Visual Studio Code 中目前選擇的模型

- **`tools`**: 代理程式模式中可用的工具名稱/集合陣列
  - `["typescript"]` - TypeScript 專用工具
  - `["react", "typescript"]` - 多個工具集
  - `["web-search", "file-system"]` - 外部工具
  - 透過聊天中的「設定工具」配置可用工具

### 基本提示檔案結構

**範例檔案: `create-react-component.prompt.md`**

```markdown
---
mode: "agent"
model: "gpt-4"
tools: ["typescript", "react"]
description: "使用 TypeScript 產生 React 元件"
---

# 建立 React 元件

建立符合以下需求的新 React 元件：

## 元件規格

- 元件名稱: ${input:componentName:輸入元件名稱}
- 使用 TypeScript 配備適當的介面
- 包含適當的 prop 驗證
- 實作響應式設計
- 新增完整的 JSDoc 註解

## 額外脈絡

- 遵循我們專案的編碼標準: [coding-standards](.github/copilot-instructions.md)
- 參考現有元件: #src/components/
- 使用我們的設計系統: #src/styles/design-system.ts

## 輸出需求

- 產生元件檔案
- 建立對應的測試檔案
- 在註解中包含使用範例
- 適當地匯出元件

選取的檔案作為脈絡: ${selection}
```

### 進階提示範例

#### 安全性檢查提示

**範例檔案: `security-review.prompt.md`**

```markdown
---
mode: "agent"
description: "執行全面的安全性檢查"
---

# 安全性程式碼檢查

對選取的程式碼執行徹底的安全性分析：

## 檢查區域

1. **輸入驗證**: 檢查適當的清理和驗證
2. **身份驗證**: 驗證適當的驗證實作
3. **授權**: 確保適當的存取控制
4. **資料洩露**: 尋找敏感資料洩露
5. **SQL 注入**: 檢查參數化查詢
6. **XSS 防護**: 驗證適當的輸出編碼

## 脈絡檔案

- 安全性指導原則: [security-guidelines](./docs/security.md)
- 身份驗證服務: #src/services/auth.ts

## 輸出格式

請以此格式提供發現：

- **問題**: 安全性疑慮描述
- **嚴重性**: 嚴重/高/中/低
- **位置**: 檔案和行號
- **建議**: 具體修復指示
- **範例**: 顯示修復的程式碼範例

選取的程式碼: ${selection}
```

## 使用提示檔案

### 執行提示

**透過聊天輸入:**

- 輸入 `/` 後接提示名稱：`/create-react-component`
- 傳遞參數：`/create-api-endpoint: method=POST resource=users`

**透過指令選項板:**

- 按下 `Ctrl+Shift+P`
- 輸入「Chat: Run Prompt」
- 選取您的提示檔案

**透過編輯器:**

- 開啟 `.prompt.md` 檔案
- 點選編輯器標題中的播放按鈕
- 選擇在目前或新的聊天會話中執行

## 進階自訂技術

### 變數系統

在指令和提示中利用 Visual Studio Code 的變數系統：

```markdown
# 目前工作區: ${workspaceFolder}

# 目前檔案: ${file}

# 選取的文字: ${selectedText}

# 使用者輸入: ${input:variableName:placeholder}
```

### 檔案參照

連結到其他檔案和指令：

```markdown
# 參照其他指令

遵循 [typescript-rules](./typescript.instructions.md) 中的指導原則

# 參照工作區檔案

檢查現有模式: #src/utils/helpers.ts

# 使用 markdown 連結參照

詳見 [API 文件](../docs/api.md)
```

### 條件式指令

使用 `applyTo` 屬性建立脈絡感知指令：

```markdown
---
applyTo: "**/tests/**/*.ts"
description: "測試專用指令"
---

# 測試指導原則

- 使用 describe/it 模式進行測試結構
- 根據需要包含設定和清理
- 模擬外部依賴
- 測試成功和錯誤情況
```

## 組織策略

### 工作區結構

```
.github/
├── copilot-instructions.md           # 全域專案指令
├── instructions/                     # 特定指令檔案
│   ├── react.instructions.md         # React 元件指導原則
│   ├── database.instructions.md      # 資料庫開發模式
│   ├── testing.instructions.md       # 測試最佳實務
│   ├── api-endpoints.instructions.md # API 開發標準
│   └── security.instructions.md      # 安全性檢查指導原則
└── prompts/                          # 可重複使用的提示範本
    ├── create-react-component.prompt.md    # 產生 React 元件
    ├── api-endpoint.prompt.md             # 建立 API 端點
    ├── security-review.prompt.md          # 安全性程式碼檢查
    ├── generate-tests.prompt.md           # 建立單元/整合測試
    └── refactor-code.prompt.md            # 程式碼重構工作流程
```

## 團隊協作最佳實務

### 版本控制

- 將指令和提示檔案提交到您的儲存庫
- 在 README 中記錄您的自訂策略
- 像檢查程式碼變更一樣檢查指令變更
- 為指令更新使用描述性的提交訊息

### 團隊標準

```markdown
---
# 範例: 團隊的 .github/copilot-instructions.md
---

# 團隊開發標準

## 程式碼檢查需求

- 所有 PR 需要 2 個批准
- 為新功能加入測試
- 為 API 變更更新文件
- 遵循慣例提交格式

## 架構決策

- 使用乾淨架構模式
- 實作依賴注入
- 遵循 SOLID 原則
- 在 ADR 中記錄架構決策
```

## 故障排除常見問題

### 指令未套用

1. **檢查設定**: 確保 `github.copilot.chat.codeGeneration.useInstructionFiles` 已啟用
2. **檔案位置**: 驗證檔案在正確的目錄中
3. **語法**: 檢查 YAML 前置設定格式
4. **檔案副檔名**: 確保使用 `.instructions.md` 或 `.prompt.md` 副檔名

### 衝突的指令

- 避免跨檔案的矛盾指導原則
- 使用特定的 `applyTo` 模式避免衝突
- 在部署前測試指令組合
- 記錄指令層次和優先順序

## 結論

指令和提示檔案將 GitHub Copilot 從通用助手轉變為專案感知、團隊一致的開發夥伴。從基本指令開始，逐步建立您的提示庫，並根據團隊需求持續改進。

成功的關鍵是一致性、團隊採用和反覆改進。從工作流程中最常見的任務開始，然後隨著您發現自動化和標準化的新機會而擴展您的自訂庫。

**後續步驟:**

1. 建立您的第一個 `.github/copilot-instructions.md` 檔案
2. 設定專案特定的指令檔案
3. 建立常見提示範本庫
4. 與團隊分享並反覆改進
5. 根據使用模式進行測量和改進

記住：這些自訂設定不只是為了讓 Copilot 運作得更好—它們是將團隊的知識和最佳實務編碼為可重複使用、可擴展的工具，幫助在整個程式碼庫中維持一致性和品質。
