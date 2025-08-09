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
  if (tag !== 'p' && tag !== 'td') return false;

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
      }
      break;
    }
    
    // 如果是 p 標籤的第一個子節點，檢查父元素內容是否包含「。」
    if (tag === 'p') {
      const parentText = parent.textContent;
      if (!parentText.includes('。')) {
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
  // 取得所有 <td> 內含 <a href="#ref-{數字}">{數字}</a> 的 <a>
  const refLinks = Array.from(document.querySelectorAll('td > a[href^="#ref-"]'));
  // 過濾出 href="#ref-{數字}" 且 a 內容也是相同數字或 [數字] 的 <a>
  const matchedLinks = refLinks.filter(a => {
    const hrefMatch = a.getAttribute('href').match(/^#ref-(\d+)$/);
    return hrefMatch && (a.textContent.trim() === hrefMatch[1] || a.textContent.trim() === `[${hrefMatch[1]}]`);
  });
  // 對每一個符合條件的 <a> 進行處理
  matchedLinks.forEach(link => {
    const num = link.textContent.trim();
    const td = link.closest('td');
    if (td) {
      // 建立新的 <a>
      const newA = document.createElement('a');
      newA.setAttribute('id', `ref-${num}`);
      newA.textContent = num;
      // 清空 <td> 並插入新 <a>
      td.innerHTML = '';
      td.appendChild(newA);
    }
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