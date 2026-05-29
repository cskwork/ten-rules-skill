# Rule 01 — Model Domain Entities Using TM Forum SID

> 통신 도메인의 데이터 모델은 TM Forum SID를 기준으로 설계해야 한다
> Design every domain entity against the TM Forum Shared Information/Data Model, not from scratch.

## Why

Telecom products, services, and parties have been modelled internationally for decades; reinventing them produces schemas that break at the first integration point with a carrier partner, regulator, or OSS vendor. TM Forum's Shared Information/Data Model (SID), part of Frameworx, defines the canonical entity hierarchy: Party, Product, Service, Resource, and their relationships. Every BSS/OSS system on the planet that interoperates with a tier-1 operator speaks this vocabulary. Deviating means expensive translation layers and downstream data quality failures that surface only in billing or porting.

## How to apply

- Map every new entity to the closest SID aggregate before naming it in code: `Party` (customer, supplier, employee), `ProductOffering`, `ServiceSpecification`, `LogicalResource` (MSISDN, IMSI, IP address), `PhysicalResource` (SIM, device).
- Use SID cardinality rules for relationships: a `ProductOrder` contains `ProductOrderItems`; each item resolves to a `ProductOfferingPrice`; do not collapse these into a flat table.
- Preserve SID lifecycle state machines — `ProductOrder` states (Acknowledged, InProgress, Completed, Failed) — rather than inventing bespoke status enums.
- When an entity has no SID equivalent (e.g., a proprietary network element), extend via the SID Extension Pattern: subclass the nearest SID class and namespace custom attributes.
- Validate your entity graph against the TM Forum Information Framework (GB922) document before finalising the data model in a new microservice.

## Checklist

- [ ] Every top-level domain entity is traceable to a named SID aggregate class
- [ ] ProductOffering, ProductSpecification, and ServiceSpecification are modelled as separate entities, not merged
- [ ] MSISDN, IMSI, and ICCID are typed as LogicalResource sub-types, not plain strings
- [ ] Lifecycle state transitions follow SID-defined state machines
- [ ] Custom extensions are namespaced and do not override SID base attributes

## References

- TM Forum Information Framework (SID) GB922 — https://www.tmforum.org/open-digital-architecture/information-framework-sid/
- TM Forum Frameworx overview (eTOM, SID, TAM, Open APIs) — https://www.tmforum.org/open-digital-architecture/
- Fundamentals of EMS, NMS and OSS/BSS, Rajeev Jain (Auerbach/CRC Press, 2007) — https://www.routledge.com/Fundamentals-of-EMS-NMS-and-OSSBSS/Jain/p/book/9781420085747
