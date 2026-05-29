# Rule 04 — Digital Identity Assurance

> 거래의 위험 수준에 맞는 신원 확인 절차를 적용하라. 과도한 인증은 시민을 배제하고, 미흡한 인증은 사기를 부른다.
> Match identity proofing and authentication strength to the risk of the transaction; over-authentication excludes citizens, under-authentication invites fraud.

## Why

Government digital services span a wide risk spectrum — from downloading a public leaflet (no authentication required) to claiming a pension, renewing a passport, or accessing health records (high assurance required). NIST SP 800-63-4 defines a structured Digital Identity Risk Management (DIRM) framework with three levels: Identity Assurance Level (IAL), Authenticator Assurance Level (AAL), and Federation Assurance Level (FAL). Applying a higher level than the risk demands creates friction that disproportionately excludes elderly, disabled, and digitally excluded citizens — the very populations most dependent on government services. Applying too low a level exposes citizens to identity theft and enables fraudulent claims against public funds.

## How to apply

- Conduct a formal identity risk assessment (IAL/AAL/FAL determination) for every service before choosing an authentication mechanism; document the rationale.
- Do not require in-person document verification or biometric proofing for services where IAL1 (self-asserted identity) is sufficient.
- At AAL2, require a second factor (TOTP app, hardware security key, or government-issued authenticator); SMS OTP is permitted but should be avoided for high-value transactions due to SIM-swap risk.
- Support federated login via government-operated identity providers (GOV.UK One Login, Login.gov) where available, rather than building bespoke credential stores.
- Never store passwords in reversible form; hash with bcrypt, scrypt, or Argon2; enforce breach-credential checking at account creation and login.
- Plan for account recovery paths that match the original proofing level; weak recovery paths (security questions, email-only reset) undermine high-assurance authentication.

## Checklist

- [ ] IAL/AAL/FAL risk assessment documented and signed off before implementation begins
- [ ] Authentication mechanism matches the determined assurance level
- [ ] Password storage uses an approved adaptive hashing algorithm
- [ ] Account recovery flow reviewed and does not downgrade effective assurance
- [ ] Federated government identity provider evaluated before building bespoke auth

## References

- NIST SP 800-63-4 Digital Identity Guidelines — https://pages.nist.gov/800-63-4/
- NIST Special Publication 800-63 overview — https://www.nist.gov/identity-access-management/projects/nist-special-publication-800-63-digital-identity-guidelines
- Login.gov — US federal shared identity provider — https://login.gov/
- GOV.UK One Login — UK government shared identity service — https://www.sign-in.service.gov.uk/
