# Rule 03 — Telemetry-First Design

> 측정하지 않은 것은 개선할 수 없다 — 출시 전에 계측부터 설계하라.
> You cannot improve what you do not measure — design instrumentation before launch.

## Why

Game analytics is not a post-launch add-on; it is the feedback mechanism that makes live-service iteration possible. El-Nasr, Drachen, and Canossa's *Game Analytics* (Springer) documents that studios treating telemetry as a first-class design concern — defining events alongside feature specs — can detect retention drops within 24 hours of a patch, while studios that add tracking retroactively spend weeks building dashboards before they can diagnose the problem. In a live service, a single bad patch can erase months of player growth; early telemetry is the only way to catch regressions before they compound.

## How to apply

- For every new feature, write the telemetry event schema (event name, properties, cardinality) in the design doc before the feature is coded.
- Define a minimum instrumentation contract: session_start, session_end, funnel_step_N, purchase_initiated, purchase_completed, feature_engaged, error_encountered.
- Use a structured event schema (JSON schema or Avro) versioned alongside code; breaking schema changes require a migration plan.
- Build dashboards for core KPIs (DAU, D1/D7/D30 retention, ARPU, session length) before the first public build ships.
- Establish A/B test infrastructure (cohort assignment, exposure logging, significance testing) as a platform concern, not a per-feature concern.

## Checklist

- [ ] Telemetry event list exists in the feature spec, not only in post-launch tickets
- [ ] Event schema is versioned and breaking changes have a migration path
- [ ] Core KPI dashboard is live before public launch
- [ ] A/B test assignment is logged with experiment ID and variant per user
- [ ] Data pipeline latency from event emit to dashboard is documented and meets SLA (typically under 1 hour)

## References

- Magy Seif El-Nasr, Anders Drachen & Alessandro Canossa (eds.), *Game Analytics: Maximizing the Value of Player Data* (Springer) — https://andersdrachen.com/the-book/
- Anders Drachen, Pejman Mirza-Babaei & Lennart Nacke (eds.), *Games User Research* (Oxford University Press) — https://global.oup.com/academic/product/games-user-research-9780198794844
- GDC Vault — analytics and data science talks — https://gdcvault.com/
