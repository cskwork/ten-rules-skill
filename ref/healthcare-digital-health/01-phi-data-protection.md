# Rule 01 — PHI Data Protection

> 환자 정보는 법적 의무이자 신뢰의 기반이다: 저장, 전송, 접근 로그 모든 단계에서 보호하라.
> Protected health information is a legal obligation and the foundation of trust: protect it at every stage of storage, transmission, and access.

## Why

HIPAA's Security Rule (45 CFR Part 164) requires covered entities and business associates to implement technical safeguards for all electronic PHI (ePHI). The 2025 NPRM proposes making all implementation specifications mandatory — including encryption at rest and in transit, MFA, and annual penetration testing — removing the prior "addressable vs. required" distinction. OCR collected over $9.9 million in fines in 2024 alone. A breach triggers mandatory notification, reputational damage, and potential civil liability that can threaten the organization's ability to operate.

## How to apply

- Encrypt all ePHI at rest (AES-256 minimum) and in transit (TLS 1.2+); never store PHI in browser localStorage, URL query strings, or application logs.
- Enforce multi-factor authentication for all workforce members accessing ePHI; apply role-based access control scoped to the minimum necessary information.
- Maintain a current technology asset inventory and network map covering every system that touches ePHI; review at least annually and after any infrastructure change.
- Execute biannual automated vulnerability scans and annual penetration tests; track and remediate findings in a documented risk register.
- Sign a Business Associate Agreement (BAA) with every third-party vendor (cloud provider, analytics platform, AI service) that processes ePHI before any data flows to them.
- Apply a data-retention and secure-deletion schedule: PHI must be destroyed in a manner that makes recovery infeasible when retention periods expire.

## Checklist

- [ ] All ePHI fields encrypted at rest and all API responses served over TLS 1.2+
- [ ] MFA enforced for all staff access paths to clinical data
- [ ] BAAs in place and countersigned for every vendor with ePHI access
- [ ] Vulnerability scan scheduled biannually; last scan results reviewed and findings tracked
- [ ] PHI absent from logs, URL parameters, error messages, and client-side storage

## References

- HIPAA Security Rule (45 CFR Part 164) — https://www.hhs.gov/hipaa/for-professionals/security/index.html
- HHS HIPAA Security Rule NPRM 2025 (proposed updates including mandatory MFA and encryption) — https://www.hhs.gov/hipaa/for-professionals/security/hipaa-security-rule-nprm/index.html
- HIPAA Journal: HIPAA Updates and Changes — https://www.hipaajournal.com/hipaa-updates-hipaa-changes/
