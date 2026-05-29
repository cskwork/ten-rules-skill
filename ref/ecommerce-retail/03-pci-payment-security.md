# Rule 03 — Never Touch Raw Card Data; Delegate to a Certified Vault

> 카드 번호는 절대 직접 처리하지 말고 인증된 결제 대행사에 위임하라.
> Your application must never see, store, log, or transmit a raw primary account number (PAN).

## Why

PCI DSS (Payment Card Industry Data Security Standard) v4, maintained by the PCI Security Standards Council, governs any system that stores, processes, or transmits cardholder data. Non-compliance exposes merchants to fines, card-brand disqualification, and liability for fraud losses. The far more important practical reason is that a single logging statement, a debug mode left on, or an accidental database query can capture a PAN and trigger a breach — with criminal penalties and irreversible reputational damage. Tokenization and hosted payment fields (iframes served by a certified Payment Service Provider) shift the entire compliance burden to the PSP, reducing the merchant's PCI scope from SAQ D (hundreds of controls) to SAQ A (approximately 22 controls).

## How to apply

- Use a Payment Service Provider (Stripe, Braintree, Adyen, etc.) that provides a hosted fields / Elements component: card input renders inside an iframe owned by the PSP, so the PAN never touches your DOM or your servers.
- Never log request bodies or HTTP payloads that could contain card numbers, CVVs, or expiry dates; add scrubbing middleware as a defense in depth.
- Store only the PSP-issued token and last-four digits for display; never store the full PAN, even encrypted.
- Enforce HTTPS with HSTS on every page of the purchase flow, not only on the payment step.
- Scope your PCI SAQ annually; if you use hosted fields exclusively, target SAQ A. If any server-side code touches card data, escalate to SAQ D and engage a Qualified Security Assessor.
- Test for accidental PAN exposure: run automated scans (e.g., regular expression scans in logs and analytics events) to catch PAN leakage before it becomes a breach.

## Checklist

- [ ] Card input is rendered in a PSP-hosted iframe; no card field exists in your own HTML.
- [ ] No log output, analytics event, or error report can contain a 13–19 digit numeric string (PAN pattern).
- [ ] Only a PSP token and display-safe last-four are stored; the raw PAN is absent from every table and log.
- [ ] HTTPS + HSTS is active on every page, not just /checkout.
- [ ] Annual PCI SAQ is completed; scope is documented and justified.

## References

- PCI Security Standards Council — PCI DSS v4 Standard — https://www.pcisecuritystandards.org/standards/pci-dss/
- PCI Security Standards Council — SAQ Types and Eligibility — https://www.pcisecuritystandards.org/document_library/
- Stripe — PCI Compliance with Stripe Elements — https://stripe.com/docs/security/guide
