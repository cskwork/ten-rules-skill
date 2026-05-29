# Rule 06 — Grid Telemetry Pipelines Must Meet Deterministic Latency SLAs

> 계통 원격 계측은 지연 시간 상한이 보장된 파이프라인으로 전송해야 한다.
> Grid telemetry must flow through pipelines with guaranteed upper-bound latency, not best-effort queuing.

## Why

Grid operators, energy management systems (EMS), and advanced distribution management systems (ADMS) make switching, protection, and dispatch decisions based on near-real-time state estimates. SCADA scan rates for transmission systems are typically 2-to-4 seconds; protective relaying requires sub-millisecond to 4 ms response for GOOSE events; phasor measurement units (PMUs) report at 30 to 120 frames per second for wide-area situational awareness. A telemetry pipeline that introduces non-deterministic latency — such as a general-purpose message broker under unexpected load, or a database write path that blocks on long transactions — can cause operators to act on stale state, state estimators to diverge, and automatic protective functions to misoperate. In energy markets, the consequence is financial: late telemetry causes missed market bids and settlement disputes.

## How to apply

- Define explicit latency SLAs for each telemetry class before choosing any component: GOOSE/protection (sub-4 ms, Layer 2 only), PMU/synchrophasor (sub-100 ms end-to-end to PDC), SCADA analog scan (2-4 s), MDMS metering (15-minute to hourly), historian archival (near-real-time, seconds). Size and test each path separately.
- Use time-stamped data at the source (IED or RTU), not at the SCADA server or historian; IEEE C37.118 defines the standard for synchrophasor timestamping; IEC 61850 sampled values carry embedded timestamps. Never reconstruct timestamps retrospectively.
- Separate the high-priority telemetry ingestion path from analytics, reporting, and bulk export paths — do not let a historical query or a report generation job contend for the same I/O resources as live SCADA reads.
- Instrument the full pipeline: measure and alert on per-segment latency (RTU to front-end processor, front-end processor to SCADA server, SCADA server to EMS), not just end-to-end. Pinpoint the bottleneck before it becomes an incident.
- For cloud or hybrid architectures, validate round-trip latency under peak load before go-live; wide-area IP networks do not provide deterministic latency guarantees and may require edge processing to meet operational requirements.

## Checklist

- [ ] Latency SLAs are documented per telemetry class and signed off by the grid operations team before architecture is finalized.
- [ ] Timestamps are applied at the field device (IED/RTU) using a synchronized time source (GPS-disciplined clock or IEEE 1588 PTP).
- [ ] Telemetry ingestion path is isolated from analytics and reporting I/O paths.
- [ ] Per-segment latency metrics are collected and alert thresholds are configured.
- [ ] End-to-end latency is load-tested against peak telemetry volume before production cutover.

## References

- IEC 61850: Communication Networks and Systems for Power Utility Automation — https://webstore.ansi.org/industry/smartgrid/iec-61850
- IEEE C37.118: Standard for Synchrophasor Measurements for Power Systems — https://standards.ieee.org/ieee/C37.118.1/4902/
- NERC FAC-002-2: Transmission Planning (reliability standards defining telemetry and state estimation requirements) — https://www.nerc.com/pa/Stand/Pages/AllReliabilityStandards.aspx
