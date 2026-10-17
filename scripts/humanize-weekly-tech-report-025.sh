#!/bin/sh
# 對 weekly-tech-report-025 的報告文字做 Humanizer-zh 人性化改寫。
#
# 只修改 canonical build script 中的 report.md heredoc，不改新聞事實、
# 數字、日期、引用編號、參考資料與 source.md。可重複執行。

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-025.sh"

python3 - "$BUILD" <<'PY'
import io
import sys

path = sys.argv[1]
text = io.open(path, encoding="utf-8").read()

report_start_marker = 'cat > "$TASK/report.md" <<\'EOF\'\n'
report_start = text.index(report_start_marker) + len(report_start_marker)
report_end = text.index('\nEOF\n', report_start)
report = text[report_start:report_end]

replacements = [
    (
        "雲端服務的全球中斷已是金融主管機關與業者共同演練的情境，多區域與跨雲的備援設計不再只是架構偏好。",
        "金融主管機關與業者已把全球雲端服務中斷納入共同演練，多區域與跨雲備援也必須納入架構評估。",
        "金融亮點：刪除金句式對比",
    ),
    (
        "生醫研究的上游，愈來愈像資料集加基礎模型的工程問題。",
        "這項計畫把資料集與基礎運算模型放在早期蛋白質研究的核心。",
        "醫療亮點：抽象類比改為直接敘述",
    ),
    (
        "從開始繪圖到 2028 年的載客目標，中間留了一年以上的驗證期，可以看出新城市上線的節奏。",
        "從開始繪圖到 2028 年載客，Waymo 為新城市留了一年以上的驗證期。",
        "運輸亮點：刪除「可以看出」",
    ),
    (
        "位在關鍵路徑上的第三方軟體，要預先設計降級流程，而不是只等廠商恢復。",
        "位在關鍵路徑上的第三方軟體，要預先準備降級流程，不能只等廠商恢復。",
        "運輸亮點：收旂否定式對比",
    ),
    (
        "尖峰日上傳量過半、串流量卻只占個位數，這組落差本身就是詐欺偵測的訊號。",
        "尖峰日的上傳量過半，串流量卻只占 1% 至 3%；上傳量不能直接當成實際收聽量。",
        "影音亮點：避免超出來源的推論",
    ),
    (
        "盜版的導流入口就在主流影音平台上，「開箱影片」成了銷售漏斗的第一層。",
        "這起案件的導流入口是主流影音平台上的開箱影片，後續交易才轉到私密社群。",
        "影音亮點：抽象行銷隐喻改為案件流程",
    ),
    (
        "人選航點、機器規劃路徑，和現在給代理目標、由代理安排步驟是同一種分工。",
        "地面人員負責選定航點，AutoNav 則在航點之間自行規劃路線。",
        "其他亮點：刪除代理類比",
    ),
    (
        "不換掉原系統、只學它的誤差，是既有系統導入機器學習最務實的切入點之一。",
        "這個做法保留既有預報模型，只用機器學習修正它的誤差。",
        "其他亮點：刪除宣稱式結論",
    ),
    (
        "「沒有人有空研究」的長尾問題，往往是 AI 最先處理掉的一批。",
        "此類長年缺乏人力的歷史密碼，正在成為 AI 密碼分析的實例。",
        "其他亮點：刪除金句式延伸",
    ),
    (
        "這就像公司不會靠一張便條提醒新人別碰正式資料庫，而是不發那個帳號。",
        "真正的限制應由帳號權限與工具規則執行，不能只靠提示詞約束。",
        "AI 趨勢：類比改為直接結論",
    ),
    (
        "對採購方來說，供應商願意公開多少負面資訊，本身就是可以比較的指標。",
        "採購方可以把供應商公開負面資訊的程度，納入模型評選指標。",
        "AI 趨勢：口語鋪墊改為直接建議",
    ),
    (
        "**CI 同時碰到供應鏈與規模兩道牆。** Actions 鎖定檔處理「同一個 tag 底下的程式碼被換掉」[[7. GitHub Changelog]](#ref-7)，Scion 處理「每天約 2,500 萬次 checkout」[[6. Anthropic Engineering]](#ref-6)。兩件事是同一個問題的兩面：CI 跑得越頻繁，抓下來的東西越需要被固定，也越需要不靠完整下載就能取得。",
        "**CI 同時要處理供應鏈固定與取用規模。** Actions 鎖定檔固定 tag 對應的程式碼 [[7. GitHub Changelog]](#ref-7)；Scion 則減少每天約 2,500 萬次 checkout 帶來的完整下載 [[6. Anthropic Engineering]](#ref-6)。CI 越頻繁，越需要同時固定取得內容與降低取用成本。",
        "軟體趨勢：牆面與雙面隱喻改為具體問題",
    ),
    (
        "Rust 編譯器自身的生命週期漏洞 [[10. iThome]](#ref-10) 則提醒，記憶體安全是語言設計加上編譯器正確性，兩者都要成立。",
        "Rust 編譯器自身的生命週期漏洞 [[10. iThome]](#ref-10) 顯示，記憶體安全還依賴編譯器正確實作語言設計。",
        "軟體趨勢：雙項公式改為完整因果",
    ),
    (
        "**推論硬體分成兩條路：雲端自研，地端好裝。**",
        "**雲端與地端推論硬體各自優化不同的部署條件。**",
        "硬體趨勢：刪除口號式二分",
    ),
    (
        "就像再好的鎖，也擋不住交屋前被換掉的鎖芯。",
        "安全晶片無法防止經銷與設定流程遭到篡改。",
        "硬體趨勢：門鎖類比改為直接結論",
    ),
    (
        "兩者都在懲罰「設定一次就忘記」的系統。",
        "這兩種情況都要求系統自動輪替或更新，不能依賴一次性設定。",
        "基礎趨勢：擬人化措辭改為工程要求",
    ),
    (
        "SBOM 平常像是文書作業，碰到這種漏洞時才顯出價值。",
        "發生這類漏洞時，SBOM 可用來盤點哪些應用程式與工具內嵌了 libcurl。",
        "基礎趨勢：刪除對文書作業的抽象對比",
    ),
    (
        "**網路基礎的韌性問題愈來愈實體。**",
        "**網路基礎的韌性也取決於機房與電力配置。**",
        "基礎趨勢：抽象標題改為具體條件",
    ),
    (
        "機房的位置與電力，重新回到架構討論的桌上。",
        "架構評估需要一併考慮機房位置、電力來源與網路距離。",
        "基礎趨勢：慣用隱喻改為直接結論",
    ),
    (
        "軟體帶來持續更新的能力，也帶來單點故障的風險。",
        "軟體定義汽車需要持續更新；位在關鍵路徑的航空軟體則要準備降級機制。",
        "運輸趨勢：對稱排比改為具體建議",
    ),
    (
        "**營建檢查從抽樣走向面狀比對。** LiDAR 面狀評估補足插針點檢 [[40. ITmedia BUILT]](#ref-40)，檢圖 AI 比對多份圖面的不一致 [[41. ITmedia BUILT]](#ref-41)，都是把「人工抽查幾個點」往「機器整面比對」推進。",
        "**營建檢查開始補上抽樣以外的範圍。** LiDAR 掃描可找出插針點檢漏掉的局部厚度不足 [[40. ITmedia BUILT]](#ref-40)；檢圖 AI 則比對多份圖面的不一致 [[41. ITmedia BUILT]](#ref-41)。",
        "房地產趨勢：刪除公式化的從 A 到 B 結構",
    ),
    (
        "**資料中心本身成了建築題，智慧家居走向本機優先。**",
        "**邊緣資料中心考慮地方建材，智慧門鎖則保留本機運作。**",
        "房地產趨勢：改為兩則來源的具體共通點",
    ),
    (
        "代理測試環境的隔離，開始從工程實務變成法遵問題。",
        "代理測試環境的隔離，現在也要納入法遵評估。",
        "第三輪 AI 亮點：刪除「從 A 變成 B」公式",
    ),
    (
        "與中國團隊合作開發或授權模型的專案，技術移轉條款之後可能要多一道出口合規檢查。",
        "與中國團隊合作開發或授權模型的專案，需要追蹤修訂結果，並檢查技術移轉條款的出口合規要求。",
        "第三輪 AI 亮點：精確交代尚未定案的法遵影響",
    ),
    (
        "要規劃後量子密碼遷移的團隊，這類降低硬體門檻的進展值得持續追蹤。",
        "規劃後量子密碼遷移時，也應追蹤此類可能降低硬體門檻的進展。",
        "第三輪其他亮點：收旂「值得追蹤」的建議語氣",
    ),
    (
        "把 2024 年提出的降本方法搬到真實硬體上；距離實用仍需更大規模的驗證。",
        "Google 將 2024 年提出的方法在真實硬體上完成實證；距離實用仍需更大規模的驗證。",
        "第三輪其他趨勢：刪除口語化的搬運隱喻",
    ),
]

applied = 0
skipped = 0
for old, new, label in replacements:
    old_hits = report.count(old)
    new_hits = report.count(new)
    if old_hits == 1:
        report = report.replace(old, new)
        applied += 1
    elif old_hits == 0 and new_hits == 1:
        skipped += 1
    else:
        raise SystemExit(
            "替換命中次數異常（舊 %d 次、新 %d 次）：%s"
            % (old_hits, new_hits, label)
        )

text = text[:report_start] + report + text[report_end:]

plan_anchor = "| 11 | 第二輪查核：重抓 52 筆原頁、驗證關鍵詞與重新補搜 | 完成（50 筆直接 HTTP 200；Intel、FTC 依站點例外重抓後為 200；549 個原頁關鍵詞全數命中；補搜無新增） |"
plan_stage_old = "| 12 | Humanizer-zh 人性化改寫 | 完成（22 處；事實、數字、日期、引用與參考資料不變） |"
plan_stage_new = "| 12 | Humanizer-zh 人性化改寫 | 完成（26 處；事實、數字、日期、引用與參考資料不變） |"
if plan_stage_new not in text:
    if text.count(plan_stage_old) == 1:
        text = text.replace(plan_stage_old, plan_stage_new)
    elif text.count(plan_anchor) == 1:
        text = text.replace(plan_anchor, plan_anchor + "\n" + plan_stage_new)
    else:
        raise SystemExit("任務計畫階段列命中次數異常")

notes_anchor = "\n## 知識庫更新\n"
notes_section = """
\n## Humanizer-zh 人性化改寫（Codex）

- 透過 `scripts/humanize-weekly-tech-report-025.sh` 修改 canonical build script，再重建並同步交付檔。
- 共改寫 26 處，集中處理類比、金句式結尾、對稱排比、抽象隐喻與「可以看出」等機械轉場。
- 保留新聞事實、數字、日期、引用編號、參考資料與 `source.md`。
- Humanizer-zh 品質自評：直接性 9、節奏 9、信任度 9、真實性 8、精簡度 9、用詞準確性 10，合計 54/60。
"""
notes_count_old = "- 共改寫 22 處，集中處理類比、金句式結尾、對稱排比、抽象隐喻與「可以看出」等機械轉場。"
notes_count_new = "- 共改寫 26 處，集中處理類比、金句式結尾、對稱排比、抽象隐喻與「可以看出」等機械轉場。"
if notes_count_old in text:
    text = text.replace(notes_count_old, notes_count_new)
elif "## Humanizer-zh 人性化改寫（Codex）" not in text:
    if text.count(notes_anchor) != 1:
        raise SystemExit("研究筆記插入點命中次數異常")
    text = text.replace(notes_anchor, notes_section + notes_anchor)

io.open(path, "w", encoding="utf-8").write(text)
print("人性化替換：套用 %d 處、已套用而跳過 %d 處" % (applied, skipped))
PY

sh "$ROOT/scripts/build-weekly-tech-report-025.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-025 2026-10-17
sh "$ROOT/scripts/validate-weekly-tech-report-025.sh"
