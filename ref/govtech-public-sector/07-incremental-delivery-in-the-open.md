# Rule 07 — Incremental Delivery in the Open

> 작은 단위로 자주 배포하고, 진행 상황을 공개적으로 공유하라. 비밀스러운 빅뱅 출시는 공공 서비스에 어울리지 않는다.
> Ship in small, frequent increments and share progress publicly; secret big-bang launches are incompatible with public accountability.

## Why

Government technology projects have an exceptionally poor track record with large, multi-year, big-bang delivery: cost overruns, scope failures, and late cancellations are documented across the US, UK, and internationally. The GOV.UK Service Standard and the USDS Playbook both mandate iterative, user-tested delivery through discovery, alpha, beta, and live phases — with a service assessment at each gate. Incremental delivery reduces the cost of being wrong, allows the team to respond to policy changes (which are frequent in government), and creates accountability: stakeholders, oversight bodies, and the public can see what the team is building and whether it is working.

## How to apply

- Follow the four-phase model (discovery, alpha, beta, live) and conduct a service assessment at each phase transition; do not skip assessments to meet political deadlines.
- Maintain a public beta with a real user population before declaring a service live; measure completion rates and error rates against defined success criteria.
- Publish a public service roadmap and, where feasible, a public-facing product log (sprint notes, blog posts) so Parliament, Congress, oversight bodies, and citizens can track progress.
- Use feature flags to deploy incomplete features to production safely; avoid long-lived feature branches that diverge from the main deployment.
- Keep the deployment pipeline automated and the cycle time from commit to production under one day for routine changes; long deployment cycles create pressure to batch changes, increasing risk.
- Write post-incident reports (PIRs) for significant outages and publish them; public sector services owe the public an explanation when things go wrong.

## Checklist

- [ ] Service phase (discovery/alpha/beta/live) documented and visible to the team
- [ ] Service assessment scheduled before each phase transition
- [ ] Automated deployment pipeline exists and deploys to production without manual steps
- [ ] Success criteria and key metrics defined before entering beta
- [ ] At least one public-facing progress update published per quarter

## References

- GOV.UK Service Standard — Point 7: Use agile ways of working — https://www.gov.uk/service-manual/service-standard/point-7-use-agile-ways-of-working
- GOV.UK Service Standard — Point 8: Iterate and improve frequently — https://www.gov.uk/service-manual/service-standard/point-8-iterate-and-improve-frequently
- US Digital Services Playbook — Play 4: Build the service using agile and iterative practices — https://playbook.usds.gov/
- GOV.UK Service Manual — Service assessments — https://www.gov.uk/service-manual/service-assessments
