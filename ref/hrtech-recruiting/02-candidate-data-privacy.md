# Rule 02 — Collect Minimum Data; Honor Deletion Rights

> 후보자 개인정보는 채용 목적에 필요한 최소한만 수집하고, 요청 시 즉시 삭제해야 한다.
> Collect only the candidate data the selection process requires, and fulfil deletion requests within the legally mandated window.

## Why

Candidate data falls squarely under GDPR (EU 2016/679) and equivalent laws (CCPA, PIPEDA, PDPA). GDPR fines reach 20 million euros or 4% of global annual revenue. Crucially, candidates are not employees — their data has a distinct legal basis (typically "legitimate interest" or explicit consent) that expires when the vacancy closes. Retaining resume data for years beyond the original vacancy, or silently reusing it for future roles without fresh consent, is a common GDPR violation in ATS products. The recruiting context also captures sensitive categories of data (disability accommodations, visa status, age-implying graduation dates) that require heightened protection.

## How to apply

- Define a data retention schedule per jurisdiction at product design time: in most EU contexts, applicant data must be deleted or anonymized within six months of rejection unless the candidate explicitly opts into a talent pool.
- Provide a single self-service "Delete my data" flow accessible without logging in; process the request within 30 days and send a confirmation.
- Separate personally identifiable information (PII) from evaluation data at the schema level so EEO aggregate reporting can continue after individual records are purged.
- Implement privacy by design: do not ask for date of birth, photo, marital status, or national ID on application forms unless local law explicitly requires them for the role.
- Log every access to candidate PII with user ID and timestamp to satisfy GDPR Article 30 records-of-processing requirements.

## Checklist

- [ ] Retention schedules defined per jurisdiction and enforced by automated purge jobs
- [ ] Candidate self-service data deletion flow tested end-to-end
- [ ] PII and aggregate EEO data stored in separate tables or schemas
- [ ] Application form reviewed: no legally unnecessary sensitive fields
- [ ] Records-of-processing log (Article 30) covering all candidate data flows

## References

- EU General Data Protection Regulation (GDPR) 2016/679 — https://gdpr-info.eu/
- ICO: Recruitment — Information about workers — https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/employment/information-about-workers/recruitment/
- California Consumer Privacy Act (CCPA) — https://oag.ca.gov/privacy/ccpa
- ICO Guide to Data Protection for Employment — https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/employment/
