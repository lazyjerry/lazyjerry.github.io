# Introducing GPT-5.2 | OpenAI

**URL:** https://openai.com/index/introducing-gpt-5-2/

---

Skip to main content
Log in
Switch to
ChatGPT
(opens in a new window)
Sora
(opens in a new window)
API Platform
(opens in a new window)
Home
Research Index
Research Overview
Research Residency
OpenAI for Science
Latest Advancements
GPT-5.2
GPT-5.1
Sora 2
GPT-5
OpenAI o3 and o4-mini
GPT-4.5
Introducing GPT-5.2 | OpenAI
Table of contents

December 11, 2025

Product
Release
Introducing GPT-5.2

The most advanced frontier model for professional work and long-running agents.

Listen to article
16:12
Share

We are introducing GPT‑5.2, the most capable model series yet for professional knowledge work.

Already, the average ChatGPT Enterprise user says⁠ AI saves them 40–60 minutes a day, and heavy users say it saves them more than 10 hours a week. We designed GPT‑5.2 to unlock even more economic value for people; it’s better at creating spreadsheets, building presentations, writing code, perceiving images, understanding long contexts, using tools, and handling complex, multi-step projects.

GPT‑5.2 sets a new state of the art across many benchmarks, including GDPval, where it outperforms industry professionals at well-specified knowledge work tasks spanning 44 occupations.




	

GPT‑5.2 Thinking 

	

GPT‑5.1 Thinking




GDPval (wins or ties)
Knowledge work tasks

	

70.9%

	

38.8% (GPT‑5)




SWE-Bench Pro (public)
Software engineering

	

55.6%

	

50.8%




SWE-bench Verified
Software engineering

	

80.0%

	

76.3%




GPQA Diamond (no tools)
Science questions

	

92.4%

	

88.1%




CharXiv Reasoning (w/ Python)
Scientific figure questions

	

88.7%

	

80.3%




AIME 2025 (no tools)
Competition math

	

100.0%

	

94.0%




FrontierMath (Tier 1–3)
Advanced mathematics

	

40.3%

	

31.0%




FrontierMath (Tier 4)
Advanced mathematics

	

14.6%

	

12.5%




ARC-AGI-1 (Verified)
Abstract reasoning

	

86.2%

	

72.8%




ARC-AGI-2 (Verified)
Abstract reasoning

	

52.9%

	

17.6%

Notion⁠
(opens in a new window)
, Box⁠
(opens in a new window)
, Shopify⁠
(opens in a new window)
, Harvey⁠
(opens in a new window)
 and Zoom⁠
(opens in a new window)
 observed GPT‑5.2 demonstrates state-of-the-art long-horizon reasoning and tool-calling performance. Databricks⁠
(opens in a new window)
, Hex⁠
(opens in a new window)
 and Triple Whale⁠
(opens in a new window)
 found GPT‑5.2 to be exceptional at agentic data science and document analysis tasks. Cognition⁠
(opens in a new window)
, Warp⁠
(opens in a new window)
, Charlie Labs⁠
(opens in a new window)
, JetBrains⁠
(opens in a new window)
 and Augment Code⁠
(opens in a new window)
 say GPT‑5.2 delivers state-of-the-art agentic coding performance, with measurable improvements in areas such as interactive coding, code reviews and bug finding.

In ChatGPT, GPT‑5.2 Instant, Thinking, and Pro will begin rolling out today, starting with paid plans. In the API, they are available now to all developers.

Overall, GPT‑5.2 brings significant improvements in general intelligence, long-context understanding, agentic tool-calling, and vision—making it better at executing complex, real-world tasks end-to-end than any previous model.

Model performance
Economically valuable tasks

GPT‑5.2 Thinking is the best model yet for real-world, professional use. On GDPval⁠, an eval measuring well-specified knowledge work tasks across 44 occupations, GPT‑5.2 Thinking sets a new state-of-the-art score, and is our first model that performs at or above a human expert level. Specifically, GPT‑5.2 Thinking beats or ties top industry professionals on 70.9% of comparisons on GDPval knowledge work tasks, according to expert human judges. These tasks include making presentations, spreadsheets, and other artifacts. GPT‑5.2 Thinking produced outputs for GDPval tasks at >11x the speed and <1% the cost of expert professionals, suggesting that when paired with human oversight, GPT‑5.2 can help with professional work. Speed and cost estimates are based on historical metrics; speed in ChatGPT may vary.

In GDPval, models attempt well-specified knowledge work spanning 44 occupations from the top 9 industries contributing to US GDP. Tasks request real work products, such as sales presentations, accounting spreadsheets, urgent care schedules, manufacturing diagrams, or short videos. In ChatGPT, GPT‑5.2 Thinking has new tools that GPT‑5 Thinking does not.

When reviewing one especially good output, one GDPval judge commented, "It is an exciting and noticeable leap in output quality... [it] appears to have been done by a professional company with staff, and has a surprisingly well designed layout and advice for both deliverables, though with one we still have some minor errors to correct."

Additionally, on our internal benchmark of junior investment banking analyst spreadsheet modeling tasks—such as putting together a three-statement model for a Fortune 500 company with proper formatting and citations, or building a leveraged buyout model for a take-private—GPT 5.2 Thinking's average score per task is 9.3% higher than GPT‑5.1’s, rising from 59.1% to 68.4%.

Side-by-side comparisons show improved sophistication and formatting in spreadsheets and slides generated by GPT‑5.2 Thinking:

Workforce planner
Cap table
Project management

Prompt: Create a workforce planning model: headcount, hiring plan, attrition, and budget impact. Include engineering, marketing, legal, and sales departments.

To use the new spreadsheet and presentation capabilities in ChatGPT, you must be on a Plus, Pro, Business, or Enterprise plan and select either GPT‑5.2 Thinking or Pro. Complex generations can take many minutes to produce.

Coding

GPT‑5.2 Thinking sets a new state of the art of 55.6% on SWE-Bench Pro, a rigorous evaluation of real-world software engineering. Unlike SWE-bench Verified, which only tests Python, SWE-Bench Pro tests four languages and aims to be more contamination-resistant, challenging, diverse, and industrially relevant.

In SWE-Bench Pro⁠
(opens in a new window)
⁠⁠⁠, a model is given a code repository and must generate a patch to solve a realistic software engineering task.

On SWE-bench Verified (not plotted), GPT‑5.2 Thinking scores our new high of 80%.

For everyday professional use, this translates into a model that can more reliably debug production code, implement feature requests, refactor large codebases, and ship fixes end-to-end with less manual intervention.

GPT‑5.2 Thinking is also better at front-end software engineering than GPT‑5.1 Thinking. Early testers found it significantly stronger at front-end development and complex or unconventional UI work—especially involving 3D elements—making it a powerful daily partner for engineers across the stack. See a few examples of what it can produce from a single prompt:

Ocean wave simulation
Holiday card builder
Typing rain game

Prompt: Create a single-page app in a single HTML file with the following requirements:
- Name: Ocean Wave Simulation
- Goal: Display realistic animated waves.
- Features: Change wind speed, wave height, lighting.
- The UI should be calming and realistic.

Early testers shared their feedback on GPT‑5.2’s coding capabilities:

Windsurf
Warp
JetBrains
Augment Code
Cline
Charlie Labs
Kilo
Azad
"GPT-5.2 represents the biggest leap for GPT models in agentic coding since GPT-5 and is a SOTA coding model in its price range. The version bump undersells the jump in intelligence. We’re excited to make it the default across Windsurf and several core Devin workloads."
Jeff Wang, CEO, Windsurf
Factuality

GPT‑5.2 Thinking hallucinates less than GPT‑5.1 Thinking. On a set of de-identified queries from ChatGPT, responses with errors were 30%rel less common. For professionals, this means fewer mistakes when using the model for research, writing, analysis, and decision support—making the model more dependable for everyday knowledge work.

Reasoning effort was set to the maximum available and a search tool was enabled. Errors were detected by other models, which may make errors themselves. Claim-level error rates are far lower than response-level error rates, as most responses contain many claims.

Like all models, GPT‑5.2 Thinking is imperfect. For anything critical, double check its answers.

Long context

GPT‑5.2 Thinking sets a new state of the art in long-context reasoning, achieving leading performance on OpenAI MRCRv2—an evaluation that tests a model’s ability to integrate information spread across long documents. On real-world tasks like deep document analysis, which require related information across hundreds of thousands of tokens, GPT‑5.2 Thinking is substantially more accurate than GPT‑5.1 Thinking. In particular, it’s the first model we’ve seen that achieves near 100% accuracy on the 4-needle MRCR variant (out to 256k tokens).

In practical terms, this enables professionals to use GPT‑5.2 to work with long documents—such as reports, contracts, research papers, transcripts, and multi-file projects—while maintaining coherence and accuracy across hundreds of thousands of tokens. This makes GPT‑5.2 especially well suited for deep analysis, synthesis, and complex multi-source workflows.

In OpenAI-MRCR⁠⁠
(opens in a new window)
 v2 (multi-round co-reference resolution), multiple identical “needle” user requests are inserted into long “haystacks” of similar requests and responses, and the model is asked to reproduce the response to nth needle. Version 2 of the eval fixes ~5% of tasks that had incorrect ground truth values. Mean match ratio measures the average string match ratio between the model’s response and the correct answer. The points at 256k max input tokens represent averages over 128k–256k input tokens, and so forth. Here, 256k represents 256 * 1,024 = 262,114 tokens. Reasoning effort was set to the maximum available.

For tasks that benefit from thinking beyond the maximum context window, GPT‑5.2 Thinking is compatible with our new Responses /compact endpoint, which extends the model’s effective context window. This lets GPT‑5.2 Thinking tackle more tool-heavy, long-running workflows that would otherwise be limited by context length. Read more in our API documentation⁠
(opens in a new window)
.

Vision

GPT‑5.2 Thinking is our strongest vision model yet, cutting error rates roughly in half on chart reasoning and software interface understanding.

For everyday professional use, this means the model can more accurately interpret dashboards, product screenshots, technical diagrams, and visual reports—supporting workflows in finance, operations, engineering, design, and customer support where visual information is central.

In CharXiv Reasoning⁠
(opens in a new window)
, models answer questions about visual charts from scientific papers. A Python tool was enabled and reasoning effort was set to maximum.

In ScreenSpot-Pro⁠
(opens in a new window)
, models must reason about high-resolution screenshots of graphical user interfaces from a variety of professional settings. A Python tool was enabled and reasoning effort was set to maximum. Without the Python tool, scores are much lower. We recommend enabling the Python tool on vision tasks like these.

Compared to previous models, GPT‑5.2 Thinking has a stronger grasp of how elements are positioned within an image, which helps on tasks where relative layout plays a key role in solving the problem. In the example below, we ask the model to identify the components in an image input (in this case, a motherboard) and return labels with approximate bounding boxes. Even on a low-quality image, GPT‑5.2 identifies the main regions and places boxes that sometimes match the true locations of each component, while GPT‑5.1 only labels a few parts and shows a much weaker understanding of their spatial arrangement. Both models make clear mistakes, but GPT‑5.2 shows better comprehension of the image.

GPT-5.1
GPT-5.2
Tool calling

GPT‑5.2 Thinking achieves a new state of the art of 98.7% on Tau2-bench Telecom, demonstrating its ability to reliably use tools across long, multi-turn tasks.

For latency-sensitive use cases, GPT‑5.2 Thinking also performs much better at reasoning.effort='none', substantially outperforming GPT‑5.1 and GPT‑4.1.

In τ2-bench⁠⁠
(opens in a new window)
, models use tools to complete customer support tasks in a multi-turn interaction with a simulated user. For the Telecom domain, we included a brief, generally helpful instruction in the system prompt to boost performance. We exclude the Airline subset because of lower-quality ground truth grading.

For professionals, this translates into stronger end-to-end workflows—such as resolving customer support cases, pulling data from multiple systems, running analyses, and generating final outputs with fewer breakdowns between steps.

For example, when asking a complex customer service question that requires multi-step resolution, the model can more effectively coordinate a full workflow across multiple agents. In the case below, a traveler reports a delayed flight, a missed connection, an overnight stay in New York, and a medical seating requirement. GPT‑5.2 manages the entire chain of tasks—rebooking, special-assistance seating, and compensation—delivering a more complete outcome than GPT‑5.1.

My flight from Paris to New York was delayed, and I missed my connection to Austin. My checked bag is also missing, and I need to spend the night in New York. I also require a special front-row seat for medical reasons. Can you help me?

GPT-5.1
GPT-5.2
Science & math

One of our hopes for AI is that it will accelerate scientific research for the benefit of everyone. Toward this, we’ve been working with and listening to scientists to see how AI can speed up their work, and last month we shared some early collaborative experiments here⁠.

We believe GPT‑5.2 Pro and GPT‑5.2 Thinking are the world’s best models for assisting and accelerating scientists. On GPQA Diamond, a graduate-level Google-proof Q&A benchmark, GPT‑5.2 Pro achieves 93.2%, followed closely by GPT‑5.2 Thinking at 92.4%.

In GPQA Diamond⁠
(opens in a new window)
, models answer multiple choice questions about physics, chemistry, and biology. No tools were enabled and reasoning effort was set to maximum.

On FrontierMath (Tier 1–3), an evaluation of expert-level mathematics, GPT‑5.2 Thinking set a new state of the art, solving 40.3% of problems.

In FrontierMath⁠
(opens in a new window)
, models solve expert-level mathematics problems. A Python tool was enabled and reasoning effort was set to maximum.

We're beginning to see AI models meaningfully accelerate progress in math and science in tangible ways. For example, in recent work⁠ with GPT‑5.2 Pro, researchers explored an open question in statistical learning theory. In a narrow, well-specified setting, the model proposed a proof that was subsequently verified by the authors and reviewed with external experts, illustrating how frontier models can assist mathematical research under close human oversight.

ARC-AGI 2

On ARC-AGI-1 (Verified), a benchmark designed to measure general reasoning ability, GPT‑5.2 Pro is the first model to cross the 90% threshold, improving from 87%⁠
(opens in a new window)
 by o3‑preview last year while reducing the cost of achieving that performance by roughly 390×.

On ARC-AGI-2 (Verified), which raises the difficulty and better isolates fluid reasoning, GPT‑5.2 Thinking achieves a new state of the art for chain-of-thought models, scoring 52.9%. GPT‑5.2 Pro performs even higher, reaching 54.2%, further extending the model’s ability to reason through novel, abstract problems.

Improvements across these evaluations reflect GPT‑5.2’s stronger multi-step reasoning, greater quantitative accuracy, and more reliable problem solving on complex technical tasks.

Here’s what our early testers say about GPT‑5.2:

Triple Whale
Notion
Zoom
Box
Hex
Databricks
Harvey
Parloa
Moveworks
Shopify
(Content truncated due to size limit. Use page ranges or line ranges to read remaining content)