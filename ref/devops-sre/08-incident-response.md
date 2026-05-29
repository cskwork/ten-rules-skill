# Rule 08 — Have a Disciplined Incident Response Process

> 사고 대응은 즉흥이 아니라 정해진 역할과 절차로 움직여라.
> Run incident response by defined roles and process, not improvisation.

## Why

During an outage, ad hoc heroics make things worse: people collide, communication breaks, and recovery time balloons. The Google SRE Book prescribes a structured incident-management process with clear roles (incident commander, operations, communications) so response scales calmly under pressure. Recovery time is a DORA stability metric: how fast you restore service matters as much as how rarely you break it. Mitigate first, diagnose later.

## How to apply

- Define incident roles up front; the incident commander coordinates and does not also fix.
- Declare severity early and open a single shared channel of record.
- Prioritize mitigation (roll back, fail over, shed load) over root-cause analysis during the incident.
- Communicate status to stakeholders on a regular cadence, even when there is no new information.
- Hand off cleanly across shifts and feed every incident into a blameless postmortem (see Rule 03).

## Checklist

- [ ] Incident roles and a severity scale are documented and known by on-call
- [ ] A single source-of-truth channel is opened per incident
- [ ] Mitigation is prioritized over diagnosis during active response
- [ ] Stakeholder communication follows a defined cadence

## References

- Google SRE — Managing Incidents — https://sre.google/sre-book/managing-incidents/
- Google SRE — Emergency Response — https://sre.google/sre-book/emergency-response/
