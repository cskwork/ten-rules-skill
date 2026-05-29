# Rule 06 — Expose and Consume TM Forum Open APIs for BSS/OSS Integration

> 외부와 연동하는 BSS/OSS 인터페이스는 TM Forum Open API 규격을 준수하여 설계한다
> Any BSS or OSS interface that crosses a system boundary must conform to the TM Forum Open API standard, not a bespoke REST contract.

## Why

TM Forum's Open API suite (over 50 REST-based APIs, technology-agnostic) has become the procurement baseline for tier-1 operators: carriers now mandate Open API conformance in vendor RFPs. Building a proprietary API for product catalog, order management, or customer management guarantees integration friction the first time a partner system, a field-force tool, or a wholesale platform connects. Open API conformance also means shared tooling: conformant APIs come with published Swagger/OpenAPI specs, test harnesses, and certification, reducing integration test time from months to days.

## How to apply

- Identify the TM Forum Open API that maps to your interface before designing any new endpoint: TMF620 (Product Catalog), TMF622 (Product Ordering), TMF629 (Customer Management), TMF638 (Service Inventory), TMF641 (Service Ordering), TMF688 (Event Management) are the most commonly required.
- Implement the API resource model exactly as defined — do not rename fields or collapse sub-resources for convenience; deviations break conformance certification.
- Use the TM Forum published Swagger/OAS3 specifications as the source of truth for the API contract; generate server stubs from the spec rather than writing them by hand.
- Publish an API conformance statement: which TMF API, which version, and which optional extensions are implemented; this is required for operator procurement.
- Register for TM Forum Open API Conformance Certification if the system will be sold to or operated by a tier-1 carrier; self-attestation is insufficient for enterprise procurement.

## Checklist

- [ ] Every cross-system BSS/OSS interface is mapped to a named TM Forum Open API number and version
- [ ] Server implementation is generated from or validated against the official TMF OAS3 spec
- [ ] No field names or resource structures deviate from the TMF spec without explicit extension documentation
- [ ] API conformance statement is published alongside the service documentation
- [ ] Event notifications follow TMF688 event schema and delivery contract

## References

- TM Forum Open APIs — https://www.tmforum.org/open-digital-architecture/implementation/open-apis/
- TM Forum Open Digital Architecture explained — https://mapyourtech.com/tm-forum-open-digital-architecture-explained/
- Cerillion — Introduction to TM Forum Open Digital Architecture — https://www.cerillion.com/blog/revolutionising-telecoms-an-introduction-to-tm-forum-s-open-digital-architecture/
