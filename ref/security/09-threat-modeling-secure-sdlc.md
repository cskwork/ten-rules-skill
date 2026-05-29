# Rule 09 — Model Threats and Build Security into the SDLC

> 코드를 짜기 전에 위협을 모델링하고 보안을 설계에 넣어라.
> Model threats before you build, and bake security into the lifecycle.

## Why

OWASP Top 10 (2021) added A04 Insecure Design specifically to stress that flaws baked into the design cannot be patched away later. STRIDE (Microsoft) gives a structured way to enumerate threats: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege. NIST SSDF (SP 800-218) frames secure development as practices spanning the whole lifecycle, not a final gate.

## How to apply

- Threat-model new features and architecture changes before implementation, using STRIDE.
- Define security requirements and abuse cases alongside functional requirements.
- Choose secure design patterns and reusable hardened components, not ad-hoc controls.
- Integrate security checks into CI: SAST, dependency scanning, and secret scanning.
- Verify against a baseline such as OWASP ASVS at a level matched to the data's sensitivity.
- Review and re-model when the design, data flows, or trust boundaries change.

## Checklist

- [ ] Each significant feature has a documented threat model (STRIDE or equivalent).
- [ ] Security requirements and abuse cases are written with functional requirements.
- [ ] Trust boundaries and data flows are identified and reviewed.
- [ ] Automated security checks (SAST, SCA, secrets) run in the pipeline.
- [ ] Design is verified against an ASVS level appropriate to its risk.

## References

- OWASP Top 10 (2021), A04 Insecure Design — https://owasp.org/Top10/2021/A04_2021-Insecure_Design/
- NIST SSDF SP 800-218 — https://csrc.nist.gov/projects/ssdf
- OWASP ASVS — https://owasp.org/www-project-application-security-verification-standard/
