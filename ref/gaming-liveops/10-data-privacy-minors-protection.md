# Rule 10 — Data Privacy and Minors Protection

> 미성년자가 있을 수 있는 곳에는 반드시 COPPA와 GDPR-K 통제가 작동해야 한다.
> Where minors may be present, COPPA and GDPR-K controls must be in place.

## Why

Games are disproportionately played by minors, and regulators treat this as a high-risk data context. The US Children's Online Privacy Protection Act (COPPA) prohibits collecting personal data from users under 13 without verifiable parental consent; GDPR Article 8 (GDPR-K) sets the age threshold at 16 in most EU member states (minimum 13). Violations result in multi-million dollar FTC fines (Google/YouTube paid USD 170 million in 2019) and app store removal. Beyond regulation, behavioral targeting of children — even incidentally — through ad SDKs, social features, or analytics platforms creates reputational risk that the Fair Play Alliance and IGDA ethics standards explicitly call out. Any live-service game without a robust age-gate and data-flow audit is a latent regulatory liability.

## How to apply

- Implement an age-gate at account creation that is friction-bearing enough to deter casual bypass; do not rely on self-declaration alone for users near the threshold age.
- For users under 13 (COPPA) or the applicable local age (GDPR-K): disable behavioral ad SDKs, disable social sharing features that expose personal data, limit analytics collection to essential operational telemetry only.
- Audit every third-party SDK at integration time for COPPA/GDPR-K compliance; a non-compliant analytics or ad SDK included in the game makes the studio the liable party.
- Store parental consent records with timestamp, consent method, and IP geolocation; retain for the life of the account plus the jurisdiction-required period.
- Review the data flow annually; third-party SDK updates can silently re-enable data collection that was previously disabled.

## Checklist

- [ ] Age-gate is implemented at account creation and not trivially bypassable
- [ ] Users under the applicable age threshold have behavioral ad and social features disabled at the account level
- [ ] Every third-party SDK has been reviewed for COPPA/GDPR-K compliance before integration
- [ ] Parental consent records are stored with timestamp, method, and geo
- [ ] Annual data-flow audit is scheduled as a recurring compliance task

## References

- US FTC COPPA Rule — https://www.ftc.gov/legal-library/browse/rules/childrens-online-privacy-protection-rule-coppa
- EU GDPR Article 8 (child consent) — https://gdpr.eu/article-8-conditions-applicable-to-childs-consent-in-relation-to-information-society-services/
- IGDA Code of Ethics — player welfare obligations — https://igda.org/about-us/core-values-and-code-of-ethics/
- Fair Play Alliance resources on safe gaming for young players — https://thrivingingames.org/
