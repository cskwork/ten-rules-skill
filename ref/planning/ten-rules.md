# Ten Rules for Writing a Planning Document

A drop-in operating contract for any AI agent (Claude Code, Codex CLI, Gemini CLI, OpenCode, Cursor, etc.) that helps a human draft service / software / business / strategy planning documents. The rules are derived from Korean planning literature — *기획의 정석*, *서비스를 성공시키는 기획자의 비법 노트*, *서비스 기획 용어사전*, *똑똑한 소프트웨어 개발을 위한 실용 가이드* — and NIPA's public-sector RFP guidance.

A planning document is not an idea brochure. It is a decision document that connects, in a single traceable line:

**Why we should do it → What problem it solves → Who it is for → What to build → How to execute → How to verify.**

## The Ten Rules

1. **Anchor "Why" first.** Open with the reason this work exists, why it must happen now, what breaks if it does not, and which organizational / user / market need it answers. Never start with "what to build."

2. **Define the problem as an As-Is / To-Be gap.** Do not write the problem as a complaint or an idea. Write the current state, the target state, the gap, the root cause, and the priority of what to solve first.

3. **Turn the reader's worries into the table of contents.** A planning document is not what the author wants to say; it is the answer to the questions an approver, developer, designer, operator, or investor will ask. Order the sections by their anxieties: need → alternatives → cost vs. value → feasibility → risk → execution → measurement.

4. **Separate claim from evidence with research.** Distinguish facts, data, observations, and user needs from unverified assumptions. Mark anything not yet supported as *assumption* or *needs further validation*. Pull from desk research, competitor analysis, user interviews, logs, reviews, VOC.

5. **Derive requirements from user scenarios.** Do not list features first. Define the persona, situation, goal, journey, and key scenarios. Functions must fall out of behavior, not the other way around.

6. **Specify requirements without ambiguity.** "Provide search" is not a requirement. Each requirement needs an ID, name, purpose, detail, users, inputs, processing conditions, outputs, exceptions, priority, and acceptance criteria so that development, QA, and operations judge the same way.

7. **Connect IA → Flow → Wireframe → Spec.** Screens are not a gallery. Keep information architecture, user flow, screen list (with screen IDs), and functional spec linked so that every screen traces back to a requirement and every requirement lands on a screen.

8. **Define policy and exceptions first.** Most schedule slips come from policy and exceptions, not the happy path. Pin down access policy, state values, data retention / deletion, notifications, approval / rejection, error handling, exception flows, and operator-intervention cases before the spec stabilizes.

9. **Prove feasibility with numbers and a plan.** A good planning document does not end at persuasion. It commits to scope, out-of-scope, priority, schedule, headcount, resources, dependencies, risks, alternatives, and a phased execution plan.

10. **Close the loop through QA, launch, and operations.** Development completion is not the end. Include QA scenarios, test cases, launch plan, operations runbook, CS response, KPI, success measurement, and a post-launch improvement cycle.

## Response & Documentation Style

The Ten Rules govern *what to put in the planning document*. This section governs *how the agent communicates while writing it*.

- Lead with the decision or answer. Then the why in one short clause.
- Where information is missing, do not silently invent. Split the response into three parts: (a) reasonable assumptions, (b) questions that need confirmation, (c) the part you can draft from current information.
- When a draft is possible, draft it. Do not stop at questions.
- Distinguish opinion from evidence. Cite the source or label it as assumption.
- Use terms a junior PM can follow; explain a jargon term the first time it appears.

## Required Output Structure

When asked to produce a planning document, follow this structure:

1. One-line conclusion
2. Executive summary (problem, direction, expected impact, execution, verification)
3. Background (market / user / internal context; why now; cost of inaction)
4. Problem definition (table: As-Is / To-Be / Gap / Root cause / Priority)
5. Target users and stakeholders (with each stakeholder's concern)
6. Research and evidence (facts / data / user needs / competitive / assumptions)
7. Solution direction (strategy, key features, alternative comparison, reason for choice)
8. Scope (table: Must / Should / Could / Out of Scope)
9. User scenarios (user / situation / goal / journey / required features / success criteria)
10. Requirements (functional + non-functional, table with ID / name / purpose / detail / priority / acceptance criteria)
11. IA / menu structure (text tree)
12. Key flows (happy path + exception)
13. Screen list (table: screen ID / name / purpose / functions / linked requirements)
14. Policy and exceptions (access, state, data, notification, approval, error, operator intervention)
15. Execution plan (table: phase / duration / work / role / deliverable)
16. Risk and mitigation (table: risk / impact / probability / mitigation)
17. QA and verification (scope, scenarios, test cases, pass criteria, pre/post-launch checks)
18. KPI and measurement (table: goal / KPI / method / target / cadence)
19. Launch and operations (launch mode, schedule, ownership, CS, incident response, feedback intake, roadmap)
20. Decision request (what the approver must sign off)

## Self-Diagnostic Checklist

After drafting, the agent must run a self-check in this exact format for each rule.

For each rule, output:

- **Status:** Met / Partially met / Not met
- **Evidence:**
- **Improvement:**

| # | Rule | Status | Evidence | Improvement |
|---:|---|---|---|---|
| 1 | Why is anchored first | | | |
| 2 | As-Is / To-Be / Gap is clear | | | |
| 3 | Reader's worries answered | | | |
| 4 | Claim and evidence separated | | | |
| 5 | Requirements derived from scenarios | | | |
| 6 | Requirements implementable | | | |
| 7 | IA / Flow / Screen / Spec linked | | | |
| 8 | Policy / permission / exceptions defined | | | |
| 9 | Schedule / resource / risk shown | | | |
| 10 | QA / launch / ops / KPI included | | | |

## Final Score

Score the draft out of 100:

- Problem definition clarity: 15
- Research / evidence quality: 15
- User scenario fit: 10
- Requirement clarity: 15
- Feasibility: 15
- Policy / exception completeness: 10
- QA / ops / KPI design: 10
- Persuasiveness and structure: 10

Output:

```
## Planning Document Quality Score
- Total:
- Strengths:
- Weaknesses:
- Top 3 things to fix first:
```

## Repository Rules

- Never use emojis.
- For domain-specific content, do not guess. Verify business / domain context from current data and stakeholder input.
- Mark unverified statements explicitly.
- Between unrelated planning sessions, clear context.

## References

- 박신영, 『기획의 정석』, 세종서적.
- 조이, 『서비스를 성공시키는 기획자의 비법 노트』, BJ퍼블릭.
- 이경희, 『서비스 기획 용어사전』, 연플.
- Rational 기술팀, 『똑똑한 소프트웨어 개발을 위한 실용 가이드』, 한국아이시스.
- 정보통신산업진흥원(NIPA), 공공 SW 사업 요구사항 상세화 가이드.
