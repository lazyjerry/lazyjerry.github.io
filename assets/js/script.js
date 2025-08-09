(function () {
  // 將所有 <td><a href="#ref-{數字}">{數字}</a></td> 的 <a> 轉為 <a id="ref-{數字}">{數字}</a>
  // 取得所有 <td> 內含 <a href="#ref-{數字}">{數字}</a> 的 <a>
  const refLinks = Array.from(document.querySelectorAll('td > a[href^="#ref-"]'));
  // 過濾出 href="#ref-{數字}" 且 a 內容也是相同數字的 <a>
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

  document.querySelectorAll('strong').forEach(function(strong) {

    // 檢查 <strong> 是否是段落開頭，如果不是，則將 <strong> 包覆的文字，改為 <a href="https://www.google.com/search?q={文字}">{文字}</a>
    // 判斷 strong 是否為段落開頭：前一個兄弟節點為 null 或僅為空白文字節點，且父元素為 <p>
    let prev = strong.previousSibling;
    while (prev && prev.nodeType === Node.TEXT_NODE && prev.textContent.trim() === '') {
      prev = prev.previousSibling;
    }
    // 如果 strong 不是段落開頭（即有前一個非空白兄弟節點，或父元素不是 <p>），才進行替換
    // 添加條件：strong 不是在列表或表格中，且前面不是<br>
    if ((prev !== null || strong.parentNode.tagName.toLowerCase() !== 'p' || strong.parentNode.tagName.toLowerCase() !== 'td' || strong.previousSibling.tagName.toLowerCase() !== 'br')) {
      const text = strong.textContent.trim();
      if (text) {
        const newA = document.createElement('a');
        newA.href = 'https://www.google.com/search?q=' + encodeURIComponent(text);
        newA.textContent = text;
        // 將 <a> 插入到 <strong> 內部，並保留 <strong> 標籤
        strong.innerHTML = '';
        strong.appendChild(newA);
      }
    }
    
  });

// ---------------------------------
  // 如果不是相同網域則另開新頁面
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

})();