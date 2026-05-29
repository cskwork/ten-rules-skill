# Rule 05 — Open by Default Data

> 공공 데이터는 기본적으로 공개하라. 공개하지 않을 명확한 법적 이유가 없는 한, 구조화된 형식으로 게시해야 한다.
> Public data is public property; publish it in structured, licensed, machine-readable form unless there is a specific legal reason not to.

## Why

Government data is produced using public funds for the public benefit. Open data enables civic innovation, policy scrutiny, academic research, and public accountability that cannot be achieved through ad-hoc freedom-of-information requests. The W3C DCAT standard (DCAT-US v3 in the US, aligned to DCAT 3 internationally) provides the metadata vocabulary for publishing dataset catalogs in a way that allows data.gov, data.gov.uk, and national open-data portals to index and discover datasets automatically. Services that silo data inside application databases rather than exposing it as open data undermine the public-sector obligation of transparency and create duplicated requests that cost staff time.

## How to apply

- Apply an open-data-by-default policy at the start of every data project: classify each dataset as open, shared, or closed with a documented rationale; default to open unless a legal exemption applies (personal data, national security, commercial sensitivity).
- Publish datasets in open, non-proprietary formats: CSV, JSON, GeoJSON, or RDF for tabular and linked data; avoid PDF-only publication for structured data.
- Apply an open licence (Creative Commons Attribution or equivalent government open licence) explicitly in the metadata; omitting a licence makes data legally unusable by third parties.
- Register every public dataset in DCAT-compliant metadata on the agency's data inventory and submit to the national catalog (data.gov, data.gov.uk); include title, description, publisher, spatial/temporal coverage, update frequency, licence, and contact point.
- Provide stable, versioned dataset URLs and document breaking changes with at least 90 days notice; open data consumers cannot absorb silent schema changes.
- For real-time or high-frequency data (transport, environmental monitoring), publish via documented REST or GTFS/SIRI feeds, not scheduled bulk downloads alone.

## Checklist

- [ ] Dataset classification (open/shared/closed) documented with legal basis for any closed classification
- [ ] Data published in at least one open, non-proprietary format
- [ ] Open licence explicitly stated in the dataset metadata
- [ ] Dataset registered in DCAT-compliant metadata catalog
- [ ] Stable canonical URL exists and redirects gracefully on version updates

## References

- W3C DCAT-US v3 open data standard — https://resources.data.gov/resources/dcat-us3/
- W3C Data Catalog Vocabulary (DCAT) Version 3 — https://www.w3.org/TR/vocab-dcat-3/
- Data.gov resources and open data standards — https://resources.data.gov/resources/dcat-us/
- GOV.UK Service Standard — Point 12: Make new source code open — https://www.gov.uk/service-manual/service-standard/point-12-make-new-source-code-open
