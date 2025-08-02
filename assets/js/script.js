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

// 尋找所有 <td><a href="#ref-{數字}">{數字}</a></td>，只處理最後一個，將其 <a> 改為 <a id="ref-1">{數字}</a>
(function () {
  // 取得所有符合條件的 <a>
  const refLinks = Array.from(document.querySelectorAll('td > a[href^="#ref-"]'));
  // 過濾 href="#ref-{數字}" 且 a 內容也是數字
  const matchedLinks = refLinks.filter(a => {
    const hrefMatch = a.getAttribute('href').match(/^#ref-(\d+)$/);
    return hrefMatch && a.textContent.trim() === hrefMatch[1];
  });
  if (matchedLinks.length > 0) {
    const lastLink = matchedLinks[matchedLinks.length - 1];
    // 取得數字
    const num = lastLink.textContent.trim();
    // 取得 <td>
    const td = lastLink.closest('td');
    if (td) {
      // 建立新的 <a>
      const newA = document.createElement('a');
      newA.setAttribute('id', `ref-${num}`);
      newA.textContent = num;
      // 清空 <td> 並插入新 <a>
      td.innerHTML = '';
      td.appendChild(newA);
    }
  }
})();
