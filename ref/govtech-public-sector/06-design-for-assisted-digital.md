# Rule 06 — Design for Assisted Digital

> 디지털 채널을 이용할 수 없는 시민을 위한 대안 경로를 설계하라. 디지털 전용 서비스는 공공 서비스가 아니다.
> Design an alternative path for citizens who cannot use digital channels; a digital-only service is not a public service.

## Why

Approximately 10 to 20 percent of the adult population in developed economies lacks the skills, connectivity, or devices to use digital government services independently. This group is disproportionately elderly, disabled, rural, or economically disadvantaged — the same people who most rely on government support. The GOV.UK Service Standard explicitly requires that teams understand and provide for users who cannot complete a digital journey alone. Building a web service without an assisted path effectively denies access to citizens who have no other option. This is not merely a policy requirement; it is a fundamental test of whether a service can be called complete.

## How to apply

- Map all non-digital user groups in the discovery phase: identify which segments need phone, post, in-person, or assisted self-service channels, and the volume of transactions expected through each.
- Provide a working phone or in-person fallback for every transactional service; the fallback must reach the same outcome as the digital journey, not a degraded or delayed alternative.
- Design the assisted channel to share data with the digital channel — a call centre agent helping a citizen should be able to see and update the same application, not work from a separate paper process.
- Publish the location of assisted-digital support points (libraries, post offices, citizen advice centres) on the service's start page.
- Train support staff using the same service specifications as the digital team; channel inconsistency — where the phone agent gives different answers than the website — is one of the top drivers of repeat contact.
- Include assisted-digital scenarios in usability testing; recruit participants who do not own smartphones or have never used a government website.

## Checklist

- [ ] Assisted-digital user groups identified and volume estimates documented
- [ ] Non-digital channel (phone, post, or in-person) available and leads to the same outcome
- [ ] Assisted-digital channel shares the same data model as the digital channel
- [ ] Support locations or contact details published on the service start page
- [ ] At least one usability test session conducted with a low-digital-skill participant

## References

- GOV.UK Service Standard — Point 3: Provide a joined-up experience across all channels — https://www.gov.uk/service-manual/service-standard/point-3-provide-a-joined-up-experience
- GOV.UK Service Manual — Assisted digital support — https://www.gov.uk/service-manual/helping-people-to-use-your-service/assisted-digital-support-introduction
- US Digital Services Playbook — Play 2: Address the whole experience, from start to finish — https://playbook.usds.gov/
- GOV.UK Design System — Accessibility (GDS) — https://design-system.service.gov.uk/accessibility/
