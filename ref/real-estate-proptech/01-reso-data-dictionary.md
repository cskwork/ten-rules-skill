# Rule 01 — RESO Data Dictionary Conformance

> 업계 표준 필드명을 사용해야 데이터가 MLS 생태계 전체에서 호환된다.
> Use RESO-standard field names and enumerations so data is interoperable across the entire MLS ecosystem.

## Why

RESO Data Dictionary 2.0 (certified mandatory for all NAR-affiliated MLSs by April 2025) defines canonical field names, types, and pick-list values for every listing attribute. Non-conformant field names break IDX feed ingestion, third-party syndication, and cross-MLS search. When a PropTech product invents its own schema, every downstream integration requires a bespoke mapping layer that compounds into technical debt at scale. RESO Web API (OData-based) is the replacement for the legacy RETS protocol; building against RETS in 2025 means building against an end-of-life interface.

## How to apply

- Map every internal listing field to its RESO Data Dictionary 2.0 equivalent before designing the database schema; do not invent field names for fields the dictionary already covers.
- Use RESO-defined enumerations (StandardStatus: Active, Pending, Closed, etc.) rather than free-text or local codes; store both the RESO enum and the MLS-local code so you can round-trip without data loss.
- Consume listing data via the RESO Web API (OData endpoint) rather than legacy RETS; authenticate with OAuth 2.0 per the RESO spec.
- Validate ingested payloads against the published RESO Data Dictionary JSON Schema on ingest, log and quarantine records that fail validation rather than silently dropping fields.
- For custom fields not covered by the dictionary, prefix them with a vendor namespace (e.g., `VendorX_SolarPanelKW`) to avoid future collisions when the dictionary expands.

## Checklist

- [ ] All listing fields in the database schema have a documented mapping to RESO Data Dictionary 2.0 or a namespaced extension.
- [ ] Feed ingest uses RESO Web API (OData); RETS usage is flagged for migration.
- [ ] Ingest pipeline validates StandardStatus and ListingId against RESO enumerations.
- [ ] Schema mapping document is version-controlled and updated on each RESO dictionary release.
- [ ] Integration tests replay real MLS feed samples and assert field mappings are lossless.

## References

- RESO Data Dictionary — Real Estate Standards Organization — https://www.reso.org/data-dictionary/
- RESO Web API specification — https://www.reso.org/reso-web-api/
- NAR Real Estate Transaction Standards (RETS — legacy reference) — https://www.nar.realtor/real-estate-transaction-standards-rets
- "What Is RESO and Why Does It Matter for Real Estate Data Products?" — Constellation Data Labs — https://cdatalabs.com/what-is-reso-and-why-does-it-matter-for-real-estate-data-products/
