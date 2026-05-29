# Rule 04 — Time-Series Data Model

> 텔레메트리는 불변의 시계열로 저장하고, 원본 측정값을 절대 덮어쓰지 마라
> Store telemetry as immutable time-series records; never overwrite a raw measurement.

## Why

Sensor readings are facts about what happened at a point in time. Overwriting them destroys audit trails, breaks anomaly detection baselines, and creates compliance violations in regulated verticals (medical, energy, automotive). IoT platforms generate data volumes that overwhelm relational databases — millions of events per second is normal at fleet scale — so a purpose-built time-series store (InfluxDB, Amazon Timestream, Azure Data Explorer, TimescaleDB) is required for both write throughput and time-range query performance. Downstream analytics, billing, and predictive maintenance all depend on the integrity and completeness of the raw record.

## How to apply

- Store every ingested reading as an append-only record with device ID, timestamp (UTC, ISO 8601 or Unix nanoseconds), measurement name, value, and unit. Never upsert or update existing rows.
- Use a purpose-built time-series database or a cloud-native equivalent (Amazon Timestream, Azure Data Explorer, InfluxDB) rather than a general-purpose SQL store for the hot path.
- Partition data by time (hourly or daily buckets) and device ID to enable efficient time-range queries and cost-effective data tiering (hot -> warm -> cold -> archive).
- Apply downsampling (roll-up aggregates at 1 min, 5 min, 1 hr) as separate derived tables or continuous queries; keep the raw data intact and query the correct tier for each use case.
- Propagate device timezone and calibration metadata alongside readings as context, not embedded in the measurement value itself.

## Checklist

- [ ] Raw telemetry rows are append-only; no UPDATE or DELETE on the hot table.
- [ ] Timestamps are in UTC and stored with at least millisecond precision.
- [ ] Time-series store is used for telemetry; relational store is used for device metadata.
- [ ] Downsampled aggregates are in separate tables, not overwriting raw data.
- [ ] Data retention and tiering policy is documented (e.g., raw 90 days, hourly 2 years, daily forever).

## References

- AWS Well-Architected IoT Lens — https://docs.aws.amazon.com/wellarchitected/latest/iot-lens/iot-lens.html
- Amazon Timestream Developer Guide — https://docs.aws.amazon.com/timestream/latest/developerguide/
- Azure Data Explorer (ADX) for IoT — https://learn.microsoft.com/en-us/azure/data-explorer/
- InfluxDB Documentation — https://docs.influxdata.com/influxdb/v2/
