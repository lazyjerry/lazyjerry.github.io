# GitHub Copilot Instructions - Lazy Jerry 科技報告網站

## 專案架構概覽

AI 驅動的中文科技報告平台，使用 Jekyll + GitHub Pages。核心工作流程：`docs/` 草稿 → `Tech/YYYY-MM-DD/` 組織 → 自動化腳本發布 → `Tech/index.md` (預覽) 和 `weekly-report/index.md` (正式版)。

## 關鍵開發模式

### 1. 三階段發布系統

```bash
# 預覽發布 (Tech/index.md)
python pre_weekly_report.py
# 正式發布 (weekly-report/index.md)
python weekly_report.py
# 快速推送
python just_push.py
```

### 2. 內容結構標準

**週記檔案**: `Tech/YYYY-MM-DD/YYYY-MM-DD 科技服務資訊週記.md`

```yaml
---
title: 科技服務資訊週記 [預覽版]
description: AI 自動彙整的科技服務官方資訊週記，使用 Manus Plus
---
```

**必需內容框架**: 總結 → 亮點 → 趨勢分析 → 參考資料 → 報告說明

**錨點格式**: `<a id="section-name"></a>` (不用 markdown #anchors)

**引用格式**: `[[數字]](#ref-數字)` → `<a id="ref-數字"></a>[數字] 標題 - 來源`

### 3. 自動化腳本模式

**共同模式**: 所有腳本都使用 `ROOT_DIR = os.path.dirname(os.path.abspath(__file__))`，UTF-8 編碼，Git 操作都包含錯誤處理（但預設註解掉）

**YAML 注入模式**:

```python
# 預覽版標題含 "預覽版"
yaml_header = (
    "---\n"
    "title: 科技服務資訊週記 預覽版\n"
    # ...
)
new_content = yaml_header + original_content
```

### 4. Jekyll 特殊配置

- `lang="zh-Hant"` 繁體中文
- 完整 Open Graph (1200x630 圖片)
- Google Analytics: G-ZS4ZJMKGME
- `Topics/index.html` 只是重導向 `<script>location.href = "/";</script>`

## 核心開發慣例

### 檔案操作

- **日期格式**: 一律 `YYYY-MM-DD`
- **中文檔名**: 週記和專題用中文，輔助檔案用英文底線
- **編碼**: 所有 `.py` 和 `.md` 檔案使用 `utf-8`
- **路徑**: 使用 `os.path.join()` 跨平台相容

### 內容生成

- **AI 工具**: 主要用 Manus AI，週記用 Wide Research 多代理功能
- **結構化資料**: `todo.md`, `analysis.md`, `categorized_news.md` 等輔助檔案
- **表格格式**: 參考資料使用表格 `| 編號 | 文章標題 | 亮點 | 發布日期 | 來源 |`

### Git 工作流程

- **提交訊息**: 中文格式 `更新檔案 YYYY-MM-DD` 或 `新增專題：XXX`
- **快速推送**: 使用 `just_push.py` 進行 add/commit/push
- **腳本預設**: 所有腳本的 Git 操作都註解掉，避免意外推送

## 專題開發模式

**目錄結構**: `Topics/[專題名稱]/YYYY-MM-DD/[報告].md`
**專題腳本**: `topic-0827.py` 模式 - 複製特定日期資料到 `index.md`
**專用變數**: `TOPIC_FOLDER_NAME`, `FILE_NAME` 可自定義

## 除錯檢查清單

1. **YAML Front Matter** 格式正確
2. **錨點連結** 使用 `<a id="...">` 而非 markdown
3. **檔案編碼** UTF-8 無 BOM
4. **路徑存在性** 腳本運行前檢查資料夾
5. **日期一致性** 檔名、資料夾名、內容中日期匹配

---

_專為 AI 助手優化的實用指南 - 聚焦此專案的特定模式和慣例_
