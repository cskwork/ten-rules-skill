# Rule 05 — Strong Customer Authentication

> 고객의 민감한 금융 행동은 서로 독립적인 두 가지 인증 요소로 검증해야 한다.
> Sensitive financial actions require two independent authentication factors from different categories.

## Why

PSD2 Article 4(30) and the EBA Regulatory Technical Standards on SCA (EU 2018/389) mandate that payment service providers apply Strong Customer Authentication — combining at least two of: something the customer knows (password, PIN), something the customer has (device, OTP token), and something the customer is (biometric) — whenever a user accesses their account online, initiates an electronic payment, or carries out any action that implies a risk of payment fraud. SCA reduces account takeover and unauthorized payment fraud; after mandatory SCA enforcement in 2019, fraud rates on authenticated transactions dropped measurably across the EEA. Even outside the EU, SCA is now industry best practice because the liability shift for unauthenticated payments typically falls on the issuer or PSP.

## How to apply

- Implement TOTP (RFC 6238), push notification OTP, or FIDO2/WebAuthn as the second factor — SMS OTP is acceptable but weaker due to SIM-swap risk.
- Apply SCA at: initial login on a new device, payment initiation above the low-value exemption threshold (currently EUR 30 in EU), adding a new payee, changing account credentials, and granting open banking consent.
- Use dynamic linking: the authentication code must be bound to the specific transaction amount and payee so that an intercepted code cannot be replayed for a different transaction.
- Apply SCA exemptions carefully (low-value, trusted beneficiary, transaction risk analysis) — keep evidence of why each exemption was claimed, as regulators audit exemption usage.
- For open banking / PSD2 API flows, implement the OAuth 2.0 + PKCE authorization code grant with SCA at the consent step.

## Checklist

- [ ] Login from a new or unrecognised device triggers a second-factor challenge.
- [ ] Payment initiation above the exemption threshold triggers SCA with dynamic linking.
- [ ] FIDO2/WebAuthn or TOTP is available as a second factor (not only SMS).
- [ ] SCA exemption claims are logged with the reason code and transaction ID.
- [ ] Adding a new payee or changing a password requires re-authentication.

## References

- European Banking Authority — "Regulatory Technical Standards on strong customer authentication and secure communication under PSD2" — https://www.eba.europa.eu/legacy/regulation-and-policy/regulatory-activities/payment-services-and-electronic-money-0
- European Commission — "Strong customer authentication requirement of PSD2 comes into force" — https://finance.ec.europa.eu/publications/strong-customer-authentication-requirement-psd2-comes-force_en
- Stripe — "Strong Customer Authentication" guide — https://stripe.com/guides/strong-customer-authentication
