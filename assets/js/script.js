/**
 * 判斷 <strong> 標籤是否位於段落（<p> 或 <td>）的開頭。
 * 
 * 用途：
 *   - 用於判斷 <strong> 是否為父元素的第一個非空白子節點，
 *     或其前方是否有 <br> 標籤，這些情況都視為「段落開頭」。
 *   - 主要用於後續自動化處理，例如避免在段落開頭的 <strong> 自動加上 Google 搜尋連結。
 * 
 * 判斷邏輯：
 *   1. 父元素必須是 <p> 或 <td>。
 *   2. 如果 <strong> 是父元素第一個非空白子節點，則：
 *      - 檢查其前方是否有 <br>，有的話也算段落開頭。
 *      - 否則直接視為段落開頭。
 *   3. 如果不是第一個非空白子節點，仍需檢查其前方是否有 <br>。
 *   4. 其他情況皆回傳 false。
 * 
 * @param {HTMLElement} strong - 欲判斷的 <strong> 元素
 * @returns {boolean} - 是否為段落開頭
 */
function isParagraphStart(strong) {
  const parent = strong.parentNode;
  if (!parent) return false;
  const tag = parent.tagName?.toLowerCase();
  if (tag !== 'p' && tag !== 'td' && tag !== 'li') return false;

  // 檢查 strong 是否為父元素第一個非空白子節點
  let firstNonEmpty = null;
  for (let node of parent.childNodes) {
    if (node.nodeType === Node.TEXT_NODE && node.textContent.trim() === '') continue;
    firstNonEmpty = node;
    break;
  }
  if (firstNonEmpty === strong) {
    // 檢查 strong 前方是否有 <br>，有的話也算段落開頭
    let prev = strong.previousSibling;
    while (prev) {
      if (prev.nodeType === Node.TEXT_NODE && prev.textContent.trim() === '') {
        prev = prev.previousSibling;
        continue;
      }
      if (prev.nodeType === Node.ELEMENT_NODE && prev.tagName.toLowerCase() === 'br') {
        return true;
      }else if (prev.nodeType === Node.ELEMENT_NODE && prev.tagName.toLowerCase() === 'li') {
        return true;
      }else if (prev.nodeType === Node.ELEMENT_NODE && prev.tagName.toLowerCase() === 'p') {
        return true;
      }
      break;
    }
    
    // 如果是 p 標籤的第一個子節點，檢查 strong 內容是否包含「。」
    if (tag === 'p') {
      // 檢查 p 是否只有這個 strong 標籤，如果是則視為段落開頭
      if (parent.childNodes.length === 1) {
        return true;
      }
      const strongText = strong.textContent.trim();
      if (strongText.includes('：')) {
        return true;
      }
      if (!strongText.includes('。')) {
        return false;
      }
      
    }
    
    return true;
  }

  // 若不是第一個非空白節點，仍需檢查 strong 前方是否有 <br>
  let prev = strong.previousSibling;
  while (prev) {
    if (prev.nodeType === Node.TEXT_NODE && prev.textContent.trim() === '') {
      prev = prev.previousSibling;
      continue;
    }
    if (prev.nodeType === Node.ELEMENT_NODE && prev.tagName.toLowerCase() === 'br') {
      return true;
    }
    break;
  }
  return false;
}

(function () {
  /**
   * 將所有表格中形如 <td><a href="#ref-{數字}">{數字}</a></td> 的引用連結，
   * 轉換為 <td><a id="ref-{數字}">{數字}</a></td>，也就是把 <a> 的 href 屬性改為 id 屬性，
   * 以便於在頁面內作為參考來源的錨點。
   * 
   * 1. 取得所有 <td> 內含 <a href="#ref-{數字}">{數字}</a> 的 <a> 元素。
   * 2. 過濾出 href 屬性為 "#ref-{數字}"，且 a 內容也是相同數字（或 [數字]）的 <a>。
   * 3. 對每一個符合條件的 <a>，將其父 <td> 內容清空，插入一個新的 <a>，
   *    並將 href 屬性改為 id 屬性，內容維持數字。
   */
  // 取得所有 <td> 內的 <a> 標籤
  const refLinks = Array.from(document.querySelectorAll('td a[id^="ref-"]'));
  
  // 過濾出符合條件的引用連結
  const matchedLinks = refLinks.filter(a => {
    const td = a.closest('td');
    if (!td) return false;
    
    // 取得 td 的純文字內容，去除 <a> 標籤後的內容
    const tdText = td.textContent.trim();
    
    // 檢查是否有中文字或英文字母（不包含數字、方括號、空白）
    if (/[a-zA-Z\u4e00-\u9fff]/.test(tdText)) {
      return false;
    }
    
    // 檢查 href 或 id 屬性格式
    const hrefMatch = a.getAttribute('href')?.match(/^#ref-(\d+)$/);
    const idMatch = a.getAttribute('id')?.match(/^ref-(\d+)$/);
    
    if (hrefMatch) {
      const num = hrefMatch[1];
      const text = a.textContent.trim();
      return text === num || text === `[${num}]`;
    }
    
    if (idMatch) {
      const num = idMatch[1];
      // 檢查 td 內容是否符合 [數字]<a id="ref-數字"></a> 或 <a id="ref-數字"></a>[數字] 格式
      return tdText === `[${num}]` || tdText === num;
    }
    
    return false;
  });
  // 對每一個符合條件的 <a> 進行處理
  matchedLinks.forEach(link => {
    const td = link.closest('td');
    if (!td) return;
    
    // 取得數字
    let num;
    const hrefMatch = link.getAttribute('href')?.match(/^#ref-(\d+)$/);
    const idMatch = link.getAttribute('id')?.match(/^ref-(\d+)$/);
    
    if (hrefMatch) {
      num = hrefMatch[1];
    } else if (idMatch) {
      num = idMatch[1];
    } else {
      return;
    }
    
    // 建立新的 <a>
    const newA = document.createElement('a');
    newA.setAttribute('id', `ref-${num}`);
    newA.textContent = num;
    
    // 清空 <td> 並插入新 <a>
    td.innerHTML = '';
    td.appendChild(newA);
  });

  /**
   * 將所有非段落開頭的 <strong> 文字自動轉為 Google 搜尋連結
   * 
   * 1. 遍歷所有 <strong> 標籤。
   * 2. 若該 <strong> 不是段落開頭（即 isParagraphStart(strong) 為 false），
   *    且其內容非空，則將其內容包裝成一個指向 Google 搜尋該文字的新 <a> 連結。
   * 3. 這樣可讓文章中強調的詞彙（非標題開頭）點擊後直接 Google 搜尋。
   */
  document.querySelectorAll('strong').forEach(function(strong) {

    if (!isParagraphStart(strong)) {
      const text = strong.textContent.trim();
      if (text) {
        const newA = document.createElement('a');
        newA.href = 'https://www.google.com/search?q=' + encodeURIComponent(text);
        newA.textContent = text;
        strong.innerHTML = '';
        strong.appendChild(newA);
      }
    }
    
  });

// ---------------------------------
  /**
   * 將所有 <a> 連結進行判斷：
   * 若 href 指向的網址不是本站（不同網域），
   * 則自動加上 target="_blank" 與 rel="noopener noreferrer"，
   * 讓使用者點擊時於新分頁開啟，並提升安全性。
   */
  document.querySelectorAll('a[href]').forEach(function (link) {
    try {
      const linkUrl = new URL(link.href, window.location.origin);
      if (linkUrl.origin !== window.location.origin) {
        link.setAttribute('target', '_blank');
        link.setAttribute('rel', 'noopener noreferrer');
      }
    } catch (e) {
      // 忽略無效的 URL
    }
  });

})(); // end of (function () {})()

// TTS — 語音朗讀功能
(function () {
  if (!('speechSynthesis' in window)) return;

  const synth = window.speechSynthesis;
  let chunks = [];
  let chunkIndex = 0;
  let isPaused = false;

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

  function getChunks() {
    var content = document.querySelector('.main-content');
    var clone = content ? content.cloneNode(true) : document.body.cloneNode(true);
    var footer = clone.querySelector('.site-footer');
    if (footer) footer.remove();
    var text = (clone.innerText || clone.textContent || '').replace(/\t/g, ' ');
    return text.split('\n').map(function (s) { return s.trim(); }).filter(function (s) { return s.length > 1; });
  }

  function getVoice() {
    var voices = synth.getVoices();
    return voices.find(function (v) { return v.lang === 'zh-TW'; }) ||
           voices.find(function (v) { return v.lang === 'zh-HK'; }) ||
           voices.find(function (v) { return v.lang.startsWith('zh'); }) ||
           null;
  }

  function speakChunk(index) {
    if (index >= chunks.length) { reset(); return; }
    chunkIndex = index;
    progress.textContent = (index + 1) + '/' + chunks.length;

    var u = new SpeechSynthesisUtterance(chunks[index]);
    u.lang = 'zh-TW';
    u.rate = 1.0;
    var voice = getVoice();
    if (voice) u.voice = voice;

    u.onend = function () { if (!isPaused) speakChunk(index + 1); };
    u.onerror = function (e) { if (e.error !== 'interrupted') reset(); };
    synth.speak(u);
  }

  function reset() {
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
    playBtn.disabled  = true;
    pauseBtn.disabled = false;
    stopBtn.disabled  = false;
    if (synth.getVoices().length === 0) {
      synth.addEventListener('voiceschanged', function () { speakChunk(0); }, { once: true });
    } else {
      speakChunk(0);
    }
  });

  pauseBtn.addEventListener('click', function () {
    if (synth.paused) {
      synth.resume();
      isPaused = false;
      pauseBtn.textContent = '⏸ 暫停';
    } else {
      synth.pause();
      isPaused = true;
      pauseBtn.textContent = '▶ 繼續';
    }
  });

  stopBtn.addEventListener('click', reset);
})();