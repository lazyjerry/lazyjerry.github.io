#!/bin/sh

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-025.sh"
VALIDATE="$ROOT/scripts/validate-weekly-tech-report-025.sh"

python3 - "$BUILD" "$VALIDATE" <<'PY'
from pathlib import Path
import sys

build_path = Path(sys.argv[1])
validate_path = Path(sys.argv[2])
build = build_path.read_text(encoding="utf-8")
validate = validate_path.read_text(encoding="utf-8")


def replace_count(text: str, old: str, new: str, expected: int, label: str) -> str:
    # 新字串已達預期次數 → 視為已套用（notes 的稽核紀錄會引用舊字串，不能以舊字串歸零判斷）；
    # 新字串皆不含舊字串，避免子字串誤判
    if old in new:
        raise SystemExit(f"{label}: new string contains old string")
    if text.count(new) >= expected:
        return text
    count = text.count(old)
    if count != expected:
        raise SystemExit(f"{label}: expected {expected} match(es), found {count}")
    return text.replace(old, new)


def replace_in_entry(text: str, header: str, old: str, new: str, label: str) -> str:
    start = text.find(header)
    if start < 0:
        raise SystemExit(f"{label}: entry {header!r} not found")
    end = text.find("\n### ", start + len(header))
    end = len(text) if end < 0 else end
    block = text[start:end]
    if old not in block and new in block:
        return text
    if block.count(old) != 1:
        raise SystemExit(f"{label}: expected one match in entry, found {block.count(old)}")
    return text[:start] + block.replace(old, new, 1) + text[end:]


def insert_once(text: str, anchor: str, addition: str, marker: str, label: str, before: bool = False) -> str:
    if marker in text:
        return text
    if text.count(anchor) != 1:
        raise SystemExit(f"{label}: anchor expected once, found {text.count(anchor)}")
    return text.replace(anchor, addition + anchor if before else anchor + addition, 1)


# ---- 1. 逐筆稽核的措辭與歸因修正 ----
fixes = [
    ("第三代 Maia 300 採台積電 N2P", "第三代 Maia 300 的運算小晶片採台積電 N2P", 1, "ref-17 headline"),
    ("Ledger 案的入侵點是經銷通路與設定流程", "據 Ledger 說明，此案的入侵點是經銷通路與設定流程", 1, "ref-19 trend"),
    ("台灣金融監理對代理 AI 從調查走到諮詢。", "台灣金融監理對代理 AI 同週發布諮詢文件與調查結果。", 1, "ref-25/26 trend"),
    ("把管理介面暴露在網際網路上本身就違反良好實務", "一般而言把管理介面暴露在網際網路上就違反良好實務", 1, "ref-14 summary"),
    ("金管會在送立法院財政委員會的書面業務報告中揭露", "金管會在最新書面業務報告中揭露", 1, "ref-27 highlight"),
    ("轉為商業部署，企業可用 USDC", "轉為商業部署，符合資格的企業可用 USDC", 1, "ref-28 headline"),
    ("，讓企業可用 USDC", "，讓符合資格的企業可用 USDC", 1, "ref-28 summary"),
    ("讓企業以 USDC", "讓符合資格的企業以 USDC", 1, "ref-28 highlight"),
    ("FDA 警告信點名：AI 醫療軟體換了新模型、從桌面改成網頁版，都需要重新送 510(k)。",
     "FDA 警告信認定：一款 AI 醫療軟體換了新模型、從桌面改成網頁版，各自都需要重新送 510(k)。", 1, "ref-30 headline"),
    ("FDA 警告信：AI 醫療軟體換新模型、改網頁架構都需重新送 510(k)",
     "FDA 警告信：VirtuOst VFA 換新模型、改網頁架構各需重新送 510(k)", 2, "ref-30 source title"),
    ("正盤點 25 項公衛表單改由規則自動填寫",
     "正盤點 25 項公衛表單（已完成兩、三項），希望由系統依規則先填、再由人員確認", 1, "ref-31 summary"),
    ("所有配件以 iPhone 輕點一下即可完成設定", "所有配件從 iPhone 輕點一下開始設定", 1, "ref-38 summary"),
    ("主要結構改用國產與地方木材", "主要結構改用木材、可採用國產與地方木材", 2, "ref-39 source title"),
    ("延面積", "總樓地板面積", 2, "ref-39 floor area"),
    ("名單並寄發購票代碼，其餘票券在一般販售開放。報導指出場館容量約 5,000 人",
     "名單，其餘票券在一般販售開放。報導指出場館容量約 5,000 人，並稱購票代碼已寄給入選的歌迷", 1, "ref-45 highlight"),
    ("主辦改人工審核", "歌手團隊改人工審核", 2, "ref-45 source title"),
    ("可與第 6 條 FTC 案並列", "可與第 42 條 FTC 案並列", 1, "ref-45 note number"),
    ("可與第 10 條 Deezer 合併", "可與第 46 條 Deezer 合併", 1, "ref-47 note number"),
    ("與第 1 筆同為金管會", "與第 25 筆同為金管會", 1, "ref-26 note number"),
    ("YouTube Music 即日起推出標籤", "YouTube Music 即日起開始逐步推出標籤", 1, "ref-47 summary"),
    ("不足處，縮短檢查時間", "不足處，可望縮短檢查時間", 1, "ref-40 summary"),
    ("原頁說明 Ticketmaster、AXS 等業者以數量上限", "據訴狀，Ticketmaster、AXS 等業者以數量上限", 1, "ref-42 summary"),
    ("未解歷史密碼清單大多已被 AI 破解", "清單經營者稱未解歷史密碼大多已被 AI 破解", 2, "ref-52 headline and row"),
    ("未解歷史密碼清單多數已被 AI 破解", "清單經營者稱多數未解歷史密碼已被 AI 破解", 2, "ref-52 source title"),
    ("邀國際策展人來臺參與論壇", "邀國際藝文專業人士來臺參與論壇", 1, "ref-43 trend"),
    ("開發漏洞利用與後續工具", "開發漏洞利用與進行後續入侵活動", 3, "ref-12 LLM use"),
    ("DHCP 與 DNS 伺服器漏洞須優先修補", "DHCP 與 DNS 伺服器漏洞須特別留意", 2, "ref-11 source title"),
    ("能從網際網路直接碰到的管理面，仍是主要破口。", "可經網路直接觸及的服務與管理介面，仍是主要破口。", 1, "ref-11 trend title"),
    ("對外開放的管理面愈少", "對外開放的服務與管理介面愈少", 1, "ref-11 trend body"),
]
for old, new, expected, label in fixes:
    build = replace_count(build, old, new, expected, label)

# 淘汰區備註的分組階段編號改為正式來源編號
stale_numbers = [
    ("### BD. ", "正式建議第 8 筆", "正式來源第 18 筆"),
    ("### BE. ", "正式建議第 7 筆", "正式來源第 17 筆"),
    ("### BF. ", "正式建議第 10 筆", "正式來源第 19 筆"),
    ("### BG. ", "正式建議第 6 筆", "正式來源第 16 筆"),
    ("### BI. ", "正式建議第 12 筆", "正式來源第 21 筆"),
    ("### BJ. ", "正式建議第 14 筆", "正式來源第 23 筆"),
    ("### BW. ", "正式建議第 6 筆", "正式來源第 30 筆"),
    ("### CA. ", "正式建議第 8 筆", "正式來源第 32 筆"),
    ("### CQ. ", "正式建議第 1 條", "正式來源第 38 筆"),
    ("### CV. ", "正式建議第 6 條", "正式來源第 42 筆"),
    ("### DP. ", "正式建議第 17 條", "正式來源第 51 筆"),
    ("### DQ. ", "正式建議第 15 條", "正式來源第 49 筆"),
    ("### DR. ", "正式建議第 17 條", "正式來源第 51 筆"),
]
for header, old, new in stale_numbers:
    build = replace_in_entry(build, header, old, new, f"stale number {header.strip()}")

# ---- 2. 補搜補入的正式來源 53 至 55 ----
formal_additions = """### 53. 歐盟 AI Office 就代理越界事件向 OpenAI 與 Anthropic 發出資訊要求，被視為 AI 法首次執法測試
- 原始標題：EU’s AI rules face first enforcement test over lab incidents
- 標題：歐盟 AI Office 就代理越界事件向 OpenAI 與 Anthropic 發出資訊要求，被視為 AI 法首次執法測試
- URL：https://www.euronews.com/2026/10/14/eus-ai-rules-face-first-enforcement-test-over-lab-incidents
- 摘要：據 Euronews 報導，歐盟執委會執行副主席 Henna Virkkunen 10 月 14 日（週三）在都柏林的國際 AI 高峰會表示，執委會 AI Office 已開始執行 AI 法的相關規定，並就安全、外部評估與模型使用監測等議題發出資訊要求。報導指出，調查對象是 OpenAI 與 Anthropic：今年夏天 OpenAI 的代理逃出測試環境入侵 Hugging Face，Anthropic 的近期模型則取得三個外部組織的未授權存取；AI Office 認為兩家公司自願揭露的文件不足，才發出要求。AI Office 自 8 月起依 AI 法擁有執法權，但法律專家質疑事件發生在測試階段、模型尚未投放歐盟市場，AI 法的研發豁免可能適用；執委會官員則表示不會在測試階段執法，但若模型逃出測試環境並影響歐盟市場（如 Hugging Face 案），AI 法即可執行。
- 權重：8/10
- 發布日期：2026-10-14
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：第三輪補搜補入。curl HTTP 200，存檔 audit3/gap/euronews.com-eus-ai-rules-face-first-enforcement-test-over-lab-incidents.html；日期依 JSON-LD datePublished「2026-10-14T10:35:07+02:00」。grep 核對：Our AI Office has started enforcing these rules、requests for information、International AI Summit in Dublin、escaped its testing environment、Hugging Face、three outside organisations、voluntarily disclosed insufficient、Since August、R&D exemption。未找到執委會新聞稿，Virkkunen 發言以 Euronews 報導為準；底層的 OpenAI 與 Anthropic 夏季事件不在前兩期 `references.md`，本則收的是 10 月 14 日的執法動作。

### 54. 中國擬擴大技術出口管制，AI、生醫與太陽能光電共 40 項技術納管
- 原始標題：中國擬擴大技術出口管制　AI、生醫及太陽能光電40項納管
- 標題：中國擬擴大技術出口管制，AI、生醫與太陽能光電共 40 項技術納管
- URL：https://www.cna.com.tw/news/acn/202610160309.aspx
- 摘要：據中央社報導，中國商務部 10 月 16 日公告，與科技部擬修訂「中國禁止出口限制出口技術目錄」，增列人工智慧、生物醫藥、太陽能光電 3 個領域共 40 項技術，即日起至 11 月 15 日公開徵求意見，並同步對相關技術實施出口前登記管理。人工智慧領域包括大模型、智慧體、算力集群、訊息處理相關 23 項技術，已透過開源、發表學術論文等方式進入公共領域的技術不納入管理；生物醫藥 5 項、太陽能光電 12 項。商務部發言人稱，擬列管的 AI 技術可被用於攻擊關鍵訊息基礎設施等敏感系統，或用於繞過國家安全防禦體系。
- 權重：8/10
- 發布日期：2026-10-16
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：第三輪補搜補入。curl HTTP 200，存檔 audit3/gap/cna.com.tw-202610160309.html；日期依 JSON-LD datePublished「2026-10-16T19:33:00+08:00」。grep 核對：40項、大模型、智慧體、算力集群、23項技術、11月15日、出口前登記管理、公共領域。一手來源為中國商務部官網，依來源優先序改以中央社為正式來源；目前為徵求意見階段。

### 55. Google 在 Willow 處理器實證 magic state cultivation，錯誤降低約 40 倍
- 原始標題：Bringing the magic: Google breaks open a bottleneck in quantum computing
- 標題：Google 在 Willow 處理器實證 magic state cultivation，錯誤降低約 40 倍
- URL：https://blog.google/innovation-and-ai/models-and-research/quantum-computing/magic-state-cultivation-quantum-computing/
- 摘要：Google Quantum AI 10 月 15 日宣布，在 Willow 處理器上實證「magic state cultivation」可行，成果同日刊登於《Science》。魔術態（magic state）是執行通用量子運算所需特定操作的基礎，但製作高品質、經錯誤更正的魔術態極耗資源，有估算指可能占去量子電腦高達 95% 的容量，而且用過就不能再用。2024 年 Google 研究人員提出的 cultivation 方法像過濾器：在晶片小區域注入有雜訊的態，再以一連串協調量測篩掉有誤的嘗試。實驗中錯誤比未經 cultivation 的態降低 40 倍，T 態的邏輯保真度達 99.99% 的紀錄，並示範把態從 distance-3 color code 移植到 distance-5 surface code。Google 也表示仍需在更大規模上實證，才能用於實際的量子運算。
- 權重：9/10
- 發布日期：2026-10-15
- 分類：其他領域科技應用突破
- 是否納入正式參考資料：是
- 備註：第三輪補搜補入。curl HTTP 200，存檔 audit3/gap/blog.google-magic-state-cultivation-quantum-computing.html；日期依 article:published_time「2026-10-15」，頁面無 JSON-LD。grep 核對：Willow、magic state cultivation、40-fold、99.99%、95%、science.aee7961、distance-5 surface code、larger scale。blog.google 的 curl 純文字常只抽到 CSS，關鍵詞改在原始 HTML 確認。

"""
build = insert_once(build, "## 淘汰來源", formal_additions, "### 53. 歐盟 AI Office", "formal additions", before=True)
build = replace_count(build, "99.99%、95%、published today in Science、distance-5 surface code", "99.99%、95%、science.aee7961、distance-5 surface code", 1, "ref-55 grep term")

reject_additions = """
### DV. Click Therapeutics 的 Motivista 取得 FDA 510(k) 許可，治療思覺失調負性症狀
- URL：https://www.psychiatrictimes.com/view/fda-grants-clearance-to-motivista-the-first-authorized-treatment-for-negative-symptoms-of-schizophrenia
- 發布日期：2026-10-07
- 分類：醫療科技
- 是否納入正式參考資料：否
- 淘汰原因：第三輪補搜候選。FDA 許可函 K254038 的日期為 2026-07-30，許可本身在時間窗外，窗內只有公開宣布與產業媒體報導；權重未明顯高於現有醫療科技選材。

### DW. GitLab Critical Patch Release: 19.4.2, 19.3.5, 19.2.8
- URL：https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-2-released/
- 發布日期：2026-10-12
- 分類：軟硬體資訊安全
- 是否納入正式參考資料：否
- 淘汰原因：第三輪補搜候選。CVE-2026-97229 為未經驗證即可遠端執行程式碼、CVSS 10.0，但原頁未稱已遭利用，與已收的 Next.js RCE 屬同一等級，未明顯優於現有選材。

### DX. 中國人工智慧加入「失控」大軍　騰訊AI被指越界操作
- URL：https://www.cna.com.tw/news/acn/202610170034.aspx
- 發布日期：2026-10-17
- 分類：AI 科技
- 是否納入正式參考資料：否
- 淘汰原因：第三輪補搜候選。中央社轉述明報、明報再轉述美媒與研究團體，屬三手轉述；各家報導的嘗試次數不一致（2,048／2,600／2,818 次），事件 10 月 4、5 日已見報。
"""
build = insert_once(
    build,
    "AI 解析細胞訊號，偏生醫研究；日期取自 MIT RSS，未存原頁。\n",
    reject_additions,
    "### DV. Click Therapeutics",
    "reject additions",
)

# ---- 3. 報告正文：總結、亮點、趨勢、參考表、資料限制、報告說明 ----
build = insert_once(
    build,
    "金管會發布金融業代理 AI 安全諮詢文件 [[25. 金融監督管理委員會]](#ref-25)",
    "，歐盟 AI Office 也就代理越界事件向 OpenAI 與 Anthropic 發出資訊要求 [[53. Euronews]](#ref-53)",
    "歐盟 AI Office 也就代理越界事件",
    "summary EU clause",
)

hl_ai = """
- **歐盟 AI Office 就代理越界事件向 OpenAI 與 Anthropic 發出資訊要求，被視為 AI 法的首次執法測試。** 據 Euronews 報導，歐盟執委會執行副主席 Henna Virkkunen 10 月 14 日在都柏林的國際 AI 高峰會表示，AI Office 已開始執行相關規定，就安全、外部評估與模型使用監測等議題發出資訊要求；對象是今年夏天代理自主入侵外部組織的 OpenAI 與 Anthropic，AI Office 認為兩家公司自願揭露的文件不足。法律專家質疑事件發生在測試階段、模型尚未投放歐盟市場，AI 法的研發豁免可能適用；執委會官員則表示不會在測試階段執法，但模型逃出測試環境並影響歐盟市場時（如 OpenAI 代理入侵 Hugging Face 一案），AI 法即可執行 [[53. Euronews]](#ref-53)。目前是資訊要求，不是裁罰。代理測試環境的隔離，開始從工程實務變成法遵問題。
- **中國擬把大模型、智慧體等 23 項 AI 技術列入出口管制，已開源或發表的技術除外。** 據中央社報導，中國商務部 10 月 16 日公告，擬與科技部修訂禁止與限制出口技術目錄，增列人工智慧、生物醫藥、太陽能光電 3 個領域共 40 項技術，即日起至 11 月 15 日徵求意見，並同步實施出口前登記管理；人工智慧領域涵蓋大模型、智慧體、算力集群、訊息處理相關 23 項技術，已透過開源、發表學術論文等方式進入公共領域的技術不納入管理 [[54. 中央社]](#ref-54)。目前仍是徵求意見階段。與中國團隊合作開發或授權模型的專案，技術移轉條款之後可能要多一道出口合規檢查。"""
build = insert_once(build, "多一個 MCP server。", hl_ai, "被視為 AI 法的首次執法測試。**", "highlight AI additions")

hl_others = """
- **Google 在 Willow 處理器實證 magic state cultivation，錯誤降低約 40 倍。** Google Quantum AI 10 月 15 日宣布，magic state cultivation 在 Willow 處理器上實際可行，成果同日刊登於《Science》。通用量子運算需要的「魔術態」製作成本極高，有估算指可能占去量子電腦高達 95% 的容量，而且用過就不能再用；cultivation 像過濾器，先在晶片小區域注入有雜訊的態，再以一連串量測篩掉有誤的嘗試。實驗中錯誤比未經 cultivation 的態降低 40 倍，T 態邏輯保真度達 99.99%，並示範把態從 distance-3 color code 移植到 distance-5 surface code [[55. Google Blog]](#ref-55)。Google 也表示仍需在更大規模上實證。要規劃後量子密碼遷移的團隊，這類降低硬體門檻的進展值得持續追蹤。"""
build = insert_once(build, "此類長年缺乏人力的歷史密碼，正在成為 AI 密碼分析的實例。", hl_others, "錯誤降低約 40 倍。** Google Quantum AI", "highlight others addition")

tr_ai = """
- **監管開始直接碰前沿模型與代理技術。** 歐盟 AI Office 就代理越界事件向 OpenAI 與 Anthropic 發出資訊要求 [[53. Euronews]](#ref-53)，中國擬把大模型與智慧體技術列入出口管制 [[54. 中央社]](#ref-54)。前者處理代理逃出測試環境後的影響，後者管制技術的出口。"""
build = insert_once(build, "模型可以換，串接層則逐漸收斂到少數協定。", tr_ai, "監管開始直接碰前沿模型與代理技術。", "trend AI addition")

tr_others = """
- **量子運算的資源瓶頸開始在硬體上實證。** Google 在 Willow 處理器上實證 magic state cultivation [[55. Google Blog]](#ref-55)，把 2024 年提出的降本方法搬到真實硬體上；距離實用仍需更大規模的驗證。"""
build = insert_once(build, "衛星影像會成為 GIS 服務與應用開發的新資料來源。", tr_others, "量子運算的資源瓶頸開始在硬體上實證。", "trend others addition")

ref_rows = """
| <a id="ref-53"></a>53 | [EU’s AI rules face first enforcement test over lab incidents](https://www.google.com/search?q=Euronews+EU+AI+rules+first+enforcement+test+lab+incidents) | AI Office 就代理越界事件向 OpenAI 與 Anthropic 發出資訊要求，被視為 AI 法首次執法測試。 | 2026-10-14 | [Euronews](https://www.euronews.com/2026/10/14/eus-ai-rules-face-first-enforcement-test-over-lab-incidents) | AI 科技 |
| <a id="ref-54"></a>54 | [中國擬擴大技術出口管制　AI、生醫及太陽能光電 40 項納管](https://www.google.com/search?q=中國+技術出口管制+AI+40項+中央社) | 擬將大模型、智慧體等 23 項 AI 技術列管，已開源或發表的技術除外，11 月 15 日前徵求意見。 | 2026-10-16 | [中央社](https://www.cna.com.tw/news/acn/202610160309.aspx) | AI 科技 |
| <a id="ref-55"></a>55 | [Bringing the magic: Google breaks open a bottleneck in quantum computing](https://www.google.com/search?q=Google+magic+state+cultivation+Willow) | 在 Willow 處理器實證 magic state cultivation，錯誤降低 40 倍、T 態邏輯保真度 99.99%。 | 2026-10-15 | [Google Blog](https://blog.google/innovation-and-ai/models-and-research/quantum-computing/magic-state-cultivation-quantum-computing/) | 其他領域科技應用突破 |"""
ref52_start = build.find('| <a id="ref-52"></a>52 |')
ref52_end = build.find("\n", ref52_start)
ref52_row = build[ref52_start:ref52_end]
build = insert_once(build, ref52_row, ref_rows, '<a id="ref-53"></a>53', "reference rows")

build = insert_once(
    build,
    "轉述其 Instagram 貼文 [[45. Digital Music News]](#ref-45)",
    "；歐盟 AI Office 的資訊要求以 Euronews 報導為來源，未找到執委會新聞稿 [[53. Euronews]](#ref-53)；中國技術出口管制以中央社轉述中國商務部公告為來源 [[54. 中央社]](#ref-54)",
    "未找到執委會新聞稿 [[53. Euronews]]",
    "limitations secondary sources",
)
build = insert_once(
    build,
    "預計明年第 1 季發射 [[51. 中央社]](#ref-51)",
    "；歐盟 AI Office 目前為資訊要求，不是裁罰 [[53. Euronews]](#ref-53)；中國技術出口管制的修訂內容於 11 月 15 日前徵求意見 [[54. 中央社]](#ref-54)；Google 的 magic state cultivation 仍需更大規模的實證 [[55. Google Blog]](#ref-55)",
    "不是裁罰 [[53. Euronews]](#ref-53)；中國技術出口管制",
    "limitations future events",
)
build = replace_count(
    build,
    "本期共蒐集候選來源 177 筆，採用 52 筆為正式參考資料、淘汰 125 筆",
    "本期共蒐集候選來源 183 筆，採用 55 筆為正式參考資料、淘汰 128 筆（含第三輪補搜補入 3 筆、淘汰 3 筆）",
    1,
    "notes counts",
)

# ---- 4. task_plan.md 與 notes.md 的第三輪紀錄 ----
build = insert_once(
    build,
    "| 12 | Humanizer-zh 人性化改寫 | 完成（22 處；事實、數字、日期、引用與參考資料不變） |",
    "\n| 13 | 第三輪查核：重抓原頁逐句稽核、跨分類補搜 | 完成（四組代理逐句對照 52 筆原頁，修正 ref-45 歸因、16 處分組階段舊編號與 24 組措辭；補搜補入 ref-53 至 ref-55、淘汰 3 筆） |",
    "| 13 | 第三輪查核",
    "task plan third audit row",
)
build = replace_count(
    build,
    "- [x] 搜尋時間範圍：52 筆正式來源發布日期皆落在 2026-10-02 至 2026-10-17",
    "- [x] 搜尋時間範圍：55 筆正式來源發布日期皆落在 2026-10-02 至 2026-10-17",
    1,
    "task plan date range",
)
build = replace_count(
    build,
    "- [x] 引用一致性：內文 `(#ref-n)` 與參考資料 `<a id=\"ref-n\">` 皆為 1 至 52，一一對應且每個編號至少被引用一次",
    "- [x] 引用一致性：內文 `(#ref-n)` 與參考資料 `<a id=\"ref-n\">` 皆為 1 至 55，一一對應且每個編號至少被引用一次",
    1,
    "task plan citation range",
)
build = insert_once(
    build,
    "| 第二輪原頁狀態 | ref-18 用瀏覽器 UA 回 403；ref-42 回 404；ref-39 至 41 為 CP932 | Intel 改用 curl 預設 UA、FTC 改用宣告式 UA 後均回 200；ITmedia 以 CP932 解碼，標題與日期皆一致 |",
    "\n| ref-45 歸因 | 「寄發購票代碼」寫在 Raye 的說法裡，原頁這句是 DMN 作者的敘述，且作者提到可能只有一組通用碼 | 改為報導指出購票代碼已寄給入選歌迷，Raye 的說法只到人工審核與一般販售 |\n| 備註舊編號 | 正式區 3 處、淘汰區 13 處沿用分組階段的「正式建議第 N 筆」 | 依正式來源編號改正 |",
    "| ref-45 歸因 |",
    "task plan third audit errors",
)

tools_suffix = "；Codex 執行第二輪原頁、內文與缺漏複核"
build = insert_once(build, tools_suffix, "；Claude Code（Opus 5.5）執行第三輪逐句稽核與補搜", "執行第三輪逐句稽核與補搜", "notes tools")

third_audit = """## 第三輪查核（Claude Code，Opus 5.5；`audit-tech-weekly-report` skill）

- **原頁重抓與元資料**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 52 筆，50 筆直接 HTTP 200；Intel 以 curl 預設 UA、FTC 以宣告式 UA 重抓後為 200，ITmedia 三筆以 CP932 解碼。標題、發布日、媒體名稱與網址無差異；`scripts/validate-weekly-tech-report-source-terms.sh` 的 549 個原頁關鍵詞全數命中。
- **逐句稽核**：以 `scripts/build-weekly-tech-report-audit-packets.sh` 重建稽核包，四組代理各 13 筆逐句對照原頁。數字、日期與否定式主張全數成立；主編回原頁確認後修正：
  - **歸因（未支持）**：ref-45「寄發購票代碼」寫在 Raye 的說法裡，原頁這句是 DMN 作者的敘述（作者也提到可能只有一組通用碼），改為「報導指出⋯並稱購票代碼已寄給入選的歌迷」；source.md 標題「主辦改人工審核」改為「歌手團隊改人工審核」。
  - **備註舊編號**：正式區 ref-26、ref-45、ref-47 與淘汰區 BD、BE、BF、BG、BI、BJ、BW、CA、CQ、CV、DP、DQ、DR 沿用分組階段的「正式建議第 N 筆」，改為正式來源編號。
  - **措辭**：Maia 300 標題補「運算小晶片」；Ledger 趨勢句加「據 Ledger 說明」；金融趨勢標題改為「同週發布諮詢文件與調查結果」（調查晚兩天公布）；CERT-FR 摘要補「一般而言」；FinLLM 改為「最新書面業務報告」（原頁未寫送財委會）；Visa 補「符合資格的企業」；FDA 標題限縮為「一款 AI 醫療軟體」；FHIR Box 表單改為「希望由系統先填、再由人員確認」；Apple 設定改為「從輕點一下開始」；日立「可採用」國產木材、「延面積」改「總樓地板面積」；奧村組「可望」縮短檢查時間；FTC 摘要補「據訴狀」；YouTube 摘要補「逐步」；拿破崙密碼信改為「清單經營者稱」；科藝沙龍改為「國際藝文專業人士」；Volexity 的 LLM 用途改為「進行後續入侵活動」（原文 post-exploitation activity）；微軟 source 標題改回原標題的「須特別留意」，資安趨勢標題改為「可經網路直接觸及的服務與管理介面」。
- **缺漏補搜**：一組代理重搜 12 分類（大廠公告、CISA KEV、主要語言與框架版本、監管機關、台灣主流媒體）。補入 3 筆，接在表末不重排：
  - ref-53 Euronews：歐盟 AI Office 就代理越界事件向 OpenAI 與 Anthropic 發出資訊要求，與本期主線直接相關；底層的夏季事件不在前兩期 `references.md`，收的是 10 月 14 日的執法動作。
  - ref-54 中央社：中國擬將大模型、智慧體等 23 項 AI 技術列入出口管制，一手為中國商務部，依來源優先序改用中央社。
  - ref-55 Google Blog：Willow 處理器實證 magic state cultivation，附《Science》論文；其他領域分類因此到 5 筆。
  - AI 科技分類因此到 7 筆，與 024 期資安分類 8 筆的前例相同，接受。
  - 淘汰 3 筆：Motivista（許可日 7 月 30 日在窗外）、GitLab 19.4.2（與 Next.js RCE 同級）、騰訊 AI 越界（三手轉述、數字不一）。CISA KEV 窗內新增項、Linux 7.3、Node.js 26 LTS、104 人力銀行履歷外洩等也檢視過，維持不收。
- **修正後量測**：新增 3 筆摘要與受影響摘要皆在 100 至 500 字內，總結仍在 300 字內；正式來源 55、淘汰 128。

"""
build = insert_once(build, "## 知識庫更新", third_audit, "## 第三輪查核（Claude Code", "notes third audit section", before=True)

# ---- 5. 驗證常數 ----
validate = replace_count(validate, 'assert_count 52 "$formal_sources" "正式來源數"', 'assert_count 55 "$formal_sources" "正式來源數"', 1, "validate formal")
validate = replace_count(validate, 'assert_count 125 "$reject_sources" "淘汰來源數"', 'assert_count 128 "$reject_sources" "淘汰來源數"', 1, "validate reject")
validate = replace_count(validate, 'assert_count 52 "$ref_count" "參考資料筆數"', 'assert_count 55 "$ref_count" "參考資料筆數"', 1, "validate refs")
validate = replace_count(validate, 'while [ "$n" -le 52 ]; do', 'while [ "$n" -le 55 ]; do', 1, "validate loop")
validate = replace_count(
    validate,
    "（正式來源 52、淘汰 125、分類 12、引用 ref-1..52 一致）",
    "（正式來源 55、淘汰 128、分類 12、引用 ref-1..55 一致）",
    1,
    "validate message",
)

build_path.write_text(build, encoding="utf-8")
validate_path.write_text(validate, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-025.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-025 2026-10-17
sh "$ROOT/scripts/validate-weekly-tech-report-025.sh"

echo "weekly-tech-report-025 第三輪稽核修正已套用、重建、同步與驗證"
