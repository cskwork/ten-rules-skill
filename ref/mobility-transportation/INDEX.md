# Mobility & Transportation — 10 Rules (index)

Source: Grounded in GTFS and GTFS-Realtime specifications (gtfs.org), Open Charge Point Protocol 2.1 (Open Charge Alliance / openchargealliance.org), OSRM routing engine documentation (project-osrm.org), California CPUC TNC regulations, OECD MaaS data architecture guidance, and peer-reviewed research on ride-hailing dispatch and dynamic pricing (Yan et al., Naval Research Logistics 2020). Building software for this industry means operating real-time, safety-critical platforms where location data, regulatory compliance, driver-passenger matching, and fare calculation must be correct, auditable, and available around the clock.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-gtfs-realtime-feed-integrity.md` | Publish valid, versioned GTFS and GTFS-RT feeds | transit schedules, stop data, vehicle positions, trip updates |
| 02 | `02-realtime-matching-dispatch.md` | Match and dispatch within sub-second SLAs | rider-driver assignment, batching, ETAs, queue management |
| 03 | `03-routing-and-map-accuracy.md` | Use road-network routing, never straight-line distance | route calculation, ETA, turn-by-turn, map display |
| 04 | `04-dynamic-pricing-transparency.md` | Show surge multiplier before the rider commits | fare display, pricing engine, surge, promotions |
| 05 | `05-ocpp-ev-charging-compliance.md` | Implement OCPP 2.x for all charger communication | EV charging station management, CPO/EMSP integration |
| 06 | `06-passenger-safety-and-tnc-compliance.md` | Meet every TNC safety mandate before launch | driver onboarding, background checks, insurance, incident reporting |
| 07 | `07-location-data-privacy.md` | Minimize, anonymize, and expire location traces | GPS tracking, trip history, data retention, GDPR/CCPA |
| 08 | `08-offline-and-degraded-mode.md` | Keep core trip functions alive without connectivity | mobile app, driver app, payment fallback, low-signal areas |
| 09 | `09-accessibility-and-multimodal.md` | Support accessibility standards and mode interoperability | wheelchair, paratransit, MaaS integration, deep links |
| 10 | `10-fare-and-payment-auditability.md` | Make every fare calculation reproducible and auditable | billing, receipts, dispute resolution, regulatory reporting |

Default for "adding or updating a trip booking flow": read 02, 03, 04, 10 at minimum.
