# Rule 08 — Design Last-Mile UX Around Delivery-Attempt Success

> 첫 번째 배송 시도의 성공률을 높이는 것이 마지막 구간 UX 설계의 핵심 목표다.
> Every UX decision in the last-mile flow must be evaluated by a single metric: does this increase first-attempt delivery success rate?

## Why

Last-mile delivery is the most expensive and failure-prone segment of the supply chain, accounting for 41-53% of total shipping cost. A failed delivery attempt — nobody home, wrong address, access code missing — requires a re-delivery or pickup that can cost more than the original shipment margin. The driver app and customer notification flow are the primary software lever: proactive ETAs reduce "not home" failures; clear access instructions reduce "unable to access" failures; digital proof-of-delivery (ePOD) with photo and signature eliminates "never received" disputes. Unlike warehouse or TMS software used by trained operators, last-mile apps must work for gig drivers on consumer devices in variable connectivity conditions.

## How to apply

- Send a day-prior notification with a narrow delivery window (2-hour or less) and a live-tracking link; send a same-day notification 60 minutes before arrival with a real-time ETA countdown.
- Build the driver app for offline-first operation: download route, stops, and delivery instructions before the shift; queue scan and ePOD events locally; sync when connectivity resumes. Never block a driver action on a network call.
- Capture ePOD at every stop: photo of parcel at door (required), signature (where mandated), recipient name, and GPS coordinate at capture time. Store all ePOD assets durably and associate with the shipment event record.
- Surface access instructions (gate code, safe-drop location, business hours) prominently in the driver app at the stop-arrival screen, not buried in notes.
- Provide a one-tap "attempt failed" flow with a required reason code (not home, address not found, access denied, refused); the reason code drives automatic rescheduling or customer re-engagement logic.

## Checklist

- [ ] Customer receives a day-before and a 60-minute-out notification with a live ETA link.
- [ ] Driver app functions fully offline; no delivery action requires a live network call to complete.
- [ ] ePOD captures photo, GPS coordinate, timestamp, and recipient name at every stop.
- [ ] Access instructions and delivery preferences are displayed at the stop-arrival screen.
- [ ] Failed-attempt flow requires a reason code; re-delivery or customer contact is triggered automatically.

## References

- MIT Center for Transportation & Logistics — Last-Mile Delivery Research — https://ctl.mit.edu/research/last-mile-logistics
- CSCMP — Supply Chain Management Definitions and Glossary (last-mile, proof of delivery) — https://cscmp.org/CSCMP/Educate/SCM_Definitions_and_Glossary_of_Terms.aspx
- Martin Christopher, "Logistics and Supply Chain Management" 6th ed., Pearson 2022 — https://www.pearson.com/en-us/subject-catalog/p/logistics-and-supply-chain-management/P200000007134/9781292416205
