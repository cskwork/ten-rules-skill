# Rule 03 — Own the Work-Order Lifecycle End-to-End in MES

> 작업 지시의 생성부터 완료까지, MES가 유일한 실행 권한을 가져야 한다.
> The MES must be the single system of authority for a work order from release to closure.

## Why

In a manufacturing facility, a work order (production order, work instruction, traveler) is the contract between planning and the shop floor. When ERP, MES, SCADA, and paper travelers each hold a partial copy with no authoritative master, operators act on stale data, materials are consumed twice, and quality events go uncaptured. The MESA MES model defines 11 functional components; "Operations/Detail Scheduling" and "Dispatching Production Units" are the core — they translate an ERP production order into sequenced, operator-executable steps with correct BOM, routing, and resource assignment. Semiconductor fabs run thousands of active lots simultaneously; any ambiguity about which step is current or which recipe version is active causes irreversible wafer loss.

## How to apply

- Accept production orders from ERP (Level 4) as read-only seeds; all execution state lives exclusively in MES.
- Represent the work order as a state machine with explicit transitions: Created → Scheduled → Dispatched → In-Progress → Pending-QC → Closed (or Scrapped). Reject any state change that skips a transition.
- Attach the exact routing version, recipe version, and BOM revision to each work order at dispatch time; changes to masters do not retroactively affect in-flight orders without an explicit engineering change record.
- Write completion confirmations back to ERP only after MES has captured: actual quantities, actual labor, any scrap reason, and quality disposition.
- Expose work-order status via a real-time API (not batch file) so SCADA, quality systems, and operator terminals read from the same source.

## Checklist

- [ ] Work-order state machine is formally defined with every valid transition enumerated.
- [ ] Routing, recipe, and BOM versions are locked to the work order at dispatch and stored immutably.
- [ ] ERP writes production orders to MES; MES writes completion confirmations back — no reverse direct writes.
- [ ] All systems (SCADA, quality, terminals) query work-order status from MES via API, not local cache.
- [ ] Scrap and rework are captured as first-class work-order outcomes, not post-hoc corrections.

## References

- ANSI/ISA-95.00.03, *Enterprise-Control System Integration Part 3: Activity Models of Manufacturing Operations Management* — https://www.isa.org/standards-and-publications/isa-standards/isa-95-standard
- MESA International, *The Benefits of MES: A Report from the Field* — https://mesa.org
- Michael McClellan, *Applying Manufacturing Execution Systems* (CRC Press / Routledge, 1997) — https://www.routledge.com/Applying-Manufacturing-Execution-Systems/McClellan/p/book/9781574441352
- IEC 62264-3:2016, *Enterprise-Control System Integration Part 3: Activity Models* — https://www.iec.ch/homepage
