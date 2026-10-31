#!/bin/sh
# weekly-tech-report-027 撰稿後逐筆稽核（四組 tech-auditor 對照本機原頁）：
# 以斷言式替換修改 canonical build script，再 build → deliver → validate。可重複執行。

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-027.sh"

python3 - "$BUILD" <<'PY'
import sys
from pathlib import Path

build_path = Path(sys.argv[1])
build = build_path.read_text(encoding="utf-8")

# 第三輪（apply-weekly-tech-report-027-third-audit.sh）改寫過的句子：命中也算已套用
SUPERSEDED = {
    "ref-4 source lean": "Anthropic 指出，真實的代理有時也會有傾向",
    "ref-4 report lean": "Anthropic 也指出，真實的代理有時也會有傾向",
    "ref-7 source enterprise": "現有 Copilot Business 與 Copilot Enterprise 客戶可維持既有方案",
    "ref-7 report enterprise": "現有 Copilot Business 與 Copilot Enterprise 客戶可維持既有方案",
    "ref-7 trim fusion": "端到端的軟體交付系統。Copilot Fusion 依任務協調一個或多個模型，在",
    "ref-17 touch": "macOS 會自動把觸控轉成點擊，許多既有 App 可直接使用",
    "ref-17 trend": "；更新後的手勢 API 讓開發者能打造專為觸控設計的體驗。",
    "ref-20 note": "Intel 新聞稿全文為計畫與預期，無上市時程。稽核時以瀏覽器 UA 重抓回 403；第二輪起改用",
    "ref-21 note": "「唯一能…」為 Intel 自述；交易尚待核准。稽核時以瀏覽器 UA 重抓回 403；第二輪起改用",
    "ref-31 ending": "已有 CE 標示的醫材與 IVD，",
    "ref-33 sought": "尋求減輕健康 AI 開發商的法規負擔，並建立了新的給付方式",
}


def replace(text: str, old: str, new: str, label: str, count: int = 1) -> str:
    """新字串已在則視為已套用（追加型替換的新字串包含舊字串，必須先看新的）；否則舊字串需恰好出現 count 次。"""
    if new in text or SUPERSEDED.get(label, "\0") in text:
        return text
    n_old = text.count(old)
    if n_old == count:
        return text.replace(old, new)
    raise SystemExit(f"{label}: expected {count} old anchor(s), found {n_old}")


# ---------- 第一組：ref-1 至 ref-14 ----------
fixes = [
    # ref-1 基準出處、時態
    ("Gemini 4 Carbon 的基準為 Google 公布 [[1. iThome]](#ref-1)",
     "Gemini 4 Carbon 的 17 項基準與三項資安基準為 Google 公布，Artificial Analysis 指數則是第三方評測機構的結果 [[1. iThome]](#ref-1)",
     "ref-1 limitations", 1),
    ("Google 先透過 Fairwind Program", "Google 本週起先透過 Fairwind Program", "ref-1 report", 1),
    # ref-3 Just three weeks、Earlier this month、平均
    ("之後又經約三週強化學習", "之後再做三週強化學習", "ref-3 three weeks", 2),
    ("10 月初先以公開預覽推出", "10 月稍早先以公開預覽推出", "ref-3 earlier this month", 2),
    ("但每項任務少用 47% Token。**", "但每項任務平均少用 47% Token。**", "ref-3 heading", 1),
    # ref-4 五項決策、傾向是刻意加強、38 例
    ("代理在四項分析選擇上偏好某一選項", "代理在五項決策（四項分析選擇與最終建議）上各偏好某一選項", "ref-4 five decisions", 2),
    ("Anthropic 指出代理的傾向是刻意加強的，未給明確傾向時 Claude Opus 4.8 在 123 次執行中有 112 次做出相同的五項選擇，現實影響可能較小；",
     "Anthropic 指出，真實的代理本來就會有傾向，未指定傾向時 Claude Opus 4.8 在 123 次執行中有 112 次做出相同的五項選擇，本實驗則刻意加強傾向；代理未被要求表達偏好時，影響可能較小；",
     "ref-4 source lean", 1),
    ("Anthropic 也指出傾向是刻意加強的，未給明確傾向時，Claude Opus 4.8 在 123 次執行中有 112 次做出相同的五項選擇，現實影響可能較小 [[4.",
     "Anthropic 也指出，真實的代理本來就會有傾向，未指定傾向時 Claude Opus 4.8 在 123 次執行中有 112 次做出相同的五項選擇，本實驗則刻意加強傾向；代理未被要求表達偏好時，影響可能較小 [[4.",
     "ref-4 report lean", 1),
    ("代理同意時只有 6%。事後", "代理同意時只有 6%（僅 38 例，原文自述估計不精確）。事後", "ref-4 source 38 cases", 1),
    ("代理同意時只有 6%；事後", "代理同意時只有 6%（僅 38 例，原文自述估計不精確）；事後", "ref-4 report 38 cases", 1),
    # ref-5 盡量鼓勵開放、預計
    ("原則上盡量開放", "原則上盡量鼓勵開放", "ref-5 open", 2),
    ("**國科會表示 TAIDE 年底前公布", "**國科會表示 TAIDE 預計年底前公布", "ref-5 heading", 1),
    # ref-7 within two points、GitHub Sales、一個或多個模型
    ("相差兩分", "的差距在兩分以內", "ref-7 two points", 2),
    ("依 AI 點數計費。基礎設施方面",
     "依 AI 點數計費，目前透過 GitHub Sales 洽購，現有 Business 與 Enterprise 客戶可維持既有方案。基礎設施方面",
     "ref-7 source enterprise", 1),
    ("依 AI 點數計費；GitHub 今年",
     "依 AI 點數計費，目前透過 GitHub Sales 洽購，現有 Business 與 Enterprise 客戶可維持既有方案；GitHub 今年",
     "ref-7 report enterprise", 1),
    ("改依 AI 點數計費後，團隊要重新估算", "若轉為 AI 點數計費，團隊要重新估算", "ref-7 ending", 1),
    ("Enterprise 改依 AI 點數", "Enterprise 可改依 AI 點數", "ref-7 table", 1),
    ("依任務協調多個模型", "依任務協調一個或多個模型", "ref-7 models", 2),
    # ref-10 修正條件
    ("PowerShell hook 未依 exit code 2 阻擋、--restricted 工作階段可能上傳工作目錄外檔案",
     "特定寫法下 PowerShell hook 未依 exit code 2 阻擋、--restricted 工作階段在 Read 允許規則涵蓋時可能上傳工作目錄外檔案",
     "ref-10 fixes", 2),
    # ref-11 官方表示、相容性
    ("，後續測試版與正式版也將採用", "，官方表示後續測試版與正式版也將採用", "ref-11 later builds", 2),
    ("主要為了改善 Claude Code、Codex 在 IDE 裡的操作",
     "主要為了改善 Claude Code、Codex 等代理與 Neovim、tmux 等工具在 IDE 裡的相容性",
     "ref-11 trend", 1),
    # ref-12 歸因、發行版狀態
    ("，成因是不同 CPU", "，Linux 核心 CVE 團隊指出成因是不同 CPU", "ref-12 cause", 2),
    ("部分發行版暫緩修補。", "部分發行版尚未修補。", "ref-12 table", 1),
    # ref-13 很快、AI 判斷依據
    ("單一漏洞很快被串成攻擊鏈。", "單一漏洞被串成攻擊鏈。", "ref-13 trend", 1),
    ("等工具，認為駭客很可能利用 AI 協助開發", "等工具，並依約 40 支指令碼風格一致，認為駭客很可能利用 AI 協助開發", "ref-13 source", 1),
    # ref-14 修補範圍
    ("Brotli 漏洞則沿著 .NET、PHP、Python 與 Node.js 的相依關係擴散",
     "Brotli 漏洞的修補範圍則從 Node.js 擴及 .NET、PHP、Python 與多個 Linux 發行版",
     "ref-14 trend", 1),
]

# ---------- 第二組：ref-15 至 ref-28 ----------
fixes += [
    # ref-15 修補版本、成因
    ("；SGLang 於 v0.5.21 修正此問題。", "；修補自 SGLang v0.5.20 釋出，Cloudflare 建議升級至 v0.5.22 以上。", "ref-15 source", 1),
    ("SGLang 於 v0.5.21 修正 [[15.", "修補自 SGLang v0.5.20 釋出，Cloudflare 建議升級至 v0.5.22 以上 [[15.", "ref-15 report", 1),
    ("屬於推論架構的設定問題，而不是傳統 Web 應用的權限漏洞", "屬於推論引擎的設定錯誤加上引擎處理超長請求的缺陷", "ref-15 trend", 1),
    # ref-17 多數既有 App、手勢 API、H1
    ("(#ref-17)。Mac App 多了一種輸入方式要測。\n- **Apple 的 M6 晶片", "(#ref-17)。\n- **Apple 的 M6 晶片", "ref-17 ending", 1),
    ("macOS 會自動把觸控轉成點擊", "macOS 會自動把觸控轉成點擊，多數既有 App 可直接使用", "ref-17 touch", 2),
    ("；短期內 Mac App 要同時顧及有觸控和沒觸控的機型。", "；想做專為觸控設計的體驗，要用更新後的手勢 API。", "ref-17 trend", 1),
    ("with PROLED XDR Display\n", "with PROLED XDR Display and Touch for the first time on Mac\n", "ref-17 source title", 1),
    ("with PROLED XDR Display](", "with PROLED XDR Display and Touch for the first time on Mac](", "ref-17 table title", 1),
    # ref-19 初期、測試中
    ("Helios 機櫃已在 Meta 安裝測試", "初期的 Helios 機櫃已在 Meta 安裝、測試中", "ref-19 heading", 4),
    ("Helios 機櫃級方案已在 Meta 安裝並測試", "初期的 Helios 機櫃級方案已在 Meta 安裝、測試中", "ref-19 body", 2),
    ("雲端業者的加速器選項變多", "OCI 上的加速器選項變多", "ref-19 trend", 1),
    # ref-20、ref-21 稽核重抓 403
    ("Intel 新聞稿全文為計畫與預期，無上市時程。",
     "Intel 新聞稿全文為計畫與預期，無上市時程。稽核時以瀏覽器 UA 重抓回 403，以蒐集時的副本為準。",
     "ref-20 note", 1),
    ("「唯一能…」為 Intel 自述；交易尚待核准。",
     "「唯一能…」為 Intel 自述；交易尚待核准。稽核時以瀏覽器 UA 重抓回 403，以蒐集時的副本為準。",
     "ref-21 note", 1),
    ("以接近傳統矽製造的設備與製程", "以傳統矽半導體製造通用的設備與製程", "ref-21 silicon", 2),
    # ref-23 208% 的分母是全部網路層攻擊
    ("持續不到 10 分鐘且低於 1 Gbps 的短時攻擊成長 208%，96% 在 10 分鐘內結束",
     "網路層攻擊比 2025 年同季增加 208%，其中 96% 在 10 分鐘內結束、98% 低於 1 Gbps",
     "ref-23 denominator", 2),
    # ref-26 將
    ("甲骨文在 OCI 資料中心部署 TPU", "甲骨文將在 OCI 資料中心部署 TPU", "ref-26 future", 2),
    # ref-27 CSD、職稱
    ("接受以分散式帳本技術（DLT）發行的可交易資產", "接受在中央證券保管機構以分散式帳本技術（DLT）發行的可交易資產", "ref-27 CSD", 2),
    ("**ECB 執行董事 Cipollone：", "**ECB 執行董事會成員 Cipollone：", "ref-27 heading", 1),
]

# ---------- 第三組：ref-29 至 ref-43 ----------
fixes += [
    # ref-29 引言歸 Craig Ramsey、示範
    ("新聞稿引述 ACI 與 Circle 主管的說法，指穩定幣的討論正從可能性走向實務，目標是讓機構在熟悉的營運環境中評估新的結算模式。",
     "新聞稿引述 ACI 主管 Craig Ramsey 的說法，指穩定幣的討論正從可能性走向實務，並稱此合作讓機構能在熟悉的營運環境中評估新的結算模式。",
     "ref-29 source", 1),
    ("新聞稿引述雙方主管，指穩定幣的討論正從可能性走向實務，目標是讓機構在熟悉的營運環境中評估新的結算模式",
     "新聞稿引述 ACI 主管 Craig Ramsey，指穩定幣的討論正從可能性走向實務；新聞稿稱此合作讓機構能在熟悉的營運環境中評估新的結算模式",
     "ref-29 report", 1),
    ("ACI 把 USDC 結算放進", "ACI 與 Circle 示範把 USDC 結算放進", "ref-29 trend", 1),
    # ref-31 許可方式針對醫材整體
    ("並推進 AI 醫療器材新授權架構", "並推進可因應 AI 的醫療器材新許可方式", "ref-31 source title", 2),
    ("為軟體與 AI 醫材發展新的許可方式。**", "為醫材發展能因應軟體與 AI 的新許可方式。**", "ref-31 heading", 1),
    ("並為軟體與 AI 醫材尋求新的許可方式。", "並為醫材尋求能因應軟體與 AI 的新許可方式。", "ref-31 table", 1),
    ("英國為軟體與 AI 醫材尋求新的許可方式", "英國為醫材尋求能因應軟體與 AI 的新許可方式", "ref-31 trend", 1),
    ("英國的 AI 醫材許可方式仍在尋求立法授權", "英國的醫材新許可方式仍在尋求立法授權", "ref-31 limitations", 1),
    ("已有 CE 標示的醫療軟體，", "已有 CE 標示的醫材（含作為醫材的軟體），", "ref-31 ending", 1),
    # ref-33 H1、sought to、既有重疊管轄
    ("Feds scramble to avoid regulatory logjam as states look to test AI in clinic",
     "FDA, CMS scramble to avoid regulatory logjam as more states look to test AI in clinical settings",
     "ref-33 title", 2),
    ("已設法減輕健康 AI 開發商的法規負擔並建立新的給付方式", "已著手減輕健康 AI 開發商的法規負擔，並建立了新的給付方式", "ref-33 sought", 2),
    ("美國州與聯邦的管轄可能重疊", "美國州與聯邦對執行臨床工作的 AI 有重疊管轄", "ref-33 trend", 1),
    # ref-34 給藥方式
    ("FDA 核准的 Voceryq 則是藥物與電穿孔裝置一起送審的例子", "FDA 核准的 Voceryq 則是以電穿孔裝置遞送的生物製劑", "ref-34 trend", 1),
    # ref-35 條件句
    ("，預期最快 2028 年底可進入人體試驗。", "，若候選藥物持續有效，最快 2028 年底可準備進入人體試驗。", "ref-35 source", 1),
    ("，Anthropic 預期最快 2028 年底可進入人體試驗 [[35.", "，Anthropic 表示若候選藥物持續有效，預期最快 2028 年底可準備進入人體試驗 [[35.", "ref-35 report", 1),
    # ref-36 訂閱、border
    ("自駕系統按服務計費", "以訂閱方式取得自駕系統", "ref-36 trend", 1),
    ("由業者持有實體車輛，部署在美墨邊境附近與全國", "由業者持有實體車輛，部署在邊境附近與全國", "ref-36 border", 1),
    # ref-39 結果不是目的、Emma Mazhari
    ("Maersk 表示此舉為取得基礎設施、採購、供應鏈準備度與船舶營運的實務經驗，並延續多燃料路徑策略；今年稍早也已在",
     "Maersk 表示此次作業提供了基礎設施、採購、供應鏈準備度與船舶營運的實務經驗；能源市場主管 Emma Mazhari 表示公司延續多燃料策略，今年稍早也已在",
     "ref-39 source", 1),
    ("Maersk 表示這是為了取得基礎設施、採購、供應鏈準備度與船舶營運的實務經驗，延續多燃料路徑策略 [[39. Maersk]](#ref-39)。今年稍早 Maersk 已在 Laura Maersk 等三艘船上做過乙醇試驗。",
     "Maersk 表示此次作業提供了基礎設施、採購、供應鏈準備度與船舶營運的實務經驗；能源市場主管 Emma Mazhari 說，公司延續多燃料策略，今年稍早已在 Laura Maersk 等三艘船上做過乙醇試驗 [[39. Maersk]](#ref-39)。",
     "ref-39 report", 1),
    ("Maersk 的乙醇加註是為了累積供應鏈與營運經驗", "Maersk 的乙醇加註累積的是供應鏈與營運經驗", "ref-39 trend", 1),
    # ref-40 兩路口清單不同
    ("兩處的取締項目包括", "兩處的取締項目依路口不同，合計包括", "ref-40 items", 1),
    # ref-41 公司方針不是 CTO 的話
    ("，並表示今後將把 B2B 事業擴大到鐵道、橋梁與災害應對等社會基礎設施領域",
     "；該公司今後將把 B2B 事業擴大到鐵道、橋梁與災害應對等社會基礎設施領域",
     "ref-41 source", 1),
    ("，並表示 B2B 事業將擴大到鐵道、橋梁與災害應對等社會基礎設施。",
     "；該公司今後將把 B2B 事業擴大到鐵道、橋梁與災害應對等社會基礎設施。",
     "ref-41 report", 1),
    # ref-42 aims to
    ("依公司公告，這筆資金將讓公司從挖土機擴展到", "依公司公告，公司目標是以這筆資金從挖土機擴展到", "ref-42 source", 1),
    ("依公司公告，資金將讓公司從挖土機擴展到", "依公司公告，公司目標是以資金從挖土機擴展到", "ref-42 report", 1),
    # ref-43 Parra Rubio says
    ("，由沒有專業營建經驗的團隊在數日內搭成", "；據第一作者 Parra Rubio 說，雕塑由沒有專業營建經驗的團隊在數日內搭成", "ref-43 attribution", 2),
]

# ---------- 第四組：ref-44 至 ref-57 ----------
fixes += [
    # ref-44 授權對象、第二種規格、趨勢定性
    ("可用於 14 層樓的木造建築。授權內容", "可用於 14 層樓的木造建築，或最上層起 14 層為木造的建物。授權內容", "ref-44 report", 1),
    ("竹中工務店把耐火集成材授權給其他施工公司", "竹中工務店開放其他施工公司施工的民間建物使用耐火集成材", "ref-44 trend licensee", 1),
    ("兩者都讓原本要專門團隊的工法，可以交給更多人做。", "兩者都放寬了誰能使用這些工法。", "ref-44 trend", 1),
    # ref-45 just over 30 minutes、機器人是 Brooks 的說法、H1
    ("開賣不到一小時就停售", "開賣 30 多分鐘就停售", "ref-45 heading", 1),
    ("兩場用的是不同售票平台，都沒擋住機器人。", "兩場用的是不同售票平台，Brooks 都歸咎於機器人。", "ref-45 ending", 1),
    ("Garth Brooks Pulls Ticket Sales From KC Due to Rampant Bots",
     "Garth Brooks Unexpectedly Pulls Ticket Sales From Kansas City Due to Rampant Bots",
     "ref-45 title", 2),
    # ref-47 arena
    ("巨蛋場館", "大型室內場館", "ref-47 arena", 2),
    # ref-48 策展人說法
    ("展出 7 組橫跨 20 年以上的裝置作品，首次在台灣呈現。",
     "策展人難波祐子表示，展出的 7 組裝置作品橫跨 20 年以上，這是首次在台灣呈現。",
     "ref-48 report", 1),
    # ref-49 郡與州
    ("郡長 Aisha Braveboy 稱此案帶來 13 億美元經濟效益",
     "郡長 Aisha Braveboy 稱此案對郡帶來 13 億美元、對馬里蘭州帶來 15 億美元的經濟效益",
     "ref-49 impact", 2),
    # ref-50 訴狀主張與律師引言分開
    ("首席律師 Richard Busch 在訴狀中指稱，Claude 對網路上幾乎每首歌都生成侵權內容",
     "訴狀指稱 Claude 對網路上幾乎每首歌都生成侵權內容，首席律師 Richard Busch 並在訴狀中寫道，被告把整個商業模式建立在大規模著作權侵權上",
     "ref-50 attribution", 2),
    # ref-51 單一受訪者、特映會非與金馬合作
    ("**影視產業對生成式 AI 採取局部切入。**", "**文策院對生成式 AI 選擇從特效與後製切入。**", "ref-51 trend", 1),
    ("今年新增與金馬獎合作的台灣新秀演員推介會與特映會。", "今年新增與金馬獎合作的台灣新秀演員推介會，並首度舉辦特映會。", "ref-51 report", 1),
    # ref-52 H1、第四要素為記者解說、seemingly
    ("Suno Fires Back Against Apple's Subpoena Opposition, Doubling Down on Its Push for Info on Apple Music's AI Deal Terms",
     "Suno Fires Back Against Apple’s Subpoena Opposition, Doubling Down on Its Push for Information About ‘Current License Negotiations,’ ‘Anti-AI Deal Terms,’ and More",
     "ref-52 title", 2),
    ("Suno 稱合理使用第四要素涉及市場影響，包括保證最低版稅與把 AI 內容排除於版稅池的條款",
     "合理使用第四要素涉及市場影響，Suno 因此主張 Apple Music 的 AI 合約條款（包括保證最低版稅與把 AI 內容排除於版稅池的條款）與本案相關",
     "ref-52 fourth factor", 2),
    ("目前卡在 4 項修改後的證詞議題", "目前似乎卡在 4 項修改後的證詞議題", "ref-52 source hang-up", 1),
    ("爭點卡在 4 項修改後的證詞議題", "報導稱爭點似乎卡在 4 項修改後的證詞議題", "ref-52 report hang-up", 1),
    # ref-53 授權是事實、含發行商
    ("Spotify 的 AI 工具則據報只取得部分唱片公司授權", "Spotify 的 AI 工具目前只有部分唱片公司與發行商授權", "ref-53 trend", 1),
    # ref-56 媒體名稱
    ("Google Research 部落格由 Travis Beals 發表", "Google 官方部落格（Google Research 分類）由 Travis Beals 發表", "ref-56 source", 1),
    ("Google Research 部落格指出", "Google 官方部落格的 Google Research 文章指出", "ref-56 report", 1),
    # ref-57 微重力為記者敘述的既有方向
    ("，並延伸研究微重力環境下的生物能源轉換。", "；報導並提到他近年已將研究延伸至模擬微重力環境下的生物能源轉換。", "ref-57 source", 1),
]

# ---------- 補句後摘要超過 500 字：ref-7、ref-35 精簡 ----------
fixes += [
    ("Microsoft CoreAI 執行副總裁 Jay Parikh 在 10 月 28 日的 GitHub Universe 官方彙整中",
     "Jay Parikh 在 10 月 28 日的 GitHub Universe 彙整中",
     "ref-7 trim opening", 1),
    ("延續同一個雲端代理工作階段；Copilot automations 可從結果學習；Copilot code review",
     "延續同一個雲端代理工作階段；Copilot code review",
     "ref-7 trim automations", 1),
    ("；Copilot Fusion 依任務選擇並協調一個或多個模型，在", "；Copilot Fusion 依任務協調一個或多個模型，在", "ref-7 trim fusion", 1),
    ("Anthropic 生命科學團隊說明過去數月與六家藥物開發機構", "Anthropic 生命科學團隊說明與六家藥物開發機構", "ref-35 trim months", 1),
    ("The Column Group）的研究合作", "The Column Group）的合作", "ref-35 trim collaboration", 1),
    # 總結補「一個或」後超過 300 字
    ("本期有兩條主線：", "本期兩條主線：", "summary trim 1", 1),
    ("分析師有 86% 的分析選擇", "分析師 86% 的分析選擇", "summary trim 2", 1),
    ("，Anthropic 則提交 S-1", "，Anthropic 提交 S-1", "summary trim 3", 1),
    ("，Android Studio 的自帶代理轉為穩定版 [[8.", "，Android Studio 自帶代理轉為穩定版 [[8.", "summary trim 4", 1),
]

for old, new, label, count in fixes:
    build = replace(build, old, new, label, count)

# ---------- notes.md 稽核段 ----------
audit_section = """
## 撰稿後逐筆稽核

- **原頁重抓**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 57 筆原頁；intel.com 對瀏覽器 UA 回 403，ref-20、ref-21 以蒐集時的副本為準；ITmedia BUILT 兩筆以 cp932 解碼。再以 `scripts/build-weekly-tech-report-audit-packets.sh` 產生稽核包。
- **四組逐筆稽核**：四組 `tech-auditor` 各負責約 14 筆，只讀稽核包與本機原頁、以文字回報；主編逐條回原頁 grep 核對後採納，修正入口 `scripts/apply-weekly-tech-report-027-audit.sh`。類型：歸因（ref-12 成因為 Linux 核心 CVE 團隊所述、ref-29 引言只屬 ACI 的 Craig Ramsey、ref-39 多燃料策略為 Emma Mazhari 所述、ref-41 B2B 擴展是公司方針、ref-43 與 ref-48 補上說話者、ref-45 機器人是 Brooks 的說法、ref-50 訴狀主張與律師引言分開、ref-52 第四要素為記者解說）；語意精度（ref-4 五項決策與 38 例、ref-7 差距在兩分以內、ref-23 208% 的分母是全部網路層攻擊、ref-27 在中央證券保管機構發行、ref-31 許可方式針對醫材整體、ref-33 sought to、ref-44 第二種規格、ref-47 arena 不是巨蛋、ref-49 郡與州兩個數字）；狀態與時態（ref-1 本週起、ref-3 三週與本月稍早、ref-5 預計、ref-19 初期安裝測試中、ref-26 將部署、ref-29 示範、ref-35 條件句、ref-42 目標）；自加定性（ref-11 趨勢、ref-13「很快」、ref-15 成因、ref-17 結尾、ref-34 送審、ref-36 計費、ref-44 與 ref-51 趨勢）；標題改用 H1（ref-17、ref-33、ref-45、ref-52）。
- **未採納**：ref-44 與 ref-41 原始標題維持 ITmedia BUILT 的 `<title>` 寫法，兩筆一致；ref-50 趨勢段句尾屬本報告觀察，保留；ref-15 結尾「要升級」已由前句寫明版本，不重複。
- **結果**：正式 57、淘汰 52、12 分類、ref-1 至 ref-57 一致。
"""
build = replace(build,
    "- 影視音樂：8 輪以上（Digital Music News、Music Business Worldwide、Variety、Hollywood Reporter、Deadline、中央社影視列表、金鐘與金馬、文策院）\n",
    "- 影視音樂：8 輪以上（Digital Music News、Music Business Worldwide、Variety、Hollywood Reporter、Deadline、中央社影視列表、金鐘與金馬、文策院）\n" + audit_section,
    "notes audit section")

# ---------- task_plan.md ----------
build = replace(build,
    "| 10 | 撰稿後逐筆稽核（稽核包＋四組 `tech-auditor` 對照本機原頁） | 進行中 |",
    "| 10 | 撰稿後逐筆稽核（稽核包＋四組 `tech-auditor` 對照本機原頁） | 完成（主編逐條 grep 核對後採納；`scripts/apply-weekly-tech-report-027-audit.sh`） |",
    "task plan row 10")
build = replace(build,
    "| 總結超長 | 初稿 321 字 | 精簡至 300 字內 |",
    "| 總結超長 | 初稿 321 字 | 精簡至 300 字內 |\n| 稽核重抓 403 | intel.com 對瀏覽器 UA 回 403 | ref-20、ref-21 以蒐集時的副本為準 |\n| ITmedia 副本亂碼 | Shift_JIS 頁面以 UTF-8 轉文字 | 以 cp932 重新解碼 |\n| 歸因錯置 | 記者敘述、新聞稿敘述或他人引言寫成受訪者的話（ref-29、39、41、45、50、52） | 補上說話者或改為報導、新聞稿的敘述 |\n| 分母錯置 | ref-23 把全部網路層攻擊的年增 208% 寫成短時攻擊的成長 | 改回原頁的分母與兩個比例 |\n| 標題取 `<title>` | ref-17、33、45、52 的 `<title>` 與 H1 不同 | 改用 H1 |",
    "task plan errors")

build_path.write_text(build, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-027.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-027 2026-10-31
sh "$ROOT/scripts/validate-weekly-tech-report-027.sh"
git -C "$ROOT" diff --check

echo "weekly-tech-report-027 稽核修正已套用、重建、同步與驗證"
