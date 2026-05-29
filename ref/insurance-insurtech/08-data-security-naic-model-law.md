# Rule 08 — Data Security Under NAIC Model Law

> 보험 데이터 보안은 NAIC 모델 법률 668호를 최소 기준으로 삼아 설계해야 한다.
> Insurance data security must be designed with NAIC Model Law #668 as the non-negotiable floor.

## Why

Insurance systems hold dense concentrations of sensitive personal data — health records, financial history, driving records, home inventory, biometric identifiers — making them high-value targets. The NAIC Insurance Data Security Model Law (#668), adopted by the majority of US states, mandates a written information security program, investigation of cybersecurity events, and notification to the state commissioner. Beyond Model Law #668, health-linked data is also subject to HIPAA, and financial data to state-level privacy laws. A breach in this industry triggers multi-regulator notification obligations and direct policyholder harm.

## How to apply

- Implement a written information security program (WISP) that is technically enforced: encryption at rest (AES-256 minimum) and in transit (TLS 1.2+), role-based access control with least privilege, and multi-factor authentication on all administrative access.
- Classify insurance data fields at ingest: health data, financial data, government ID, geolocation — apply retention limits and access controls per classification.
- Build cybersecurity event detection (SIEM or equivalent) with automated alerting; the NAIC Model Law requires investigation and commissioner notification within defined timeframes.
- Conduct annual penetration testing and vulnerability scanning; document findings and remediation timelines.
- For third-party vendors and data providers (credit bureaus, IoT telematics, medical information bureaus), contractually require equivalent security standards and audit rights.

## Checklist

- [ ] Written information security program (WISP) exists, is technically enforced, and covers all data categories.
- [ ] All sensitive data fields are classified; health, financial, and government ID data have explicit retention and access policies.
- [ ] Cybersecurity event detection is operational with automated alerting and a documented incident response runbook.
- [ ] Third-party data providers have security contracts with audit rights and breach notification requirements.
- [ ] Annual penetration test results and remediation are documented and available for regulator examination.

## References

- NAIC Insurance Data Security Model Law (#668) — https://content.naic.org/sites/default/files/government-affairs-brief-data-security-model-law.pdf
- NAIC Insurance Data Security Model Law compliance overview (Thales) — https://cpl.thalesgroup.com/compliance/americas/naic-insurance-data-security-model-law-compliance
- NAIC main site — https://content.naic.org/
- *Insurance Technology: Navigating the Innovation, Risk, and Future of Insurance*, Steven Haynes (Elsevier, 2024) — https://www.amazon.com/dp/0443439729
