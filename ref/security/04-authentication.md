# Rule 04 — Authenticate Strongly and Manage Sessions Safely

> 신원은 강하게 증명하고 세션은 안전하게 관리하라.
> Prove identity with strong, phishing-resistant auth and guard the session.

## Why

Identification and Authentication Failures rank #7 in the OWASP Top 10 (2021). Weak passwords, broken session handling, and missing multi-factor authentication (MFA) let attackers impersonate users directly. Authentication is the gate every other control sits behind, so its failure is catastrophic.

## How to apply

- Offer and prefer MFA; favor phishing-resistant factors (passkeys / WebAuthn) where possible.
- Store passwords with a strong adaptive hash (bcrypt, scrypt, Argon2), never plaintext or fast hashes.
- Check credentials against known-breached password lists; allow long passphrases.
- Generate session tokens with a CSPRNG; rotate on login; invalidate on logout and timeout.
- Set cookies as HttpOnly, Secure, and SameSite; bind sessions to the smallest needed scope.
- Rate-limit and add backoff on login, password reset, and MFA to slow credential stuffing.

## Checklist

- [ ] MFA is available and enforced for sensitive or privileged accounts.
- [ ] Passwords are stored with bcrypt/scrypt/Argon2, never reversible or fast-hashed.
- [ ] Session IDs are random, rotated at login, and expire on inactivity and logout.
- [ ] Session cookies set HttpOnly, Secure, and SameSite attributes.
- [ ] Login and reset flows are rate-limited and do not reveal whether an account exists.

## References

- OWASP Top 10 (2021), A07 Identification and Authentication Failures — https://owasp.org/Top10/2021/A07_2021-Identification_and_Authentication_Failures/
- OWASP Cheat Sheet Series (Authentication, Password Storage) — https://cheatsheetseries.owasp.org/
