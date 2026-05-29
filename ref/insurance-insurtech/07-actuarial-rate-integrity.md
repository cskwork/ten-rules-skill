# Rule 07 — Actuarial Rate Integrity

> 보험료 산정 테이블은 무결성이 보장된 버전 관리 하에서만 변경되어야 한다.
> Premium rate tables must only change under version-controlled conditions that guarantee integrity.

## Why

Insurance rates are filed with and approved by state regulators; selling coverage at an unapproved rate — even by accident — is a regulatory violation that triggers refunds, fines, and potential license suspension. Rates are also the actuarial foundation of solvency: charging inadequate rates creates reserve deficiencies that endanger policyholders. Ad-hoc overrides, copy-paste errors in spreadsheet-based rate tables, or untracked configuration changes have caused real-world insurance insolvencies. Rate tables must be treated with the same discipline as financial ledger entries.

## How to apply

- Store all rate factors, rating tiers, and rule sets in a versioned, append-only rate repository; no in-place edits to active rate versions.
- Gate activation of a new rate version per state behind a workflow that requires actuarial sign-off and a record of the regulatory filing effective date.
- The pricing engine reads rate data only from the approved-and-active version for the state and product at quote time; never from a staging or draft version.
- Maintain a complete audit trail of which rate version produced each quote and bound policy; this is required for rate adequacy review and regulatory examination.
- When refactoring the pricing engine, run parallel execution (old engine vs. new engine on the same inputs) and assert that output differences are zero or within an explicitly documented tolerance before cutover.

## Checklist

- [ ] Rate tables are stored in a versioned, append-only data store; no in-place edits to live versions.
- [ ] Activation of a new rate version per state requires documented actuarial approval and regulatory effective date.
- [ ] Pricing engine reads only the approved-active rate version; staging or draft versions are blocked from production traffic.
- [ ] Every quote and bound policy references the rate version that produced it; this reference is immutable.
- [ ] Pricing engine changes are validated by parallel execution against a reference dataset before production cutover.

## References

- NAIC Model Laws (rate and form filing requirements) — https://content.naic.org/model-laws
- *Insurance Technology: Navigating the Innovation, Risk, and Future of Insurance*, Steven Haynes (Elsevier, 2024) — https://www.amazon.com/dp/0443439729
- Casualty Actuarial Society — Statement of Principles Regarding P&C Insurance Ratemaking — https://www.casact.org/sites/default/files/old/sprate.pdf
- *The INSURTECH Book*, VanderLinden et al. (Wiley, 2018) — https://www.oreilly.com/library/view/the-insurtech-book/9781119362210/
