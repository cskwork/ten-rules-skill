# Rule 01 — User Need Over Organisational Convenience

> 시민의 실제 필요를 먼저 파악하고, 내부 행정 편의에 맞추지 마라.
> Design for what the user needs to accomplish, not for how the agency is structured.

## Why

Government services are often the only option a citizen has — there is no competing provider to switch to. When a service is designed around departmental silos or legacy process flows, users face dead ends, redundant forms, and jargon that serves no one. The GOV.UK Service Standard's first point and the USDS Playbook's Play 1 both place user research ahead of every other design decision, specifically because public-sector teams are institutionally pressured to replicate internal procedures rather than solve user problems.

Failing to understand the real user journey means building the wrong thing expensively, then discovering it at scale — with citizens unable to access benefits, renew licences, or file required documents.

## How to apply

- Conduct contextual user research with real members of the public before writing a single line of code or drafting a form field; include users with low digital literacy, disabilities, and limited English proficiency.
- Map the full end-to-end journey including offline steps (phone calls, paper, in-person visits) — the digital touchpoint is rarely the whole service.
- Define the user need as a problem statement ("As a citizen renewing my driving licence, I need to confirm my address has not changed so that the DVLA sends the licence to the right place"), not as a feature request.
- Challenge every form field: if the agency does not act on a piece of data, do not collect it; data minimisation is both a privacy obligation and a usability gain.
- Test prototypes with a minimum of five users per research round before moving to beta; recruit through assisted-digital channels, not just online panels.

## Checklist

- [ ] User research conducted with at least two distinct user groups before alpha
- [ ] End-to-end journey map exists, including offline and cross-agency steps
- [ ] Every form field has a documented justification tied to a user or statutory need
- [ ] Service described in terms of the user task, not the departmental name
- [ ] Prototype tested with users before any development investment

## References

- GOV.UK Service Standard — Point 1: Understand users and their needs — https://www.gov.uk/service-manual/service-standard/point-1-understand-user-needs
- US Digital Services Playbook — Play 1: Understand what people need — https://playbook.usds.gov/
- GOV.UK Government Design Principles (GDS) — https://www.gov.uk/guidance/government-design-principles
- GOV.UK Service Manual — User research — https://www.gov.uk/service-manual/user-research
