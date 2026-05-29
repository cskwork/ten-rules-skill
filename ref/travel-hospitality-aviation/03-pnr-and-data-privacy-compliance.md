# Rule 03 — PNR and Passenger Data Privacy Compliance

> 승객 데이터는 법적으로 규정된 목적과 기간에 한해서만 보관하라.
> Retain passenger data only for the legally mandated purpose and duration.

## Why

A Passenger Name Record (PNR) contains personally identifiable information — name, passport, contact details, payment data, and special service requests — that is subject to at least two overlapping regulatory regimes simultaneously: the EU GDPR (right to erasure, data minimization, purpose limitation) and the EU PNR Directive 2016/681 (mandatory transmission to national Passenger Information Units for terrorism screening, with depersonalization after six months and deletion after five years). Airlines and OTAs that conflate operational use with security-reporting use violate both. A single British Airways-scale breach or a misrouted PNR transmission to the wrong government agency can cost eight-figure GDPR fines.

## How to apply

- Separate PNR data into operational (booking, check-in, service delivery) and security-reporting (border/law enforcement) stores; apply different retention schedules and access controls to each.
- Implement automated depersonalization jobs: strip names, passport numbers, and contact fields from operational records after the travel date plus a configurable grace period (typically 90 days for dispute resolution).
- For security-reporting PNR: transmit to the national PIU in the required format; depersonalize at six months; delete at five years — and log every transmission with a timestamp and jurisdiction code.
- Apply data minimization at collection: collect only the fields required for the specific booking type; do not collect frequent-flyer tier data, nationality, or dietary preferences unless the service explicitly requires them.
- Build a Subject Access Request workflow that can locate all records for a given passenger across operational store, loyalty system, and security-reporting store within the GDPR 30-day deadline.
- Encrypt PNR fields at rest using column-level encryption; never log full PNR data in application logs.

## Checklist

- [ ] Retention schedule for operational PNR is documented and enforced by an automated job, not manual process.
- [ ] Security-reporting PNR is isolated from operational PNR in a separate store with audit-logged access.
- [ ] GDPR Subject Access Request workflow is implemented and tested; response time is measured.
- [ ] Data minimization is enforced at the API layer — fields not required by the booking type are rejected, not ignored.
- [ ] PNR transmission to government PIUs is logged with jurisdiction, timestamp, and confirmation receipt.

## References

- IATA Data Protection & Privacy program — https://www.iata.org/en/programs/passenger/data-protection-privacy/
- EU PNR Directive 2016/681 (GOV.UK compliance guide) — https://www.gov.uk/government/publications/passenger-name-record-data/compliance-with-international-pnr-data-standards
- EU PNR Directive 2016/681 (full text, EUR-Lex) — https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32016L0681
