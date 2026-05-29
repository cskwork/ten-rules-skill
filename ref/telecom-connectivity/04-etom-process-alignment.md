# Rule 04 — Align Workflows to the eTOM Process Framework

> 업무 프로세스 설계는 eTOM 프레임워크의 프로세스 계층 구조를 따라 정의하고 명명해야 한다
> Name, scope, and sequence every business workflow against the eTOM process hierarchy before writing code.

## Why

The Enhanced Telecom Operations Map (eTOM), published by TM Forum and ratified as ITU-T Recommendation M.3050, is the universally recognised process reference for telecom operators. When OSS/BSS workflows deviate from eTOM naming and process boundaries, every integration with a third-party vendor — a field-force management system, a network inventory tool, a partner settlement engine — requires a custom process-mapping exercise. More critically, eTOM defines the handoff points between Fulfilment, Assurance, and Billing (FAB), which are the three pillars of telecom operations; systems that blur these boundaries produce order-to-cash cycles that cannot be audited or automated end-to-end.

## How to apply

- Before designing any order management or trouble-ticketing workflow, locate the corresponding Level 2 eTOM process (e.g., "Order Handling", "Problem Handling", "Service Configuration & Activation") and use its name as the bounded context name in code.
- Map state machines to eTOM process flow: a service order must progress through Order Feasibility Check → Order Completion → Order Issuance → Order Status & Tracking before closure.
- Separate the three FAB domains in the service layer: Fulfilment processes must not call Billing processes directly; use asynchronous events (e.g., "ServiceActivated" triggers billing entitlement, not a synchronous call).
- When two eTOM processes share data, define the exchange contract via TM Forum SID entities (Rule 01), not via shared database tables.
- Use eTOM process decomposition levels to scope microservices: a Level 3 process is typically the right granularity for a single service boundary.

## Checklist

- [ ] Each service or module maps to a named Level 2 or Level 3 eTOM process
- [ ] FAB domains (Fulfilment, Assurance, Billing) are separated by asynchronous event boundaries
- [ ] Order state transitions follow the eTOM Order Handling process flow
- [ ] Cross-domain data exchange uses SID entity contracts, not shared tables
- [ ] New workflow names do not contradict or duplicate existing eTOM process names

## References

- TM Forum Business Process Framework (eTOM) — https://www.tmforum.org/open-digital-architecture/process-framework-etom/
- ITU-T Recommendation M.3050 (eTOM) — https://www.itu.int/rec/T-REC-M.3050/en
- TM Forum Frameworx — https://www.tmforum.org/open-digital-architecture/
- Fundamentals of EMS, NMS and OSS/BSS, Rajeev Jain (Auerbach/CRC Press, 2007) — https://www.routledge.com/Fundamentals-of-EMS-NMS-and-OSSBSS/Jain/p/book/9781420085747
