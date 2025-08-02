// 將所有 <td><a href="#ref-{數字}">{數字}</a></td> 的 <a> 轉為 <a id="ref-{數字}">{數字}</a>
(function () {
  // 取得所有 <td> 內含 <a href="#ref-{數字}">{數字}</a> 的 <a>
  const refLinks = Array.from(document.querySelectorAll('td > a[href^="#ref-"]'));
  // 過濾出 href="#ref-{數字}" 且 a 內容也是相同數字的 <a>
  const matchedLinks = refLinks.filter(a => {
    const hrefMatch = a.getAttribute('href').match(/^#ref-(\d+)$/);
    return hrefMatch && a.textContent.trim() === hrefMatch[1];
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

  // 將後面帶有 <a> 標籤的 <strong> 包覆的文字，改為 <a href="https://www.google.com/search?q={文字}">{文字}</a>
  // 例如：<strong>測試</strong><a ...>...</a> 變成 <a href="https://www.google.com/search?q=測試">測試</a><a ...>...</a>
  document.querySelectorAll('strong').forEach(function(strong) {
    // 檢查 strong 的下一個兄弟節點是否為 <a>
    let next = strong.nextSibling;
    // 跳過空白文字節點
    while (next && next.nodeType === Node.TEXT_NODE && next.textContent.trim() === '') {
      next = next.nextSibling;
    }
    if (next && next.nodeType === Node.ELEMENT_NODE && next.tagName.toLowerCase() === 'a') {
      const text = strong.textContent.trim();
      if (text) {
        // 建立新的 <a>
        const newA = document.createElement('a');
        newA.href = 'https://www.google.com/search?q=' + encodeURIComponent(text);
        newA.textContent = text;
        // 用新的 <a> 取代 <strong>
        strong.parentNode.replaceChild(newA, strong);
      }
    }
  });

})();

// 如果不是相同網域則另開新頁面
document.addEventListener('DOMContentLoaded', function () {
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
});