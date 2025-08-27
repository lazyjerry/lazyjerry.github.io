# Copilot Instructions - Lazy Jerry AI 科技報告網站

## 專案概覽

這是一個使用 Jekyll + GitHub Pages 的中文科技資訊部落格，專注於 AI 技術趨勢分析和定期科技服務週報。網站採用自動化內容生成和發布流程，結合 AI 工具進行內容彙整和分析。

### 核心特色

- **AI 驅動內容生成**：使用 Manus AI 和其他 AI 工具自動彙整科技資訊
- **結構化週報系統**：每週定期發布科技服務資訊週記
- **專題深度分析**：針對特定主題進行深入研究和報告
- **多重文件組織**：支援草稿、預覽和正式發布的工作流程

## 目錄結構與內容規範

### 1. 科技週報系統 (`Tech/`)

```
Tech/
├── index.md                    # 最新週報（預覽版）
└── YYYY-MM-DD/                 # 按日期組織的週報資料夾
    ├── YYYY-MM-DD 科技服務資訊週記.md  # 主要週報檔案
    ├── analysis.md             # 深度分析
    ├── categorized_news.md     # 分類新聞
    ├── todo.md                 # 待辦事項
    └── [其他輔助檔案]
```

**週報內容結構標準**：

- YAML Front Matter：必須包含 `title` 和 `description`
- 內容框架：總結 → 亮點 → 趨勢分析 → 參考資料 → 報告說明
- 引用格式：使用 `[[數字]](#ref-數字)` 格式
- 錨點格式：`<a id="錨點內容"></a>` HTML 標籤

### 2. 主題專題系統 (`Topics/`)

```
Topics/
├── index.html                  # 重導向到首頁
└── [專題名稱]/
    ├── index.md               # 專題主頁
    └── YYYY-MM-DD/            # 按日期的研究進度
        ├── [專題報告].md      # 主要報告
        ├── data_collection.md # 資料收集
        └── research_data.md   # 研究數據
```

### 3. 文檔與草稿 (`docs/`)

- 用於存放原始資料、提示詞、資料收集檔案
- 支援多種格式：`.md`, `.json`, `.csv`
- 不直接參與網站渲染，主要用於內容開發過程

### 4. 週報發布系統 (`weekly-report/`)

- `index.md`：正式發布的週報頁面
- 由自動化腳本從 `Tech/` 目錄複製並處理

## 開發工作流程

### 自動化腳本系統

#### 1. `pre_weekly_report.py` - 週報預覽生成

```python
# 功能：從 Tech/YYYY-MM-DD/ 複製週報到 Tech/index.md（預覽版）
# 用法：python pre_weekly_report.py
# 輸入：日期 (預設今天)
# 輸出：更新 Tech/index.md 為預覽版本
```

#### 2. `weekly_report.py` - 正式週報發布

```python
# 功能：從 Tech/YYYY-MM-DD/ 複製週報到 weekly-report/index.md
# 用法：python weekly_report.py
# 輸入：日期選擇
# 輸出：正式發布版週報
```

#### 3. `just_push.py` - Git 自動推送

```python
# 功能：自動執行 git add, commit, push
# 用法：python just_push.py
# 適用：快速部署更新
```

### Jekyll 配置要點

#### 主要配置 (`_config.yml`)

```yaml
title: Lazy Jerry 的 AI 科技與各專題報告
description: AI 技術與應用報告，彙整最新資訊、趨勢，並不定時推出各種領域的專題報告。
theme: jekyll-theme-cayman
og_image: https://lazyjerry.github.io/assets/og-image.png
google_analytics: G-ZS4ZJMKGME
```

#### 自訂佈局 (`_layouts/default.html`)

- **語言設定**：`lang="zh-Hant"` 繁體中文
- **SEO 優化**：完整的 Open Graph 和 Twitter Card 設定
- **Google Analytics**：自動整合追蹤代碼
- **社群分享**：針對中文內容優化的分享圖

## 程式碼協作指南

### 檔案命名規範

- **週報檔案**：`YYYY-MM-DD 科技服務資訊週記.md`
- **專題報告**：使用描述性中文名稱
- **輔助檔案**：英文小寫，底線分隔（如 `data_collection.md`）
- **資料夾**：日期使用 `YYYY-MM-DD` 格式

### Markdown 撰寫標準

1. **Front Matter**：

   ```yaml
   ---
   title: 明確的標題
   description: 詳細描述內容和用途
   ---
   ```

2. **錨點設定**：

   ```html
   <a id="section-name"></a>
   ## 章節標題
   ```

3. **引用連結**：

   ```markdown
   根據資料顯示 [[1]](#ref-1)
   ```

4. **參考資料格式**：
   ```markdown
   ## <a id="參考資料"></a>參考資料

   - <a id="ref-1"></a>[1] 標題 - 來源連結
   ```

### Python 腳本開發準則

- **編碼設定**：所有檔案使用 `utf-8` 編碼
- **路徑處理**：使用 `os.path.join()` 確保跨平台相容
- **錯誤處理**：Git 操作必須包含 try-except 處理
- **使用者互動**：提供清楚的輸入提示和預設值
- **檔案操作**：讀寫檔案前檢查路徑和檔案存在性

### Git 協作規範

- **提交訊息**：使用中文描述，格式：`更新檔案 YYYY-MM-DD` 或 `新增專題：XXX`
- **分支策略**：主要在 main 分支開發，重大功能可開分支
- **自動化**：優先使用提供的 Python 腳本進行提交

## AI 工具整合

### 內容生成工具

- **Manus AI**：主要的週報內容生成工具
- **Wide Research**：多代理協作研究功能
- **其他 AI 工具**：根據專題需求選用

### 內容品質標準

- **準確性**：引用資料必須包含來源連結
- **結構化**：遵循既定的章節框架
- **中文用詞**：使用繁體中文，技術術語保持一致
- **時效性**：週報內容反映最新一週的科技動態

## 常見開發任務

### 1. 新增週報

```bash
# 1. 在 Tech/ 建立新日期資料夾
mkdir Tech/2025-XX-XX

# 2. 撰寫週報內容
# 3. 生成預覽版
python pre_weekly_report.py

# 4. 正式發布
python weekly_report.py

# 5. 推送更新
python just_push.py
```

### 2. 建立新專題

```bash
# 1. 在 Topics/ 建立專題資料夾
mkdir Topics/new-topic-name

# 2. 建立 index.md 和研究資料夾
# 3. 依需求建立 docs/ 下的相關資料夾
```

### 3. 內容除錯

- **檢查 YAML Front Matter 格式**
- **驗證錨點連結正確性**
- **確認檔案路徑和編碼**
- **測試 Jekyll 本機預覽**

## 最佳實踐

### 效能考量

- **圖片最佳化**：OG 圖片尺寸 1200x630
- **內容長度**：週報控制在適合網頁閱讀的長度
- **載入速度**：避免過大的資料檔案直接放在 assets/

### 可維護性

- **模組化腳本**：保持 Python 腳本的功能單一性
- **文檔完整**：每個專題都應有完整的 README 說明
- **版本控制**：重要更新前先備份關鍵檔案

### 內容策略

- **一致性**：維持週報格式和品質標準的一致
- **可讀性**：適當使用格式化和分段
- **互動性**：善用錨點連結提升導航體驗
- **SEO 友善**：合理使用標題階層和關鍵字

---

_本指南隨專案發展持續更新，協助 AI 編碼助手更好地理解和協作此專案。_
