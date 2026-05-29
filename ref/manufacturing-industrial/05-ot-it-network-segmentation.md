# Rule 05 — Enforce IEC 62443 Zone-and-Conduit OT/IT Segmentation

> OT 네트워크는 IT 네트워크와 물리적·논리적으로 분리하고, 모든 경계를 감사하라.
> Physically and logically separate OT from IT networks and audit every boundary crossing.

## Why

An OT (Operational Technology) network carries real-time control traffic for PLCs, DCS, SCADA, and safety systems. A successful cyberattack on OT can halt production, damage equipment, or trigger physical safety incidents — consequences far beyond a data breach. The 2021 Oldsmar water treatment incident and the 2022 automotive supplier ransomware shutdowns demonstrate that flat IT/OT networks turn a commodity phishing email into a factory outage. IEC 62443 / ISA-99 defines the zone-and-conduit model: group assets by security level (SL 1–4), define conduits (the only allowed communication paths between zones), and enforce least-privilege access at each conduit. This is the recognized framework for industrial cybersecurity used by asset owners, integrators, and vendors worldwide.

## How to apply

- Define security zones based on function and criticality: Safety (SIL), Control (DCS/PLC), Supervisory (SCADA/HMI), MES/Operations, Enterprise (IT), and DMZ.
- Allow inter-zone traffic only through defined conduits; implement conduits as firewalls, data diodes, or application-layer gateways — not VLANs alone.
- Never allow direct outbound internet access from Control or Safety zones; remote access must terminate in a DMZ jump server with MFA and session recording.
- Apply the Security Level (SL) target from IEC 62443-3-3 to each zone; document which SL-T requirements each conduit control satisfies.
- Patch OT systems on a risk-assessed schedule (not automatic); test patches in a staging replica before applying to production; log every change with a change record.

## Checklist

- [ ] Network zones are defined with documented Security Level targets per IEC 62443-3-3.
- [ ] All inter-zone traffic passes through explicitly defined conduits (firewall rules, data diodes, or proxies).
- [ ] Control and Safety zones have no direct internet path; remote access uses a DMZ jump server with MFA and session logging.
- [ ] OT patch process is documented with staging validation before production deployment.
- [ ] Annual zone-and-conduit review is scheduled; any new device is assigned to a zone before connecting.

## References

- ISA/IEC 62443 Series of Standards — ISA: https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards
- ANSI/ISA-62443-2-1-2024, *Security Program Requirements for IACS Asset Owners* — https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards
- IEC 62443-3-3:2013, *System Security Requirements and Security Levels* — https://www.iec.ch/homepage
- Dragos, *ISA/IEC 62443 Concepts* — https://www.dragos.com/blog/isa-iec-62443-concepts
