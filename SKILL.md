---
name: ten-rules
description: Loads cskwork's "10 rules" reference sets and applies them before producing domain work. Routes a task to one of five rule sets — web design (sites, UI, landing pages, accessibility, web performance), communication (writing, emails, messages, docs, slides, persuasion), investment (stocks, valuation, portfolio, buy/sell decisions), planning documents (PRD, spec, proposal, RFP, project plan), or coding-agent conduct — reads only the rules that bear on the task, then executes against their checklists. Use when starting or reviewing work in any of these domains and the work should meet a defined standard, or when the user says "apply the rules" / "follow the 10 rules" / names a web-design, communication, investment, planning, or coding rule set.
---

# Ten Rules

A router over five "10 rules" reference sets in `ref/`. Before doing the work, load the
rules that match the task, apply their checklists, then execute — do not skip straight to output.

## 1. Route the task

Match the strongest signal to one domain. If two domains apply (e.g. an investment landing
page = investment + web-design), load both indexes.

| Task signals | Domain | Open first |
|---|---|---|
| website, landing page, UI/UX, layout, redesign, visual hierarchy, accessibility, web perf/Core Web Vitals | **web-design** | `ref/web-design/INDEX.md` |
| writing, email, message, report, slide narrative, persuasion, explaining, feedback, docs clarity | **communication** | `ref/communication/INDEX.md` |
| stock, equity, valuation, portfolio, buy/sell, thesis, risk, KR stocks, trading bot | **investment** | `ref/investment/INDEX.md` |
| planning doc, PRD, spec, proposal, RFP, project/service/business plan | **planning** | `ref/planning/INDEX.md` |
| explicit "follow coding-agent rules / Ten Commandments" | **coding** | `ref/coding/INDEX.md` |

No domain matches → this skill does not apply; proceed normally.

## 2. Apply (same for every domain)

1. Read the domain `INDEX.md`. Pick the 1–5 rules that actually bear on **this** task — not all ten.
2. Read only those full rule files (each has Why / How to apply / Checklist).
3. Before producing output, state in one line each which rules you are applying and why.
4. Do the work so it satisfies every selected rule's checklist.
5. Self-check against those checklists. Fix gaps before claiming done.

## 3. Notes

- **Progressive**: INDEX first, then specific rule files. Never dump all rules into context.
- **investment** has overlays — load `kr-equity/` only for Korean (KOSPI/KOSDAQ) stocks, and
  `quant-bot/` only for an automated/agentic trading system.
- **coding** duplicates the Ten Commandments already in `~/.claude/CLAUDE.md`. Skip it unless the
  user explicitly asks, or you are running outside Claude Code (e.g. Codex/Gemini) without those rules.
- Rules are vendored snapshots of five upstream repos. Refresh with `scripts/refresh.sh`.

## Source repos

web-design · communication · investment · planning · coding — all under
`github.com/cskwork/{web-design-10-rules, communication-10-rules, investment-agent-rules, planning-doc-rules, coding-agent-rules}`.
