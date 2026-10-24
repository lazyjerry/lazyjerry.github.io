#!/bin/sh
# 對 weekly-tech-report-026 的報告文字做 Humanizer-zh 人性化改寫。
#
# 只修改 canonical build script 中的 report.md heredoc，不改新聞事實、
# 數字、日期、引用編號、參考資料與 source.md。可重複執行。

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
BUILD="$ROOT/scripts/build-weekly-tech-report-026.sh"

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
        "維護 SDK 的團隊多了一種回饋：文件寫得好不好，可以看代理照著做的成功率。",
        "維護 SDK 的團隊可以拿代理照文件操作的成功率，回頭找出文件哪裡寫得不清楚。",
        "軟體亮點：刪除冒號揭示句",
    ),
    (
        "晶片供應風險不只在晶圓與封裝，也在設備的材料。",
        "這次討論的是廠內自動化設備用的馬達，屬於設備端的材料風險。",
        "硬體亮點：刪除否定式排比金句",
    ),
    (
        "做影像或 IoT 硬體的團隊，晶片來源已會直接決定產品能不能進美國市場。",
        "做影像或 IoT 硬體的團隊，晶片來源會直接決定產品能不能進美國市場。",
        "硬體亮點：刪除贅字「已」",
    ),
    (
        "多可用區部署擋得住單一可用區斷電，擋不住所有人同時容錯移轉造成的容量不足，也擋不住控制層跨可用區的同步相依。",
        "多可用區部署擋得住單一可用區斷電；但所有人同時容錯移轉造成的容量不足，加上控制層跨可用區的同步相依，都會讓影響擴到其他可用區。",
        "基礎亮點：拆掉三段排比",
    ),
    (
        "代理付款的難點不在 API，而在網站如何辨識「這是被授權的代理」而不是機器人。",
        "供應商網站得分辨被授權的代理與一般機器人流量，這次試行處理的就是這一段。",
        "金融亮點：刪除「不在……而在」對比",
    ),
    (
        "自家的代理工具若會動到金流，這套權限切分可以直接套用。",
        "自家的代理工具若會動到金流，可以參考這套權限切分。",
        "金融亮點：收斂「直接套用」",
    ),
    (
        "AI 醫材的模型更新與效能監控，會成為產品本身要具備的功能。",
        "做 AI 醫材的團隊，模型更新與效能監控的紀錄可能要配合新框架準備。",
        "醫療亮點：推測改為具體的準備事項",
    ),
    (
        "後續釋出的資料格式值得醫療資料工程師追蹤。",
        "醫療資料工程師可以等平台公開後，看它的資料格式與存取方式。",
        "醫療亮點：刪除「值得追蹤」",
    ),
    (
        "eVTOL 進入實測，飛行資料的蒐集與回報格式會成為營運與監理的介面。",
        "擴大飛行範圍是為了蒐集更多資料，記錄與彙整飛行資料的系統要先準備好。",
        "運輸亮點：抽象「介面」改為具體事項",
    ),
    (
        "歐洲車廠與叫車平台的自駕軟體棧，有一部分會落在同一套參考設計上。",
        "Bolt 與 Lucid 都採用輝達的軟體與平台，歐洲叫車服務的自駕系統有一部分會來自同一家供應商。",
        "運輸亮點：「軟體棧」改為台灣用語並具體化",
    ),
    (
        "建築資料要給機器人用，中間需要一層轉換規則，這和一般資料管線的清理步驟是同一類問題。",
        "施工圖原本是畫給人看的，要給機器人用，就得先拿掉文字、符號和尺寸線。",
        "房地產亮點：刪除資料管線類比",
    ),
    (
        "這則是政策面的市場背景，與房屋修繕、昇降設備相關的服務可以留意第 2 梯次時程。",
        "做房屋修繕或昇降設備的業者，可以留意第 2 梯次的受理時程。",
        "房地產亮點：刪除後設說明",
    ),
    (
        "先逐項驗證、再整合測試，營建自動化也走這個順序。",
        "六項技術目前各自驗證過，還沒有在同一個工地一起跑過。",
        "房地產亮點：金句改為現況",
    ),
    (
        "空間音訊不只用在耳機與遊戲，也用在劇場觀眾席的分區聲響上。",
        "觀眾坐在哪一區，聽到的就是不同的震動與聲響層次。",
        "表演藝術亮點：刪除否定式排比",
    ),
    (
        "活動資料沒有統一格式，聚合 API 的價值就在這裡。",
        "Tickitto 做的，就是把這些格式不一的活動資料整理成一份。",
        "表演藝術亮點：刪除金句",
    ),
    (
        "這是專利申請，不是產品；但用骨架資料取樣來做群眾行為，是遊戲開發常見的低成本做法。",
        "目前只是專利申請；NPC 的動作直接取自表演者與觀眾的骨架資料，不必另外製作動畫。",
        "表演藝術亮點：刪除對比句與無出處的「常見做法」",
    ),
    (
        "做生成式 UGC 功能時，同意與授權的資料模型是產品設計的一部分。",
        "做生成式 UGC 功能，藝人的同意狀態要能在系統裡分兩層記錄。",
        "影音亮點：抽象說法改為具體設計",
    ),
    (
        "這是創作者的觀點，記錄了來台與談的韓國編劇對 AI 的態度。",
        "這是編劇個人的看法。",
        "影音亮點：刪除填充說明",
    ),
    (
        "為非文字資料生成描述再做對齊訓練，是領域模型補足文獻偏誤的一種資料策略。",
        "先替非文字資料生成描述、再做對齊訓練，這個做法也能用在其他缺少文字標註的領域資料。",
        "其他亮點：刪除「是……的一種策略」",
    ),
    (
        "快速偵測、定位再通知其他觀測站，是事件驅動架構在天文上的例子。",
        "規劃系統能在幾分鐘內排入臨時觀測，Swift 才追得到這麼多短暫的天文事件。",
        "其他亮點：刪除架構類比",
    ),
    (
        "目前仍是規劃階段，與台積電評估無稀土馬達同屬稀土供應風險的因應。",
        "目前仍是規劃階段，和台積電評估無稀土馬達一樣，都是在因應稀土供應風險。",
        "其他亮點：拆開「同屬……的因應」",
    ),
    (
        "代理評測的網路隔離，等同於對外部社群的責任。",
        "評測要開放網路，就得先想好代理碰到外部專案時怎麼攔下來。",
        "AI 趨勢：刪除金句",
    ),
    (
        "測試資料的格式與指標，會成為與監理機關溝通的共同語言。",
        "測試期間記哪些指標、怎麼記，之後都會拿去跟監理機關談。",
        "運輸趨勢：刪除「共同語言」",
    ),
]

superseded = {
    "基礎亮點：拆掉三段排比": "多可用區部署讓服務在單一可用區斷電時能切換；但所有人同時容錯移轉造成的容量不足，加上控制層跨可用區的同步相依，都會讓影響擴到其他可用區。",
    "其他亮點：刪除「是……的一種策略」": "研究者認為這個做法可用於多種晶體材料，並希望其他材料科學家採用。",
}

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
    elif old_hits == 0 and label in superseded and report.count(superseded[label]) == 1:
        # 後續輪次（apply-weekly-tech-report-026-third-audit.sh）又改寫了這句，視為已套用
        skipped += 1
    else:
        raise SystemExit(
            "替換命中次數異常（舊 %d 次、新 %d 次）：%s"
            % (old_hits, new_hits, label)
        )

text = text[:report_start] + report + text[report_end:]

# 階段列與研究筆記段落接在 Codex 第二輪查核之後（apply-weekly-tech-report-026-second-audit.sh
# 以「錨點緊接其內容」判斷已套用，插在它前面會讓該腳本重跑時重複插入）。
audit_row = "| 10 | 撰稿後逐筆稽核（稽核包＋四組 `tech-auditor` 對照本機原頁） | 完成（四組回報約 65 處，全數採納，紀錄於 `notes.md`） |"
second_audit_row = "| 11 | Codex 第二輪查核：重抓 55 筆原頁、複核內文與 12 類缺漏 | 完成（54 筆以 curl 取得 HTTP 200；SEC 以瀏覽器擷取核對；修正 ref-16 過時備註，沒有新增正式來源） |"
stage_detail = "Humanizer-zh 人性化改寫 | 完成（%d 處；事實、數字、日期、引用與參考資料不變） |" % len(replacements)
# 移除早先誤插在第 10 階段之後的「| 11 | Humanizer-zh」列
text = text.replace(audit_row + "\n| 11 | " + stage_detail, audit_row)
if text.count(second_audit_row) == 1:
    plan_anchor, plan_stage = second_audit_row, "| 12 | " + stage_detail
else:
    plan_anchor, plan_stage = audit_row, "| 11 | " + stage_detail
if plan_stage not in text:
    if text.count(plan_anchor) != 1:
        raise SystemExit("任務計畫階段列命中次數異常")
    text = text.replace(plan_anchor, plan_anchor + "\n" + plan_stage)

audit_end = "- 錯字：「接獲時商」改為「接獲比利時商」（ref-40）\n"
second_audit_end = "- **結果**：正式來源 55 筆、淘汰 62 筆、ref-1 至 ref-55 與 12 分類不變。\n"
notes_section = """
## Humanizer-zh 人性化改寫

- 透過 `scripts/humanize-weekly-tech-report-026.sh` 修改 canonical build script，再重建並同步交付檔。
- 共改寫 %d 處，集中處理亮點結尾與趨勢判讀中的金句、否定式排比、三段排比、類比與「值得追蹤」等套話；「軟體棧」改為具體敘述。
- 保留新聞事實、數字、日期、引用編號、參考資料與 `source.md`。
""" % len(replacements)
# 移除早先誤插在第一輪稽核段之後的段落
text = text.replace(audit_end + notes_section, audit_end)
notes_anchor = second_audit_end if text.count(second_audit_end) == 1 else audit_end
if "## Humanizer-zh 人性化改寫" not in text:
    if text.count(notes_anchor) != 1:
        raise SystemExit("研究筆記插入點命中次數異常")
    text = text.replace(notes_anchor, notes_anchor + notes_section)

io.open(path, "w", encoding="utf-8").write(text)
print("人性化替換：套用 %d 處、已套用而跳過 %d 處" % (applied, skipped))
PY

sh "$ROOT/scripts/build-weekly-tech-report-026.sh"
sh "$ROOT/scripts/deliver-weekly-tech-report.sh" weekly-tech-report-026 2026-10-24
sh "$ROOT/scripts/validate-weekly-tech-report-026.sh"
