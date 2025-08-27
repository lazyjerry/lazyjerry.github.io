# AI提示詞工程英文簡寫框架研究發現

## 已識別的主要框架

### 1. RISEN框架
- **全名**: Role, Input, Steps, Expectation, Narrowing
- **開發者**: Kyle Balmer
- **基礎**: 基於RISE框架的修改版本，增加了Narrowing組件
- **組成要素**:
  - Role: 定義AI的角色（顧問、創作者、問題解決者等）
  - Input: 提供的數據或資訊
  - Steps: 給出的指令或方向
  - Expectation: 期望的結果或目標
  - Narrowing: 限制、約束或聚焦領域

### 2. CREATE框架
- **全名**: Character, Request, Examples, Additions, Type of Output, Extras
- **開發者**: Dave Birss (AI顧問和作者)
- **特點**: 以"你"來稱呼AI，類似教師的作業指派
- **組成要素**:
  - Character: 描述AI要扮演的角色
  - Request: 清楚具體地定義請求
  - Examples: 提供範例
  - Additions: 細化任務，描述觀點或風格
  - Type of Output: 輸出類型（如100字摘要）
  - Extras: 其他資訊，包括參考文本

### 3. CLEAR框架
- **全名**: Concise, Logical, Explicit, Adaptive, Reflective
- **開發者**: Leo S. Lo (新墨西哥大學圖書館員)
- **特點**: 強調迭代改進過程
- **組成要素**:
  - Concise: 僅使用必要詞彙
  - Logical: 有意識地安排想法順序
  - Explicit: 提供精確的格式、內容或範圍指示
  - Adaptive: 根據初始結果改進提示
  - Reflective: 批判性思考AI的回答

### 4. CO-STAR框架
- **全名**: Context, Objective, Style, Tone, Audience, Response
- **特點**: 協作式提示框架
- **組成要素**:
  - Context: 設定背景
  - Objective: 目標
  - Style: 風格
  - Tone: 語調
  - Audience: 受眾
  - Response: 回應格式

### 5. RACE框架
- **全名**: Role, Action, Context, Execute
- **特點**: 四步驟結構化方法
- **組成要素**:
  - Role: 角色定義
  - Action: 行動指令
  - Context: 背景資訊
  - Execute: 執行指示

### 6. CRAFT框架
- **全名**: Context, Role, Action, Format, Target Audience
- **特點**: 五個核心組件的結構化方法
- **組成要素**:
  - Context: 背景
  - Role: 角色
  - Action: 行動
  - Format: 格式
  - Target Audience: 目標受眾

## 其他提及的框架
- RTF (Role, Task, Format)
- Chain of Thought
- RHODES
- Chain of Destiny
- TIDD-EC

## 來源資料
- RISEN: https://easyaibeginner.com/risen-framework-ai-prompt-for-chatgpt/
- CREATE: https://iac.gatech.edu/featured-news/2024/02/AI-prompt-engineering-ChatGPT
- CLEAR: https://library.usfca.edu/ai/promptengineering
- 其他框架來源待進一步調研



## 框架詳細分析

### CO-STAR框架深度分析
- **來源**: Portkey.ai (2025年3月7日)
- **特點**: 系統性方法，超越試錯法
- **四個主要步驟**:
  1. 結構化提示 (Structured Prompting)
  2. 適應性迭代 (Adaptive Iteration)
  3. 模型特定調整 (Model-Specific Adjustments)
  4. Token效率優化 (Token Efficiency Optimization)
- **優勢**: 提高準確性、減少幻覺、降低成本
- **與其他方法比較**: 
  - 相對於CoT (Chain of Thought): 專注於改進初始輸入而非引導推理過程
  - 相對於ToT (Tree of Thought): 更輕量級，易於實施和適應

### RACE框架深度分析
- **來源**: Acronymat.com (2024年12月22日)
- **設計理念**: "WIN THE AI PROMPTING RACE"
- **視覺化**: 提供信息圖表和海報形式的框架說明
- **應用場景**: 適合需要快速、結構化提示的場景

### 結構化方法 (Structured Approach)
- **開發者**: Lance Cummings (北卡羅來納大學威明頓分校副教授)
- **來源**: "The Anatomy of a Prompt"
- **四步驟公式**:
  1. 角色和目標 (Role and Goal)
  2. 背景和脈絡 (Context and Background)
  3. 明確定義任務 (Clearly Define Task)
  4. 提供參考內容 (Reference Content)

### 修辭學方法 (Rhetorical Approach)
- **開發者**: Sébastien Bauer (巴塞隆納自治大學)
- **核心**: 描述主要論點和修辭情境
- **要素**: 受眾、脈絡、作者與信譽、情感、邏輯、安排、風格與表達

## 應用領域分析

### 行銷領域應用
- **來源**: Skai.io (2025年4月17日), eLearning Industry (2025年7月8日)
- **特點**: 專注於內容創作和策略制定
- **案例**: 完整行銷策略生成提示

### UX研究領域應用
- **來源**: Merge.rocks (2024年8月2日), Medium (2024年9月3日)
- **特點**: 改善用戶體驗設計流程
- **應用**: 加速用戶研究、提升設計直覺性

### 影像生成領域應用
- **來源**: Skylum (2025年7月25日), Adobe Express
- **特點**: 視覺創作的精確控制
- **技巧**: 清晰度、細節添加、散景效果、位置變更

## 學術研究進展
- **最新研究**: 2025年關於行銷教育中AI技能差距的研究
- **分類框架**: 針對行銷專業人員的生成式AI應用分類學框架
- **用戶體驗**: LLM聊天機器人的用戶體驗挑戰研究


## 九大框架詳細比較分析

### 框架比較表格 (來源: AI Business Asia, 2024年8月20日)

| 框架 | 關鍵組件 | 風格 | 使用案例 |
|------|----------|------|----------|
| A.P.E. | Action, Purpose, Expectation | 清晰、目的驅動的解釋 | 掌握複雜設計模式 |
| R.A.C.E. | Role, Action, Context, Expectation | 領域專家 | 需要角色特定知識的任務，如詳細遷移策略 |
| C.O.A.S.T. | Context, Objective, Actions, Scenario, Task | 全方位、綜合性 | 多面向架構挑戰 |
| T.A.G. | Task, Action, Goal | 直接、清晰 | 有明確目標的任務，如實施特定方法論 |
| R.I.S.E. | Role, Input, Steps, Expectation | 詳細、方法性 | 需要逐步過程的場景，適合複雜整合 |
| T.R.A.C.E. | Task, Request, Action, Context, Example | 詳細、範例驅動 | 複雜設置任務 |
| E.R.A. | Expectation, Role, Action | 結果專家 | 結果導向任務，特別是專業領域如雲端安全 |
| C.A.R.E. | Context, Action, Result, Example | 脈絡驅動、範例導向 | 脈絡重要且範例能改善規劃執行的任務 |
| R.O.S.E.S | Role, Objective, Scenario, Expected Solution, Steps | 綜合、詳細 | 規劃和執行複雜可擴展性專案 |

## 提示詞工程的主要限制

### 核心限制 (來源: FatCat Remote)

1. **AI對提示品質的依賴性**
   - 結構不良的提示導致不準確或誤導性輸出
   - 需要人工干預

2. **對AI行為的有限控制**
   - 即使精心設計的提示，AI仍可能產生意外或偏見回應
   - 受限於固有的訓練限制

3. **上下文長度限制**
   - AI模型有token限制
   - 難以保持長對話或分析大型數據集

4. **缺乏真正理解**
   - AI不真正理解人類情感或複雜細微差別
   - 僅基於訓練數據模式預測回應

5. **安全與倫理風險**
   - 結構不良的提示可能無意中產生有害或偏見內容
   - 對AI治理和合規性構成挑戰

### 克服挑戰的方法

1. **使用防護欄**: 實施內容審核過濾器防止偏見輸出
2. **持續迭代與測試**: 基於AI反饋定期改進和調整提示
3. **納入外部數據驗證**: 與可信來源交叉檢查AI回應

## 評估指標研究

### 提示效果評估指標 (來源: Portkey.ai, KDnuggets)

1. **相關性**: 模型輸出與用戶原始意圖的匹配程度
2. **準確性**: 輸出的事實正確性
3. **一致性**: 相似提示產生一致結果的能力
4. **效率**: 達到期望結果所需的計算資源
5. **完整性**: 回應的全面性
6. **特異性**: 回應的具體程度
7. **創造性**: 創新和原創性
8. **遵循性**: 對指定格式和要求的遵循程度

