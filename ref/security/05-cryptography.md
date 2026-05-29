# Rule 05 — Apply Cryptography Correctly

> 암호화는 직접 만들지 말고 검증된 표준을 올바르게 써라.
> Do not invent crypto; use vetted standards correctly and protect the keys.

## Why

Cryptographic Failures rank #2 in the OWASP Top 10 (2021) and frequently lead to exposure of passwords, payment data, and personal information. Most failures are misuse, not broken math: missing encryption, weak algorithms, hardcoded keys, or homegrown schemes. Correct use of standard primitives is what protects data in transit and at rest.

## How to apply

- Encrypt all sensitive data in transit with current TLS; disable legacy protocols and ciphers.
- Encrypt sensitive data at rest using vetted, authenticated algorithms (e.g., AES-GCM).
- Use a maintained crypto library; never roll your own algorithm or mode.
- Generate keys, IVs, and salts with a cryptographically secure RNG; never reuse a nonce.
- Classify data first; encrypt what is sensitive and avoid storing what you do not need.
- Manage key lifecycle: store in a vault/KMS, restrict access, and rotate on a schedule.

## Checklist

- [ ] All sensitive traffic uses TLS; weak protocols and ciphers are disabled.
- [ ] Data at rest uses a current, authenticated algorithm, not deprecated ones.
- [ ] No custom or "lightly obfuscated" cryptography exists in the codebase.
- [ ] Keys are stored in a KMS/vault, access-controlled, and rotated.
- [ ] Salts, IVs, and nonces come from a CSPRNG and are never reused.

## References

- OWASP Top 10 (2021), A02 Cryptographic Failures — https://owasp.org/Top10/2021/A02_2021-Cryptographic_Failures/
- OWASP Cheat Sheet Series (Cryptographic Storage, Transport Layer) — https://cheatsheetseries.owasp.org/
