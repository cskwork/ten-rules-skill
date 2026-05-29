# Rule 04 — Record Full Material and Process Genealogy at Every Step

> 모든 공정 단계에서 재료와 프로세스의 이력을 완전하게 기록하라.
> Capture an unbroken chain of material identity and process parameters at every manufacturing step.

## Why

Traceability is not a reporting feature — it is the mechanism by which a manufacturer can isolate and contain a defect before it reaches the customer or triggers a safety recall. In semiconductor manufacturing (wafer lots), automotive (VIN genealogy), pharma (batch records under 21 CFR Part 11 / EU GMP Annex 11), and food/beverage (lot recall within 2 hours), incomplete traceability means either a full-plant recall or regulatory shutdown. Genealogy records must answer: what material went in, from which supplier lot; which equipment and which certified operator ran each step; what the actual process parameters were; and what the measured output quality was. This data must be immutable once captured and queryable in under a minute for any unit in the last 10 years.

## How to apply

- Assign a unique, immutable identifier to every discrete unit, lot, or batch at the point of entry into the facility; never reuse identifiers.
- Capture parent-child material relationships at every split, merge, or consume event so the full genealogy tree is reconstructable from any node.
- Record actual process parameters (temperature, pressure, speed, recipe version, equipment ID, operator ID, timestamp) as a linked process record on each work-order step — not as a separate system that must be joined later.
- Mark genealogy records as write-once; corrections create a new audit record referencing the original, not an in-place update.
- Index genealogy by: unit ID, lot ID, equipment ID, date range, and supplier lot — all five must support sub-minute query response.

## Checklist

- [ ] Every unit/lot has an immutable ID assigned at facility entry; no ID reuse policy is enforced.
- [ ] Parent-child material relationships are stored at every split, merge, and consume event.
- [ ] Actual process parameters are linked to work-order steps at capture time, not reconciled later.
- [ ] Genealogy records are write-once; all corrections are additive audit records.
- [ ] Query by unit ID, lot, equipment, date range, and supplier lot all return results in under 60 seconds.

## References

- ISA-95.00.02, *Enterprise-Control System Integration Part 2: Object and Attribute Models* — https://www.isa.org/standards-and-publications/isa-standards/isa-95-standard
- FDA 21 CFR Part 11, *Electronic Records; Electronic Signatures* — https://www.ecfr.gov/current/title-21/chapter-I/subchapter-A/part-11
- SEMI E10 and SEMI E30 standards for semiconductor equipment traceability — https://www.semi.org/en/connect/standards
- MESA International, *Traceability and Genealogy* functional component — https://mesa.org
