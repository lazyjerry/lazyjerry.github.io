---
title: 科技服務資訊週記
description: AI 自動彙整的科技服務官方資訊週報，使用 Manus Plus ，希望每週一更新。
---

# 2025-08-09 科技服務資訊週記

**作者：Manus AI 　報告日期：2025-08-09**

---

## 大綱

- [大綱](#大綱)
- [總結](#總結)
- [亮點](#亮點)
- [趨勢分析](#趨勢分析)
- [參考資料](#參考資料)
- [報告說明](#報告說明)

---

<a id="總結"></a>

## 總結

近 15 天內的科技服務領域呈現出前所未有的激烈競爭態勢，**人工智慧模型**的能力邊界持續被推進。**OpenAI** 於 8 月 7 日正式發布 **GPT-5** [[1]](#ref-1)，聲稱達到「博士水平」的專業知識，同時推出開放權重模型 **gpt-oss** [[2]](#ref-2)。**Anthropic** 則在 8 月 5 日發布專為程式設計優化的 **Claude Opus 4.1** [[3]](#ref-3)，在 **SWE-bench Verified** 上達到 74.5% 的性能表現。

在開發工具領域，**GitHub Copilot** 率先整合 **GPT-5** [[4]](#ref-4)，為程式設計師提供更強大的 AI 輔助能力。**Microsoft** 也積極將 **GPT-5** 整合到消費者、開發者和企業產品中 [[5]](#ref-5)，並將 **gpt-oss** 引入 **Azure AI** 平台 [[6]](#ref-6)。

然而，AI 發展也帶來新的爭議與挑戌。**Cloudflare** 於 8 月 4 日公開指控 **Perplexity** 使用隱形爬蟲繞過網站保護機制 [[7]](#ref-7)，引發關於 AI 資料取得倫理的激烈辯論。同時，**Cloudflare** 也宣布與 **OpenAI** 合作，將新的開放模型引入 **Workers AI** 平台 [[8]](#ref-8)。這些發展反映出科技產業正處於技術突破與監管平衡的關鍵轉折點。

---

<a id="亮點"></a>

## 亮點

### AI 科技領域

**OpenAI 發布 GPT-5 與開放權重模型，展現技術領導地位**

**OpenAI** 於 2025 年 8 月 7 日正式發布 **GPT-5** [[1]](#ref-1)，這是該公司迄今為止最先進的 AI 模型。根據官方發布資訊，**GPT-5** 在推理能力、程式碼品質和使用者體驗方面都有顯著提升，特別是在處理端到端複雜編碼任務方面表現卓越。同時，**OpenAI** 也推出了針對開發者的專門版本 [[9]](#ref-9)，並為美國聯邦政府提供 **ChatGPT** 服務 [[10]](#ref-10)。

更值得注意的是，**OpenAI** 在 8 月 5 日發布了開放權重模型 **gpt-oss-120b** 和 **gpt-oss-20b** [[2]](#ref-2)，採用 **Apache 2.0** 授權。這個舉動標誌著 **OpenAI** 策略的重大轉變，從完全專有的模式轉向部分開放，讓開發者能夠在本地部署和客製化 AI 模型。這種策略既能擴大 **OpenAI** 的影響力，也能在開源社群中建立更強的生態系統。

**Anthropic 推出 Claude Opus 4.1，專攻程式設計領域**

**Anthropic** 在 2025 年 8 月 5 日發布 **Claude Opus 4.1** [[3]](#ref-3)，這是 **Claude Opus 4** 的升級版本，專注於代理任務、實際編碼和推理能力的提升。根據官方資料，**Claude Opus 4.1** 在 **SWE-bench Verified** 上達到 74.5% 的性能表現，顯著超越前代產品。

**GitHub** 指出 **Claude Opus 4.1** 在多檔案程式碼重構方面有顯著的性能提升。**Rakuten Group** 發現該模型能夠在大型程式碼庫中精確定位需要修正的地方，而不會進行不必要的調整或引入錯誤。**Windsurf** 報告顯示，**Claude Opus 4.1** 在其初級開發者基準測試中比 **Opus 4** 有一個標準差的改進，展現出與 **Sonnet 3.7** 到 **Sonnet 4** 相同程度的性能躍升。

### 軟體工程領域

**GitHub Copilot 整合 GPT-5，開啟 AI 輔助開發新時代**

**GitHub Copilot** 成為首個整合 **GPT-5** 的開發工具 [[4]](#ref-4)，為全球程式設計師提供了前所未有的 AI 輔助能力。這項整合涵蓋了 **github.com**、**Visual Studio Code** 的 **Agent**、**Ask** 和 **Edit** 模式，以及 **GitHub Mobile** 等多個平台。使用者可以透過聊天模型選擇器存取 **GPT-5** 的強大功能。

**GPT-5** 在 **GitHub Copilot** 中的應用特別針對端到端的複雜編碼任務進行了優化，能夠處理大型實作項目且只需最少的提示。更重要的是，它具備了增強的代理能力，能夠提供清晰、前瞻性的行動解釋，使其成為真正的編碼協作夥伴。這種進化代表著 AI 輔助編程從簡單的程式碼補全，發展到能夠理解和參與整個開發流程的智慧助手。

**Microsoft 全面整合 OpenAI 技術，推動 AI 生態系統發展**

**Microsoft** 積極將 **OpenAI** 的 **GPT-5** 整合到消費者、開發者和企業產品中 [[5]](#ref-5)，展現了其在 AI 領域的戰略布局。同時，**Microsoft** 也將 **OpenAI** 的開源模型 **gpt-oss** 引入 **Azure AI** 平台 [[6]](#ref-6)，為開發者提供更多選擇。

此外，**Microsoft** 還推出了 **Bing Image Creator** 的新功能，添加了 **GPT-4o** 和 **DALL-E3** [[11]](#ref-11)，為使用者提供更多免費的創作方式。這些整合展現了 **Microsoft** 在 AI 生態系統中的全方位布局，從開發工具到消費者應用，都能看到 AI 技術的深度整合。

### 網路/伺服器等基礎領域

**Cloudflare 與 Perplexity 爆發「資料主權」戰爭**

**Cloudflare** 於 8 月 4 日發布詳細報告 [[7]](#ref-7)，指控 **Perplexity** 使用隱形、未宣告的爬蟲來規避網站的禁止爬取指令。根據 **Cloudflare** 的調查，**Perplexity** 反覆修改其使用者代理並更換 IP 和 ASN，以隱藏其爬取活動，這與網站明確表達的禁止爬取偏好直接衝突。

這起爭議揭露了 AI 時代資料取得的倫理問題，也凸顯了傳統網路協議在面對 AI 應用時的局限性。**Cloudflare** 的指控基於具體證據，包括客戶反映內容仍被擷取、隱藏測試網域被存取，以及流量分析發現偽裝瀏覽器的爬蟲行為。這場爭議實際上反映了 AI 助理與傳統網路爬蟲之間的界線模糊，以及現有網路協議需要更新以適應 AI 時代的需求。

**Cloudflare 與 OpenAI 合作，推動 AI 基礎設施發展**

儘管存在與 **Perplexity** 的爭議，**Cloudflare** 仍積極與 **OpenAI** 合作，於 8 月 5 日宣布將 **OpenAI** 的新開放模型引入 **Cloudflare Workers AI** 平台 [[8]](#ref-8)。這項合作在第 0 天就提供了對 **Responses API**、**Code Interpreter** 和即將推出的 **Web Search** 功能的支援。

同時，**Cloudflare** 也在 8 月 8 日發布了關於重新設計 **Workers KV** 的更新 [[12]](#ref-12)，以提高可用性和更快的性能。在 6 月 12 日的事件後，**Cloudflare** 重新架構了 **KV** 的冗餘儲存後端，移除了單點故障，並進行了實質性的改進。這些技術改進展現了 **Cloudflare** 在雲端基礎設施領域的持續創新。

### 雲端服務與基礎設施領域

**Google Cloud 推出 AI 編碼助手，加入開發工具競爭**

**Google Cloud** 推出了新的 AI 編碼夥伴 **Gemini CLI GitHub Actions** [[13]](#ref-13)，加入了 AI 輔助開發工具的競爭行列。這項服務旨在為開發者提供更智慧的編碼協助，與 **GitHub Copilot** 和其他 AI 開發工具形成競爭關係。

此外，**Google Cloud** 也在探索 AI 在其他領域的應用，包括為護士節省數百萬小時文書工作的 AI 解決方案 [[14]](#ref-14)，以及在 **MLB 全明星賽**中展示 AI 技術的應用 [[15]](#ref-15)。這些應用展現了 **Google Cloud** 在 AI 技術商業化方面的多元化策略。

---

<a id="趨勢分析"></a>

## 趨勢分析

### AI 科技發展趨勢

**「博士級」AI 將重新定義專業服務邊界**

**OpenAI GPT-5** 聲稱達到博士水平的能力 [[1]](#ref-1) 標誌著 AI 技術即將跨越一個重要門檻。當 AI 模型能夠在特定領域提供專家級建議時，傳統的專業服務模式將面臨根本性變革。我們可以預期，在未來 12-18 個月內，將有更多專業領域開始採用 AI 輔助決策，從法律諮詢、醫療診斷到工程設計，AI 將從輔助工具演變為核心決策夥伴。

這種趨勢的深層影響在於，它將推動專業人士角色的重新定位。就像計算機的普及改變了會計師的工作內容一樣，「博士級」AI 將使專業人士更專注於創意思考、倫理判斷和人際溝通等 AI 難以替代的能力。程式設計師可能會發現，他們的價值將更多體現在系統架構設計、業務需求理解和團隊協作上，而非純粹的程式碼撰寫。

**開放與專有模式的混合策略成為主流**

**OpenAI** 發布開放權重模型 **gpt-oss** [[2]](#ref-2) 的舉動預示著 AI 公司商業策略的重要轉變。純粹的專有模式或開源模式都有其局限性，混合策略能夠同時獲得商業收益和社群支持。這種趨勢將推動 AI 生態系統的多元化發展，讓不同規模的組織都能找到適合的 AI 解決方案。

我們可以預期，更多 AI 公司將採用類似的策略，提供基礎的開源模型來建立生態系統，同時保留高階功能作為商業產品。這種模式將促進 AI 技術的普及，同時確保公司能夠維持可持續的商業模式。

**AI 模型專業化分工趨勢明確**

**Anthropic** 推出專為程式設計優化的 **Claude Opus 4.1** [[3]](#ref-3) 反映了 AI 發展的一個重要趨勢：從通用模型轉向專業化模型。這種策略類似於醫學領域的專科分工，不同的 AI 模型將在特定領域深耕，提供更精準和高效的服務。

未來我們可能會看到更多垂直領域的專業 AI 模型出現，例如專門用於金融分析的 AI、專攻生物醫學研究的 AI，或是專注於創意設計的 AI。這種專業化趨勢將促使企業重新思考其 AI 策略，從「一個模型解決所有問題」轉向「多個專業模型協同工作」的架構。

### 軟體工程領域趨勢

**AI 輔助開發將成為標準配置**

**GitHub Copilot** 整合 **GPT-5** [[4]](#ref-4) 以及 **Microsoft** 全面整合 **OpenAI** 技術 [[5]](#ref-5) 的舉動表明，AI 輔助開發正在從「可選功能」轉變為「標準配置」。未來的整合開發環境 (IDE) 如果沒有 AI 輔助功能，將被視為過時的工具。

這種趨勢將深刻改變軟體開發的工作流程。程式設計師將更多時間投入在系統設計、需求分析和程式碼審查上，而重複性的程式碼撰寫工作將大幅減少。同時，這也意味著程式設計教育需要調整重點，從語法記憶轉向邏輯思維和系統思考能力的培養。

**雲端平台 AI 服務競爭白熱化**

**Microsoft** 將 **gpt-oss** 引入 **Azure AI** [[6]](#ref-6)，**Cloudflare** 與 **OpenAI** 合作推出 **Workers AI** [[8]](#ref-8)，以及 **Google Cloud** 推出 **Gemini CLI** [[13]](#ref-13)，都顯示了雲端平台在 AI 服務領域的激烈競爭。

我們可以預期，在未來 6-12 個月內，各大雲端服務商將推出更多 AI 相關服務，從模型託管、微調服務到專業化的 AI 應用。這種競爭將推動 AI 服務的價格下降和功能提升，最終受益的將是開發者和企業用戶。

### 網路基礎設施與資料治理趨勢

**AI 時代的資料主權戰爭將愈演愈烈**

**Cloudflare** 與 **Perplexity** 的爭議 [[7]](#ref-7) 只是冰山一角，它揭示了 AI 時代資料取得與使用的根本性衝突。隨著 AI 模型對資料需求的不斷增長，內容創作者、平台營運商和 AI 公司之間的利益衝突將更加激烈。

未來我們可能會看到更多類似的爭議，以及相應的技術和法律解決方案的出現。新的技術標準和協議可能會被制定，以平衡 AI 發展需求與資料權益保護。同時，我們也可能看到更多「按次付費」的資料使用模式出現，讓內容擁有者能夠從其資料的 AI 應用中獲得合理報酬。

**邊緣運算與 AI 推理的結合趨勢**

**Cloudflare** 重新設計 **Workers KV** [[12]](#ref-12) 以及與 **OpenAI** 的合作 [[8]](#ref-8)，展現了邊緣運算與 AI 推理結合的趨勢。隨著 AI 模型變得更加高效，在邊緣節點進行 AI 推理將成為可能，這將大幅降低延遲並提高使用者體驗。

這種趨勢將推動更多邊緣運算服務商投資 AI 基礎設施，並可能導致新的商業模式出現。開發者將能夠在全球分散的邊緣節點上部署 AI 應用，為使用者提供更快速、更可靠的 AI 服務。

### 產業生態系統演進趨勢

**AI 技術民主化加速**

從 **OpenAI** 的開放權重模型 [[2]](#ref-2) 到各大雲端平台提供的 AI 服務，我們看到 AI 技術正在快速民主化。這種趨勢將使更多中小企業和個人開發者能夠接觸到先進的 AI 技術，推動創新應用的出現。

我們可以預期，在未來 12-18 個月內，將出現大量基於這些開放 AI 技術的創新應用，從垂直領域的專業工具到消費者應用，AI 技術將滲透到更多行業和場景中。

**跨平台 AI 整合成為常態**

**Microsoft** 在多個產品線中整合 **OpenAI** 技術 [[5]](#ref-5)[[6]](#ref-6)[[11]](#ref-11)，以及 **Google Cloud** 在不同領域的 AI 應用 [[13]](#ref-13)[[14]](#ref-14)[[15]](#ref-15)，都顯示了跨平台 AI 整合的趨勢。

未來，我們可能會看到更多的 AI 技術在不同平台和應用之間無縫整合，形成一個更加互聯的 AI 生態系統。這將為使用者提供更一致、更智慧的體驗，同時也將推動 AI 技術標準化的發展。

---

<a id="參考資料"></a>

## 參考資料

### AI 科技領域

| 編號                    | 文章標題                                                                                                                                         | 一句話結論                                                           | 發布日期   | 來源                                                                 |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------- | ---------- | -------------------------------------------------------------------- |
| <a id="ref-1"></a>[1]   | [Introducing GPT-5](https://www.google.com/search?q=Introducing+GPT-5)                                                                           | OpenAI 發布達到博士水平的 GPT-5 旗艦模型                             | 2025-08-07 | [OpenAI 官方新聞](https://openai.com/news/)                          |
| <a id="ref-2"></a>[2]   | [Introducing gpt-oss](https://www.google.com/search?q=Introducing+gpt-oss)                                                                       | OpenAI 發布開放權重模型 gpt-oss-120b 和 gpt-oss-20b                  | 2025-08-05 | [OpenAI 官方新聞](https://openai.com/news/)                          |
| <a id="ref-3"></a>[3]   | [Claude Opus 4.1](https://www.google.com/search?q=Claude+Opus+4.1)                                                                               | Anthropic 發布專為程式設計優化的 Claude Opus 4.1，SWE-bench 達 74.5% | 2025-08-05 | [Anthropic 官方新聞](https://www.anthropic.com/news/claude-opus-4-1) |
| <a id="ref-9"></a>[9]   | [GPT-5 for developers](https://www.google.com/search?q=GPT-5+for+developers)                                                                     | OpenAI 推出針對開發者的 GPT-5 專門版本                               | 2025-08-07 | [OpenAI 官方新聞](https://openai.com/news/)                          |
| <a id="ref-10"></a>[10] | [Providing ChatGPT to the Entire U.S. Federal Workforce](https://www.google.com/search?q=Providing+ChatGPT+to+the+Entire+U.S.+Federal+Workforce) | OpenAI 為美國聯邦政府提供 ChatGPT 服務                               | 2025-08-06 | [OpenAI 官方新聞](https://openai.com/news/)                          |

### 軟體工程領域

| 編號                    | 文章標題                                                                                                                                                                                                    | 一句話結論                                                  | 發布日期   | 來源                                                           |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ---------- | -------------------------------------------------------------- |
| <a id="ref-4"></a>[4]   | [GitHub Copilot GPT-5 Integration](https://www.google.com/search?q=GitHub+Copilot+GPT-5+Integration)                                                                                                        | GitHub Copilot 成為首個整合 GPT-5 的開發工具                | 2025-08-07 | [GitHub 官方部落格](https://github.blog/)                      |
| <a id="ref-5"></a>[5]   | [Microsoft incorporates OpenAI's GPT-5 into consumer, developer and enterprise offerings](https://www.google.com/search?q=Microsoft+incorporates+OpenAI+GPT-5+into+consumer+developer+enterprise+offerings) | Microsoft 全面將 GPT-5 整合到消費者、開發者和企業產品中     | 未知時間   | [Microsoft 官方新聞](https://news.microsoft.com/source)        |
| <a id="ref-6"></a>[6]   | [OpenAI's open‑source model: gpt‑oss on Azure AI](https://www.google.com/search?q=OpenAI+open+source+model+gpt+oss+on+Azure+AI)                                                                             | Microsoft 將 OpenAI 的開源模型 gpt-oss 引入 Azure AI 平台   | 未知時間   | [Microsoft 官方新聞](https://news.microsoft.com/source)        |
| <a id="ref-11"></a>[11] | [Bing Image Creator adds GPT-4o alongside DALL-E3 for even more free ways to create](https://www.google.com/search?q=Bing+Image+Creator+adds+GPT-4o+alongside+DALL-E3)                                      | Microsoft Bing 圖像創建器添加 GPT-4o 和 DALL-E3 功能        | 未知時間   | [Microsoft 官方新聞](https://news.microsoft.com/source)        |
| <a id="ref-13"></a>[13] | [Meet your new AI coding teammate: Gemini CLI GitHub Actions](https://www.google.com/search?q=Meet+your+new+AI+coding+teammate+Gemini+CLI+GitHub+Actions)                                                   | Google Cloud 推出新的 AI 編碼夥伴 Gemini CLI GitHub Actions | 未知時間   | [Google Cloud 官方部落格](https://blog.google/products/cloud/) |

### 網路/伺服器等基礎領域

| 編號                    | 文章標題                                                                                                                                                                                                      | 一句話結論                                                    | 發布日期   | 來源                                                 |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- | ---------- | ---------------------------------------------------- |
| <a id="ref-7"></a>[7]   | [Perplexity is using stealth, undeclared crawlers to evade website no-crawl directives](https://www.google.com/search?q=Perplexity+is+using+stealth+undeclared+crawlers+to+evade+website+no-crawl+directives) | Cloudflare 指控 Perplexity 使用隱形爬蟲繞過網站保護機制       | 2025-08-04 | [Cloudflare 官方部落格](https://blog.cloudflare.com) |
| <a id="ref-8"></a>[8]   | [Partnering with OpenAI to bring their new open models onto Cloudflare Workers AI](https://www.google.com/search?q=Partnering+with+OpenAI+to+bring+their+new+open+models+onto+Cloudflare+Workers+AI)          | Cloudflare 與 OpenAI 合作，將新的開放模型引入 Workers AI 平台 | 2025-08-05 | [Cloudflare 官方部落格](https://blog.cloudflare.com) |
| <a id="ref-12"></a>[12] | [Redesigning Workers KV for increased availability and faster performance](https://www.google.com/search?q=Redesigning+Workers+KV+for+increased+availability+and+faster+performance)                          | Cloudflare 重新設計 Workers KV 以提高可用性和性能             | 2025-08-08 | [Cloudflare 官方部落格](https://blog.cloudflare.com) |

### 雲端服務與基礎設施領域

| 編號                    | 文章標題                                                                                                                                                                   | 一句話結論                                                  | 發布日期 | 來源                                                           |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | -------- | -------------------------------------------------------------- |
| <a id="ref-14"></a>[14] | [Can AI save nurses millions of hours of paperwork?](https://www.google.com/search?q=Can+AI+save+nurses+millions+of+hours+of+paperwork)                                    | Google Cloud 探索 AI 為護士節省數百萬小時文書工作的解決方案 | 未知時間 | [Google Cloud 官方部落格](https://blog.google/products/cloud/) |
| <a id="ref-15"></a>[15] | [AI from Google Cloud steps up to the plate at the MLB All-Star Game](https://www.google.com/search?q=AI+from+Google+Cloud+steps+up+to+the+plate+at+the+MLB+All-Star+Game) | Google Cloud 的 AI 技術在 MLB 全明星賽中展示應用            | 未知時間 | [Google Cloud 官方部落格](https://blog.google/products/cloud/) |

---

<a id="報告說明"></a>

## 報告說明

本報告整理了 2025 年 7 月 25 日至 2025 年 8 月 9 日（近 15 天）期間的重要科技新聞，主要針對程式設計師群體撰寫。所有資料來源均為權威官方網站，包括 **OpenAI**、**Anthropic**、**Cloudflare**、**Microsoft** 和 **Google Cloud** 等公司的官方發布。

**資料來源說明：**

- 標記「未知時間」的項目表示該新聞確定在近期發布，但無法確定精確發布時間
- 所有引用編號均可點擊跳轉至對應的參考資料
- 快速搜尋連結可協助讀者進一步查證資訊

**報告作者：** Manus AI  
**報告日期：** 2025-08-09  
**資料範圍：** 2025-07-25 至 2025-08-09

---
