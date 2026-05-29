# Rule 06 — Passenger Safety and TNC Regulatory Compliance

> 안전 요건을 하나라도 빠뜨리면 면허 취소와 민사 책임이 함께 온다.
> Missing a single safety requirement brings license revocation and civil liability together.

## Why

Transportation Network Companies (TNCs) operate under a patchwork of state and local regulations that are strictly enforced, not advisory. In California, the CPUC requires annual re-permitting and mandates specific driver background check standards, insurance minimums (commercial coverage from app-on through trip-end), and accessible vehicle quotas. New York's TLC, Texas's TNC law, and similar regimes mirror these requirements with local variations. The software platform is not a neutral technology tool: it is the mechanism through which safety mandates are enforced, so missing fields in the driver onboarding flow, incorrect insurance stage tracking, or absent incident-reporting endpoints constitutes a regulatory violation by the platform itself, not just the operator.

## How to apply

- Model the three-stage insurance state machine in software: Stage 1 (app on, no match), Stage 2 (match accepted, en route to pickup), Stage 3 (passenger in vehicle); each stage has a different liability minimum and must be stored on every trip record.
- Enforce background check expiry: driver accounts must be flagged and suspended automatically when the background check certificate expires; never rely on manual review workflows.
- Build an in-app emergency SOS feature that shares the rider's real-time location and trip ID with emergency services and a trusted contact; this is mandated in several jurisdictions.
- Implement an incident-reporting API that produces a structured report (trip ID, parties, timestamp, location, description) exportable to regulators within the required window (typically 10 business days in California).
- Log the driver's license plate, vehicle VIN, and photo at every session start; surface these on the rider's "share my trip" screen to enable visual verification before entry.

## Checklist

- [ ] Three-stage insurance state machine is implemented and every trip record stores the current stage at fare calculation time.
- [ ] Driver background check expiry date is stored and auto-suspension fires on expiry.
- [ ] In-app SOS button present, tested, and shares live location and trip ID.
- [ ] Incident report can be generated and exported in structured format within regulatory window.
- [ ] Rider-facing trip share screen displays license plate, vehicle make/model, and driver photo.

## References

- California CPUC Basic Information for Transportation Network Companies — https://www.cpuc.ca.gov/-/media/cpuc-website/files/uploadedfiles/cpuc_public_website/content/licensing/transportation_network_companies/basicinformationfortncs.pdf
- NY DMV — Information for TNC Passengers — https://dmv.ny.gov/business/information-for-tnc-passengers
- NYC TLC — TNC Rules and Regulations — https://www.nyc.gov/site/tlc/businesses/transportation-network-company.page
- NHTSA — Automated Vehicles for Safety — https://www.nhtsa.gov/technology-innovation/automated-vehicles-safety
