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
document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('td > a[href^="#ref-"]').forEach(function (a) {
    // 檢查 href 是否為 #ref-{數字}，且 a 內文也是相同數字
    const href = a.getAttribute('href');
    const match = href.match(/^#ref-(\d+)$/);
    if (match && a.textContent.trim() === match[1]) {
      a.removeAttribute('href');
      a.setAttribute('id', `ref-${match[1]}`);
    }
  });
});

