#!/usr/bin/env python3
"""把多組研究代理的候選檔收斂成 source.md 的正式與淘汰區段。

用法: python3 scripts/converge-weekly-tech-report-candidates.py <候選目錄> <order.txt> <rejects.txt> <out_formal.md> <out_reject.md> [窗起 窗迄]

- 候選目錄：放 candidates-A.md … candidates-X.md（X 為主編補查，最後讀入、覆蓋代理版本）與選用的 overrides.tsv。
- 候選檔格式：`## 正式建議` 與 `## 淘汰候選` 兩節，每筆 `### 編號. 標題` 加 `- 欄位：值` 各行。
- order.txt：每行一個 URL，決定正式來源的編號順序；`#` 開頭為註解。
- rejects.txt：每行 `URL<TAB>淘汰原因`，把代理列為正式、主編改為淘汰的條目補上原因。
- overrides.tsv：`URL<TAB>摘要` 或 `URL<TAB>欄位<TAB>值`，覆寫單一欄位（例如精簡超過 500 字的摘要、改中文標題）。
- 檢查：摘要 100 至 500 字、發布日期落在時間窗、正式建議未入選者必須有淘汰原因；有錯誤時 exit 1。
"""
import re
import sys
from pathlib import Path

GROUPS = ["A", "B", "C", "D", "E", "F", "X"]
DROP_FIELDS = ("來源網站", "程式設計師觀點")


def parse(path: Path):
    text = path.read_text(encoding="utf-8")
    formal, reject = [], []
    section = None
    for block in re.split(r"\n(?=#{2,3} )", text):
        head = block.strip().split("\n", 1)[0]
        if head.startswith("## 正式建議"):
            section = "formal"
            continue
        if head.startswith("## 淘汰候選"):
            section = "reject"
            continue
        m = re.match(r"### (?:[0-9]+|[A-Z]+)\. (.+)", block.strip())
        if not m:
            continue
        title = m.group(1).strip()
        fields = {}
        order = []
        for line in block.strip().split("\n")[1:]:
            fm = re.match(r"- ([^：]+)：(.*)", line)
            if fm:
                key, val = fm.group(1), fm.group(2)
                fields[key] = val
                order.append(key)
        entry = {"heading": title, "fields": fields, "order": order, "src": path.name}
        if section == "formal":
            formal.append(entry)
        elif section == "reject":
            reject.append(entry)
    return formal, reject


def main():
    if len(sys.argv) < 6:
        print(__doc__)
        sys.exit(2)
    cand_dir, order_file, rejects_file, out_formal, out_reject = sys.argv[1:6]
    window_start, window_end = (sys.argv[6], sys.argv[7]) if len(sys.argv) >= 8 else ("0000-00-00", "9999-99-99")
    SCRATCH = Path(cand_dir)
    order = [l.strip() for l in Path(order_file).read_text(encoding="utf-8").splitlines() if l.strip() and not l.startswith("#")]
    extra_rejects = {}
    for l in Path(rejects_file).read_text(encoding="utf-8").splitlines():
        if l.strip() and not l.startswith("#"):
            url, reason = l.split("\t", 1)
            extra_rejects[url.strip()] = reason.strip()

    by_url = {}
    rejects = []
    for g in GROUPS:
        p = SCRATCH / f"candidates-{g}.md"
        if not p.exists():
            continue
        formal, reject = parse(p)
        for e in formal:
            by_url[e["fields"]["URL"].strip()] = e
        rejects.extend(reject)

    ov = SCRATCH / "overrides.tsv"
    if ov.exists():
        for l in ov.read_text(encoding="utf-8").splitlines():
            if l.strip() and not l.startswith("#"):
                parts = l.split("\t")
                url = parts[0].strip()
                field, value = ("摘要", parts[1]) if len(parts) == 2 else (parts[1], parts[2])
                if url in by_url:
                    by_url[url]["fields"][field] = value.strip()

    errors = []
    formal_out = []
    for i, url in enumerate(order, 1):
        e = by_url.get(url)
        if not e:
            errors.append(f"order 中的 URL 不在任何候選檔的正式建議：{url}")
            continue
        f = e["fields"]
        summary = f.get("摘要", "")
        n = len(summary)
        if not 100 <= n <= 500:
            errors.append(f"[{i}] 摘要 {n} 字超出 100-500：{f.get('標題')}")
        d = f.get("發布日期", "")
        if not (window_start <= d <= window_end):
            errors.append(f"[{i}] 發布日期 {d} 不在窗內：{f.get('標題')}")
        if f.get("是否納入正式參考資料", "").strip() != "是":
            errors.append(f"[{i}] 未標示納入：{f.get('標題')}")
        lines = [f"### {i}. {f.get('標題', e['heading'])}"]
        for key in e["order"]:
            if key in DROP_FIELDS:
                continue
            lines.append(f"- {key}：{f[key]}")
        formal_out.append("\n".join(lines))

    # 代理列為正式但主編未採用 → 淘汰
    demoted = []
    for url, e in by_url.items():
        if url in order:
            continue
        reason = extra_rejects.get(url)
        if not reason:
            errors.append(f"代理正式建議未入選也沒有淘汰原因：{url}")
            continue
        f = e["fields"]
        demoted.append({
            "heading": f.get("標題", e["heading"]),
            "fields": {"URL": url, "發布日期": f.get("發布日期", ""), "分類": f.get("分類", ""),
                       "是否納入正式參考資料": "否", "淘汰原因": reason},
            "order": ["URL", "發布日期", "分類", "是否納入正式參考資料", "淘汰原因"],
        })

    all_rejects = demoted + rejects
    seen = set()
    reject_out = []
    letters = []
    idx = 0
    for e in all_rejects:
        url = e["fields"].get("URL", "").strip()
        if url in seen or url in order:
            continue
        seen.add(url)
        label = ""
        k = idx
        while True:
            label = chr(ord("A") + k % 26) + label
            k = k // 26 - 1
            if k < 0:
                break
        idx += 1
        f = e["fields"]
        lines = [f"### {label}. {e['heading']}"]
        for key in ["URL", "發布日期", "分類", "是否納入正式參考資料", "淘汰原因"]:
            lines.append(f"- {key}：{f.get(key, '')}")
        reject_out.append("\n".join(lines))

    Path(out_formal).write_text("\n\n".join(formal_out) + "\n", encoding="utf-8")
    Path(out_reject).write_text("\n\n".join(reject_out) + "\n", encoding="utf-8")
    print(f"正式 {len(formal_out)} 筆、淘汰 {len(reject_out)} 筆")
    if errors:
        print("\n".join("ERROR " + x for x in errors))
        sys.exit(1)


if __name__ == "__main__":
    main()
