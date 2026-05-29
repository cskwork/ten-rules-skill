# Logistics & Supply Chain — 10 Rules (index)

Source: Grounded in ASCM SCOR Digital Standard v14 (ascm.org), GS1 global identification and EDI standards (gs1.org), Eliyahu M. Goldratt & Jeff Cox "The Goal" (North River Press, 1984), Martin Christopher "Logistics and Supply Chain Management" 6th ed. (Pearson, 2022), and FMCSA/DOT federal motor carrier regulations (fmcsa.dot.gov). Building software for logistics and supply chain means engineering systems that move physical goods reliably under regulatory constraints — correctness in identifiers, timestamps, and state transitions directly determines whether freight arrives on time, inventory is accurate, and compliance records survive audit.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-shipment-state-machine.md` | Model every shipment as an explicit state machine | Order lifecycle, status updates, track-and-trace events, webhook design |
| 02 | `02-canonical-identifiers.md` | Use GS1/industry canonical IDs throughout | SKU, GTIN, SSCC, GLN, carrier PRO/BOL, any entity key design |
| 03 | `03-real-time-visibility.md` | Publish location and ETA events in near-real time | Track-and-trace UI, customer notifications, carrier integrations, IoT feeds |
| 04 | `04-constraint-aware-scheduling.md` | Surface and protect the system constraint | Route planning, warehouse slotting, dock scheduling, capacity modeling |
| 05 | `05-regulatory-compliance-guard.md` | Enforce regulatory rules at the data layer | Hazmat, FMCSA carrier vetting, customs/HS codes, cold-chain, food safety |
| 06 | `06-idempotent-edi-integration.md` | Make every EDI and API exchange idempotent | EDI 204/210/214/856, ASN ingestion, carrier API, 3PL webhooks |
| 07 | `07-inventory-accuracy-first.md` | Treat inventory accuracy as a safety-critical property | WMS receiving, cycle-count, adjustment flows, multi-DC inventory sync |
| 08 | `08-last-mile-ux.md` | Design last-mile UX around delivery-attempt success | Driver apps, customer notification flows, proof-of-delivery capture |
| 09 | `09-cost-to-serve-instrumentation.md` | Instrument cost-to-serve at the shipment level | Billing, carrier rate shopping, accessorial charges, SLA reporting |
| 10 | `10-resilient-carrier-network.md` | Architect for carrier and lane failure | Multi-carrier tender, fallback routing, service-disruption handling |

Default for "building or modifying a shipment tracking or fulfillment feature": read rules 01, 03, 07 at minimum.
