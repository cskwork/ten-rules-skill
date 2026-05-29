# Rule 01 — OT/IT Network Boundary Isolation

> 운영 기술(OT)과 정보 기술(IT) 네트워크는 명시적 격리 없이 절대 연결하지 않는다.
> Operational technology and information technology networks must never be bridged without explicit, documented isolation controls.

## Why

Power grids, substations, and pipeline SCADA systems run on operational technology (OT) networks — field devices, PLCs, and IEDs that control physical equipment with real-time, safety-critical constraints. A compromise that pivots from the IT network into the OT network can cause physical damage, cascading outages, or safety incidents that no software patch can instantly reverse. Utility regulators treat this boundary as a mandatory control, not an architectural preference: NERC CIP-005 (Electronic Security Perimeter) and NIST SP 800-82 both require that access into the OT environment be limited, authenticated, and logged at every crossing point. The consequence of getting this wrong is measured in megawatt-hours lost and potential injury — not just data breach notification.

## How to apply

- Place all OT systems (SCADA, DCS, protection relays, RTUs, AMI head-ends) in a dedicated OT network zone separated from the corporate IT network by a hardware firewall or data diode, never a software-only control.
- Define an Electronic Security Perimeter (ESP) — a documented network boundary drawn around every cyber asset that, if compromised, could affect the reliability of the bulk electric system; every ingress and egress must have an Electronic Access Point (EAP) with explicit allow-list rules.
- For any data that must cross the boundary (e.g., metering reads flowing to the billing system), use a one-way data diode or a DMZ historian with well-defined, minimal-privilege data flows — never allow IT systems to initiate connections into the OT zone.
- Enforce role-based access with multi-factor authentication (MFA) on all remote and interactive access paths into the OT zone; log and alert every session.
- Segment further within OT: separate protection and control networks from monitoring networks so that a monitoring compromise cannot affect protective relay operation.

## Checklist

- [ ] An Electronic Security Perimeter is documented with every ingress/egress point named and mapped.
- [ ] No software-only firewall is the sole control between IT and OT zones; a hardware boundary or data diode exists.
- [ ] All interactive access into OT requires MFA and produces a session log retained for the jurisdiction-mandated period.
- [ ] Data flows crossing the boundary are documented, minimal, and unidirectional where technically feasible.
- [ ] OT zone devices do not have direct internet access; patch delivery uses an offline or DMZ intermediary.

## References

- NERC CIP-005-7: Electronic Security Perimeters — https://www.nerc.com/pa/Stand/Pages/CIPStandards.aspx
- NIST SP 800-82 Rev. 3: Guide to Operational Technology (OT) Security — https://csrc.nist.gov/pubs/sp/800/82/r3/final
- IEC 62351: Security for power system communication (complements IEC 61850 deployments) — https://www.iec.ch/homepage
