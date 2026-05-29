---
name: ten-rules
description: Routes a task to the matching "10 rules" reference set, reads only the rules that bear on it, and works against their checklists. Covers web-design, communication, investment, planning, coding, api-design, data-engineering, security, devops-sre, ai-engineering, product-management, ux-research, growth-marketing, seo, finance-unit-economics, brand-identity, and data-privacy-legal. Use when work in any of these should meet a defined standard, or the user says "apply the 10 rules" / names a set. Index: https://cskwork.github.io/ten-rules-skill/
---

# Ten Rules

A router over seventeen "10 rules" reference sets in `ref/`. Before doing the work, load the
rules that match the task, apply their checklists, then execute — do not skip straight to output.

## 1. Route the task

Match the strongest signal to a domain. If several apply (e.g. an LLM product launch page =
ai-engineering + web-design + growth-marketing), load each one's index.

**Core sets**

| Task signals | Domain | Open first |
|---|---|---|
| website, landing page, UI/UX, layout, redesign, visual hierarchy, accessibility, web perf/Core Web Vitals | **web-design** | `ref/web-design/INDEX.md` |
| writing, email, message, report, slide narrative, persuasion, explaining, feedback, docs clarity | **communication** | `ref/communication/INDEX.md` |
| stock, equity, valuation, portfolio, buy/sell, thesis, risk, KR stocks, trading bot | **investment** | `ref/investment/INDEX.md` |
| planning doc, PRD, spec, proposal, RFP, project/service/business plan | **planning** | `ref/planning/INDEX.md` |
| explicit "follow coding-agent rules / Ten Commandments" | **coding** | `ref/coding/INDEX.md` |

**Builder stack**

| Task signals | Domain | Open first |
|---|---|---|
| REST/HTTP API, endpoint, contract, OpenAPI, versioning, status codes, idempotency, rate limit | **api-design** | `ref/api-design/INDEX.md` |
| data model, SQL, ETL/ELT pipeline, warehouse, schema, partitioning, data quality, dbt, lineage | **data-engineering** | `ref/data-engineering/INDEX.md` |
| security review, authn/authz, OWASP, injection, XSS, secrets, threat model, least privilege | **security** | `ref/security/INDEX.md` |
| reliability, SLO/error budget, CI/CD, deploy, rollback, incident, postmortem, observability, IaC, on-call | **devops-sre** | `ref/devops-sre/INDEX.md` |
| LLM/AI feature, prompt, eval, RAG, agent, guardrails, hallucination, model selection | **ai-engineering** | `ref/ai-engineering/INDEX.md` |
| product discovery, prioritization, roadmap, success metric, North Star, MVP, jobs-to-be-done | **product-management** | `ref/product-management/INDEX.md` |
| user research, usability test, user interview, survey, heuristic evaluation, research plan | **ux-research** | `ref/ux-research/INDEX.md` |
| growth, acquisition, funnel, activation, retention, positioning, messaging, product/market fit | **growth-marketing** | `ref/growth-marketing/INDEX.md` |
| SEO, search ranking, keywords, search intent, E-E-A-T, structured data, indexing | **seo** | `ref/seo/INDEX.md` |
| pricing, unit economics, LTV/CAC, contribution margin, gross margin, burn/runway, cohort, break-even | **finance-unit-economics** | `ref/finance-unit-economics/INDEX.md` |
| brand, positioning, naming, logo, voice/tone, visual identity, differentiation | **brand-identity** | `ref/brand-identity/INDEX.md` |
| privacy, GDPR/PIPA/CCPA, consent, personal data, retention/deletion, DSAR, data residency | **data-privacy-legal** | `ref/data-privacy-legal/INDEX.md` |

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
- The five core sets are vendored snapshots of upstream repos — refresh with `scripts/refresh.sh`.
  The twelve builder-stack sets are authored in-repo from the authorities cited in each rule's
  References; `refresh.sh` does not touch them.

## Source repos

Core sets — web-design · communication · investment · planning · coding — vendored from
`github.com/cskwork/{web-design-10-rules, communication-10-rules, investment-agent-rules, planning-doc-rules, coding-agent-rules}`.

Builder stack — api-design · data-engineering · security · devops-sre · ai-engineering ·
product-management · ux-research · growth-marketing · seo · finance-unit-economics ·
brand-identity · data-privacy-legal — authored in-repo from recognized authorities (OWASP, Google
SRE/AIP, NIST, Kimball, Nielsen Norman, GDPR, et al.) cited in each rule's References.
