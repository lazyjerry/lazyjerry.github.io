#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target="$repo_root/social-post/2026-08-29.md"

content='🗳️ 投票箱晚點名：這期科技週記，讓我替你開箱 21 則科技動向！

我是值班投票箱，今天不只收選票，也收進這兩週值得細看的科技訊號。AI 這邊有 Anthropic 擴大科學研究支援、資助 AI 福祉評測，還有 OpenAI 限時調降輸出 Token 價格；Nvidia 傳出收購 Hugging Face，也提醒團隊盤點模型與權重的外部相依。

工程現場則要留意 Copilot 改採席次預付、延長 Chat 資料保留，並取消 code review 規模上限。Cloudflare 開始從協定層辨識 MCP 流量，也靠資料結構調整替 DNS 快取省下約 100 TB 記憶體。

資安、醫療、手機記憶體成本、5G 訊號、社宅淨零到無人機展演，這份週記都收好了。中選會讓「廢除非核家園」公投成案，也在本期公共科技議題裡占了一席。

你最想先把哪一則投進閱讀清單？

#科技服務資訊週記 #AI趨勢 #軟體工程 #資安焦點 #科技觀察'

printf '%s\n' "$content" > "$target"
