# Rule 07 — Location Data Privacy

> 이동 경로는 개인의 생활 패턴 그 자체이므로, 수집은 최소화하고 보존은 짧게 한다.
> A trip trace is a person's daily pattern itself — collect the minimum and retain it briefly.

## Why

GPS traces collected by mobility platforms are among the most sensitive personal data categories: they reveal home address, workplace, medical appointments, religious attendance, and political activity. Researchers have demonstrated that four spatio-temporal points are sufficient to uniquely re-identify 95% of individuals in a mobility dataset (de Montjoye et al., Nature Scientific Reports). Regulators treat precise location data as a special category under GDPR (Article 9 context) and under California's CPRA. Mobility platforms are high-value targets for both commercial data brokers and law enforcement subpoenas; without explicit data minimization and retention limits, platforms become surveillance infrastructure by default.

## How to apply

- Store raw GPS traces only for the duration operationally required: driver navigation (trip duration + 24 hours for dispute), passenger sharing (trip duration only), fraud detection (30 days maximum raw, then aggregate).
- Anonymize historical trip data before any analytical use: replace precise coordinates with H3 hexagonal grid cells (resolution 8 or coarser) and add temporal jitter of ±5 minutes.
- Implement purpose-bound access control: the fraud team may access raw traces during a 30-day window; the product analytics team must only access the anonymized aggregate; no cross-purpose sharing without explicit DPO (Data Protection Officer) approval.
- Require explicit, granular consent for background location access on mobile apps; "always on" location must be justified, explained in plain language, and revocable without losing core app functionality.
- Log every access to raw location records (who, when, what trip ID, stated purpose) and make this access log auditable by the user on request.

## Checklist

- [ ] Raw GPS trace retention policy is documented and enforced by automated deletion jobs.
- [ ] Analytical pipelines use H3-aggregated or otherwise anonymized location data, not raw coordinates.
- [ ] Access to raw location data is role-gated and every access is logged with purpose.
- [ ] Mobile app requests foreground-only location by default; background location requires explicit secondary consent.
- [ ] Users can request an export or deletion of their trip location history through the app.

## References

- de Montjoye et al. — "Unique in the Crowd: The privacy bounds of human mobility," Nature Scientific Reports 3, 2013 — https://www.nature.com/articles/srep01376
- OECD — Mix and MaaS: Data Architecture for Mobility as a Service — https://www.oecd.org/en/publications/mix-and-maas-data-architecture-for-mobility-as-a-service_4272475b-en.html
- Uber Privacy — referenced via California CPUC TNC data requirements
- H3 Geospatial Indexing System — Uber Engineering — https://h3geo.org/
