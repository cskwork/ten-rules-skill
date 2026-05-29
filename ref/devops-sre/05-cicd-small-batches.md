# Rule 05 — Automate CI/CD and Deploy in Small Batches

> 작은 변경을 자주, 자동화된 파이프라인으로 배포하라.
> Ship small changes often, through an automated pipeline.

## Why

Large, infrequent releases concentrate risk and lengthen recovery. The DORA / Accelerate research shows that continuous delivery and small batch sizes drive both higher throughput and lower change failure rate. An automated, version-controlled pipeline that builds, tests, and deploys removes manual error and makes every change reproducible. Small batches are easier to review, test, and roll back when something breaks.

## How to apply

- Trunk-based development with short-lived branches; integrate to main at least daily.
- Run build, automated tests, and security scans as required gates in the pipeline; a red pipeline blocks release.
- Keep deployable units small so blast radius and review effort stay low.
- Make deployment a single automated action, not a runbook of manual steps.
- Decouple deploy from release using flags so code can ship dark and activate later.

## Checklist

- [ ] Every change flows through an automated build/test/deploy pipeline
- [ ] Failing tests or scans block the deployment, with no manual override habit
- [ ] Branches are short-lived and integrated frequently
- [ ] Deployments are one automated action, reproducible from version control

## References

- DORA — Continuous Delivery capabilities — https://dora.dev/capabilities/
- Google SRE Workbook — Canarying Releases — https://sre.google/workbook/canarying-releases/
