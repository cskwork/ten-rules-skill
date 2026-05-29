# Rule 09 — Accessibility and Multimodal Interoperability

> 이동약자를 지원하지 않는 교통 플랫폼은 법적으로도 시장 측면에서도 불완전하다.
> A mobility platform that does not support people with disabilities is incomplete both legally and commercially.

## Why

The Americans with Disabilities Act (ADA) and equivalent regulations in the EU, UK, and most transit jurisdictions require that transportation services be accessible to people using wheelchairs, those with visual or hearing impairments, and others with mobility limitations. TNCs in California must file an Accessibility Plan with the CPUC and report on WAV (Wheelchair Accessible Vehicle) availability and wait times. Beyond compliance, the MaaS (Mobility as a Service) model — where a single app aggregates transit, ride-hailing, bike share, and micro-mobility — requires standardized deep-link and API contracts between modes so users can plan a mixed-mode journey end-to-end. GTFS already has `wheelchair_boarding` fields; ignoring them means your app actively misleads riders with disabilities.

## How to apply

- Populate and consume `wheelchair_boarding` on `stops.txt` and `wheelchair_accessible` on `trips.txt` in all GTFS feeds; surface wheelchair accessibility filters in the trip planner UI.
- Implement WAV (Wheelchair Accessible Vehicle) as a first-class vehicle category in the ride-hailing booking flow; report WAV request volume and average wait time as separate metrics for regulatory reporting.
- Follow WCAG 2.1 AA for all rider-facing and driver-facing interfaces: minimum 4.5:1 contrast, tap targets 44x44 dp minimum, full screen-reader support for trip state announcements.
- Use the MaaS Alliance API or TOMP (Transport Operator to MaaS Provider) standard for third-party integrations so other aggregators can access your inventory with a documented, versioned interface.
- Support universal deep links (`appname://trip?from=...&to=...`) and fallback web URLs so a multimodal journey planner can hand off to your app mid-flow without losing trip context.

## Checklist

- [ ] GTFS feeds include `wheelchair_boarding` and `wheelchair_accessible` fields, populated accurately.
- [ ] WAV vehicle category bookable through the app; wait time tracked as a separate SLA metric.
- [ ] All public-facing UI passes WCAG 2.1 AA automated audit (axe, Lighthouse accessibility).
- [ ] Deep-link schema documented and tested for handoff from third-party journey planners.
- [ ] Accessibility plan or equivalent regulatory report can be generated from platform data.

## References

- GTFS Schedule Reference — `wheelchair_boarding` field — https://gtfs.org/documentation/schedule/reference/
- California CPUC TNC Accessibility Requirements — https://www.cpuc.ca.gov/-/media/cpuc-website/files/uploadedfiles/cpuc_public_website/content/licensing/transportation_network_companies/basicinformationfortncs.pdf
- SFMTA Accessibility Strategy — Accessible Emerging Private Passenger Services — https://www.sfmta.com/accessibility-strategy-needs-assessment-2024/streets-policy-and-planning/23-accessible-emerging-private-passenger-services
- OECD MaaS Data Architecture for Mobility as a Service — https://www.oecd.org/en/publications/mix-and-maas-data-architecture-for-mobility-as-a-service_4272475b-en.html
