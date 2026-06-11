---
name: ten-rules
description: "Route tasks to cskwork 10-rules references across core disciplines, builder-stack domains, and industry verticals. Use when the user asks to apply/follow the 10 rules or names a rule set."
---

# Ten Rules

A router over thirty-nine "10 rules" reference sets in `ref/` — seventeen cross-cutting disciplines
plus twenty-two industry verticals. Before doing the work, load the rules that match the task, apply
their checklists, then execute — do not skip straight to output.

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

**Industry verticals** — building a site or software for a specific industry. Layer these on top of
the disciplines above (e.g. an online pharmacy = ecommerce-retail + healthcare-digital-health +
data-privacy-legal; a Palantir-style tool = enterprise-data-platform + security + b2b-saas).

| Task signals | Domain | Open first |
|---|---|---|
| online store, shopping mall, marketplace, cart, checkout, product catalog, storefront (Amazon/Coupang/Shopify) | **ecommerce-retail** | `ref/ecommerce-retail/INDEX.md` |
| course platform, LMS, e-learning, quizzes, student data, edtech | **edtech-learning** | `ref/edtech-learning/INDEX.md` |
| video/audio streaming, OTT, subscriptions, content catalog, playback, recommendations | **media-streaming** | `ref/media-streaming/INDEX.md` |
| game backend, live-ops, matchmaking, player retention, in-game economy, anti-cheat | **gaming-liveops** | `ref/gaming-liveops/INDEX.md` |
| social network, feed, UGC, community, moderation, trust & safety, network effects | **social-community** | `ref/social-community/INDEX.md` |
| internal data platform, ontology, B2B analytics, enterprise RBAC, data governance (Palantir-style) | **enterprise-data-platform** | `ref/enterprise-data-platform/INDEX.md` |
| smart factory, MES, industrial IoT, OT/IT, ISA-95, digital twin, semiconductor fab (Hynix-style) | **manufacturing-industrial** | `ref/manufacturing-industrial/INDEX.md` |
| logistics, supply chain, fulfillment, WMS/TMS, last-mile, shipment tracking | **logistics-supply-chain** | `ref/logistics-supply-chain/INDEX.md` |
| multi-tenant SaaS, B2B app, SSO/SCIM, seat billing, enterprise readiness, SOC 2 | **b2b-saas** | `ref/b2b-saas/INDEX.md` |
| IoT, connected devices, telemetry, MQTT, OTA updates, device fleet, edge | **iot-connected-devices** | `ref/iot-connected-devices/INDEX.md` |
| smart grid, utility billing, metering, energy, ESG/sustainability reporting | **energy-utilities** | `ref/energy-utilities/INDEX.md` |
| banking, payments, neobank, wallet, ledger, KYC/AML, PCI, open banking (Toss/Stripe-style) | **fintech-banking** | `ref/fintech-banking/INDEX.md` |
| telemedicine, EHR, patient portal, FHIR, HIPAA, digital health | **healthcare-digital-health** | `ref/healthcare-digital-health/INDEX.md` |
| insurance, claims, underwriting, policy admin, insurtech | **insurance-insurtech** | `ref/insurance-insurtech/INDEX.md` |
| government, public sector, citizen services, accessibility/Section 508, gov.uk service standard, digital identity | **govtech-public-sector** | `ref/govtech-public-sector/INDEX.md` |
| airport, airline, hotel, booking, reservation, OTA, flight ops, travel (IATA/NDC) | **travel-hospitality-aviation** | `ref/travel-hospitality-aviation/INDEX.md` |
| marketing platform, CDP, ad server, attribution, campaign, consent/TCF, adtech | **martech-adtech** | `ref/martech-adtech/INDEX.md` |
| real estate, property listings, MLS, proptech, virtual tours, transactions | **real-estate-proptech** | `ref/real-estate-proptech/INDEX.md` |
| ride-hailing, transit app, mapping/routing, EV charging, dispatch, mobility (Uber-style) | **mobility-transportation** | `ref/mobility-transportation/INDEX.md` |
| telecom, carrier, OSS/BSS, 5G, billing/charging, TM Forum | **telecom-connectivity** | `ref/telecom-connectivity/INDEX.md` |
| HR, recruiting, ATS, hiring, HRIS, candidate experience, hrtech | **hrtech-recruiting** | `ref/hrtech-recruiting/INDEX.md` |
| nonprofit, charity, donations, fundraising, NGO, civic platform | **nonprofit-civic** | `ref/nonprofit-civic/INDEX.md` |

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
  The twelve builder-stack sets and the twenty-two industry verticals are authored in-repo from the
  authorities cited in each rule's References; `refresh.sh` does not touch them.

## Source repos

Core sets — web-design · communication · investment · planning · coding — vendored from
`github.com/cskwork/{web-design-10-rules, communication-10-rules, investment-agent-rules, planning-doc-rules, coding-agent-rules}`.

Builder stack — api-design · data-engineering · security · devops-sre · ai-engineering ·
product-management · ux-research · growth-marketing · seo · finance-unit-economics ·
brand-identity · data-privacy-legal — authored in-repo from recognized authorities (OWASP, Google
SRE/AIP, NIST, Kimball, Nielsen Norman, GDPR, et al.) cited in each rule's References.

Industry verticals — ecommerce-retail · edtech-learning · media-streaming · gaming-liveops ·
social-community · enterprise-data-platform · manufacturing-industrial · logistics-supply-chain ·
b2b-saas · iot-connected-devices · energy-utilities · fintech-banking · healthcare-digital-health ·
insurance-insurtech · govtech-public-sector · travel-hospitality-aviation · martech-adtech ·
real-estate-proptech · mobility-transportation · telecom-connectivity · hrtech-recruiting ·
nonprofit-civic — authored in-repo from each industry's recognized books and standards (Baymard,
Mayer, Kleppmann, ISA-95, HL7 FHIR, PCI-DSS, IATA NDC, GOV.UK Service Standard, et al.) cited in
each rule's References.
