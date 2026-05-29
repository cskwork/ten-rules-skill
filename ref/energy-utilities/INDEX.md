# Energy & Utilities — 10 Rules (index)

Source: Grounded in IEC 61850 (IEC substation automation and communication standard), NERC CIP reliability standards (North American Electric Reliability Corporation Critical Infrastructure Protection), NIST SP 800-82 Rev. 3 (Guide to Operational Technology Security), GHG Protocol Corporate Standard (World Resources Institute / WBCSD), OpenADR 2.0 (OpenADR Alliance), and FERC Order 2222 (Federal Energy Regulatory Commission). Building software for Energy & Utilities means operating at the intersection of safety-critical operational technology, heavily regulated billing and metering, real-time grid telemetry, and mandatory emissions and reliability reporting — where a software defect can cause outages, regulatory fines, or physical harm.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-ot-it-boundary.md` | Never bridge OT and IT networks without explicit isolation | SCADA, DCS, substation, AMI head-end, any system touching physical grid assets |
| 02 | `02-nerc-cip-compliance.md` | Treat NERC CIP as a hard non-negotiable constraint | Bulk electric system software, access control, asset inventory, incident response |
| 03 | `03-settlement-grade-metering.md` | Metering and billing data must be settlement-grade and auditable | AMI, MDMS, billing engines, demand response settlement, revenue reporting |
| 04 | `04-iec-61850-interop.md` | Model grid assets with IEC 61850 logical nodes | Substation automation, protection relays, IED integration, SCADA data models |
| 05 | `05-demand-response-openadr.md` | Implement demand response over certified OpenADR 2.0 | DR programs, virtual power plants, FERC 2222 DER aggregation, load curtailment |
| 06 | `06-realtime-telemetry-latency.md` | Grid telemetry pipelines must meet deterministic latency SLAs | SCADA dashboards, EMS, ADMS, protection systems, outage management |
| 07 | `07-ghg-scope-accounting.md` | Separate and trace Scope 1, 2, and 3 emissions at source | ESG platforms, carbon accounting, sustainability reporting, decarbonisation tools |
| 08 | `08-regulatory-data-retention.md` | Retain operational and billing records per jurisdiction-specific mandates | Billing, metering, compliance portals, audit interfaces, tariff management |
| 09 | `09-resilient-offline-first.md` | Field and substation software must operate without WAN connectivity | RTUs, field crew apps, substation HMIs, mobile workforce management |
| 10 | `10-tariff-rate-engine.md` | Encode tariff logic as versioned, testable rate rules, never hardcoded | Rate design changes, time-of-use billing, EV charging rates, demand charges |

Default for "utility billing or customer portal": read 03, 08, 10 at minimum.
Default for "grid operations or SCADA interface": read 01, 02, 04, 06 at minimum.
Default for "ESG or carbon reporting platform": read 07, 08 at minimum.
Default for "demand response or DER aggregation": read 05, 06, 03 at minimum.
