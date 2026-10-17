#!/bin/sh

set -eu

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 SOURCE_MD PAGES_DIR" >&2
  exit 2
fi

SOURCE=$1
PAGES_DIR=$2

if [ ! -f "$SOURCE" ]; then
  echo "Source file not found: $SOURCE" >&2
  exit 2
fi

if [ ! -d "$PAGES_DIR" ]; then
  echo "Pages directory not found: $PAGES_DIR" >&2
  exit 2
fi

python3 - "$SOURCE" "$PAGES_DIR" <<'PY'
import html
import re
import sys
import unicodedata
from pathlib import Path

source_path = Path(sys.argv[1])
pages_dir = Path(sys.argv[2])
source = source_path.read_text(encoding="utf-8")

formal = source.split("## 正式納入來源", 1)[1].split("## 淘汰來源", 1)[0]
entries = list(re.finditer(r"(?ms)^### (\d+)\. .*?(?=^### \d+\.|\Z)", formal))

def normalize(value: str) -> str:
    value = html.unescape(value)
    value = unicodedata.normalize("NFKC", value)
    value = re.sub(r"\\u([0-9a-fA-F]{4})", lambda m: chr(int(m.group(1), 16)), value)
    value = re.sub(r"\s+", " ", value)
    return value.casefold()

missing = []
checked_terms = 0
for entry_match in entries:
    ref = int(entry_match.group(1))
    entry = entry_match.group(0)
    checklist_match = re.search(r"grep 核對(?:\uff08[^\uff09]*\uff09)?\uff1a(.*?)(?:\u3002|$)", entry)
    if not checklist_match:
        missing.append((ref, "<missing checklist>"))
        continue

    page = pages_dir / f"ref-{ref}.html"
    if ref == 18 and (pages_dir / "ref-18-default.html").exists():
        page = pages_dir / "ref-18-default.html"
    if ref == 42 and (pages_dir / "ref-42-declared.html").exists():
        page = pages_dir / "ref-42-declared.html"
    if not page.exists():
        missing.append((ref, "<missing page>"))
        continue

    raw = page.read_bytes()
    decoded = raw.decode("utf-8", errors="replace")
    if decoded.count("\ufffd") > 20:
        decoded = raw.decode("cp932", errors="replace")
    haystack = normalize(decoded)

    terms = [term.strip() for term in checklist_match.group(1).split("、") if term.strip()]
    for term in terms:
        checked_terms += 1
        if normalize(term) not in haystack:
            missing.append((ref, term))

print(f"Checked {checked_terms} terms across {len(entries)} formal sources")
if missing:
    for ref, term in missing:
        print(f"ref-{ref}\t{term}")
    raise SystemExit(1)
print("All source-term checks passed")
PY
