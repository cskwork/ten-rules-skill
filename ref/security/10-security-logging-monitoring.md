# Rule 10 — Log Security Events and Monitor for Attacks

> 보안 이벤트를 기록하고 감시하라. 보이지 않는 침입은 막을 수 없다.
> Log security events and watch them; you cannot stop an attack you never see.

## Why

Security Logging and Monitoring Failures rank #9 in the OWASP Top 10 (2021). Without reliable logs and alerting, breaches go undetected for weeks or months, and incident response has nothing to work from. NIST SSDF (SP 800-218) treats vulnerability response as a core practice, and that depends entirely on visibility. Detection and response are the last layer of defense in depth.

## How to apply

- Log security-relevant events: logins, failures, access-control denials, and admin actions.
- Use structured logs with timestamp, severity, request ID, and user ID for correlation.
- Never log secrets, passwords, tokens, or PII; redact sensitive fields.
- Centralize logs in tamper-resistant storage with sufficient retention.
- Alert on suspicious patterns (brute force, privilege escalation) and tie alerts to a response plan.
- Test detection and the incident-response runbook regularly, not only during a real incident.

## Checklist

- [ ] Authentication, authorization, and high-value actions are logged with enough context.
- [ ] Logs are structured and include correlation IDs for tracing a request.
- [ ] No passwords, tokens, or PII are written to logs.
- [ ] Logs are centralized, tamper-resistant, and retained per policy.
- [ ] Alerts exist for attack patterns and connect to a tested incident-response plan.

## References

- OWASP Top 10 (2021), A09 Security Logging and Monitoring Failures — https://owasp.org/Top10/2021/A09_2021-Security_Logging_and_Monitoring_Failures/
- NIST SSDF SP 800-218 — https://csrc.nist.gov/projects/ssdf
