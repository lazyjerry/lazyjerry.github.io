#!/bin/sh
# weekly-tech-report-026 第三輪查核（audit-tech-weekly-report）：
# 以斷言式替換修改 canonical build script，再 build → deliver → validate。可重複執行。

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-026.sh"
VALIDATE="$ROOT/scripts/validate-weekly-tech-report-026.sh"

python3 - "$BUILD" "$VALIDATE" <<'PY'
import re
import sys
from pathlib import Path

build_path = Path(sys.argv[1])
validate_path = Path(sys.argv[2])
build = build_path.read_text(encoding="utf-8")
validate = validate_path.read_text(encoding="utf-8")


def replace(text: str, old: str, new: str, label: str, count: int = 1) -> str:
    """新字串已在則視為已套用（追加型替換的新字串包含舊字串，必須先看新的）；否則舊字串需恰好出現 count 次。"""
    if new in text:
        return text
    n_old = text.count(old)
    if n_old == count:
        return text.replace(old, new)
    raise SystemExit(f"{label}: expected {count} old anchor(s), found {n_old}")


# ---------- 四組稽核修正 ----------
fixes = [
    # ref-11 may ≠ 常
    ("對開發者，文章提醒 SDK 常把驗證交給 HTTP 函式庫、語言執行環境或作業系統，只更新 SDK 不一定改變信任政策，",
     "對開發者，文章提醒 API 客戶端可能把憑證驛證交給 HTTP 函式庫、語言執行環境、作業系統或自訂信任設定，只更新 SDK 不一定改變底層政策，".replace("驛證", "驗證"),
     "ref-11 source", 1),
    ("文章也提醒，SDK 常把驗證交給 HTTP 函式庫、語言執行環境或作業系統，只更新 SDK 不一定改變信任政策，",
     "文章也提醒，API 客戶端可能把憑證驗證交給 HTTP 函式庫、語言執行環境、作業系統或自訂信任設定，只更新 SDK 不一定改變底層政策，",
     "ref-11 report", 1),
    ("eMudhra 私鑰外洩則讓所有信任這些中間憑證的用戶端都要更新",
     "eMudhra 私鑰外洩則讓瀏覽器以外信任這些中間憑證的用戶端都要更新",
     "ref-11 trend", 1),
    # ref-13 記者敘述
    ("既無法修補也無法緩解才暫時停止對外服務；數發部目前沒有收到相關被駭通報，也未要求機關限期完成處理 [[13",
     "既無法修補也無法緩解才暫時停止對外服務；報導指數發部目前沒有收到相關被駭通報，也未要求機關限期完成處理 [[13",
     "ref-13 report attribution", 1),
    # ref-6 結尾定性
    ("冷卻期擋的是「剛發布就被裝進去」的惡意版本，近期多起安裝階段惡意套件攻擊走的就是這條路。",
     "GitHub 稱近期安裝階段的惡意軟體攻擊大量出現，冷卻期針對的就是「剛發布就被裝進去」的版本。",
     "ref-6 ending", 1),
    # ref-8 路線圖為提議
    ("擔任主要維護者。初步路線圖包含版本化發行",
     "擔任主要維護者。Anthropic 提議的初步路線圖涵蓋版本化發行",
     "ref-8 source", 1),
    ("以個人身分維護，初步路線圖包含版本化發行",
     "以個人身分維護，Anthropic 提議的初步路線圖涵蓋版本化發行",
     "ref-8 report", 1),
    # ref-2 越界略輕
    ("Anthropic 判定其嚴重度與 9 月 9 日的 PyPI 事件相當，欺瞞程度更高。",
     "Anthropic 判定其嚴重度與 9 月 9 日的 PyPI 事件相當，越界程度略輕、欺瞞程度更高。",
     "ref-2 source", 1),
    ("Anthropic 判定嚴重度與 9 月 9 日的 PyPI 事件相當、欺瞞程度更高；",
     "Anthropic 判定嚴重度與 9 月 9 日的 PyPI 事件相當，越界程度略輕、欺瞞程度更高；",
     "ref-2 report", 1),
    # ref-5 行為變更有兩項
    ("行為變更是對分配式型別參數的檢查更嚴格",
     "行為變更包括 DOM 型別定義（lib.d.ts）更新，以及對分配式型別參數更嚴格的檢查",
     "ref-5 report", 1),
    # ref-7 備註日期出處
    ("日期依 JSON-LD datePublished「2026-10-21T00:00:00.000Z」",
     "日期依 `<time datetime>`「2026-10-21T00:00:00.000Z」",
     "ref-7 note", 1),
    # ref-4 標題欄
    ("- 標題：OpenAI GPT-6 三款模型上架 Google Cloud",
     "- 標題：OpenAI GPT-6 系列三款模型上架 Google Cloud",
     "ref-4 title", 1),
    # ref-15 節能數字歸屬
    ("DSX POD 的部署時程與節能數字",
     "DSX POD 的部署時程與 DSX AI Factory 平臺的節能數字",
     "ref-15 limitation", 1),
    # ref-22 主因的範圍
    ("控制層跨可用區的同步驗證相依也被列為主因 [[22",
     "控制層跨可用區的同步驗證相依也被列為未斷電可用區受影響的主因之一 [[22",
     "ref-22 trend", 1),
    ("報告另列控制層跨可用區的同步驗證相依為主因之一；",
     "報告把需求湧入與控制層跨可用區的同步驗證相依列為這些可用區受影響的主因；",
     "ref-22 highlight", 1),
    ("多可用區部署擋得住單一可用區斷電；但",
     "多可用區部署讓服務在單一可用區斷電時能切換；但",
     "ref-22 ending", 1),
    # ref-23 128 MiB 是資料中心間傳輸
    ("就可能讓 Cloudflare 從來源拉 128 MiB 並在資料中心間移動。",
     "就可能造成 128 MiB 的資料中心間傳輸。",
     "ref-23 source", 1),
    ("就可能讓 Cloudflare 從來源拉 128 MiB；",
     "就可能造成 128 MiB 的資料中心間傳輸；",
     "ref-23 report", 1),
    # 趨勢：不是預設
    ("前兩者把原本要靠設定與調校的部分，變成產品的預設。",
     "前兩者把原本要靠設定與調校的部分，交給產品代管。",
     "infra trend default", 1),
    # ref-26 can
    ("以 Trusted Agent Protocol 的驗證滿足 CAPTCHA",
     "以 Trusted Agent Protocol 的驗證可滿足 CAPTCHA",
     "ref-26 trend", 1),
    ("Visa 10 月 20 日宣布實際試行：",
     "三方 10 月 20 日宣布實際試行：",
     "ref-26 report", 1),
    # ref-28 may
    ("將隨市場事件與新技術調整焦點",
     "可能隨市場事件與新技術調整焦點",
     "ref-28 source", 1),
    # ref-18 標題
    ("也提醒應用程式尚未全面適配",
     "也提醒部分第三方 App 尚未適配",
     "ref-18 title", 2),
    # ref-25 雙方資訊
    ("不論金額都要傳遞雙方資訊",
     "不論金額都要傳遞必要資訊",
     "ref-25 report", 1),
    # ref-37 業者的話、未來式
    ("；測試初期避開高度複雜路況，先從車流量較少的時段開始。",
     "；業者鍾子倫表示，測試初期將避開高度複雜路況，先從車流量較少的時段開始。",
     "ref-37 source", 1),
    # ref-35 部長的話
    ("新聞稿提及測試飛行達數千小時，",
     "運輸部長 Duffy 稱安全審查含數千小時測試飛行，",
     "ref-35 source", 1),
    # ref-36 CTOL
    ("也是首家取得固定翼機型市場調查授權者",
     "其 CTOL（傳統起降）機型也是首個取得市場調查授權者",
     "ref-36 source", 1),
    # ref-29 higher value
    ("其他承諾包括新增較高價位的快速科學建議服務選項",
     "其他承諾包括新增較高階（higher value）的快速科學建議服務選項",
     "ref-29 source", 1),
    ("另新增較高價位的快速科學建議服務選項",
     "另新增較高階（higher value）的快速科學建議服務選項",
     "ref-29 report", 1),
    # ref-32 日期與空格
    ("美國衛生高等研究計畫署（ARPA-H）於 2026-10-22 宣布三項新的阿茲海默症計畫",
     "美國衛生高等研究計畫署（ARPA-H）於 2026-10-22 發布新聞稿，宣布本週新增三項阿茲海默症計畫",
     "ref-32 source", 1),
    ("含AI 賦能的開放資料平台", "含 AI 賦能的開放資料平台", "ref-32 table", 1),
    ("其中一項是AI 賦能", "其中一項是 AI 賦能", "ref-32 report", 1),
    # ref-34 只就馬德里
    ("每進一座新城市都要先完成在地化驗證，才能開始載客。",
     "進馬德里也是先人工駕駛、在地驗證，才開始載客。",
     "ref-34 ending", 1),
    ("Waymo 進新城市先人工駕駛再驗證", "Waymo 進馬德里先人工駕駛再驗證", "ref-34 trend", 1),
    # ref-38 宣布日
    ("輝達在 2026-10-21 至 22 日的柏林 GTC 大會宣布",
     "輝達 10 月 21 日在柏林 GTC 大會（21 至 22 日舉行）宣布",
     "ref-38 source", 1),
    # ref-40 分析而非使用紀錄
    ("數位權利管理系統的使用紀錄，成了權利人發現侵權的依據。",
     "數位權利管理系統的分析結果，成了權利人發現侵權的依據。",
     "ref-40 ending", 1),
    ("權利人也以數位權利管理系統的使用紀錄發現",
     "權利人也以數位權利管理系統的分析發現",
     "ref-40 trend", 1),
    # ref-41 申請補助經費、補「等」
    ("補助金額 100 萬元至 1,100 餘萬元不等，約占總經費 45% 至 62%",
     "申請補助經費 100 萬元至 1,100 餘萬元不等，約占總經費 45% 至 62%",
     "ref-41 source", 1),
    ("屋頂隔熱防水與室內無障礙，", "屋頂隔熱防水與室內無障礙等，", "ref-41 list", 2),
    # ref-47 兩段式同意是 Believe
    ("同時與 Believe 簽署 AI 混音授權並採兩段式同意 [[47",
     "同時與 Believe 簽署 AI 混音授權，Believe 方對藝人採兩段式同意 [[47",
     "ref-47 trend", 1),
    ("另列 Spotify 與 Merlin 的同類授權協議",
     "另列 Spotify 與 Merlin、Kobalt、UMG 的同類授權協議",
     "ref-47 note", 1),
    # ref-49 all but admitted
    ("稱已承認訓練資料存在授權市場", "稱其幾乎等於承認訓練資料存在授權市場", "ref-49", 2),
    # ref-53 兩位發言人
    ("ESA 科學主管 Carole Mundell 與專案科學家向 JAXA 與團隊道賀，並表示預計明年夏季抵達火星，近距離調查火衛一 Phobos 與火衛二 Deimos。",
     "ESA 科學主管 Carole Mundell 向 JAXA 與團隊道賀；專案科學家 Elliot Sefton-Nash 表示團隊正準備明年夏季抵達火星，近距離調查火衛一 Phobos 與火衛二 Deimos。",
     "ref-53 source", 1),
    # ref-50 原頁沒有開發者嵌入
    ("授權音樂以玩家端訂閱服務的形式與遊戲並行播放，不經過遊戲開發者嵌入。",
     "授權音樂以玩家端訂閱服務的形式，與受支援的遊戲並行播放。",
     "ref-50 ending", 1),
    # ref-51 只談晶體材料
    ("先替非文字資料生成描述、再做對齊訓練，這個做法也能用在其他缺少文字標註的領域資料。",
     "研究者認為這個做法可用於多種晶體材料，並希望其他材料科學家採用。",
     "ref-51 ending", 1),
    # ref-43 作品主體
    ("歌劇院以即時聲響處理做出觀眾席分區的聲響體驗",
     "歌劇院駐館藝術家把即時聲響處理與環繞音場做進演出",
     "ref-43 trend", 1),
    # ref-46 beta 與訊號
    ("Artist Profile Protection 測試版將在年底前開放給所有藝人",
     "Artist Profile Protection 已有數千名藝人加入測試版，工具將在年底前開放給所有藝人",
     "ref-46 source", 1),
    ("單一偵測器不可靠，平台改用多種訊號一起判斷。",
     "單一訊號抓不全，平台結合多種訊號一起判斷。",
     "ref-46 ending", 1),
    # ref-55 調配方、去掉「約」
    ("分離需要數百到上千階的調配程序", "分離困難，調配方的程序有數百到上千階", "ref-55 source", 1),
    ("供應台灣約 50% 需求", "供應台灣 50% 需求", "ref-55 約", 3),
    # ref-54 備註：原頁 2,000 與 gamma-ray bursts 被標籤切開，拆成兩個詞
    ("Oct. 20、2,000 gamma-ray bursts、", "Oct. 20、2,000、gamma-ray bursts、", "ref-54 checklist", 1),
    ("Agent Knowledge Foundation、nearly $10 billion、", "Agent Knowledge Foundation、nearly、$10 billion、", "ref-15 checklist", 1),
]
for old, new, label, count in fixes:
    build = replace(build, old, new, label, count)

# C 組（ref-24 至 38）備註的 grep 核對清單改用「、」分隔，驗證腳本才能逐詞比對
def fix_checklists(text: str) -> str:
    def entry_sub(m):
        entry = m.group(0)
        return re.sub(r"(grep 核對：)([^。\n]*)", lambda c: c.group(1) + c.group(2).replace("，", "、"), entry)
    return re.sub(r"(?ms)^### (?:2[4-9]|3[0-8])\. .*?(?=^### )", entry_sub, text)
build = fix_checklists(build)

# ---------- 補搜新增 ref-56 至 ref-59 ----------
new_sources = """
### 56. NIST、NSA 與 CISA 聯合發布超級智慧訓練與評測的事件整備與應變十項關鍵作法
- 原始標題：Key Practices for Incident Readiness and Response in Super Intelligence Training and Evaluation
- 標題：NIST、NSA 與 CISA 聯合發布超級智慧訓練與評測的事件整備與應變十項關鍵作法
- URL：https://www.nist.gov/news-events/news/2026/10/key-practices-incident-readiness-and-response-super-intelligence-training
- 摘要：NIST 的超級智慧創新與標準中心（CAISSI）、NSA 的 Super Intelligence Security Center 與 CISA 於 2026-10-16 共同發布十項自願性關鍵作法，供前沿超級智慧（SI）業者在訓練與評測期間預防、準備與處理事件。文件鎖定的情境是一個或多個 SI 代理採取重大且未受指示的行動，破壞營運者為界定任務範圍或確保人類監督所設的政策、控制或安全措施。十項作法以 NIST SP 800-61r3 等既有資安事件管理框架為基礎，並參考 CAISSI 自身執行前沿模型安全評測的經驗。NIST 稱這份文件是落實白宮 2025 年 SI 行動計畫中「把 SI 事件應變納入既有事件應變文件」建議的一步；代理式 SI 訓練與評測的事件整備與應變將在後續階段處理。
- 權重：9/10
- 發布日期：2026-10-16
- 分類：AI 科技
- 是否納入正式參考資料：是
- 備註：第三輪補搜新增。curl HTTP 200，存檔 pages/ref-56.html；日期依 article:published_time 2026-10-16T08:00-04:00，頁面日期列 October 16, 2026。CISA 同文頁日期相同；iThome 179841（2026-10-22）有轉述報導，未收。原頁用語為 super intelligence（SI），摘要沿用。 grep 核對：Key Practices for Incident Readiness and Response、ten key practices、CAISSI、Super Intelligence Security Center、CISA、voluntary、uninstructed actions、SP 800-61r3、SI Action Plan、agentic SI。

### 57. TorchTPU 開源：Google 與 Meta 合作推出 PyTorch 原生 TPU 後端
- 原始標題：Introducing TorchTPU
- 標題：TorchTPU 開源：Google 與 Meta 合作推出 PyTorch 原生 TPU 後端
- URL：https://pytorch.org/blog/introducing-torchtpu/
- 摘要：PyTorch 部落格於 2026-10-20 介紹 TorchTPU，這是 Google 與 Meta 合作、替 Google TPU 提供原生 PyTorch 後端的開源專案；2025 年中在 Google 啟動，用來取代以 Lazy Tensor 為基礎的 PyTorch/XLA。設計原則包括執行環境不依賴 JAX、torch.compile 建立在 Torch Dynamo 上，並在 PyTorch 堆疊最底層提供 TPU 集體通訊以支援 DDP、FSDP、DTensor；既有工作負載只需把 `.to("cuda")` 改成 `.to("tpu")` 即可執行。原頁稱專案仍在積極開發，已用於部分最大型 Google Cloud 客戶的正式環境；支援約 450 個 Aten 運算子，已驗證 Hugging Face Transformers v5 相容、下載量前 5,000 的模型可直接執行，並驗證與 vLLM、SGLang、TorchTitan 的整合，相關儲存庫在 2026 年 10 月的 PyTorch Conference 發布。
- 權重：8/10
- 發布日期：2026-10-20
- 分類：硬體或軟硬整合
- 是否納入正式參考資料：是
- 備註：第三輪補搜新增。curl HTTP 200，存檔 pages/ref-57.html；日期依 article:published_time 2026-10-20T16:02:30+00:00。Google Cloud 同日部落格為同一公告；Amazon 同場公布的 TorchNeuron（aboutamazon.com，頁面日期 2026-10-19）屬同類事件，未另收。原頁的效能數據只提初步結果，摘要未引用。PyTorch Conference North America 2026 於 10-20 至 21 舉行，更正淘汰條目 S「窗內無大型開發者大會」的盤點結論。 grep 核對：TorchTPU、Google and Meta、mid 2025、PyTorch/XLA、Lazy Tensor、No JAX dependencies、Torch Dynamo、DTensor、.to("tpu")、~450 Aten ops、Pallas、Helion DSL、Transformers v5、5,000 most downloaded、TorchTitan、TorchRec、October 2026 PyTorch Conference。

### 58. OCC 公布實施 GENIUS Act 的穩定幣最終規則，與法案同於 2027 年 1 月 18 日生效
- 原始標題：OCC Advances U.S. Digital Asset Leadership with Final Rule to Implement GENIUS Act
- 標題：OCC 公布實施 GENIUS Act 的穩定幣最終規則，與法案同於 2027 年 1 月 18 日生效
- URL：https://www.occ.gov/news-issuances/news-releases/2026/nr-occ-2026-92.html
- 摘要：美國貨幣監理署（OCC）於 2026-10-21 發布新聞稿 2026-92，宣布實施《GENIUS Act》的最終規則。規則為 OCC 轄下的許可支付型穩定幣發行人與外國支付型穩定幣發行人訂定要求，也涵蓋 OCC 監理機構從事的特定託管活動。OCC 表示，這份規則處理了該法要求 OCC 制定的全部規定，只有銀行保密法、防制洗錢與外國資產控制辦公室制裁相關部分，將與財政部協調另行制定。制定過程中 OCC 收到加密業者、社區銀行、公會等各方數百則意見。署長 Gould 稱規則為支付型穩定幣創新提供清楚實用的框架，在準備金支持、贖回與風險管理上設有嚴格標準。OCC 將另以新聞稿公告何時開始受理許可發行人的申請與豁免請求；最終規則與 GENIUS Act 同於 2027 年 1 月 18 日生效。
- 權重：9/10
- 發布日期：2026-10-21
- 分類：金融科技
- 是否納入正式參考資料：是
- 備註：第三輪補搜新增。curl HTTP 200，存檔 pages/ref-58.html；頁面無日期 meta，日期取頁首「News Release 2026-92 | October 21, 2026」。原頁未列資本或準備金比例等數字，二手報導的數字未採用。 grep 核對：2026-92、October 21, 2026、GENIUS、final rule、permitted payment stablecoin issuers、foreign payment stablecoin issuers、custody activities、Bank Secrecy Act、anti-money laundering、hundreds of comments、Jonathan V. Gould、reserve backing、waiver requests、January 18, 2027。

### 59. Merck 與 Moderna 公布個人化 mRNA 新抗原療法第三期黑色素瘤試驗結果，復發或死亡風險降低 42%
- 原始標題：Merck and Moderna Will Present Results From Landmark Phase 3 INTerpath-001 Trial for Intismeran Autogene Plus KEYTRUDA® (pembrolizumab) at ESMO 2026 Presidential Symposium
- 標題：Merck 與 Moderna 公布個人化 mRNA 新抗原療法第三期黑色素瘤試驗結果，復發或死亡風險降低 42%
- URL：https://www.merck.com/news/merck-and-moderna-will-present-results-from-landmark-phase-3-interpath-001-trial-for-intismeran-autogene-plus-keytruda-pembrolizumab-at-esmo-2026-presidential-symposium/
- 摘要：Merck 與 Moderna 於 2026-10-22 公布第三期 INTerpath-001 試驗結果：研究中的 mRNA 個人化新抗原療法 intismeran autogene（V940／mRNA-4157）併用 KEYTRUDA（pembrolizumab），作為已完整切除的 IIB 至 IV 期黑色素瘤輔助治療。主要預先設定分析（意圖治療族群，追蹤中位數 24.6 個月）顯示，相較於單用 KEYTRUDA，復發或死亡風險降低 42%（HR 0.58，95% CI 0.45 至 0.75，雙尾 p<0.001），遠端轉移或死亡風險降低 38%（HR 0.62）。前六個月兩組療效相當（HR 0.99）；六個月免疫接種流程完成後的預先設定敏感度分析，復發或死亡風險降低 58%（分段 HR 0.42）。安全性與先前研究一致、無新的安全訊號；整體存活資料尚未成熟但呈有利趨勢，兩家公司表示正與主管機關接洽。結果在 ESMO 2026 Presidential Symposium 發表（LBA1），並已獲《新英格蘭醫學期刊》接受刊登。
- 權重：8/10
- 發布日期：2026-10-22
- 分類：醫療科技
- 是否納入正式參考資料：是
- 備註：第三輪補搜新增。curl HTTP 200，存檔 pages/ref-59.html；日期依 article:published_time 2026-10-22T14:59:00-04:00。原頁 H1 為「Will Present Results…」，頁面副標先列結果數字。2026-08-19 的初步宣布未含數字，本期新資訊為詳細數據；Nature 新聞（10-23）與 Ars Technica 另有報導，未收。數字皆為試驛委託方公布，論文尚未刊出。 grep 核對：INTerpath-001、intismeran autogene、42%、HR=0.58、0.45–0.75、p<0.001、38%、HR=0.62、24.6 months、58%、HR=0.42、HR=0.99、stage IIB-IV、no new safety signals、regulatory authorities、Presidential Symposium、LBA1、New England Journal of Medicine。
""".replace("試驛", "試驗")
build = replace(build,
    "、六甲院區、2028年底、2030年底、500噸、50%、國科會、價格保障機制、路透社。\n\n## 淘汰來源",
    "、六甲院區、2028年底、2030年底、500噸、50%、國科會、價格保障機制、路透社。\n" + new_sources + "\n## 淘汰來源",
    "source entries 56-59")

# 淘汰條目 S：窗內其實有 PyTorch Conference
build = replace(build,
    "OpenAI DevDay 為 9 月）；故無開發者端彙整。",
    "OpenAI DevDay 為 9 月）。第三輪補搜確認 PyTorch Conference North America 2026（10-20 至 21）在窗內，開發者端以該會發布的 TorchTPU（ref-57）代表。",
    "reject S")

# 參考資料表
new_rows = """| <a id="ref-56"></a>56 | [Key Practices for Incident Readiness and Response in Super Intelligence Training and Evaluation](https://www.google.com/search?q=NIST+Key+Practices+Incident+Readiness+Response+Super+Intelligence+Training+Evaluation) | NIST、NSA 與 CISA 發布十項自願性作法，處理訓練與評測期間 SI 代理的越界行動。 | 2026-10-16 | [NIST](https://www.nist.gov/news-events/news/2026/10/key-practices-incident-readiness-and-response-super-intelligence-training) | AI 科技 |
| <a id="ref-57"></a>57 | [Introducing TorchTPU](https://www.google.com/search?q=Introducing+TorchTPU+PyTorch) | Google 與 Meta 開源 PyTorch 原生 TPU 後端，取代 Lazy Tensor 式的 PyTorch/XLA。 | 2026-10-20 | [PyTorch Blog](https://pytorch.org/blog/introducing-torchtpu/) | 硬體或軟硬整合 |
| <a id="ref-58"></a>58 | [OCC Advances U.S. Digital Asset Leadership with Final Rule to Implement GENIUS Act](https://www.google.com/search?q=OCC+final+rule+GENIUS+Act+stablecoin) | 實施 GENIUS Act 的穩定幣最終規則，2027 年 1 月 18 日與法案同時生效。 | 2026-10-21 | [OCC](https://www.occ.gov/news-issuances/news-releases/2026/nr-occ-2026-92.html) | 金融科技 |
| <a id="ref-59"></a>59 | [Merck and Moderna Will Present Results From Landmark Phase 3 INTerpath-001 Trial for Intismeran Autogene Plus KEYTRUDA® (pembrolizumab) at ESMO 2026 Presidential Symposium](https://www.google.com/search?q=Merck+Moderna+INTerpath-001+Phase+3+melanoma+results) | 個人化 mRNA 新抗原療法併用 KEYTRUDA，復發或死亡風險降低 42%（HR 0.58）。 | 2026-10-22 | [Merck](https://www.merck.com/news/merck-and-moderna-will-present-results-from-landmark-phase-3-interpath-001-trial-for-intismeran-autogene-plus-keytruda-pembrolizumab-at-esmo-2026-presidential-symposium/) | 醫療科技 |
"""
build = replace(build,
    "/news/afe/202610240025.aspx) | 其他領域科技應用突破 |\n\n<a id=\"notes\"></a>",
    "/news/afe/202610240025.aspx) | 其他領域科技應用突破 |\n" + new_rows + "\n<a id=\"notes\"></a>",
    "reference rows 56-59")

# 總結
build = replace(build,
    "惡意程式碼的案例 [[2. Anthropic]](#ref-2)。",
    "惡意程式碼的案例 [[2. Anthropic]](#ref-2)，NIST、NSA 與 CISA 則發布同類事件的十項應變作法 [[56. NIST]](#ref-56)。",
    "summary ref-56")

# 亮點
hl_ai = "- **NIST、NSA 與 CISA 替「代理在訓練與評測中越界」這類事件寫了十項應變作法。** 三個機關 10 月 16 日共同發布自願性文件，鎖定的情境是一個或多個 SI 代理採取重大且未受指示的行動，破壞營運者為界定任務範圍或確保人類監督所設的政策、控制或安全措施；十項作法以 NIST SP 800-61r3 等既有資安事件管理框架為基礎，並參考 CAISSI 自身執行前沿模型安全評測的經驗。NIST 稱這是落實白宮 2025 年 SI 行動計畫建議的一步，代理式 SI 的事件整備與應變留待後續階段 [[56. NIST]](#ref-56)。它處理的情境和 Anthropic 檢視的 AISI 事件是同一類；做模型評測的團隊可以拿它對照自己的事件流程。\n"
build = replace(build,
    "選雲端時要比較的是區域、配額與資料處理條款。\n\n<a id=\"hl-software\"></a>",
    "選雲端時要比較的是區域、配額與資料處理條款。\n" + hl_ai + "\n<a id=\"hl-software\"></a>",
    "highlight ref-56")

hl_hw = "- **TorchTPU 開源，PyTorch 在 Google TPU 上有了原生後端，不再走 Lazy Tensor 式的 PyTorch/XLA。** PyTorch 部落格 10 月 20 日介紹 Google 與 Meta 合作的 TorchTPU：執行環境不依賴 JAX、以 eager 模式為基礎、torch.compile 建立在 Torch Dynamo 上，並在 PyTorch 堆疊最底層提供 TPU 集體通訊以支援 DDP、FSDP、DTensor；既有程式把 `.to(\"cuda\")` 改成 `.to(\"tpu\")` 這類小幅修改即可執行。原頁稱專案仍在積極開發，已用於部分最大型 Google Cloud 客戶的正式環境，支援約 450 個 Aten 運算子，並驗證與 Hugging Face Transformers v5、vLLM、SGLang、TorchTitan 的整合；追求峰值效能的正式工作負載仍建議採最佳化做法 [[57. PyTorch Blog]](#ref-57)。在非 NVIDIA 晶片上跑 PyTorch 的門檻，取決於這類後端跟得上 PyTorch 本身演進的速度。\n"
build = replace(build,
    "iOS App 要開始處理摺疊與展開兩種版面。\n\n<a id=\"hl-infrastructure\"></a>",
    "iOS App 要開始處理摺疊與展開兩種版面。\n" + hl_hw + "\n<a id=\"hl-infrastructure\"></a>",
    "highlight ref-57")

hl_fin = "- **美國 OCC 公布 GENIUS Act 穩定幣最終規則，2027 年 1 月 18 日與法案同時生效。** OCC 10 月 21 日宣布最終規則，為轄下的許可支付型穩定幣發行人與外國支付型穩定幣發行人訂定要求，也涵蓋受監理機構的特定託管活動；銀行保密法、防制洗錢與制裁相關規定將與財政部協調另行制定。署長 Gould 稱規則在準備金支持、贖回與風險管理上設有嚴格標準；OCC 將另行公告何時開始受理申請與豁免請求 [[58. OCC]](#ref-58)。要做美元穩定幣發行或託管的系統，準備金與贖回流程的紀錄從現在起就要對得上這套規則。\n"
build = replace(build,
    "在美國受檢的金融系統，資安、營運韌性與代幣化資產的紀錄都要能交代。\n\n<a id=\"hl-healthtech\"></a>",
    "在美國受檢的金融系統，資安、營運韌性與代幣化資產的紀錄都要能交代。\n" + hl_fin + "\n<a id=\"hl-healthtech\"></a>",
    "highlight ref-58")

hl_health = "- **個人化 mRNA 新抗原療法的第三期結果出爐：併用 KEYTRUDA 讓黑色素瘤復發或死亡風險降低 42%。** Merck 與 Moderna 10 月 22 日公布 INTerpath-001 試驗結果，intismeran autogene 併用 KEYTRUDA 作為已完整切除 IIB 至 IV 期黑色素瘤的輔助治療，追蹤中位數 24.6 個月時復發或死亡風險降低 42%（HR 0.58，95% CI 0.45 至 0.75），遠端轉移或死亡風險降低 38%；前六個月兩組療效相當，六個月免疫接種流程完成後的敏感度分析降低 58%。安全性無新訊號，整體存活資料尚未成熟但呈有利趨勢，兩家公司表示正與主管機關接洽，結果已獲《新英格蘭醫學期刊》接受刊登 [[59. Merck]](#ref-59)。數字由試驗委託方公布，論文尚待刊出。\n"
build = replace(build,
    "模型能否跨族群使用仍待確認。\n\n<a id=\"hl-logistics\"></a>",
    "模型能否跨族群使用仍待確認。\n" + hl_health + "\n<a id=\"hl-logistics\"></a>",
    "highlight ref-59")

# 趨勢
build = replace(build,
    "受影響的是外部的開源維護者。評測要開放網路，",
    "受影響的是外部的開源維護者；NIST、NSA 與 CISA 發布的十項作法，處理的正是這類訓練與評測期間的代理越界事件 [[56. NIST]](#ref-56)。評測要開放網路，",
    "trend ai ref-56")
build = replace(build,
    "部分第三方 App 尚未針對新螢幕尺寸優化 [[18. 中央社]](#ref-18)。\n\n<a id=\"tr-infrastructure\"></a>",
    "部分第三方 App 尚未針對新螢幕尺寸優化 [[18. 中央社]](#ref-18)。\n- **非 NVIDIA 加速器的軟體入口在補齊。** Google 與 Meta 開源 TorchTPU，讓 PyTorch 工作負載以小幅修改在 TPU 上執行 [[57. PyTorch Blog]](#ref-57)。選加速器時，框架後端的成熟度與維護節奏，和晶片規格一樣要看。\n\n<a id=\"tr-infrastructure\"></a>",
    "trend hw ref-57")
build = replace(build,
    "SEC 把代幣化與新興技術列入檢查重點 [[28. U.S. SEC]](#ref-28)。\n\n<a id=\"tr-healthtech\"></a>",
    "SEC 把代幣化與新興技術列入檢查重點 [[28. U.S. SEC]](#ref-28)，OCC 則公布 GENIUS Act 穩定幣最終規則並訂出 2027 年 1 月的生效日 [[58. OCC]](#ref-58)。\n\n<a id=\"tr-healthtech\"></a>",
    "trend fin ref-58")
build = replace(build,
    "[[32. ARPA-H]](#ref-32) [[33. 中央社]](#ref-33)。\n\n<a id=\"tr-logistics\"></a>",
    "[[32. ARPA-H]](#ref-32) [[33. 中央社]](#ref-33)。\n- **個人化療法拿到第三期結果。** Merck 與 Moderna 的 mRNA 新抗原療法在黑色素瘤輔助治療中讓復發或死亡風險降低 42%，兩家公司表示正與主管機關接洽 [[59. Merck]](#ref-59)。每位患者一份專屬製劑，後續看的是製造與審查流程。\n\n<a id=\"tr-logistics\"></a>",
    "trend health ref-59")

# 資料限制
build = replace(build,
    "未經法院認定 [[49. Digital Music News]](#ref-49)。",
    "未經法院認定 [[49. Digital Music News]](#ref-49)；INTerpath-001 的療效數字由試驗委託方公布，論文尚未刊出 [[59. Merck]](#ref-59)；TorchTPU 的運算子支援數與正式環境使用情形為 PyTorch 部落格所述 [[57. PyTorch Blog]](#ref-57)。",
    "limitation vendor")
build = replace(build,
    "工研院稀土示範工廠為規劃階段 [[55. 中央社]](#ref-55)。本報告引用",
    "工研院稀土示範工廠為規劃階段 [[55. 中央社]](#ref-55)；OCC 最終規則 2027 年 1 月 18 日生效，申請受理時間另行公告 [[58. OCC]](#ref-58)；NIST 等三機關的十項作法為自願性，代理式 SI 部分留待後續階段 [[56. NIST]](#ref-56)；TorchTPU 仍在積極開發 [[57. PyTorch Blog]](#ref-57)；INTerpath-001 的主管機關接洽與論文刊登尚在進行 [[59. Merck]](#ref-59)。本報告引用",
    "limitation future")
build = replace(build,
    "報導發布日 10 月 19 日在窗內 [[43. 中央社]](#ref-43)。",
    "報導發布日 10 月 19 日在窗內 [[43. 中央社]](#ref-43)；OCC 新聞稿沒有日期 meta，取頁首日期列 [[58. OCC]](#ref-58)。",
    "limitation date")

# 報告說明
build = replace(build,
    "本期共蒐集候選來源 117 筆，採用 55 筆為正式參考資料、淘汰 62 筆",
    "本期共蒐集候選來源 121 筆，採用 59 筆為正式參考資料、淘汰 62 筆",
    "report counts")
build = replace(build,
    "逐筆複核內文並重新補搜 12 類；沒有新增正式來源。",
    "逐筆複核內文並重新補搜 12 類；沒有新增正式來源。第三輪查核重抓全部原頭，四組逐筆稽核加一組 12 類補搜，修正 50 處措辭、歸因與備註，並新增 ref-56 至 ref-59（NIST 事件應變作法、TorchTPU、OCC 穩定幣最終規則、INTerpath-001 第三期結果）。".replace("原頭", "原頁"),
    "report third audit note")

# notes.md
build = replace(build,
    "Codex 執行第二輪原頁、內文與缺漏複核",
    "Codex 執行第二輪原頁、內文與缺漏複核；Claude Code（Fable 5.1）執行第三輪重抓、稽核派工與補搜裁決",
    "notes tools")
third_audit = """
## 第三輪查核（`audit-tech-weekly-report` skill；Claude Code Fable 5.1）

- **原頁與元資料**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 ref-1 至 ref-55，54 筆 HTTP 200，SEC（ref-28）改宣告式 UA 後 200；Google Cloud 事故頁改抓 `incidents.json`，ITmedia BUILT 兩筆以 cp932 解碼。標題、媒體名稱與網址 55 筆全部相符；41 筆日期 meta 吻合，其餘 14 筆由頁面日期列、iThome `created`、kernel.org 釋出日（Linux 7.3 為 2026-10-18）確認，無差異。
- **四組逐筆稽核**：稽核包加本機原頁副本，四組 `tech-auditor` 回報約 40 處，主編逐條回原頁 grep 後全數採納，合計 50 處替換。類型：歸因（ref-13 數發部未收到通報為記者敘述、ref-35 數千小時測試飛行為運輸部長的話、ref-37 測試初期避開複雜路況為業者說法、ref-47 兩段式同意是 Believe 而非 Spotify、ref-53 抵達火星時程為專案科學家所述、ref-43 作品主體是駐館藝術家）；語意精度（ref-11 may 不是「常」、ref-23 128 MiB 是資料中心間傳輸、ref-15 節能數字屬 DSX AI Factory 平臺、ref-22 控制層同步相依是未斷電可用區受影響的主因、ref-29 higher value 不是「較高價位」、ref-36 CTOL 不是「固定翼」、ref-49 all but admitted、ref-26 can satisfy、ref-28 may adjust、ref-41 申請補助經費、ref-5 行為變更有兩項、ref-25 必要資訊）；報告自加定性（ref-6 冷卻期結尾、ref-34 概括到所有新城市、ref-50 不經開發者嵌入、ref-51 推到其他領域、ref-46 偵測器、ref-40 使用紀錄、趨勢段「變成產品的預設」、ref-22 多可用區擋得住）；狀態（ref-8 路線圖為提議、ref-2 越界程度略輕、ref-32 本週宣布、ref-38 宣布日）；備註（ref-7 日期出處為 `<time>`、ref-47 頁尾另列 Kobalt 與 UMG）；格式（ref-32 中英空格、ref-4 與 ref-18 標題、ref-55 的「約」）。
- **補搜與新增**：一組 `tech-collector` 掃 12 類共約 48 輪，提出 6 筆；收 4 筆明顯高於現有選材的一手來源：NIST／NSA／CISA 十項事件應變作法（ref-56，AI 科技）、TorchTPU（ref-57，硬體或軟硬整合）、OCC GENIUS Act 最終規則（ref-58，金融科技）、INTerpath-001 第三期結果（ref-59，醫療科技）。Nature 的 prime editing 報導因公司公告日 10-05 在窗外不收；TechCrunch 的 OpenAI 訓練不連網為二手且與 ref-56 重疊，不收。淘汰條目 S 的「窗內無開發者大會」更正為 PyTorch Conference 在窗內。
- **工具修正**：稽核包腳本第二輪把 `references` 錨點後全部截掉，連資料限制段也漏了，四組代理都要自己回報告補讀；改為正文加 `limitations` 至 `disclaimer` 段。C 組備註的 grep 核對清單用全形逗號分隔，`validate-weekly-tech-report-source-terms.sh` 會整串當一個詞，統一改為「、」。
- **結果**：正式 59、淘汰 62、12 分類、ref-1 至 ref-59 一致；修正入口 `scripts/apply-weekly-tech-report-026-third-audit.sh`。
"""
build = replace(build,
    "- 保留新聞事實、數字、日期、引用編號、參考資料與 `source.md`。\n",
    "- 保留新聞事實、數字、日期、引用編號、參考資料與 `source.md`。\n" + third_audit,
    "notes third audit section")

# task_plan.md
build = replace(build,
    "| 12 | Humanizer-zh 人性化改寫 | 完成（23 處；事實、數字、日期、引用與參考資料不變） |",
    "| 12 | Humanizer-zh 人性化改寫 | 完成（23 處；事實、數字、日期、引用與參考資料不變） |\n| 13 | 第三輪查核：重抓原頁、四組逐筆稽核、一組 12 類補搜 | 完成（50 處替換；新增 ref-56 至 ref-59；稽核包腳本補回資料限制段） |",
    "task plan row 13")
build = replace(build,
    "| 稽核包雜訊 | 每個 ref 都重複收入參考表與報告說明，ref-55 還夾入淘汰區標題 | 稽核包限於參考資料前的正文，並在淘汰區標題前停止擷取 |",
    "| 稽核包雜訊 | 每個 ref 都重複收入參考表與報告說明，ref-55 還夾入淘汰區標題 | 稽核包限於參考資料前的正文，並在淘汰區標題前停止擷取 |\n| 稽核包漏收資料限制段 | 第二輪把參考資料錨點後全部截掉，資料限制段的引用也不見 | 改為正文加 limitations 至 disclaimer 段 |\n| 歸因錯置 | 記者敘述或他人引言寫成受訪者或機關的話（ref-13、35、37、47、53） | 補上說話者或改為「報導指」 |\n| 開發者大會盤點 | 淘汰條目 S 稱窗內無大型開發者大會，漏了 PyTorch Conference | 收 TorchTPU 為 ref-57，更正 S 的說明 |\n| 來源詞清單分隔符 | C 組備註用全形逗號分隔 grep 核對清單，驗證腳本整串比對 | 統一改為「、」 |",
    "task plan errors")

build_path.write_text(build, encoding="utf-8")

# 驗證腳本常數 55 → 59
for old, new, label in [
    ("assert_count 55 \"$formal_sources\" \"正式來源數\"", "assert_count 59 \"$formal_sources\" \"正式來源數\"", "validate formal"),
    ("assert_count 55 \"$ref_count\" \"參考資料筆數\"", "assert_count 59 \"$ref_count\" \"參考資料筆數\"", "validate refs"),
    ("while [ \"$n\" -le 55 ]; do", "while [ \"$n\" -le 59 ]; do", "validate loop"),
    ("正式來源 55、淘汰 62、分類 12、引用 ref-1..55 一致", "正式來源 59、淘汰 62、分類 12、引用 ref-1..59 一致", "validate message"),
]:
    validate = replace(validate, old, new, label)
validate_path.write_text(validate, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-026.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-026 2026-10-24
sh "$ROOT/scripts/validate-weekly-tech-report-026.sh"
git -C "$ROOT" diff --check

echo "weekly-tech-report-026 第三輪查核修正已套用、重建、同步與驗證"
