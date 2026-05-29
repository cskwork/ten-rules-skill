# Rule 09 — Property Data Provenance and Chain of Custody

> 모든 부동산 데이터 포인트에는 출처, 시각, 변경 이력이 있어야 한다 — 근거 없는 숫자는 법적 분쟁의 씨앗이다.
> Every property data point must carry its source, timestamp, and change history — unsourced numbers seed legal disputes.

## Why

Property data flows from multiple authoritative and semi-authoritative sources: MLS feeds, county assessor records, FEMA flood maps, permit databases, HOA records, and user-submitted content. These sources conflict regularly: the MLS may show 1,800 sq ft while the county assessor shows 1,640 sq ft. When a buyer later discovers a discrepancy, the question of which system displayed which number at the time of offer can determine liability. Title searches, appraisals, and loan underwriting all depend on traceable data lineage. Regulatory audits of AVMs (see Rule 05) require documentation of which inputs were used for a given valuation at a given date.

## How to apply

- Model every property data attribute as a versioned record with fields: value, source_type (MLS, assessor, user, computed), source_id, ingested_at, and valid_from/valid_to timestamps; never overwrite in place.
- When multiple sources disagree on the same field, display the MLS value as primary (for on-market properties) but expose the discrepancy to the agent or consumer: "MLS: 1,800 sq ft | County assessor: 1,640 sq ft — verify before offer."
- Tag user-submitted corrections or edits with the submitter's user ID and a "unverified" flag; display them separately from authoritative-source data until a licensed agent confirms them.
- Maintain a property event ledger (ownership transfers, permit pulls, price changes, status changes) as an append-only log; this feeds the listing history timeline on the property detail page.
- For AVM computation, snapshot the exact inputs (comparable sales used, tax assessed value, square footage source) and store them immutably alongside the output value and the model version number.

## Checklist

- [ ] Property attribute records are versioned with source_type, source_id, and valid_from/valid_to; no in-place overwrites.
- [ ] Multi-source conflicts are surfaced to the user, not silently resolved by last-write-wins.
- [ ] User-submitted data is flagged "unverified" until agent-confirmed.
- [ ] Property event ledger is append-only and backs the listing history timeline.
- [ ] AVM snapshots store input comparables and model version alongside the output.

## References

- RESO Data Dictionary field provenance fields (OriginatingSystemKey, SourceSystemKey) — https://www.reso.org/data-dictionary/
- FEMA National Flood Hazard Layer (NFHL) data source — https://www.fema.gov/flood-maps/national-flood-hazard-layer
- ATTOM Property Data API provenance documentation — https://www.attomdata.com/
- Constellation Data Labs: RESO and real estate data products — https://cdatalabs.com/what-is-reso-and-why-does-it-matter-for-real-estate-data-products/
