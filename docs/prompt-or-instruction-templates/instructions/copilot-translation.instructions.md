---
applyTo: "**/*.{md,txt,php,js,ts,jsx,tsx,vue,py,go,html,css,scss,sass,json,yaml,yml,env}"
description: "文件與程式碼的繁體中文翻譯規範：包含註解、docstring、錯誤訊息、UI 文字等中文內容須使用台灣用語"
---

# 全域中文翻譯規範（繁體中文／台灣用語）

## 核心原則

- 所有中文內容必須使用**繁體中文**，絕對禁止簡體字
- 強制使用**台灣常用詞彙**，避免中國大陸用語
- 技術專有名詞保留英文原文（API、Token、Commit 等）
- 語氣正式專業，避免主觀形容詞與誇大修飾
- 避免使用 emoji

## 翻譯範圍

| 檔案類型 | 翻譯內容 |
|----------|----------|
| 文件檔案 | 標題、內文、表格、清單、註解 |
| 程式碼 | docstring、註解、錯誤訊息、輸出文字 |
| 專案檔案 | README、CHANGELOG、description 欄位 |

## 台灣用語對照表

| 情境 | 中國用語 | 台灣用語 |
|------|----------|----------|
| 軟體相關 | 軟件、程序、代碼、文檔、優化 | 軟體、程式、程式碼、文件、最佳化 |
| 網路相關 | 網絡、服務器、在線、離線 | 網路、伺服器、線上、離線 |
| 檔案操作 | 文件夾、默認值、信息 | 資料夾、預設值、資訊 |
| 系統相關 | 操作系統、內存、硬盤、數據庫 | 作業系統、記憶體、硬碟、資料庫 |
| 功能描述 | 打開、配置、視頻、音頻 | 開啟、設定、影片、音訊 |
| 介面相關 | 界面、窗口、菜單、鼠標 | 介面、視窗、選單、滑鼠 |
| 開發用語 | 進程、線程、移動端、調試 | 行程、執行緒、行動裝置、除錯 |
| 其他 | 激活、通過、用戶、落地、智能 | 啟用、透過、使用者、實現、智慧 |

## 常見句式轉換

- 「通過 API 來實現」→「透過 API 實現」
- 「打開配置文件」→「開啟設定檔」
- 「默認情況下」→「預設情況下」
- 「查看文檔」→「查看文件」

## 禁用詞彙

以下主觀形容詞嚴禁使用：專業的、企業級、強大的、優秀的、完善的、高效的、先進的、卓越的、最佳的、一流的、頂級的、極致的、完美的、絕佳的

## 技術專有名詞處理

- **保留原文**：API、CLI、Token、Commit、Pull Request、Webhook、Endpoint
- **中英並列**：第一次出現時使用「中文（英文）」格式
- **程式碼內**：變數、函數、類別名稱保持英文，註解翻譯成中文

## 格式規範

- 中文內容使用全形標點符號
- 英文內容保持半形標點符號
- 中英文之間適當留空格
- 數字表達：阿拉伯數字 + 中文單位（2025 年、3 個步驟）

## 不需翻譯的內容

- URL 和網址
- 檔案路徑
- 套件名稱
- Git 指令
- 環境變數名稱

## 品質檢核

1. 全文無簡體字
2. 使用台灣常用詞彙
3. 專有名詞翻譯一致
4. 語意自然流暢
5. Markdown 結構完整

## 翻譯範例

### 文件標題與說明

| 原文 | 翻譯 |
|------|------|
| Database Instructions | 資料庫操作指引 |
| API Endpoint Guidelines | API 端點指引 |
| Getting Started | 快速開始 |
| Configuration | 設定說明 |
| Troubleshooting | 疑難排解 |

### 程式碼註解

**Python docstring**
```python
def get_user_profile(user_id):
    """
    取得使用者個人資料

    Args:
        user_id (str): 使用者識別碼

    Returns:
        dict: 包含使用者資料的字典

    Raises:
        ValueError: 當使用者 ID 無效時拋出
    """
```

**JavaScript JSDoc**
```javascript
/**
 * 計算購物車總金額
 * @param {Array} items - 購物車商品陣列
 * @returns {number} 總金額
 */
```

**PHP PHPDoc**
```php
/**
 * 驗證使用者輸入資料
 *
 * @param array $data 使用者提交的表單資料
 * @return bool 驗證結果
 * @throws InvalidArgumentException 當資料格式錯誤時拋出
 */
```

### 錯誤訊息

| 英文 | 中文 |
|------|------|
| Invalid email format | 電子郵件格式無效 |
| Password too short | 密碼長度不足 |
| Network error, please try again | 網路連線發生問題，請稍後再試 |
| Permission denied | 您沒有權限執行此操作 |
| Resource not found | 找不到您要求的資源 |

### 常用 UI 文字

| 英文 | 中文 |
|------|------|
| Submit | 提交 |
| Cancel | 取消 |
| Save | 儲存 |
| Delete | 刪除 |
| Edit | 編輯 |
| Search | 搜尋 |
| Loading... | 載入中... |
| No results found | 查無結果 |
