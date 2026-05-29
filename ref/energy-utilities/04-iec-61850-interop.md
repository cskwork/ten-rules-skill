# Rule 04 — Model Grid Assets with IEC 61850 Logical Nodes

> 계통 자산은 IEC 61850 논리 노드 모델로 표현해야 공급업체 종속을 피할 수 있다.
> Grid assets must be represented using IEC 61850 logical node models to avoid vendor lock-in and enable interoperability.

## Why

Power substations contain equipment from dozens of vendors — protection relays, circuit breakers, transformers, bay controllers — each historically using proprietary protocols. IEC 61850 defines a standard information model (logical nodes such as XCBR for circuit breakers, PTRC for protection trip conditioning, MMXU for measurement) and communication services (GOOSE for fast peer-to-peer messaging, Sampled Values for process bus, MMS for SCADA communication). Software that reads or writes grid state using vendor-specific APIs or data formats becomes tightly coupled to specific hardware generations. The standard's Substation Configuration Language (SCL) — expressed as XML files — allows automated tool chains to configure IEDs, validate wiring, and generate communication bindings without manual per-device programming. Building against IEC 61850 logical nodes is therefore both a technical interoperability requirement and a long-term maintainability choice, because substation equipment has a 20-to-40-year asset life.

## How to apply

- Map every physical grid asset to its canonical IEC 61850 Logical Node class (e.g., XCBR, CSWI, PDIS, MMXU) before designing data models or APIs; use this mapping as the single source of truth for field names and semantics.
- Consume and produce SCL (Substation Configuration Language) files — SSD, SCD, IID, CID — as the authoritative configuration artifact; tooling that cannot read or write SCL should be treated as a liability.
- Use GOOSE (Generic Object-Oriented Substation Event) only for time-critical peer-to-peer signals (trip, blocking, interlocking) where latency must be under 4 ms; never route GOOSE through a routed IP network — it requires an Ethernet multicast fabric at Layer 2.
- For north-bound integration (SCADA, EMS, historian), expose data using IEC 61968/61970 CIM (Common Information Model) as the enterprise semantic layer on top of IEC 61850 device-level data.
- When integrating new vendor IEDs, validate conformance using an IEC 61850 conformance test tool before connecting to the live substation network.

## Checklist

- [ ] All grid assets in scope are mapped to IEC 61850 Logical Node classes in a maintained data model document.
- [ ] SCL files are the authoritative configuration source; they are version-controlled and diff-reviewed before deployment.
- [ ] GOOSE traffic is confined to Layer 2 Ethernet segments and never traverses IP routers.
- [ ] North-bound APIs expose CIM objects, not raw IED attribute paths.
- [ ] New IED integrations pass conformance validation before connecting to production substation network.

## References

- IEC 61850: Communication Networks and Systems for Power Utility Automation — International Electrotechnical Commission — https://webstore.ansi.org/industry/smartgrid/iec-61850
- Springer: Automation for the Smart Grid: IEC 61850 — Substation Automation and DER Communication — https://link.springer.com/chapter/10.1007/978-3-642-34916-4_7
- EPRI: Implementing the IEC 61850 Substation Automation Standard — https://restservice.epri.com/publicdownload/000000003002006451/0/Product
