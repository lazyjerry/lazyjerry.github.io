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

// 尋找所有 <td><a href="#ref-{數字}">{數字}</a></td>，將 <a> 的 href 改為 id 
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
})();
