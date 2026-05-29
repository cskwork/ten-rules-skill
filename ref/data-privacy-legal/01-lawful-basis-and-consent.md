# Rule 01 — Establish a Lawful Basis Before You Process

> 처리하기 전에 적법 근거부터 정하라. 동의는 자유롭고 구체적이며 철회할 수 있어야 한다.
> Fix a lawful basis before processing; consent must be freely given, specific, and revocable.

## Why

GDPR Article 5 lists lawfulness first among its principles: no personal data may be processed without a valid legal basis. Korea PIPA goes further, requiring opt-in consent as the default for most collection. Processing without a basis is the most fundamental compliance failure, exposing the largest fines and invalidating everything built on top of the data.

## How to apply

- Pick and document one basis per purpose (consent, contract, legal obligation, vital interests, public task, or legitimate interests).
- Make consent a clear affirmative act: no pre-ticked boxes, no bundling, opt-in not opt-out.
- Record what each person consented to, when, and the wording they saw.
- Make withdrawing consent as easy as giving it, and stop processing when it is withdrawn.
- Treat special-category and children's data as requiring stronger, explicit grounds.

## Checklist

- [ ] Every processing purpose maps to one named, documented lawful basis.
- [ ] Consent (where used) is opt-in, unbundled, and logged with timestamp and version.
- [ ] A working withdrawal path exists and actually halts the processing.
- [ ] Sensitive or children's data has an explicit, stronger basis on file.
- [ ] No processing starts before its basis is confirmed.

## References

- GDPR Article 6 lawfulness of processing — https://gdpr-info.eu/art-6-gdpr/
- Korea Personal Information Protection Commission (PIPC) — https://www.pipc.go.kr/eng/
