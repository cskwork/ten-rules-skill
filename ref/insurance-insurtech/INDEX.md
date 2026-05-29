# Insurance & InsurTech — 10 Rules (index)

Source: Grounded in *The INSURTECH Book* (VanderLinden, Millie, Anderson, Chishti, Wiley 2018), *Insurance Technology: Navigating the Innovation, Risk, and Future of Insurance* (Steven Haynes, Elsevier 2024), NAIC Model Laws and AI Model Bulletin (content.naic.org/model-laws), and ACORD Data Standards (acord.org/standards-architecture/acord-data-standards). Building sites and software for insurance means operating within a state-regulated, actuarially-priced risk-transfer industry where every data field, decision rule, and customer interaction carries legal, financial, and solvency consequences.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-regulatory-compliance-by-design.md` | Embed state regulatory requirements into the system, not bolted on | Filing workflows, rate/form approval, state rollout, AI decisioning |
| 02 | `02-acord-canonical-data-model.md` | Use ACORD as the canonical data contract across systems | Policy, claims, billing, or any integration with carriers or reinsurers |
| 03 | `03-policy-lifecycle-state-machine.md` | Model the policy as a strict state machine, not a flat record | Quote, bind, endorse, renew, lapse, cancel, reinstate logic |
| 04 | `04-explainable-underwriting-decisions.md` | Every automated underwriting decision must be auditable and explainable | Risk scoring, AI models, pricing engines, decline logic |
| 05 | `05-claims-straight-through-processing.md` | Automate claims end-to-end but gate every path with fraud and coverage checks | FNOL intake, adjudication, payment, STP pipeline design |
| 06 | `06-fraud-detection-layered-controls.md` | Layer behavioral, network, and model-based fraud signals; never rely on one | Claims intake, underwriting, billing, identity verification |
| 07 | `07-actuarial-rate-integrity.md` | Protect actuarial rate tables from ad-hoc overrides; all changes are versioned | Pricing engine, rate filings, product configuration |
| 08 | `08-data-security-naic-model-law.md` | Implement the NAIC Insurance Data Security Model Law (#668) as a floor | Any system handling PII, health data, financial records |
| 09 | `09-policyholder-trust-and-transparency.md` | Surface coverage, exclusions, and decisions in plain language before purchase | Customer-facing quote, bind, claims, renewal flows |
| 10 | `10-resilience-for-cat-event-spikes.md` | Design for catastrophic-event claim surges; normal load is not the design point | Infrastructure sizing, queue design, claims triage, contact center |

Default for "building or modifying a claims or underwriting flow": read rules 01, 03, 04, 05, 06 at minimum.
