# DevOps and SRE — 10 Rules (index)

Source: market-researched synthesis grounded in the Google SRE Book, DORA / Accelerate (Forsgren), the Twelve-Factor App, and GitOps / progressive-delivery practice. The discipline of running software reliably at scale: setting reliability targets, delivering change safely and fast, observing systems, and learning from failure.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-slo-error-budget.md` | Define SLOs, govern by error budgets | reliability targets, launch freezes, alerting |
| 02 | `02-dora-metrics.md` | Measure delivery with the DORA metrics | performance, throughput vs stability, benchmarking |
| 03 | `03-blameless-postmortems.md` | Run blameless postmortems | incidents, learning, team culture |
| 04 | `04-observability.md` | Make systems observable | metrics, logs, traces, instrumentation, debugging |
| 05 | `05-cicd-small-batches.md` | Automate CI/CD, deploy small batches | pipelines, branching, release automation |
| 06 | `06-progressive-delivery.md` | Deploy progressively, cheap rollback | canary, feature flags, staged rollout, rollback |
| 07 | `07-infrastructure-as-code.md` | Manage infrastructure as code | IaC, GitOps, config, environment parity, drift |
| 08 | `08-incident-response.md` | Disciplined incident response | outages, on-call, roles, severity, recovery time |
| 09 | `09-eliminate-toil.md` | Eliminate toil through automation | repetitive ops work, self-service, automation |
| 10 | `10-capacity-planning.md` | Plan capacity, manage load | scaling, load testing, timeouts, circuit breakers |

Default for "set up or review a production service": read 01, 04, 05, 08 at minimum.
