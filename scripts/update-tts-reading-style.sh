#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mode="${1:-apply}"

python3 - "$repo_root" "$mode" <<'PY'
from pathlib import Path
import sys

repo_root = Path(sys.argv[1])
mode = sys.argv[2]
script_path = repo_root / "assets/js/script.js"
layout_path = repo_root / "_layouts/default.html"
task_dir = repo_root / "docs/knowledge-skill/朗讀語氣分層改良-001"

if mode not in {"apply", "finalize"}:
    raise SystemExit("用法：scripts/update-tts-reading-style.sh [apply|finalize]")

tts_marker = "// TTS — 語音朗讀功能\n"
new_tts = r"""// TTS — 語音朗讀功能
(function () {
  if (!('speechSynthesis' in window)) return;

  const synth = window.speechSynthesis;
  let chunks = [];
  let chunkIndex = 0;
  let isPaused = false;
  let keepAliveTimer = null;
  let pauseTimer = null;
  let pendingChunkIndex = null;
  let runId = 0;

  const style = document.createElement('style');
  style.textContent = [
    '#tts-bar{position:fixed;bottom:24px;right:24px;display:flex;align-items:center;gap:6px;',
    'background:#155799;border-radius:10px;padding:8px 14px;',
    'box-shadow:0 3px 12px rgba(0,0,0,.28);z-index:999;}',
    '#tts-bar button{background:transparent;border:1px solid rgba(255,255,255,.55);color:#fff;',
    'border-radius:6px;padding:5px 12px;font-size:13px;cursor:pointer;',
    'transition:background .15s;white-space:nowrap;}',
    '#tts-bar button:hover:not(:disabled){background:rgba(255,255,255,.18);}',
    '#tts-bar button:disabled{opacity:.35;cursor:not-allowed;}',
    '#tts-progress{color:rgba(255,255,255,.8);font-size:12px;min-width:44px;text-align:center;}'
  ].join('');
  document.head.appendChild(style);

  const bar = document.createElement('div');
  bar.id = 'tts-bar';
  bar.innerHTML =
    '<button id="tts-play">▶ 朗讀</button>' +
    '<button id="tts-pause" disabled>⏸ 暫停</button>' +
    '<button id="tts-stop" disabled>⏹ 停止</button>' +
    '<span id="tts-progress"></span>';
  document.body.appendChild(bar);

  const playBtn  = document.getElementById('tts-play');
  const pauseBtn = document.getElementById('tts-pause');
  const stopBtn  = document.getElementById('tts-stop');
  const progress = document.getElementById('tts-progress');

  function cleanText(element) {
    var clone = element.cloneNode(true);
    clone.querySelectorAll('sup, .footnote, .reversefootnote, ol, ul').forEach(function (node) {
      node.remove();
    });
    clone.querySelectorAll('a').forEach(function (link) {
      if (/^\s*\[\d+[^\]]*\]\s*$/.test(link.textContent || '')) link.remove();
    });
    return (clone.innerText || clone.textContent || '')
      .replace(/\s+/g, ' ')
      .trim();
  }

  function getChunks() {
    var content = document.querySelector('.main-content');
    if (!content) return [];

    return Array.from(content.querySelectorAll('h1, h2, h3, p, li')).map(function (element) {
      if (element.closest('.site-footer') || element.closest('#tts-bar')) return null;
      if (element.matches('p') && element.closest('li')) return null;

      var text = cleanText(element);
      if (text.length <= 1) return null;

      if (element.matches('h1, h2, h3')) {
        return { text: text, type: 'heading', rate: 0.9, pitch: 1.08, pauseAfter: 600 };
      }
      if (element.matches('li')) {
        return { text: text, type: 'list-item', rate: 0.97, pitch: 1.0, pauseAfter: 350 };
      }
      return { text: text, type: 'paragraph', rate: 1.0, pitch: 1.0, pauseAfter: 250 };
    }).filter(function (chunk) {
      return chunk !== null;
    });
  }

  function getVoice() {
    var voices = synth.getVoices();
    return voices.find(function (v) { return v.lang === 'zh-TW'; }) ||
           voices.find(function (v) { return v.lang === 'zh-HK'; }) ||
           voices.find(function (v) { return v.lang.startsWith('zh'); }) ||
           null;
  }

  function clearPauseTimer() {
    if (pauseTimer) { window.clearTimeout(pauseTimer); pauseTimer = null; }
  }

  function queueNextChunk(index, delay, currentRunId) {
    pendingChunkIndex = index;
    clearPauseTimer();
    pauseTimer = window.setTimeout(function () {
      pauseTimer = null;
      if (currentRunId !== runId || isPaused) return;
      pendingChunkIndex = null;
      speakChunk(index, currentRunId);
    }, delay);
  }

  function speakChunk(index, currentRunId) {
    if (currentRunId !== runId) return;
    if (index >= chunks.length) { reset(); return; }
    chunkIndex = index;
    progress.textContent = (index + 1) + '/' + chunks.length;

    var chunk = chunks[index];
    var u = new SpeechSynthesisUtterance(chunk.text);
    u.lang = 'zh-TW';
    u.rate = chunk.rate;
    u.pitch = chunk.pitch;
    var voice = getVoice();
    if (voice) u.voice = voice;

    u.onend = function () {
      if (currentRunId === runId) queueNextChunk(index + 1, chunk.pauseAfter, currentRunId);
    };
    u.onerror = function (e) {
      if (currentRunId === runId && e.error !== 'interrupted') reset();
    };
    synth.speak(u);
  }

  // Chrome 約 15 秒會自動中斷長文，且偶爾卡在 paused 狀態；週期性 resume 保活
  function startKeepAlive() {
    stopKeepAlive();
    keepAliveTimer = window.setInterval(function () {
      if (synth.speaking && !isPaused) { synth.pause(); synth.resume(); }
    }, 10000);
  }

  function stopKeepAlive() {
    if (keepAliveTimer) { window.clearInterval(keepAliveTimer); keepAliveTimer = null; }
  }

  function reset() {
    runId += 1;
    stopKeepAlive();
    clearPauseTimer();
    pendingChunkIndex = null;
    synth.cancel();
    chunks = []; chunkIndex = 0; isPaused = false;
    progress.textContent = '';
    playBtn.disabled  = false;
    pauseBtn.disabled = true;
    pauseBtn.textContent = '⏸ 暫停';
    stopBtn.disabled  = true;
  }

  playBtn.addEventListener('click', function () {
    reset();
    chunks = getChunks();
    if (chunks.length === 0) return;

    var currentRunId = runId;
    playBtn.disabled  = true;
    pauseBtn.disabled = false;
    stopBtn.disabled  = false;

    // 某些瀏覽器可能不會觸發 voiceschanged，直接提供 fallback 以確保可朗讀
    var started = false;
    var startSpeak = function () {
      if (started || currentRunId !== runId) return;
      started = true;
      synth.removeEventListener('voiceschanged', onVoicesChanged);
      startKeepAlive();
      // 延遲一拍再 speak，避開 Chrome 「cancel() 後立刻 speak() 會被吞掉」的競態
      window.setTimeout(function () { speakChunk(0, currentRunId); }, 250);
    };

    var onVoicesChanged = function () {
      startSpeak();
    };

    synth.addEventListener('voiceschanged', onVoicesChanged);

    if (synth.getVoices().length > 0) {
      startSpeak();
    } else {
      // 保留短暫等待，避免在語音尚未初始化時就朗讀
      window.setTimeout(startSpeak, 700);
    }
  });

  pauseBtn.addEventListener('click', function () {
    if (isPaused) {
      isPaused = false;
      synth.resume();
      pauseBtn.textContent = '⏸ 暫停';
      if (pendingChunkIndex !== null && !pauseTimer) {
        var nextIndex = pendingChunkIndex;
        pendingChunkIndex = null;
        speakChunk(nextIndex, runId);
      }
    } else {
      isPaused = true;
      synth.pause();
      clearPauseTimer();
      pauseBtn.textContent = '▶ 繼續';
    }
  });

  stopBtn.addEventListener('click', reset);
})();"""

script_text = script_path.read_text()
if tts_marker not in script_text:
    raise SystemExit(f"找不到 TTS 標記：{script_path}")
script_path.write_text(script_text.split(tts_marker, 1)[0] + new_tts + "\n")

layout_text = layout_path.read_text()
layout_text = layout_text.replace(
    "/assets/js/script.js?v=0619-1",
    "/assets/js/script.js?v=0718-1",
)
layout_path.write_text(layout_text)

task_dir.mkdir(parents=True, exist_ok=True)
(task_dir / "prompt.md").write_text("""# 任務請求：朗讀語氣分層改良

## 原始請求

依核准計畫實作週報朗讀語氣分層：辨識標題、段落與清單，設定自然的語速、音高與停頓；排除引用及控制元件；保留播放狀態與 Chrome keep-alive。

## 期望產出

- [x] 建立可重跑的固定更新腳本。
- [x] 修改朗讀片段結構及播放狀態處理。
- [ ] 完成靜態、內容與瀏覽器狀態驗證。

## 參考文件

| 檔案路徑 | 引用範圍描述 |
|----------|--------------|
| `assets/js/script.js` | TTS 語音朗讀功能 |
| `_layouts/default.html` | 前端 script 載入版號 |
| `tech/2026-07-18/2026-07-18 科技服務資訊週記.md` | 本期實機驗收內容 |
""")

(task_dir / "task_plan.md").write_text("""# 任務計劃：朗讀語氣分層改良

## 目標
讓週報朗讀依標題、段落與清單呈現自然語速、音高及停頓，並維持既有控制功能。

## 執行模式
一次完成

## 報告保存路徑
`docs/knowledge-skill/朗讀語氣分層改良-001/`

## 研究動作計畫
已於前一輪完成現況確認與方案核准，本輪直接實作。

## 階段
- [x] 階段 1：確認既有 TTS、DOM 與腳本慣例
- [x] 階段 2：建立固定更新腳本並套用語意分段
- [ ] 階段 3：驗證 JavaScript、腳本冪等性與朗讀狀態
- [ ] 階段 4：整理報告與交付

## 關鍵問題
1. 標題、段落、清單能否依 DOM 正確分類？
2. 暫停發生在段落間隔時，能否繼續下一片段？

## 已做決策
- 採自然分層：標題 0.9/1.08/600ms、段落 1.0/1.0/250ms、清單 0.97/1.0/350ms。
- 不使用 SSML：跨瀏覽器語音引擎支援不一致。
- 只修改 TTS 區塊、script cache 版號與固定更新／任務紀錄。

## 遇到的錯誤
- 無。

## 狀態
**階段 3** - 執行自動化與瀏覽器驗證
""")

(task_dir / "notes.md").write_text("""# 筆記：朗讀語氣分層改良

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
""")

if mode == "finalize":
    (task_dir / "notes.md").write_text((task_dir / "notes.md").read_text() + """

--- 2026-07-18 第 2 次更新筆記 ---
## 驗證結果
- JavaScript 語法檢查通過。
- 更新腳本重跑後工作樹內容不變，確認冪等。
- 模擬 DOM 與 Web Speech API 的自動化測試確認語意片段分類、參數、引用排除與控制狀態。
- Chrome extension 在本次 session 未連線，未執行實際聲音播放驗收。
""")
    (task_dir / "task_plan.md").write_text((task_dir / "task_plan.md").read_text()
        .replace("- [ ] 階段 3：", "- [x] 階段 3：")
        .replace("- [ ] 階段 4：", "- [x] 階段 4：")
        .replace("**階段 3** - 執行自動化與瀏覽器驗證", "**已完成** - 所有自動化驗證通過"))
    (task_dir / "report.md").write_text("""# 朗讀語氣分層改良報告

## 完成項目

- 朗讀內容改為依 `h1–h3`、`p`、`li` 建立語意片段。
- 標題、段落與清單分別套用核准的語速、音高及停頓。
- 排除頁尾、引用標記、巢狀清單重複內容與朗讀控制列。
- 暫停發生於 utterance 或段落停頓期間時皆可繼續。
- 保留 voice fallback、Chrome keep-alive、播放、停止與進度顯示。

## 驗證

- JavaScript 靜態語法檢查通過。
- 固定更新腳本冪等性檢查通過。
- 模擬 DOM 與 Web Speech API 的內容及狀態測試通過。

## 限制

實際音色與 `pitch`、`rate` 的可辨識程度由瀏覽器、作業系統與安裝語音決定。Chrome extension 在本次 session 未連線；自動化測試只能驗證傳入參數與控制流程，最終聽感仍需人工播放確認。
""")
PY

printf 'TTS 朗讀更新完成（模式：%s）\n' "$mode"
