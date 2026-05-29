# Changelog — 2026-05-29

## Expand ten-rules from 5 to 17 domain rule sets ("builder stack")

### What
Added 12 new "10 rules" reference sets so the router can apply correct domain expertise across
software, product, design, growth, and business work — not just the original 5.

New domains (slug — grounded in):
- api-design — Fielding, Google AIP, Stripe, Zalando, OpenAPI
- data-engineering — Kimball, Kleppmann, dbt, Data Mesh
- security — OWASP Top 10 / ASVS, NIST SSDF, STRIDE
- devops-sre — Google SRE, DORA, 12-Factor
- ai-engineering — NIST AI RMF, Google Rules of ML, RAG / eval-driven dev
- product-management — Cagan, Torres, JTBD, Lean Startup
- ux-research — Nielsen Norman, Krug, ISO 9241
- growth-marketing — Dunford, Ellis, Balfour, AARRR
- seo — Google Search Essentials, E-E-A-T, schema.org
- finance-unit-economics — David Skok, Bessemer, Ramanujam
- brand-identity — Neumeier, Aaker, Byron Sharp, Sinek
- data-privacy-legal — GDPR Art.5, Privacy by Design, NIST Privacy Framework, PIPA/CCPA

Each set: `INDEX.md` + 10 prioritized rule files (Why / How to apply / Checklist / References).
132 new files total.

### Decisions and why
- **Which domains.** Chose a "full builder stack" spanning engineering, product, design, growth,
  and business so the agent can apply expertise to almost anything it builds (user goal: "build
  anything with correct expertise"). Confirmed the selection with the user before generating.
- **Format = multi-file (INDEX + 10), matching web-design/communication/investment.** This format
  fits the skill's progressive-disclosure design (load INDEX, then only the rules that apply) better
  than the single-file format used by planning/coding.
- **Bilingual per rule.** KO one-line maxim + EN maxim, English body and citations. Picked by the
  user. Headings/checklists/citations in English because these domains are globally standardized;
  the KO maxim keeps parity with the existing sets' tone.
- **Prioritized, not arbitrary.** Rule 01 = most critical, descending. "Market research" basis =
  each set is grounded in the recognized authority/standard for that field, cited in References.
- **Authored in-repo, not vendored.** Unlike the 5 core sets (pulled by `scripts/refresh.sh` from
  upstream cskwork repos), these 12 are synthesized here from cited authorities. `refresh.sh` does
  not touch them. Documented this in SKILL.md notes + README so future refreshes don't surprise.
- **Succinct skill `description:`.** Per user feedback mid-task, trimmed the always-loaded frontmatter
  `description:` to domain names only; detailed trigger keywords live in the SKILL.md body table
  (loaded on demand). Rationale: the frontmatter is in context every session, so verbosity there
  costs tokens on every turn.
- **Landing page = compact tier.** Kept the 5 featured cards with their expandable per-rule "why";
  added the 12 as a separate "Builder stack" tier of compact cards (10 rule titles each, bilingual,
  no per-rule expand). Avoids 120 hand-written why-paragraphs and keeps the page scannable at 17
  domains while still fully representing every new set.

### How it was built
- Ran a custom research-and-author workflow: 12 parallel author agents (WebSearch to confirm current
  authorities + canonical URLs, then synthesize + write the 11 files each), each followed by an
  adversarial verify agent that checked format, bilingual maxims, emoji, and — most importantly —
  citation realism, fixing fabricated/weak URLs in place.
- Landing page expansion delegated to a designer agent, fed the real rule files so titles and Korean
  maxims are grounded, with strict constraints to preserve the i18n system, accessibility, and aesthetic.

### Verification
- Structure: all 12 domains have INDEX + 10 rule files (132 files); every rule file has Why / How to
  apply / Checklist / References; bilingual maxims present (Hangul line + English line); INDEX tables
  have 10 rows + a "Default for" line; zero emojis across all files.
- Citations: adversarial verify pass canonicalized/repaired several URLs (Fielding dissertation,
  Saltzer & Schroeder MIT page, dbt Kimball doc). Minor editorial concerns (ordering nuances,
  root-vs-subpage links) logged by verifiers; left as defensible.
- Routing: SKILL.md table points every domain at an existing `ref/<slug>/INDEX.md`.
- Landing page: 17 chips, 17 cards, all 12 new slugs present with correct GitHub links; 120
  builder-stack rule titles all carry `data-ko`; every chip/card class token resolves to a defined
  CSS rule; no emojis; HTML parses cleanly; i18n script / reveal observer / language toggle unchanged.

### Files touched
- `ref/{api-design,data-engineering,security,devops-sre,ai-engineering,product-management,ux-research,growth-marketing,seo,finance-unit-economics,brand-identity,data-privacy-legal}/` — new (132 files)
- `SKILL.md` — routing table (Core + Builder stack), description, notes, source repos
- `README.md` — domain table split into vendored core + in-repo builder stack
- `docs/index.html` — router chips, hero/meta copy, "Builder stack" compact card section, CSS

## Follow-up: expandable "why" on the 12 builder-stack cards

User feedback: the new compact cards only showed rule titles; the featured 5 cards expand
a "why" on click. Added the same click-to-expand to all 12 builder-stack cards — each of the
120 rules now opens a one-to-two-sentence bilingual explanation, condensed from that rule
file's `## Why` section and citing the same authority. Mirrored the featured cards'
`<details>/<summary>` markup and `+`/`−` affordance with a compact-sized `.crules` CSS variant;
removed the now-dead `.crules li::before` rules. Verified: 12 cards × 10 `<details>` = 120, every
summary and why carries `data-ko`, no leftover plain `<li>`, featured 5 cards' 50 rules untouched,
no emojis, HTML balanced.
