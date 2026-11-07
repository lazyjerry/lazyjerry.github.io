#!/bin/sh
# weekly-tech-report-028 撰稿後逐筆稽核（三組 tech-auditor 對照本機原頁）：
# 以斷言式替換修改 canonical build script，再 build → deliver → validate。可重複執行。

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-028.sh"

python3 - "$BUILD" <<'PY'
import sys
from pathlib import Path

build_path = Path(sys.argv[1])
build = build_path.read_text(encoding="utf-8")


def replace(text: str, old: str, new: str, label: str, count: int = 1) -> str:
    """新字串已在則視為已套用（追加型替換的新字串包含舊字串，必須先看新的）；否則舊字串需恰好出現 count 次。"""
    if new in text:
        return text
    n_old = text.count(old)
    if n_old == count:
        return text.replace(old, new)
    raise SystemExit(f"{label}: expected {count} old anchor(s), found {n_old}")


fixes = [
    # ---------- 第一組：ref-1 至 ref-19 ----------
    # ref-2 deepmind.google 轉址至 blog.google（canonical）
    ("https://deepmind.google/blog/gemini-omni-12-flash-fast-and-cost-effective-with-longer-clips/",
     "https://blog.google/innovation-and-ai/technology/developers-tools/introducing-gemini-omni-1-2-flash/", "ref-2 canonical url", 2),
    ("| [Google DeepMind](", "| [Google Blog](", "ref-2 table site", 1),
    ("[[2. Google DeepMind]]", "[[2. Google Blog]]", "ref-2 cite site", 2),
    ("同篇另有 blog.google 版（pages/A-06-blog.google-gemini-omni-12-flash.html），擇 DeepMind 原頁為正式。",
     "deepmind.google 網址會轉址到 blog.google 的同一頁（canonical），兩份存檔（pages/A-05、pages/A-06）為同一篇；參考表改列 canonical 網址，作者為 Google DeepMind 產品經理。",
     "ref-2 note canonical", 1),
    # ref-2 fast sports action、ongoing
    ("官方也坦承快速運動、劇本快速變化與複雜物理仍在持續改善", "官方也說明快速的運動賽事動作、劇本快速變化與複雜物理仍在持續改善", "ref-2 source ongoing", 1),
    ("官方也承認快速運動、劇本快速變化與複雜物理仍在改善", "官方也說明快速的運動賽事動作、劇本快速變化與複雜物理仍在改善", "ref-2 report ongoing", 1),
    # ref-4 dreaming 範圍
    ("「dreaming」則是回頭檢視記錄來修正記憶", "「dreaming」則是回頭檢視紀錄來修正錯誤，或產生新的筆記與表徵", "ref-4 source dreaming", 1),
    ("文中的「dreaming」是回頭檢視紀錄來修正記憶", "文中的「dreaming」是回頭檢視紀錄來修正錯誤，或產生新的筆記與表徵", "ref-4 report dreaming", 1),
    # ref-7 Pando 主詞
    ("Pando 稱可將推送延遲中位數縮短近 80%", "OpenAI 稱 Pando 可將推送延遲中位數縮短近 80%", "ref-7 pando", 1),
    # ref-13 成因是 Wakefield 的分析；趨勢段「合理」
    ("映像檔。成因是 musl（2012）", "映像檔。Wakefield 指出，成因是 musl（2012）", "ref-13 wakefield", 2),
    ("SSHole 則是三個專案各自合理的調整組合成可利用條件", "SSHole 則是三個專案各自解決不同問題的調整組合成可利用條件", "ref-13 trend", 1),
    # ref-16 400 多名與 10 萬元是先前傳出的數字
    ("。事件初步影響 400 多名客戶、每筆轉出約 10 萬元", "。先前傳出事件初步影響 400 多名客戶、每筆轉出約 10 萬元", "ref-16 source rumor", 1),
    ("已確認是外部駭客所為；初步影響 400 多名客戶、每筆轉出約 10 萬元", "已確認是外部駭客所為；先前傳出的影響範圍是 400 多名客戶、每筆轉出約 10 萬元", "ref-16 report rumor", 1),
    # ref-17 「核心問題是合規性」是記者敘述；趨勢段定性
    ("指出目前沒有證據顯示造成立即危害，核心問題是合規性", "指出目前沒有證據顯示造成立即危害；報導並指核心問題是合規性", "ref-17 source attribution", 1),
    ("台灣本期有兩則與金融信任相關的事件", "台灣本期有兩則與上游系統信任相關的事件", "ref-17 trend", 1),
    # ref-18 原頁未說明本次修補改了什麼
    ("檢查放在複製之後，等於沒擋住，這次修補的重點就是檢查順序。", "驗證這次修補時，要看檢查是否已移到複製之前。", "ref-18 ending", 1),
    # ref-19 topped；趨勢定性
    ("並登上 ClickBench 硬體榜", "並登上 ClickBench 硬體排行榜榜首", "ref-19 topped", 1),
    ("代理的瓶頸開始落在 CPU 端的沙箱與工具呼叫", "NVIDIA 把訴求放在 CPU 端的沙箱啟動與工具呼叫", "ref-19 ending", 1),
    # ---------- 第二組：ref-20 至 ref-38 ----------
    # ref-20 CPO 雷射是「去年」推出
    ("並推出針對共封裝光學（CPO）最佳化的雷射", "去年也推出針對共封裝光學（CPO）最佳化的雷射", "ref-20 source cpo", 1),
    ("光電路交換器，也推出針對共封裝光學（CPO）最佳化的雷射", "光電路交換器，去年也推出針對共封裝光學（CPO）最佳化的雷射", "ref-20 report cpo", 1),
    # ref-24 about 40%
    ("完整建置減少 40%", "完整建置減少約 40%", "ref-24 about", 2),
    # ref-26 交付延遲與營收目標延後的原因分開
    ("IREN 表示延遲是因微軟要求修改網路設計及供應商交貨時程，不會導致財務處罰；超過 40 億美元年化營收目標的達成時間從年底延至明年 1 月，進度可能再延至 2 月底。",
     "IREN 表示交付延遲是因微軟要求修改網路設計，不會導致財務處罰；超過 40 億美元年化營收目標的達成時間從年底延至明年 1 月，進度可能再延至 2 月底，IREN 指出這項調整是因客戶要求變更設計與供應商交貨時程。",
     "ref-26 source reason", 1),
    ("表示原因是微軟要求修改網路設計，以及供應商的交貨時程，不會導致財務處罰；超過 40 億美元年化營收目標的達成時間從年底延到明年 1 月，進度可能再延至 2 月底。",
     "表示交付延遲是因微軟要求修改網路設計，不會導致財務處罰；超過 40 億美元年化營收目標的達成時間從年底延到明年 1 月，進度可能再延至 2 月底，IREN 指出這項調整是因客戶要求變更設計與供應商交貨時程。",
     "ref-26 report reason", 1),
    ("IREN 的延遲原因是網路設計變更與供應商交期", "IREN 的交付延遲源於微軟要求變更網路設計，營收目標延後另涉供應商交期", "ref-26 trend", 1),
    # ref-29 clarifies / should not
    ("OCC 要求檢查人員不要把 SI 當獨立風險類別", "OCC 的框架明確表示檢查人員不應把 SI 當獨立風險類別", "ref-29 trend", 1),
    # ref-30 57.2% 是確數
    ("整體通過率約 57.2%", "整體通過率 57.2%", "ref-30 rate", 3),
    # ref-31 自加「刻意」
    ("Claude Personal Finance 則刻意只給唯讀權限", "Claude Personal Finance 則只給唯讀權限", "ref-31 trend", 1),
    # ref-32 明定期限，不是縮短
    ("試辦要點也縮短審查時程", "試辦要點也明定 60 日內完成審查", "ref-32 trend", 1),
    # ref-35 recommendations
    ("FDA 的效價保證指引要求從開發到上市後都納入效價考量", "FDA 的效價保證指引建議從開發到上市後都納入效價考量", "ref-35 trend", 1),
    # ref-37 輔助，不是取代
    ("數位塔台以攝影機取代實體視野", "數位塔台以攝影機與螢幕提供 360 度視野", "ref-37 trend", 1),
    # ref-38 宣布者是運輸部長
    ("FAA 11 月 5 日宣布，Enterprise – Information Display System（E-IDS）將取代",
     "美國運輸部長 Duffy 11 月 5 日宣布，FAA 將以 Enterprise – Information Display System（E-IDS）取代", "ref-38 attribution", 1),
    # ---------- 第三組：ref-39 至 ref-57 ----------
    # ref-41 201 架是 2028 年目標；基隆監測是記者敘述；8 成以上
    ("- **無人機從試點走向規模部署。** Zipline 與 Walmart 要新增 300 個站點", "- **無人機開始規畫規模部署。** Zipline 與 Walmart 要新增 300 個站點", "ref-41 trend heading", 1),
    ("公路局則把無人機巡檢擴大到 201 架", "公路局則規畫 2028 年把無人機增至 201 架", "ref-41 trend", 1),
    ("變化，目前在基隆工務段", "變化；報導指出目前已在基隆工務段", "ref-41 attribution", 2),
    ("8 成準確率加人工複查", "8 成以上準確率加人工複查", "ref-41 rate", 1),
    # ref-42 where labor is expensive
    ("文中指出，對重複性的矩形梁，傳統可重複使用模具仍較經濟", "文中指出，在人工昂貴的地區，重複性的矩形梁用傳統可重複使用模具仍較經濟", "ref-42 source labor", 1),
    ("文中也指出，重複性的矩形梁用傳統可重複使用的模具仍較經濟", "文中也指出，在人工昂貴的地區，重複性的矩形梁用傳統可重複使用的模具仍較經濟", "ref-42 report labor", 1),
    # ref-44 原頁未定性
    ("ITmedia BUILT 報導，電線電纜廠商 SWCC", "ITmedia BUILT 報導，SWCC", "ref-44 label", 2),
    # ref-45 導入與受理已開始
    ("報導僅寫「今後」「目指す」，皆為計畫而非已完成成果。", "BIM 導入與「BIM 習得計畫」受理已開始；AI 結合運用與 2030 年生態系，報導寫的是「今後」「目指す」，屬計畫。", "ref-45 note", 1),
    # ref-46 Much of that
    ("是否開庭與時程，取決於證據開示結果", "是否開庭與時程，大半取決於證據開示結果", "ref-46 source discovery", 1),
    ("是否開庭取決於證據開示", "是否開庭大半取決於證據開示", "ref-46 limits discovery", 1),
    # ref-47 網站說法
    ("旗下 AI 代理以客戶資料訓練", "據 Easol 網站說法，旗下 AI 代理以客戶資料訓練", "ref-47 source attribution", 1),
    ("Teammates 以客戶資料訓練", "Easol 網站稱 Teammates 以客戶資料訓練", "ref-47 report attribution", 1),
    # ref-50 原頁有 GAI-D 草案進度
    ("實作 DDEX 標準不需要成為會員。", "實作 DDEX 標準不需要成為會員。報導也提到，AI 工作小組的 Generative AI Declaration Standard（GAI-D）委員會草案已完成會員意見徵詢，將進入 DDEX 同儕審查，預計 2027 年初發布。", "ref-50 source gai-d", 1),
    ("頁面沒有說明標準將如何修改。", "頁面提到 GAI-D 草案的審查進度，但沒有說明草案內容。", "ref-50 note", 1),
    ("報導沒有說明標準會怎麼改，但串接音樂發行系統的人可以留意 AI 標示欄位的動向。",
     "報導也提到 AI 工作小組的 GAI-D 標準委員會草案已完成會員意見徵詢，預計 2027 年初發布，但沒有說明草案內容；串接音樂發行系統的人可以留意 AI 標示欄位的動向。", "ref-50 report", 1),
    ("DDEX 未說明標準將如何修改", "DDEX 未說明 GAI-D 草案內容", "ref-50 limits", 1),
    # ref-53 through 2027
    ("將在 2027 年前擴及更多機型", "並在 2027 年間陸續擴及更多機型", "ref-53 source through", 1),
    ("2027 年前會擴及更多機型", "2027 年間會陸續擴及更多機型", "ref-53 report through", 1),
    # ref-55 silk 是蠶絲；原頁未寫「只」
    ("矽蛋白", "蠶絲蛋白", "ref-55 silk", 6),
    ("魚苗微針只在虹鱒上測試", "魚苗微針在虹鱒上測試", "ref-55 trend", 1),
    # ref-56 原頁無「純」
    ("可較純再生能源加電氣化路徑", "可較再生能源加電氣化路徑", "ref-56 title", 2),
    # ref-57 記者敘述
    ("NASA 表示，人類最快將在 2030 年代登陸火星，並計劃讓太空人重返月球。", "報導指出，NASA 最快將在 2030 年代實現人類登陸火星計畫，並計劃讓太空人重返月球。", "ref-57 attribution", 1),
    # 稽核組數：三組
    ("| 10 | 撰稿後逐筆稽核（稽核包＋四組 `tech-auditor` 對照本機原頁） |", "| 10 | 撰稿後逐筆稽核（稽核包＋三組 `tech-auditor` 對照本機原頁） |", "task plan row 10 groups", 1),
    ("四組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核", "三組 `tech-auditor` 代理（fable）對照本機原頁逐筆稽核", "notes auditor groups", 1),
]

for old, new, label, count in fixes:
    build = replace(build, old, new, label, count)

# ---------- notes.md 稽核段 ----------
audit_section = """
## 撰稿後逐筆稽核

- **原頁重抓**：以 `scripts/audit-weekly-tech-report-sources.sh` 重抓 57 筆原頁，全部 HTTP 200；ITmedia BUILT 三筆以 cp932 解碼。再以 `scripts/build-weekly-tech-report-audit-packets.sh` 產生稽核包。
- **三組逐筆稽核**：三組 `tech-auditor` 各負責 19 筆，只讀稽核包與本機原頁、以文字回報；主編逐條回原頁 grep 核對後採納，修正入口 `scripts/apply-weekly-tech-report-028-audit.sh`。類型：歸因（ref-7 推送延遲是 OpenAI 的說法、ref-13 成因為 Wakefield 的分析、ref-17 合規性是報導敘述、ref-38 宣布者是美國運輸部長、ref-41 基隆監測與 ref-57 登陸火星時程為記者敘述、ref-47 AI 代理說明出自 Easol 網站）；語意精度（ref-2 運動賽事動作、ref-4 dreaming 的範圍、ref-24 與 ref-30 約數與確數、ref-29 should not、ref-35 建議、ref-41 8 成以上、ref-42 限人工昂貴地區、ref-46 大半取決於證據開示、ref-53 through 2027、ref-55 silk 是蠶絲而非矽）；狀態與時態（ref-16 400 多名客戶是先前傳出的數字、ref-20 CPO 雷射是去年推出、ref-26 交付延遲與營收目標延後的原因分開、ref-41 201 架是 2028 年目標、ref-45 BIM 導入已開始）；自加定性（ref-13、ref-17、ref-19、ref-31、ref-37 趨勢段，ref-18 結尾，ref-32 縮短審查，ref-44 電線電纜廠商，ref-55「只」，ref-56「純」）；否定式主張與原頁矛盾（ref-50 原頁其實寫了 GAI-D 草案進度）；網址改列 canonical（ref-2 deepmind.google 轉址到 blog.google，來源名改 Google Blog）。
- **未採納**：ref-48「首度擴展到歐洲以外」依原頁 One Arena 現有七個成員皆為歐洲集管團體推得，備註已寫明依據，保留。
- **結果**：正式 57、淘汰 46、12 分類、ref-1 至 ref-57 一致。
"""
build = replace(build,
    "- 盤點未成條目：SpaceX Starship 第 15 次試飛在窗內尚未發射；核融合只有一則無一手來源的外媒說法；台灣太空中心窗內無新事件；教育科技無可核對條目\n",
    "- 盤點未成條目：SpaceX Starship 第 15 次試飛在窗內尚未發射；核融合只有一則無一手來源的外媒說法；台灣太空中心窗內無新事件；教育科技無可核對條目\n" + audit_section,
    "notes audit section")

# ---------- task_plan.md ----------
build = replace(build,
    "| 10 | 撰稿後逐筆稽核（稽核包＋三組 `tech-auditor` 對照本機原頁） | 進行中 |",
    "| 10 | 撰稿後逐筆稽核（稽核包＋三組 `tech-auditor` 對照本機原頁） | 完成（主編逐條 grep 核對後採納；`scripts/apply-weekly-tech-report-028-audit.sh`） |",
    "task plan row 10")
build = replace(build,
    "| zsh 不拆字 | 迴圈內 `set -- $p` 在 zsh 不分詞，存檔檔名錯誤 | 改用明確的迴圈變數重抓，刪除錯誤檔 |",
    "| zsh 不拆字 | 迴圈內 `set -- $p` 在 zsh 不分詞，存檔檔名錯誤 | 改用明確的迴圈變數重抓，刪除錯誤檔 |\n| 歸因錯置 | 記者敘述、網站說法或作者分析寫成受訪者或機構的話（ref-7、13、17、38、41、47、57） | 補上說話者或改為報導的敘述 |\n| 譯名錯誤 | ref-55 把 silk fibroin 譯成「矽蛋白」 | 全篇改為「蠶絲蛋白」 |\n| 否定式主張與原頁矛盾 | ref-50 寫「沒有說明標準會怎麼改」，原頁有 GAI-D 草案進度 | 補上草案進度，改為未說明草案內容 |\n| 目標寫成已完成 | ref-41 把 2028 年的 201 架目標寫成已擴大 | 改為規畫 |\n| 非 canonical 網址 | ref-2 的 deepmind.google 網址轉址到 blog.google | 改列 canonical 網址與來源名 |",
    "task plan errors")

build_path.write_text(build, encoding="utf-8")
PY

sh "$ROOT/scripts/build-weekly-tech-report-028.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-028 2026-11-07
sh "$ROOT/scripts/validate-weekly-tech-report-028.sh"
git -C "$ROOT" diff --check

echo "weekly-tech-report-028 稽核修正已套用、重建、同步與驗證"
