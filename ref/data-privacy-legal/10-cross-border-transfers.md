# Rule 10 — Transfer Data Abroad Only with a Valid Mechanism

> 국경을 넘기 전에 적정성 결정이나 표준계약조항 같은 합법 근거를 확보하라.
> Before data crosses borders, secure a valid mechanism such as an adequacy decision or SCCs.

## Why

GDPR Chapter 5 prohibits transferring personal data outside the EEA unless a transfer mechanism applies: an adequacy decision, appropriate safeguards (Standard Contractual Clauses or Binding Corporate Rules), or a narrow derogation. The EU-US Data Privacy Framework (DPF, July 2023) is an adequacy decision covering certified US organizations; it survived its first court challenge in September 2025 but remains subject to further review. Korea PIPA imposes similar cross-border rules. Cloud regions and offshore vendors make transfers easy to trigger unknowingly, and unauthorized transfers carry the highest fine tier.

## How to apply

- Map where personal data physically resides and flows, including sub-processors and cloud regions.
- Confirm a valid mechanism (adequacy including DPF for certified US orgs, SCCs, or BCRs) before any cross-border flow starts.
- Run a transfer impact assessment when relying on SCCs, per the Schrems II standard.
- Prefer in-region storage and processing where data residency rules or risk demand it.
- Re-check mechanisms when vendors, regions, or adequacy decisions change.

## Checklist

- [ ] Data flows and storage locations, including sub-processors, are mapped.
- [ ] Each cross-border transfer has a documented, valid legal mechanism.
- [ ] SCC-based transfers have a transfer impact assessment on file.
- [ ] Data residency requirements are met where they apply.
- [ ] Transfer mechanisms are reviewed when vendors or regions change.

## References

- GDPR Chapter 5 transfers to third countries — https://gdpr-info.eu/chapter-5/
- EU-US Data Privacy Framework (DPF) — https://www.dataprivacyframework.gov/Program-Overview
- European Data Protection Board (EDPB) — https://www.edpb.europa.eu/
