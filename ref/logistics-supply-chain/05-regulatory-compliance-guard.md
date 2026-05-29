# Rule 05 — Enforce Regulatory Rules at the Data Layer

> 규정 위반은 저장 전에 차단해야 한다. UI 경고나 사후 감사만으로는 충분하지 않다.
> Regulatory violations must be blocked at persistence, not surfaced as warnings in the UI or caught in a post-shipment audit.

## Why

Logistics is one of the most regulated industries in existence: FMCSA/DOT governs carrier safety and hours-of-service, 49 CFR Parts 171-180 governs hazardous materials classification and packaging, FDA FSMA 204 mandates food traceability at lot level, customs authorities require accurate HS tariff codes and declared values, and cold-chain regulations demand continuous temperature records for pharmaceuticals. Violations carry civil penalties, shipment seizures, and loss of operating authority. A software system that allows non-compliant data to be saved — even temporarily — creates compliance gaps that auditors find and prosecutors use. The cost of a data-layer guard is trivial compared to a single FMCSA violation or FDA recall.

## How to apply

- Classify every shipment by commodity type at creation; the commodity type drives which regulatory rule sets apply (hazmat, food, pharma, standard).
- For hazmat shipments: validate UN number, proper shipping name, hazard class, packing group, and quantity against the DOT hazardous materials table (49 CFR 172.101) before the shipment record can be saved; block, do not warn.
- For carrier selection: verify current FMCSA operating authority and insurance status via the FMCSA SAFER system API before tendering; prevent tender to carriers with inactive authority.
- Store HS (Harmonized System) tariff codes on all international shipment lines; validate format (6-digit minimum) and require country-of-origin at the line level for customs filings.
- For temperature-controlled shipments: persist the required temperature range and record-keeping obligation (FSMA, EU GDP) on the load; integrate with cold-chain logger APIs and alert on excursion events.
- Implement a compliance rule engine that is independently testable and versioned; regulatory tables change frequently and must not require code deploys to update.

## Checklist

- [ ] Hazmat shipments cannot be saved without a valid UN number, hazard class, and packing group.
- [ ] Carrier tender is blocked if FMCSA operating authority is inactive or insurance is expired.
- [ ] International shipment lines carry a validated HS code and country of origin before export filing.
- [ ] Cold-chain shipment records include required temperature range and are linked to logger data.
- [ ] Compliance rule tables are version-controlled and updateable without a full application redeploy.

## References

- FMCSA — Hazardous Materials Regulations, 49 CFR Parts 171-180 — https://www.fmcsa.dot.gov/regulations/hazardous-materials
- FMCSA — Carrier compliance and SAFER system — https://www.fmcsa.dot.gov/regulations
- GS1 — Traceability standards for food and pharma — https://www.gs1.org/standards
- ASCM SCOR Digital Standard v14 — Enable process, compliance enablers — https://scor.ascm.org/
