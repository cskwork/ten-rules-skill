# Rule 03 — Test Data as Rigorously as Code

> 데이터 품질을 테스트로 강제하고, 깨지면 파이프라인을 멈춰라.
> Enforce data quality with tests, and stop the pipeline when they break.

## Why

Code has compilers and unit tests; data has neither unless you add them. Great Expectations and dbt tests exist precisely because silent data corruption is far more expensive than a loud failure. Untested data erodes trust faster than any outage: once analysts stop believing the numbers, the platform is dead even while running.

## How to apply

- Assert the non-negotiables on every table: not-null, uniqueness of keys, accepted values, and referential integrity.
- Add freshness checks: fail if the latest partition is older than its SLA.
- Add volume and distribution checks (row-count bounds, null-rate drift) to catch silent upstream breakage.
- Gate the pipeline: a failed critical test halts promotion to the next layer, it does not just log a warning.
- Concentrate tests on high-business-value columns first rather than testing everything thinly.
- Quarantine bad rows instead of dropping them silently, so failures are auditable.

## Checklist

- [ ] Primary keys are tested for uniqueness and not-null
- [ ] Each critical table has a freshness/SLA test
- [ ] Volume or distribution anomalies trigger a failure, not a silent pass
- [ ] A failing critical test blocks downstream promotion
- [ ] Rejected records are quarantined and inspectable

## References

- Great Expectations — https://greatexpectations.io/
- dbt tests — https://docs.getdbt.com/docs/build/data-tests
