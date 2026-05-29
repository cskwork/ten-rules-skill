# Rule 03 — Use Data Only for Its Stated Purpose

> 모은 목적 외로 데이터를 쓰지 마라. 새 용도는 새 근거가 필요하다.
> Do not use data beyond the purpose it was collected for; a new use needs a new basis.

## Why

Purpose limitation is a GDPR Article 5 principle: data collected for one specified purpose must not be further processed in a way incompatible with it. This is where well-meaning teams most often drift, repurposing support data for marketing or production data for ML training. Such "function creep" breaks the original consent and is a frequent enforcement trigger.

## How to apply

- State each purpose explicitly at collection time, in specific not catch-all language.
- Before any new use of existing data, run a compatibility check against the original purpose.
- Treat training ML models on personal data as a distinct purpose needing its own basis.
- Keep purpose tags on datasets so downstream systems can enforce the limit.
- Get fresh consent or a new lawful basis for genuinely incompatible new uses.

## Checklist

- [ ] Each dataset records the specific purpose(s) it was collected for.
- [ ] New uses pass a documented compatibility assessment before launch.
- [ ] Using data to train or fine-tune models is explicitly authorized.
- [ ] Data shared with other teams or vendors carries its purpose constraints.
- [ ] No production personal data flows into unrelated analytics without a basis.

## References

- GDPR Article 5(1)(b) purpose limitation — https://gdpr-info.eu/art-5-gdpr/
- California CCPA/CPRA (CPPA) — https://cppa.ca.gov/
