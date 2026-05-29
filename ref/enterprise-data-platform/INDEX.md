# Enterprise Data Platforms — 10 Rules (index)

Source: Grounded in Martin Kleppmann's *Designing Data-Intensive Applications* (O'Reilly, 2017/2nd ed.), Zhamak Dehghani's *Data Mesh* (O'Reilly, 2022), DAMA International's *DAMA-DMBOK 2nd Edition*, NIST SP 800-162 (ABAC), and Palantir Foundry's published ontology architecture. An enterprise data platform is software built to ingest, govern, transform, serve, and audit large-scale organizational data for operational and analytical decision-making — products such as Palantir Foundry, internal data lakes, B2B analytics portals, and data mesh nodes.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-lineage-first.md` | Capture full data lineage before exposing data | Any new pipeline, dataset, or transformation |
| 02 | `02-ontology-driven-model.md` | Model the domain as objects and relationships, not tables | Schema design, data model review, API contract |
| 03 | `03-attribute-based-access.md` | Enforce ABAC; reject role-only access for sensitive data | Access control, permission model, multi-tenant design |
| 04 | `04-immutable-audit-log.md` | Append-only audit log for every read, write, and decision | Compliance, SOC 2, GDPR, regulated data access |
| 05 | `05-data-contract.md` | Publish explicit data contracts between producers and consumers | Pipeline integration, domain hand-offs, SLA commitments |
| 06 | `06-domain-ownership.md` | Each domain owns, curates, and SLA-backs its data products | Data mesh nodes, federated governance, platform onboarding |
| 07 | `07-semantic-consistency.md` | One canonical definition per business term, enforced platform-wide | Metric authoring, reporting, cross-domain joins |
| 08 | `08-tiered-data-quality.md` | Gate data promotion through explicit quality tiers | Ingestion pipelines, ML feature stores, analyst-facing datasets |
| 09 | `09-late-binding-schema.md` | Decouple storage schema from consumer query schema | Schema evolution, backward compatibility, multi-consumer datasets |
| 10 | `10-operational-observability.md` | Instrument pipelines and queries with RED metrics and data-health signals | Pipeline monitoring, SLA reporting, incident response |

Default for "build or extend a data pipeline": read 01, 05, 08 at minimum.
Default for "add a new data domain or product": read 02, 06, 07 at minimum.
Default for "implement access control or compliance feature": read 03, 04 at minimum.
