# Rule 01 — Model Every Integration Against the ISA-95 Hierarchy

> 현장 제어부터 경영 계획까지, ISA-95 계층 없이 시스템을 연결하지 마라.
> Never wire systems together without locating each one in the ISA-95 functional hierarchy first.

## Why

Manufacturing software spans five levels — from field devices (Level 0) up through ERP (Level 4) — and data that crosses level boundaries without a defined interface contract creates brittle, untestable spaghetti integrations. ISA-95 / IEC 62264 defines canonical object models (ProductionRequest, ProductionResponse, WorkMaster, Personnel, Equipment, Material) that are the shared vocabulary between MES, ERP, SCADA, and historians. Skipping this model means every integration team invents its own names, leading to reconciliation failures during shift handovers, incorrect inventory postings, and undetectable production gaps. Semiconductor fabs such as SK Hynix and TSMC operate hundreds of interconnected systems; ISA-95 is what makes them auditable.

## How to apply

- Assign every system in scope to an ISA-95 level (0–4) before designing any data flow.
- Map all cross-level exchanges to one of the eight ISA-95 information categories (production, inventory, quality, maintenance, etc.) and use the standard's UML object models as the schema baseline.
- Use Level 3 (MES / MOM) as the single source of truth for WIP and production status; never let Level 4 (ERP) write directly to Level 2 (SCADA).
- Version interface contracts independently per level pair; a change in ERP order format must not require a SCADA change.
- Document every integration point with: source level, target level, trigger, frequency, payload schema, and error behavior.

## Checklist

- [ ] Every system is assigned to exactly one ISA-95 level in the architecture diagram.
- [ ] All cross-level interfaces use ISA-95 canonical object names (ProductionRequest, WorkMaster, etc.).
- [ ] Level 3 (MES) is the authoritative source for real-time WIP; ERP reads from it, does not write to it.
- [ ] Interface contracts are versioned and tested independently of the systems they connect.
- [ ] No direct Level 4-to-Level 2 data writes exist without an explicit, documented exception.

## References

- ANSI/ISA-95.00.01-2010, *Enterprise-Control System Integration Part 1: Models and Terminology* — ISA: https://www.isa.org/standards-and-publications/isa-standards/isa-95-standard
- IEC 62264-1:2013, *Enterprise-Control System Integration* — IEC: https://www.iec.ch/homepage
- Michael McClellan, *Applying Manufacturing Execution Systems* (CRC Press / Routledge, 1997) — https://www.routledge.com/Applying-Manufacturing-Execution-Systems/McClellan/p/book/9781574441352
- MESA International, MES Functional Components model — https://mesa.org
