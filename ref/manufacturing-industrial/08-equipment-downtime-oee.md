# Rule 08 — Surface OEE and Downtime Causes in Near-Real-Time

> 설비 가동률(OEE)과 정지 원인은 교대 종료 후가 아니라 실시간으로 공유하라.
> OEE and downtime root causes must be visible to operators and managers in real time, not reconstructed after the shift ends.

## Why

Overall Equipment Effectiveness (OEE) — the product of Availability, Performance, and Quality — is the primary KPI for any production asset. World-class OEE is considered 85%; most factories start below 60%. The gap is almost entirely recoverable through faster detection and response to downtime events, speed losses, and quality defects. If downtime is only classified at the end of a shift by an operator filling out a paper form, the data is inaccurate (recall bias) and arrives too late to trigger same-shift corrective action. SEMI E10 (semiconductor equipment productivity standard) and MESA define the data model for equipment states (Productive, Standby, Engineering, Scheduled Down, Unscheduled Down) and require automated state capture, not manual entry, as the authoritative source.

## How to apply

- Capture equipment state changes automatically from PLC signals or OPC UA state nodes; operator input is used to annotate reasons, not to report the event itself.
- Map equipment states to SEMI E10 categories (or ISO 22400 for discrete manufacturing) so OEE calculations are comparable across lines, sites, and vendors.
- Calculate and publish OEE at three granularities: per-shift (for operators), per-day (for supervisors), and per-week/month (for management) — all derived from the same event store, not separate manual reports.
- Surface the current shift's top three downtime reasons on the operator's HMI in real time so the team can act before the shift ends.
- Expose OEE and downtime APIs to external analytics and MES systems; do not silo KPI data inside a proprietary SCADA historian.

## Checklist

- [ ] Equipment state transitions are captured automatically from control system signals; no state relies solely on manual operator entry.
- [ ] Equipment states map to SEMI E10 or ISO 22400 categories; mapping is documented and version-controlled.
- [ ] OEE is calculated and visible at shift, daily, and weekly granularity from a single event store.
- [ ] Current-shift top downtime reasons are displayed on the operator HMI in real time.
- [ ] OEE data is accessible via an API; other systems do not scrape the historian directly.

## References

- SEMI E10-0714, *Specification for Definition and Measurement of Equipment Reliability, Availability, and Maintainability (RAM)* — https://www.semi.org/en/connect/standards
- ISO 22400-2:2014, *Automation Systems and Integration — KPIs for Manufacturing Operations Management* — https://www.iso.org/standard/56847.html
- MESA International, *OEE and Performance Metrics* — https://mesa.org
- Productivity Press Development Team, *OEE for Operators* (Productivity Press / Shopfloor Series, 1999) — https://www.productivitypress.com
