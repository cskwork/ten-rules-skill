# Rule 02 — Collect the Minimum

> 목적에 꼭 필요한 데이터만 모아라. 안 모은 데이터는 새지 않는다.
> Collect only the data the purpose strictly needs; data you never hold cannot leak.

## Why

Data minimization is a core GDPR Article 5 principle: data must be adequate, relevant, and limited to what is necessary. The NIST Privacy Framework treats minimization as a primary way to reduce privacy risk at the source. Every extra field is a liability for breach, subject-access, and retention, with no offsetting benefit if the purpose does not need it.

## How to apply

- Justify each collected field against a specific purpose; drop fields with no clear use.
- Prefer aggregates, ranges, or flags over raw identifiers where they meet the need.
- Anonymize or pseudonymize as early as possible; separate identifiers from event data.
- Scrub personal data out of logs, error reports, and analytics events by default.
- Audit third-party SDKs and tags for what they silently collect.

## Checklist

- [ ] Every field in the schema or form maps to a documented purpose.
- [ ] No "collect now in case we need it later" fields exist.
- [ ] Logs and telemetry exclude personal data unless specifically justified.
- [ ] Identifiers are pseudonymized or separated from behavioral data where feasible.
- [ ] Third-party SDK data collection has been reviewed and constrained.

## References

- GDPR Article 5(1)(c) data minimisation — https://gdpr-info.eu/art-5-gdpr/
- NIST Privacy Framework — https://www.nist.gov/privacy-framework
