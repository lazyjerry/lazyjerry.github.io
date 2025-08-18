---
title: 專題報告週記
description: 不定時發布使用 Manus AI 所整理的相關專題，希望一週更新一次。
og_image: https://lazyjerry.github.io/assets/og-image2.png
---

# CLI 工具比較

**作者：** Manus AI  
**報告日期：** 2025 年 8 月 18 日

---

工具 功能 上下文長度 成本 開源狀態 適合場景 付費方式

---

Gemini CLI 終端內 Agent。支援 ReAct、檔案與殼層工具、可接 1M tokens（Gemini 2.5 系列）〔[4][5][6]〕 個人可免費用 Gemini 2.5 Pro；企業走 Vertex AI 開源 大型程式庫理解、PR 審查、自動修復〔[3][5]〕 個人免費；或以 Google AI
GitHub Actions 〔[1][2][3]〕 計量價〔[1][7]〕 Apache-2.0〔[2]〕 Studio/Vertex API
金額計費〔[1][7]〕

Claude Code 終端代碼代理。掃描與改寫整庫、MCP Sonnet 4 上至 1M tokens〔[10]〕 訂閱方案並有週限額調整；避免「無限用量」濫用〔[11]〕 封閉原廠 企業級重構、上線前修補、深度理解專案〔[8][10]〕 Anthropic 訂閱與/或 API
工具、專案導覽〔[8][9]〕 依量計費〔[8][11]〕

cursor-agent（Cursor 以 CLI 執行 Cursor 代理。規則化上下文、與 IDE 官方未標明固定數字；依模型與規則切片供稿〔[12][14]〕 方案制（Free/Pro/Enterprise）。Pro 專有 偏好與 Cursor IDE 同步規則與流程者；CI 月費訂閱；超量再升級或改用自帶
CLI） 規則共用；自動寫改查測試〔[12][13][14]〕 含一定模型推論額度，超量需升級〔[13][15]〕 腳本自動化〔[12][14]〕 API〔[13][15]〕

Codex CLI（OpenAI） 本機終端代碼代理。支援 ChatGPT 帳號登入或 API 依所用模型（gpt-5 等）與設定而定；官方未固定單一上限於 CLI 隨 ChatGPT Plus/Pro/Team 使用權益或依 API 開源 本機安全沙箱開發、零資料保留組織、流水線任務〔[16]〕 ChatGPT 訂閱內含或 OpenAI API
key；MCP、沙箱、CI 模式〔[16]〕 層〔[16]〕 用量計費〔[16]〕 Apache-2.0〔[16]〕 按量計費〔[16]〕

---

---

# 參考資料（編號對應上表）

---

編號 來源與說明

---

[1] [Google 官方 Blog：介紹 Gemini CLI
與免費存取選項](https://blog.google/technology/developers/introducing-gemini-cli-open-source-ai-agent/)

[2] [GitHub：google-gemini/gemini-cli 專案，Apache-2.0](https://github.com/google-gemini/gemini-cli)

[3] [GitHub Action：run-gemini-cli，支援在開發流程中自動化](https://github.com/marketplace/actions/run-gemini-cli)

[4] [Vertex AI 長上下文說明：Gemini 標配 1M tokens](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/gemini)

[5] [Google Cloud Blog：Gemini 2.5 Pro 與 1M
context](https://cloud.google.com/blog/products/ai-machine-learning/whats-new-with-gemini-ai-august-2025)

[6] [Vertex AI 模型頁：2.5 系列與 1M context](https://cloud.google.com/vertex-ai/generative-ai/docs/model-garden/gemini)

[7] [Vertex AI 生成式 AI 價格頁](https://cloud.google.com/vertex-ai/pricing)

[8] [Anthropic 文件：Claude Code 概覽與能力](https://docs.anthropic.com/en/docs/claude-code/overview)

[9] [Anthropic 官網：Claude Code 能做什麼](https://www.anthropic.com/news/claude-code)

[10] [The Verge 報導：Claude Sonnet 4 提供 1M
context](https://www.theverge.com/ai-artificial-intelligence/757998/anthropic-just-made-its-latest-move-in-the-ai-coding-wars)

[11] [Business Insider：因重度用戶推論成本，Claude Code
將引入週限額與反共用](https://www.businessinsider.com/anthropic-ai-claude-code-tool-limits-pricing-change-2025-8)

[12] [Cursor CLI 概覽與安裝](https://cursor.sh/docs/cli/overview)

[13] [Cursor 定價頁：方案與額度邏輯](https://cursor.sh/pricing)

[14] [Cursor CLI 使用與規則檔說明](https://cursor.sh/docs/cli/configuration)

[15] [TechCrunch：Cursor 因定價溝通引發爭議與調整](https://techcrunch.com/2025/07/28/cursor-ai-pricing-controversy/)

[16] [GitHub：openai/codex（Codex CLI）README，登入方式、MCP、沙箱、開源授權](https://github.com/openai/codex)

---
