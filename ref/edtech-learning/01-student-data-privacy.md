# Rule 01 — Student Data Privacy (FERPA / COPPA)

> 학생 데이터는 교육 목적으로만 수집하고, 동의 없이 제3자에게 절대 공유하지 않는다.
> Collect student data only for educational purposes and never share it with third parties without required consent.

## Why

FERPA applies to every platform receiving U.S. federal education funding and restricts disclosure of student education records without parental or eligible-student consent. COPPA imposes additional consent and data-minimization requirements for users under 13. As of 2024, over 130 U.S. state laws add further restrictions beyond FERPA and COPPA. A single data-sharing violation can trigger FTC enforcement, loss of federal funding, and complete institutional distrust — ending a product's school-market viability overnight.

## How to apply

- Gate all data collection behind a role check: distinguish K-12 minors (COPPA + FERPA), higher-ed students (FERPA), and adult consumer learners (GDPR / state laws).
- Never pass student PII (name, email, grade, performance data) to third-party analytics, ad networks, or AI training pipelines without a signed Data Processing Agreement that meets the "school official" exception under FERPA.
- Implement data minimization by default: collect only what the learning feature requires; delete or anonymize records on the schedule your privacy policy states.
- Provide a parent/guardian portal for K-12 products with rights to inspect, correct, and request deletion of education records.
- Surface a plain-language privacy notice at account creation; store the version accepted and timestamp per user record.

## Checklist

- [ ] FERPA "school official" DPA signed with every third-party data processor before go-live
- [ ] COPPA verifiable parental consent flow in place for any service collecting data from users under 13
- [ ] Data retention schedule defined, enforced in code, and communicated in the privacy policy
- [ ] PII excluded from server logs, analytics events, and error tracking payloads
- [ ] Privacy policy version and acceptance timestamp stored per user row

## References

- U.S. Department of Education — FERPA — https://studentprivacy.ed.gov/ferpa
- FTC — Children's Online Privacy Protection Act (COPPA) — https://www.ftc.gov/legal-library/browse/rules/childrens-online-privacy-protection-rule-coppa
- Parent Coalition for Student Privacy — FERPA, PPRA, and COPPA overview — https://studentprivacymatters.org/
- U.S. Dept. of Education — Student Privacy 101: FERPA for School Officials — https://studentprivacy.ed.gov/training/student-privacy-101-ferpa-school-officials
