# HR Tech & Recruiting — 10 Rules (index)

Source: Grounded in EEOC Strategic Enforcement Plan 2024-2028 and AI-in-hiring guidance (eeoc.gov), GDPR (EU Regulation 2016/679), IETF SCIM 2.0 (RFC 7643/7644), O*NET (U.S. Department of Labor, onetcenter.org), ESCO (European Commission), and "The Alliance: Managing Talent in the Networked Age" by Reid Hoffman, Ben Casnocha, and Chris Yeh. Building software for HR tech and recruiting means creating platforms — ATS, HRIS, job boards, assessment engines, onboarding portals — where employment decisions are made, regulated, audited, and where a poor candidate experience directly erodes employer brand.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-bias-and-adverse-impact.md` | Audit every selection step for disparate impact | AI screening, resume parsing, scoring, ranking, any automated filter |
| 02 | `02-candidate-data-privacy.md` | Collect minimum data; honor deletion rights | Profile forms, data retention policies, GDPR/CCPA flows, consent screens |
| 03 | `03-skills-taxonomy-alignment.md` | Map jobs and candidates to a standard skills ontology | Job posting, search, matching, skills tagging, career-path features |
| 04 | `04-hris-ats-integration.md` | Use SCIM 2.0 and standard HR APIs for system sync | Employee provisioning, ATS-to-HRIS sync, onboarding handoffs, SSO |
| 05 | `05-structured-hiring-process.md` | Enforce structured, scored, repeatable interview stages | Interview kits, scorecard design, stage automation, offer workflows |
| 06 | `06-candidate-experience.md` | Every touchpoint must be fast, clear, and mobile-first | Application UI, status notifications, feedback loops, career site |
| 07 | `07-compliance-audit-trail.md` | Log every hiring decision with actor, timestamp, and rationale | Disposition tracking, EEO data capture, audit exports, legal hold |
| 08 | `08-job-board-distribution.md` | Standardize job schema for multi-channel syndication | Job posting, feed publishing, Indeed/LinkedIn integrations, schema.org |
| 09 | `09-offer-and-onboarding-handoff.md` | Bridge the offer-to-day-one gap without data re-entry | Offer management, e-signature, background check triggers, onboarding tasks |
| 10 | `10-multi-tenant-data-isolation.md` | Strictly isolate recruiter-company data in shared infrastructure | SaaS ATS architecture, database design, access controls, API scoping |

Default for "building or modifying an ATS or hiring workflow": read 01, 05, 07 at minimum.
