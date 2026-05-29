# Rule 04 — Use SCIM 2.0 and Standard HR APIs for System Sync

> ATS와 HRIS 간 직원 데이터 동기화는 SCIM 2.0 표준을 따라야 하며, 독자적 통합 방식을 피해야 한다.
> Integrate ATS, HRIS, and identity systems using SCIM 2.0 and published HR API standards, not one-off custom connectors.

## Why

The typical enterprise HR stack connects an ATS to an HRIS (Workday, SAP SuccessFactors, BambooHR), an identity provider (Okta, Azure AD), a payroll system, and background check services. Without a standard protocol, each integration becomes a bespoke ETL job that breaks on provider updates. SCIM 2.0 (IETF RFC 7643/7644) defines a REST/JSON schema for user and group provisioning that all major identity and HR vendors now support. An ATS that builds to SCIM eliminates months of custom integration work for every enterprise customer, reduces offboarding security risk (terminated employee accounts remain active when manual sync fails), and meets SOC 2 access-management requirements more easily.

## How to apply

- Implement SCIM 2.0 server endpoints (/Users, /Groups, /Schemas, /ServiceProviderConfig) in your ATS so enterprise customers can provision and deprovision candidates and employees from their IdP without custom code.
- For outbound sync (ATS pushing a new hire to HRIS), prefer published vendor APIs (Workday SOAP/REST, SAP OData, BambooHR v1) over file-based imports; use a unified HR API layer (Merge, Finch, Unified.to) to abstract vendor differences.
- Treat HRIS as the system of record for employee identity after hire; ATS is the system of record only during the candidate lifecycle. Define the handoff point (typically offer-accepted) and the fields each system owns.
- Use idempotent upsert semantics for all sync operations: the same employee record processed twice must produce the same state, not a duplicate.
- Implement webhook or change-data-capture listeners so the ATS reacts to HRIS termination events within minutes, not hours.

## Checklist

- [ ] SCIM 2.0 server endpoints implemented and tested against Okta/Azure AD
- [ ] Outbound new-hire push to HRIS uses published API, not file drop
- [ ] System-of-record ownership documented for each data field at each lifecycle stage
- [ ] Sync operations are idempotent; duplicate events do not create duplicate records
- [ ] HRIS termination events trigger ATS access revocation within SLA (e.g., 15 minutes)

## References

- IETF RFC 7643 — SCIM Core Schema — https://www.rfc-editor.org/rfc/rfc7643.html
- IETF RFC 7644 — SCIM Protocol — https://www.rfc-editor.org/rfc/rfc7644.html
- SCIM Overview (Okta) — https://www.okta.com/blog/2017/01/what-is-scim/
- Workday REST API documentation — https://developer.workday.com/
