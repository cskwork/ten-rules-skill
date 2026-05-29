# Application Security — 10 Rules (index)

Source: market-researched synthesis grounded in OWASP Top 10 (2021), OWASP ASVS, NIST SSDF (SP 800-218), and Saltzer & Schroeder's design principles (least privilege, fail-safe defaults). Application security is the practice of building, verifying, and operating software so that confidentiality, integrity, and availability hold even against motivated attackers and untrusted input.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-broken-access-control.md` | Enforce authorization on every request, server-side | endpoints, object access, roles, admin functions |
| 02 | `02-never-trust-input.md` | Validate and encode all untrusted input at boundaries | forms, APIs, file upload, query params, headers |
| 03 | `03-prevent-injection.md` | Separate code from data; parameterize everything | SQL/NoSQL queries, OS commands, templates, LDAP |
| 04 | `04-authentication.md` | Prove identity with strong, phishing-resistant auth | login, sessions, passwords, MFA, tokens |
| 05 | `05-cryptography.md` | Use standard crypto correctly to protect data | TLS, hashing, encryption at rest, key handling |
| 06 | `06-secrets-management.md` | Keep secrets out of code; rotate via a vault | API keys, DB creds, tokens, certificates, CI/CD |
| 07 | `07-least-privilege.md` | Grant minimum access; fail safe by default | IAM, service accounts, DB grants, file permissions |
| 08 | `08-dependency-supply-chain.md` | Govern third-party and build-pipeline risk | npm/pip packages, base images, CI, SBOM |
| 09 | `09-threat-modeling-secure-sdlc.md` | Design security in; model threats before code | new features, architecture, design reviews |
| 10 | `10-security-logging-monitoring.md` | Log security events; detect and respond | audit trails, alerting, incident response, monitoring |

Default for "building or reviewing a web application feature": read 01, 02, 03, 07 at minimum.
