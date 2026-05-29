# Rule 06 — Keep Secrets Out of Code

> 비밀은 코드에 넣지 말고 금고에서 꺼내 쓰며 노출되면 즉시 교체하라.
> Never hardcode secrets; load them from a vault and rotate any that leak.

## Why

Hardcoded credentials are among the most common and most damaging real-world breaches, and they fall under OWASP Top 10 A05 Security Misconfiguration (2021). A secret committed to a repository is effectively public the moment it is pushed, since history persists. NIST SSDF (SP 800-218) treats protecting credentials as a core "Protect the Software" practice.

## How to apply

- Store secrets in environment variables or a secret manager (Vault, AWS/GCP/Azure KMS), never in source.
- Validate that required secrets are present at startup; fail fast if missing.
- Scan commits and CI for secrets (pre-commit hooks, automated scanners) to block leaks.
- Use short-lived, scoped credentials and rotate on a schedule and after any exposure.
- Keep secrets out of logs, error messages, URLs, and client-side code.
- Separate secrets per environment; never reuse production credentials in dev or test.

## Checklist

- [ ] No API keys, passwords, or tokens appear in source or config committed to git.
- [ ] Secrets load from env vars or a secret manager and are validated at startup.
- [ ] A secret scanner runs in pre-commit and/or CI and blocks on findings.
- [ ] Credentials are rotated on schedule and immediately after any suspected exposure.
- [ ] Logs, errors, and URLs are checked to ensure no secret is emitted.

## References

- OWASP Top 10, A05 Security Misconfiguration — https://owasp.org/www-project-top-ten/
- NIST SSDF SP 800-218 — https://csrc.nist.gov/projects/ssdf
