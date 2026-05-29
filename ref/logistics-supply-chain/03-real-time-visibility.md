# Rule 03 — Publish Location and ETA Events in Near-Real Time

> 화물의 위치와 도착 예정 시간은 발생 즉시 모든 이해관계자에게 전달되어야 한다.
> Location and estimated arrival updates must reach every stakeholder within seconds of the physical event, not on the next polling cycle.

## Why

Logistics decisions — dock scheduling, labor allocation, customer service responses, customs pre-clearance — are made against expected arrival windows. Stale ETAs cascade into missed dock appointments, idle labour, and failed customer SLAs. Real-time visibility is the primary differentiator cited by shippers when selecting carriers and 3PLs; a platform that cannot surface sub-minute location updates loses contracts to ones that can. Martin Christopher identifies supply chain visibility as the foundation of responsive logistics: you cannot compress lead time without knowing exactly where inventory is at every moment.

## How to apply

- Ingest carrier GPS/telematic feeds, IoT sensor payloads, and EDI 214 status messages through a dedicated event ingestion service; do not poll carrier APIs on user-initiated requests.
- Normalize all location events to a common schema: shipment ID, canonical carrier SCAC, latitude/longitude or location GLN, event timestamp (carrier time), ingestion timestamp, event type.
- Publish normalized events to an internal event bus (Kafka, SNS/SQS, Pub/Sub); downstream services — ETA engine, notification service, visibility dashboard — subscribe independently.
- Compute and update predicted ETA on every location event using a model that incorporates remaining distance, carrier speed patterns, traffic, and scheduled stops; never show a static "promised" ETA to end users when live data is available.
- Push proactive outbound notifications (SMS, email, webhook) to customers and receivers when ETA shifts by more than a configurable threshold (e.g., 30 minutes).
- Retain the full location event history per shipment for SLA measurement, claims, and regulatory dwell-time audits.

## Checklist

- [ ] Location events are ingested and stored within 60 seconds of the carrier timestamp.
- [ ] ETA is recomputed on every inbound location event; stale static ETAs do not persist beyond one polling interval.
- [ ] Customer-facing notifications fire automatically when ETA deviation exceeds the configured threshold.
- [ ] The visibility dashboard shows last-known position and event age so operators can identify stale feeds.
- [ ] Full event history is queryable per shipment for at least 90 days.

## References

- Martin Christopher, "Logistics and Supply Chain Management" 6th ed., Pearson 2022 — https://www.pearson.com/en-us/subject-catalog/p/logistics-and-supply-chain-management/P200000007134/9781292416205
- ASCM SCOR Digital Standard v14 — Enable process domain, visibility enablers — https://scor.ascm.org/
- CSCMP — Supply Chain Management Definitions and Glossary (visibility, lead-time compression) — https://cscmp.org/CSCMP/Educate/SCM_Definitions_and_Glossary_of_Terms.aspx
