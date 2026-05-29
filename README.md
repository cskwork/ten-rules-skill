# ten-rules skill

Live: https://cskwork.github.io/ten-rules-skill/

A single Claude Code (and Codex/Gemini-compatible) skill that **routes a task to the right "10 rules"
reference set, reads only the rules that apply, and works against their checklists** — instead of you
remembering which standard to follow.

It bundles **seventeen** rule sets — five vendored from upstream [cskwork](https://github.com/cskwork) repos, twelve authored in-repo from recognized authorities.

### Core sets (vendored)

| Domain | Triggers on | Upstream |
|--------|-------------|----------|
| **web-design** | sites, UI/UX, landing pages, accessibility, web performance | [web-design-10-rules](https://github.com/cskwork/web-design-10-rules) |
| **communication** | writing, emails, messages, reports, slides, persuasion | [communication-10-rules](https://github.com/cskwork/communication-10-rules) |
| **investment** | stocks, valuation, portfolio, buy/sell decisions | [investment-agent-rules](https://github.com/cskwork/investment-agent-rules) |
| **planning** | PRD, spec, proposal, RFP, project/service plan | [planning-doc-rules](https://github.com/cskwork/planning-doc-rules) |
| **coding** | explicit "follow the Ten Commandments" | [coding-agent-rules](https://github.com/cskwork/coding-agent-rules) |

### Builder stack (authored in-repo)

| Domain | Triggers on | Grounded in |
|--------|-------------|-------------|
| **api-design** | REST/HTTP contracts, versioning, errors, idempotency | Fielding · Google AIP · Stripe · OpenAPI |
| **data-engineering** | data modeling, SQL, pipelines, warehousing, data quality | Kimball · Kleppmann · dbt · Data Mesh |
| **security** | OWASP, authn/authz, secrets, threat modeling | OWASP Top 10/ASVS · NIST SSDF · STRIDE |
| **devops-sre** | reliability, SLOs, CI/CD, incidents, observability | Google SRE · DORA · 12-Factor |
| **ai-engineering** | LLM apps, prompts, evals, RAG, guardrails | NIST AI RMF · Google Rules of ML |
| **product-management** | discovery, prioritization, metrics, MVP, roadmaps | Cagan · Torres · JTBD · Lean Startup |
| **ux-research** | usability, user research, testing, heuristics | Nielsen Norman · Krug · ISO 9241 |
| **growth-marketing** | acquisition, funnels, positioning, retention, PMF | Dunford · Ellis · Balfour · AARRR |
| **seo** | search intent, technical SEO, content, E-E-A-T | Google Search Essentials · schema.org |
| **finance-unit-economics** | pricing, LTV/CAC, margins, burn/runway | David Skok · Bessemer · Ramanujam |
| **brand-identity** | positioning, naming, voice, visual identity | Neumeier · Aaker · Byron Sharp · Sinek |
| **data-privacy-legal** | GDPR/PIPA/CCPA, consent, retention, user rights | GDPR Art.5 · Privacy by Design · NIST |

## How it works (progressive disclosure)

1. `SKILL.md` routes the task to a domain.
2. The agent opens `ref/<domain>/INDEX.md` — a one-line summary of all ten rules — and picks the few that apply.
3. It reads only those full rule files (each has **Why / How to apply / Checklist**).
4. It states which rules it is applying, does the work, and self-checks against the checklists.

This keeps context small: the ten rules are never all loaded at once.

## Install

```bash
git clone https://github.com/cskwork/ten-rules-skill.git
# Symlink (or copy) into your Claude Code skills so it auto-discovers:
ln -s "$PWD/ten-rules-skill" ~/.claude/skills/ten-rules
```

Then in Claude Code it auto-triggers on matching tasks, or invoke explicitly: "apply the ten-rules skill".
For Codex/Gemini, point the tool at this directory's `SKILL.md`.

## Keep rules up to date

```bash
./scripts/refresh.sh   # re-pulls the five core upstream repos (INDEX.md + the in-repo builder stack are untouched)
```

## Layout

```
SKILL.md                 router + trigger description
ref/<domain>/INDEX.md    10 rules, one line each, with "read when" cues
ref/<domain>/*.md        full rules (vendored snapshots of the upstream repos)
scripts/refresh.sh       re-sync ref/ from upstream
```

## License

MIT. Underlying rule content belongs to its source repos (also cskwork).
