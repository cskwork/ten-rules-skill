# Manufacturing & Industrial — 10 Rules (index)

Source: Grounded in ANSI/ISA-95 / IEC 62264 (ISA enterprise-control integration), ISA/IEC 62443 (OT cybersecurity), OPC UA / IEC 62541 (OPC Foundation), MESA MES functional model, IEC 63278 Asset Administration Shell (IDTA), and RAMI 4.0 (Plattform Industrie 4.0); supplemented by Michael McClellan, *Applying Manufacturing Execution Systems* (CRC Press). Building software for this industry means connecting shop-floor OT (PLCs, SCADA, sensors) to enterprise IT (ERP, MES, analytics) while meeting strict uptime, traceability, and safety requirements inside highly regulated fabs, process plants, and discrete assembly lines.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-isa95-hierarchy.md` | Model every integration against the ISA-95 hierarchy | ERP–MES interfaces, data flow design, system scope definition |
| 02 | `02-opcua-interoperability.md` | Use OPC UA as the lingua franca for OT/IT data exchange | Device connectivity, edge gateways, protocol selection, historian feeds |
| 03 | `03-mes-work-order-lifecycle.md` | Own the work-order lifecycle end-to-end in MES | Production scheduling, dispatch, WIP tracking, yield reporting |
| 04 | `04-traceability-genealogy.md` | Record full material and process genealogy at every step | Lot/serial tracking, quality holds, recall readiness, SPC integration |
| 05 | `05-ot-it-network-segmentation.md` | Enforce IEC 62443 zone-and-conduit OT/IT segmentation | Network architecture, SCADA/DCS access, remote maintenance, patch strategy |
| 06 | `06-real-time-alarm-management.md` | Treat alarms as engineered objects, not log lines | Alarm rationalization, HMI design, operator overload prevention |
| 07 | `07-digital-twin-aas.md` | Represent every asset with an Asset Administration Shell | Digital twin design, equipment onboarding, lifecycle data handoff |
| 08 | `08-equipment-downtime-oee.md` | Surface OEE and downtime causes in near-real-time | Dashboards, KPI APIs, maintenance workflows, shift reports |
| 09 | `09-change-management-validation.md` | Gate every software change through validation and MOC | Regulated environments (pharma, semiconductor), change control, CSV/GxP |
| 10 | `10-edge-reliability-offline-first.md` | Design edge nodes to operate fully offline | Edge computing, factory floor apps, intermittent connectivity, failover |

Default for "building or extending a MES / factory floor application": read 01, 03, 04, 05 at minimum.
