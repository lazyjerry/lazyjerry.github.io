# 筆記：朗讀語氣分層改良

--- 2026-07-18 第 1 次更新筆記 ---
## 任務摘要
現有 `getChunks()` 先把 `.main-content` 轉為純文字再依換行切割，會失去標題、段落與清單語意。所有 utterance 固定 `rate = 1.0`，也沒有段落間停頓。改為從 DOM 建立含朗讀參數的片段，並用 utterance 結束事件安排下一片段。

## 來源

### 來源 1：目前專案實作
- 路徑：`assets/js/script.js`
- 重點：
  - 既有播放、暫停、停止、voice fallback 與 keep-alive 需要保留。
  - `.main-content` 內含 `.site-footer`，朗讀時必須排除。

### 來源 2：Web Speech API
- URL：https://webaudio.github.io/web-speech-api/
- 重點：
  - `SpeechSynthesisUtterance` 可逐段設定 `rate` 與 `pitch`。
  - 語音引擎可能限制實際參數效果。

## 綜合發現

### 實作
- 使用 `h1, h2, h3, p, li` 保留文件順序與語意。
- 移除 citation-like links、`sup`、巢狀清單及頁尾，避免重複或朗讀引用。
- 以 `pendingChunkIndex` 保留段落間停頓時的下一片段，暫停後仍可繼續。


--- 2026-07-18 第 2 次更新筆記 ---
## 驗證結果
- JavaScript 語法檢查通過。
- 更新腳本重跑後工作樹內容不變，確認冪等。
- 模擬 DOM 與 Web Speech API 的自動化測試確認語意片段分類、參數、引用排除與控制狀態。
- Chrome extension 在本次 session 未連線，未執行實際聲音播放驗收。
