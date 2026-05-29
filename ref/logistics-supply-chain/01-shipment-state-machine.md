# Rule 01 — Model Every Shipment as an Explicit State Machine

> 화물의 모든 상태 전이를 명시적으로 정의하고, 허용되지 않은 전이는 시스템이 거부해야 한다.
> Every allowed and forbidden transition in a shipment's life must be declared in code, not inferred at runtime.

## Why

A shipment passes through a dozen or more discrete states — tendered, accepted, in-transit, out-for-delivery, delivered, exception, returned — and each state carries legal, financial, and operational consequences. Ad hoc string comparisons or boolean flags accumulate invalid state combinations that silently corrupt billing, customer notifications, and SLA timers. ASCM SCOR defines Deliver and Return as explicit process domains precisely because state integrity across the physical-to-digital handoff is non-negotiable. In logistics, a misclassified "delivered" event can trigger customer payments, close a claim window, or satisfy a regulatory dwell-time requirement — all irreversibly.

## How to apply

- Define a sealed enum or discriminated union for every status your domain recognises; never use raw strings in business logic.
- Encode the valid transition graph (e.g., `IN_TRANSIT -> DELIVERED`, `IN_TRANSIT -> EXCEPTION`) in a single authoritative module; all state changes must pass through it.
- Persist the full event log, not just current state: each transition record includes timestamp, actor, location, and source system (carrier API, driver app, EDI 214).
- Expose the current state and event history on every shipment API response; downstream consumers (billing, notifications) react to events, not polling.
- Distinguish terminal states (DELIVERED, CANCELLED, RETURNED_CLOSED) from re-entrant states (EXCEPTION can resume to IN_TRANSIT) and enforce that distinction.

## Checklist

- [ ] A finite set of statuses is declared in one place; no magic strings elsewhere in the codebase.
- [ ] Invalid transitions return a domain error, not a silent no-op.
- [ ] Every transition is timestamped and attributed to an actor and source system.
- [ ] Terminal states are protected — no code path re-opens a closed shipment without an explicit reversal workflow with audit trail.
- [ ] Integration tests cover at least the "exception -> re-tendered -> delivered" and "delivered -> disputed" paths.

## References

- ASCM SCOR Digital Standard v14 — Plan, Source, Make, Deliver, Return, Enable processes — https://scor.ascm.org/
- Martin Christopher, "Logistics and Supply Chain Management" 6th ed., Pearson 2022 — https://www.pearson.com/en-us/subject-catalog/p/logistics-and-supply-chain-management/P200000007134/9781292416205
- GS1 EDI Standard — Transport and Logistics message sets — https://www.gs1.org/standards/edi
