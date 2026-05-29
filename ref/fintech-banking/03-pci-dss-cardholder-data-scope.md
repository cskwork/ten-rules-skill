# Rule 03 — PCI DSS Cardholder Data Scope

> 카드 정보를 직접 처리하지 말고, 토큰화로 PCI 범위를 최소화하라.
> Never handle raw card data yourself; tokenize at the point of entry to shrink PCI scope to the smallest possible surface.

## Why

PCI DSS v4.0.1 (PCI Security Standards Council) mandates that any system storing, processing, or transmitting Primary Account Numbers (PAN) — the 16-digit card number — meets 12 major control objectives covering encryption, access control, vulnerability management, and network segmentation. A breach of cardholder data triggers mandatory disclosure, card brand fines, forensic audit costs, and loss of the right to accept cards. The fastest path to compliance is scope reduction: if your systems never see a raw PAN, most PCI controls do not apply. Tokenization (delegating card capture to a certified payment processor or vault) achieves this.

## How to apply

- Use a PCI-certified processor's hosted fields or JavaScript SDK (Stripe Elements, Braintree Drop-in, Adyen Web Components) so the raw PAN flows directly to the processor and never touches your servers.
- Store only the processor-issued token (e.g., `pm_xxx` in Stripe) — never the PAN, CVV, or full magnetic-stripe data.
- Never log card numbers, even partially, in application logs, error trackers, or analytics pipelines.
- Segment the network so that servers in PCI scope cannot reach unrelated systems; document the Cardholder Data Environment (CDE) boundary.
- Run a quarterly internal scan and annual external ASV (Approved Scanning Vendor) scan as required by PCI DSS v4.0.1 Requirement 11.

## Checklist

- [ ] No raw PAN or CVV is logged, stored in application databases, or transmitted through non-PCI systems.
- [ ] Card capture uses a processor-hosted UI component (hosted fields / drop-in).
- [ ] Network diagram clearly marks the CDE boundary and is reviewed annually.
- [ ] SAQ (Self-Assessment Questionnaire) or QSA report is current.
- [ ] CVV is never persisted after authorization, per PCI DSS Requirement 3.3.

## References

- PCI Security Standards Council — PCI DSS v4.0.1 — https://www.pcisecuritystandards.org/standards/
- PCI Security Standards Council — Document Library — https://www.pcisecuritystandards.org/
- PCI Security Standards Council — "Tokenization Product Security Guidelines" — https://www.pcisecuritystandards.org/document_library/
