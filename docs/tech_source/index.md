蒐集科技服務關鍵字：
Hugging Face, OpenAI, Anthropic, YouAI, GitHub Copilot, GitHub, Manus, Grok,
Apple, Microsoft, Azure, Nvidia, Tesla, Meta, Cloudflare, Perplexity, AWS,
Google, Vultr, DigitalOcean, Kamatera, Ollama, Docker

時間規範：
時間基準: {TODAY} = 執行當天
時間範圍: {DAYS_RANGE} = 15 (可調整)
開始日期: {START_DATE} = {TODAY} - {DAYS_RANGE} 天
結束日期: {END_DATE} = {TODAY}
當前年份: {CURRENT_YEAR} = 執行當年
當前月份: {CURRENT_MONTH} = 執行當月

優先來源：
huggingface.co/blog
openai.com/zh-Hant/news/
anthropic.com/news
manus.im/updates
you.com
github.com/features/copilot/whats-new
github.com/newsroom
github.com/trending?since=weekly&spoken_language_code=
apple.com/newsroom/
news.microsoft.com/source
azure.microsoft.com/en-us/blog/
nvidianews.nvidia.com/
tesla.com/blog
about.fb.com/news/
blog.cloudflare.com
blog.google/products/android-chrome-play/
blog.google/products/platforms-devices/
blog.google/products/cloud/
blog.google/products/explore-get-answers/
linode.com/blog/
vultr.com/news/
digitalocean.com/press/releases
kamatera.com/topics/news/
highscalability.com/
netflixtechblog.com/
uber.com/blog/engineering/
ai.googleblog.com/
ai.meta.com/blog/
techcrunch.com/
theverge.com/
arstechnica.com/
technews.tw/
bnext.com.tw/
buzzorange.com/techorange/
inside.com.tw/
ithome.com.tw/
infoq.com/
news.ycombinator.com/
thehackernews.com/
coindesk.com/
searchengineland.com/
crunchbase.com/
stratechery.com/
a16z.com/
reddit.com/r/programming/
lobste.rs/
www.docker.com/blog

範圍：

- 僅收集 {START_DATE} 至 {END_DATE} 期間的新聞、報導、評論
- 如果沒有指定日期則以當下時間往前計算 15 天內
- 無日期則忽略；若確認在期間內但日期不詳，標註 \*未知時間
