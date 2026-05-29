# Data Privacy and Compliance — 10 Rules (index)

Source: market-researched synthesis grounded in GDPR Article 5 principles, Ann Cavoukian's Privacy by Design (7 foundational principles), the NIST Privacy Framework, ISO/IEC 27701, the Korea PIPA (including 2025 portability amendments), and the California CCPA/CPRA regimes; cross-border transfer guidance reflects the EU-US Data Privacy Framework (DPF, July 2023). Data privacy and compliance is the practice of collecting, using, securing, and disposing of personal data so that it is lawful, minimal, purpose-bound, secure, and accountable to the people it describes. This is operational and engineering guidance, not legal advice; confirm specifics with counsel.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-lawful-basis-and-consent.md` | Have a documented lawful basis before any processing | new data collection, consent flows, tracking, marketing |
| 02 | `02-data-minimization.md` | Collect only what the purpose strictly requires | forms, logging, schemas, analytics, third-party SDKs |
| 03 | `03-purpose-limitation.md` | Use data only for the purposes it was collected for | reuse of data, ML training, internal analytics, sharing |
| 04 | `04-privacy-by-design.md` | Build privacy in by default, before launch | new features, architecture, defaults, data models |
| 05 | `05-security-and-confidentiality.md` | Protect personal data with appropriate safeguards | storage, transit, access control, encryption, vendors |
| 06 | `06-retention-and-deletion.md` | Keep data only as long as needed, then delete | retention policies, backups, archives, log rotation |
| 07 | `07-user-rights.md` | Honor access, erasure, and portability requests | account settings, DSAR handling, export, deletion APIs |
| 08 | `08-transparency-and-notice.md` | Tell people clearly what you do with their data | privacy notices, cookie banners, in-product disclosures |
| 09 | `09-dpia-and-breach-response.md` | Assess high-risk processing; report breaches fast | high-risk features, new vendors, incident response plans |
| 10 | `10-cross-border-transfers.md` | Transfer data abroad only with a valid mechanism | cloud regions, offshore vendors, data residency, SCCs |

Default for "shipping a feature that collects or uses personal data": read 01, 02, 04, 06 at minimum.
