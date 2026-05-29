# Rule 02 — Use GS1/Industry Canonical IDs Throughout

> 모든 물품, 위치, 거래처는 글로벌 표준 식별자를 사용해야 한다. 내부 코드는 보조 역할에 그쳐야 한다.
> Every product, location, and trading partner must carry a globally unique, standard identifier; internal codes are aliases, not the source of truth.

## Why

Logistics networks span dozens of carriers, 3PLs, retailers, and customs authorities, none of which share your internal database. Without canonical identifiers — GS1 GTIN for products, SSCC for pallets, GLN for locations, SCAC for carriers — every integration becomes a bespoke mapping exercise that breaks when a partner changes their schema. GS1 standards underpin billions of daily supply chain transactions globally; deviation forces manual reconciliation at every handoff, the leading cause of ASN (Advanced Ship Notice) reject rates and inventory discrepancies. Customs and food-traceability regulations (FDA FSMA 204, EU FMD) increasingly mandate GTIN- and GLN-level granularity by law.

## How to apply

- Assign and store GTIN-14 (or GTIN-12 for retail units) as the primary product key; never rely on supplier part numbers alone.
- Represent warehouse locations and trading partner sites as GLN (Global Location Number); include GLN in all EDI documents (856 ASN, 850 PO, 810 invoice).
- Encode carrier identity with SCAC code (Standard Carrier Alpha Code) for road freight; use IATA codes for air, UN/LOCODE for ports.
- Store SSCC (Serial Shipping Container Code) on every pallet label and ASN line to enable pallet-level receiving scan.
- Maintain a master data registry that maps internal codes to canonical IDs; the registry is the integration contract — downstream systems query it, they do not store raw internal codes.
- Validate GS1 check digits at input boundaries (receiving scan, EDI ingest, API submission).

## Checklist

- [ ] Every product record has a GTIN stored and displayed in GS1 compliant format.
- [ ] Every warehouse location used in outbound documents carries a GLN.
- [ ] EDI 856 ASN lines include SSCC at pallet level.
- [ ] SCAC or equivalent carrier code is stored on every shipment; no carrier identified by name string alone.
- [ ] Check-digit validation runs at every data-entry and API-ingest boundary.

## References

- GS1 — Barcodes, GTIN, GLN, SSCC, EDI standards — https://www.gs1.org/standards
- GS1 EDI standard documentation — https://www.gs1.org/standards/edi
- GS1 US — Barcodes Powered by GS1 Standards — https://www.gs1us.org/
- ASCM SCOR Digital Standard v14 — https://scor.ascm.org/
