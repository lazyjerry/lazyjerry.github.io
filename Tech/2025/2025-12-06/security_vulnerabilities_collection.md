# 近期資安漏洞蒐集記錄

## 已納入報告的漏洞

### [1] React2Shell (CVE-2025-55182)
- **日期**：2025-12-03
- **CVSS 評分**：10.0（滿分）
- **影響範圍**：React 19.x、Next.js 15.x、16.x
- **來源**：https://cloud.google.com/blog/products/identity-security/responding-to-cve-2025-55182
- **狀態**：已納入報告

## 新發現的漏洞

### [2] Chrome V8 零日漏洞 (CVE-2025-13223)
- **日期**：2025-11-18
- **嚴重程度**：高（High）
- **來源**：https://www.malwarebytes.com/blog/news/2025/11/chrome-zero-day-under-active-attack-visiting-the-wrong-site-could-hijack-your-browser
- **影響範圍**：Chrome 瀏覽器（版本 142.0.7444.175 之前）
- **漏洞類型**：V8 引擎的類型混淆（Type Confusion）漏洞
- **攻擊方式**：遠端攻擊者可透過惡意 HTML 頁面利用堆積損壞（heap corruption）
- **發現者**：Google Threat Analysis Group (TAG)
- **修補版本**：142.0.7444.175/.176（Windows）、142.0.7444.176（macOS）、142.0.7444.175（Linux）
- **重點**：
  - 已在野外被積極利用（exploit exists in the wild）
  - 僅訪問惡意網站即可能導致瀏覽器被劫持
  - TAG 團隊通常關注間諜軟體和國家級攻擊者濫用零日漏洞進行間諜活動
  - Chrome 是全球最受歡迎的瀏覽器，約有 34 億用戶
  - 同時修補了另一個類型混淆漏洞 CVE-2025-13224（由 Google Big Sleep AI 專案發現，尚未被利用）

**權重評估**：
- 來源權威性：3 分（Malwarebytes 是知名資安媒體，且引用 Google 官方資訊）
- 技術相關性：3 分（直接影響程式設計師日常使用的瀏覽器，且涉及 JavaScript 執行環境）
- 時效性：3 分（2025-11-18，完全符合時間範圍）
- 影響範圍：3 分（全球 34 億 Chrome 用戶，影響極廣）
- 創新程度：2 分（零日漏洞，已被積極利用）
- **總分**：14 分（高權重，必須納入）

### [3] Android Framework 嚴重漏洞 (CVE-2025-48631)
- **日期**：2025-12-01（發布）
- **嚴重程度**：嚴重（Critical）
- **來源**：https://source.android.com/docs/security/bulletin/2025-12-01
- **影響範圍**：Android 13、14、15、16
- **漏洞類型**：遠端拒絕服務（Remote Denial of Service）
- **攻擊方式**：無需額外執行權限即可進行遠端拒絕服務攻擊
- **修補版本**：2025-12-05 安全補丁等級或更高版本
- **重點**：
  - 這是 12 月 Android 安全公告中最嚴重的漏洞
  - 公告共修補了 107 個漏洞
  - 包含兩個補丁等級：2025-12-01 和 2025-12-05
  - Framework 組件共修補 35 個漏洞（1 個 Critical、28 個 High、6 個其他）
  - System 組件共修補 14 個漏洞（全部為 High）

**權重評估**：
- 來源權威性：3 分（Google 官方 Android 安全公告）
- 技術相關性：2 分（影響 Android 開發者，但不是所有程式設計師都涉及 Android 開發）
- 時效性：3 分（2025-12-01，完全符合時間範圍）
- 影響範圍：3 分（影響全球數十億 Android 設備）
- 創新程度：2 分（常規安全更新，但包含 Critical 級別漏洞）
- **總分**：13 分（高權重，建議納入）

### [4] Android Framework 權限提升漏洞 (CVE-2025-48572)
- **日期**：2025-12-02（CISA 加入 KEV 目錄）
- **嚴重程度**：高（High）
- **來源**：https://www.cisa.gov/news-events/alerts/2025/12/02/cisa-adds-two-known-exploited-vulnerabilities-catalog
- **影響範圍**：Android Framework
- **漏洞類型**：權限提升（Privilege Escalation）
- **重點**：
  - CISA 基於活躍利用證據將其加入已知被利用漏洞（KEV）目錄
  - 與 CVE-2025-48633（Android Framework 資訊洩露漏洞）同時被加入 KEV
  - 這類漏洞是惡意網路行為者的常見攻擊向量，對聯邦企業構成重大風險

**權重評估**：
- 來源權威性：3 分（CISA 官方公告）
- 技術相關性：2 分（影響 Android 開發者）
- 時效性：3 分（2025-12-02，完全符合時間範圍）
- 影響範圍：3 分（已被積極利用，影響廣泛）
- 創新程度：2 分（已知被利用的漏洞）
- **總分**：13 分（高權重，建議納入）

### [5] Android Framework 資訊洩露漏洞 (CVE-2025-48633)
- **日期**：2025-12-02（CISA 加入 KEV 目錄）
- **嚴重程度**：高（High）
- **來源**：https://www.cisa.gov/news-events/alerts/2025/12/02/cisa-adds-two-known-exploited-vulnerabilities-catalog
- **影響範圍**：Android Framework
- **漏洞類型**：資訊洩露（Information Disclosure）
- **重點**：
  - CISA 基於活躍利用證據將其加入已知被利用漏洞（KEV）目錄
  - 與 CVE-2025-48572 同時被加入 KEV

**權重評估**：
- 來源權威性：3 分（CISA 官方公告）
- 技術相關性：2 分（影響 Android 開發者）
- 時效性：3 分（2025-12-02，完全符合時間範圍）
- 影響範圍：3 分（已被積極利用，影響廣泛）
- 創新程度：2 分（已知被利用的漏洞）
- **總分**：13 分（高權重，建議納入）

## 評估結論

### 建議納入報告的漏洞：

1. **Chrome V8 零日漏洞 (CVE-2025-13223)**：14 分，影響全球 34 億用戶，已被積極利用，對程式設計師日常工作影響極大
2. **Android Framework 嚴重漏洞 (CVE-2025-48631)**：13 分，Critical 級別，影響全球數十億 Android 設備
3. **Android Framework 權限提升漏洞 (CVE-2025-48572)**：13 分，已被 CISA 列入 KEV，證實被積極利用
4. **Android Framework 資訊洩露漏洞 (CVE-2025-48633)**：13 分，已被 CISA 列入 KEV，證實被積極利用

### 納入策略：

考慮到報告的可讀性與平衡性，建議：
- **必須納入**：Chrome V8 零日漏洞（影響所有程式設計師）
- **選擇性納入**：Android 相關漏洞可整合為一個段落，重點介紹 12 月 Android 安全更新，包含 1 個 Critical 漏洞和 2 個已被積極利用的漏洞

這樣可以避免報告過於冗長，同時涵蓋最重要的資安資訊。
