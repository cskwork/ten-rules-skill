# Rule 09 — Make Pipelines Observable and Traceable

> 신선도, 양, 계보를 측정하라. 측정하지 않으면 깨진 줄도 모른다.
> Measure freshness, volume, and lineage; what you cannot see, you cannot trust.

## Why

The worst data incidents are the silent ones: a table that quietly stopped updating, a join that started dropping half its rows. Data observability (freshness, volume, schema, distribution) plus column-level lineage is what lets you detect breakage before consumers do and trace any number back to its source. OpenLineage exists to standardize this signal across tools.

## How to apply

- Emit freshness, row-count, and schema metrics for every production table and alert on anomalies.
- Capture lineage (which sources and transforms produced each dataset) so impact and root cause are traceable.
- Log structured run metadata: run id, logical interval, rows in/out, duration, and status.
- Alert on rate-of-change and SLA breaches, not just hard failures, to catch silent degradation.
- Surface a data SLA/SLO per critical dataset and report against it.
- Make lineage and quality metrics visible to consumers, not buried in engineer-only dashboards.

## Checklist

- [ ] Every critical table reports freshness and volume
- [ ] Anomalies (not just crashes) raise alerts
- [ ] Lineage links each dataset to its sources and transforms
- [ ] Each run logs id, interval, row counts, and status
- [ ] Critical datasets have a stated, monitored SLA

## References

- OpenLineage — https://openlineage.io/
- Designing Data-Intensive Applications — https://dataintensive.net/
