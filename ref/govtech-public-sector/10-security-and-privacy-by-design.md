# Rule 10 — Security and Privacy by Design

> 보안과 개인정보 보호는 나중에 덧붙이는 것이 아니라 첫 번째 스프린트부터 설계에 포함해야 한다.
> Security and privacy are not post-launch concerns; embed them from the first sprint or they will not be embedded at all.

## Why

Government services hold sensitive personal data — tax records, health information, immigration status, criminal records — that makes them high-value targets for attackers and creates severe harm when breached. In many jurisdictions (GDPR in Europe, Privacy Act in the US and Australia) data protection obligations attach at the point of collection, not at the point of breach; a service that collects more data than it needs, retains it longer than necessary, or shares it without lawful basis is non-compliant before any incident occurs. The USDS Playbook and the GOV.UK Service Standard both require security and privacy to be treated as live concerns throughout delivery, not handed off to a compliance team for a pre-launch sign-off.

## How to apply

- Complete a Data Protection Impact Assessment (DPIA) or Privacy Impact Assessment (PIA) before collecting any personal data; document the legal basis for collection, retention period, and sharing arrangements.
- Apply data minimisation at schema level: collect only the fields the service needs to function; never store sensitive attributes (race, religion, health, biometric) without explicit statutory authority and a separate security boundary.
- Use threat modelling (STRIDE or equivalent) during design to identify attack surfaces; revisit the threat model when the architecture changes significantly.
- Enforce HTTPS everywhere with HSTS headers; configure Content Security Policy (CSP) headers to prevent cross-site scripting; apply CSRF protection on all state-changing endpoints.
- Store secrets (API keys, database credentials, signing keys) in a secrets manager (AWS Secrets Manager, Azure Key Vault, HashiCorp Vault) — never in source code, configuration files, or environment variables baked into container images.
- Run automated dependency vulnerability scanning in the CI pipeline; treat critical CVEs as release-blocking defects.

## Checklist

- [ ] DPIA/PIA completed before any personal data is collected
- [ ] Data minimisation applied: no fields collected without documented justification
- [ ] Threat model (STRIDE or equivalent) completed and reviewed at design stage
- [ ] HTTPS + HSTS enforced; CSP and CSRF protection in place
- [ ] Secrets stored in a secrets manager, not in source code or config files
- [ ] Dependency vulnerability scan runs in CI and blocks on critical CVEs

## References

- NIST SP 800-53 Rev 5 — Security and Privacy Controls for Information Systems — https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final
- GOV.UK Service Standard — Point 9: Create a secure service which protects users' privacy — https://www.gov.uk/service-manual/service-standard/point-9-create-a-secure-service-which-protects-users-privacy
- US Digital Services Playbook — Play 11: Manage security and privacy through reusable processes — https://playbook.usds.gov/
- ICO (UK Information Commissioner's Office) — Data Protection Impact Assessments guidance — https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/accountability-and-governance/data-protection-impact-assessments/
