# Rule 07 — Log Every Hiring Decision with Actor, Timestamp, and Rationale

> 모든 채용 결정은 누가, 언제, 왜 했는지 감사 추적이 가능해야 법적 분쟁에서 회사를 보호할 수 있다.
> Every disposition, stage advance, rejection, and offer must be recorded with actor, timestamp, and a job-related rationale that can be produced in response to an EEOC charge or litigation hold.

## Why

EEOC charge investigations and employment discrimination lawsuits routinely demand records of hiring decisions going back two years or more. Federal contractors must retain applicant flow data for two years under 41 CFR Part 60. OFCCP (Office of Federal Contract Compliance Programs) audits require employers to demonstrate that selection criteria were applied consistently. Without an immutable audit log, an employer cannot prove that a rejection was based on legitimate job-related factors rather than protected characteristics. HR tech platforms that allow records to be edited or deleted without a diff log expose their customers to catastrophic legal liability.

## How to apply

- Record every disposition change as an append-only event (event sourcing pattern): store who triggered it, when (UTC ISO-8601), the previous state, the new state, and the linked scorecard or note ID that provides the rationale.
- Do not allow hard deletion of candidate records within the legally mandated retention window; implement soft-delete with a reason code and a scheduled purge after the retention period expires.
- Capture EEO self-identification data (race, gender, veteran status, disability status) at application time in a separate data store that is not accessible to hiring managers; use it only for aggregate reporting and adverse impact analysis.
- Provide a one-click "Export audit trail" function for a given requisition that produces a time-ordered CSV or JSON of all events, suitable for legal review.
- For federal contractor customers, surface OFCCP-required applicant flow log reports (requisition, applicants, interviewed, offered, hired, rejected — broken down by EEO category) directly in the reporting module.

## Checklist

- [ ] Disposition changes written as append-only events with actor, timestamp, and rationale reference
- [ ] Hard deletion blocked during legally mandated retention window; soft-delete with scheduled purge implemented
- [ ] EEO self-identification data isolated from hiring-manager view
- [ ] Audit trail export (CSV/JSON) available per requisition
- [ ] OFCCP applicant flow log report available for federal contractor configurations

## References

- EEOC Strategic Enforcement Plan Fiscal Years 2024-2028 — https://www.eeoc.gov/strategic-enforcement-plan-fiscal-years-2024-2028
- OFCCP Record-Keeping and Reporting Requirements (41 CFR Part 60-1) — https://www.ecfr.gov/current/title-41/subtitle-B/chapter-60/part-60-1
- GDPR Article 30 (Records of Processing Activities) — https://gdpr-info.eu/art-30-gdpr/
- EEOC Uniform Guidelines on Employee Selection Procedures (29 CFR Part 1607) — https://www.ecfr.gov/current/title-29/subtitle-B/chapter-XIV/part-1607
