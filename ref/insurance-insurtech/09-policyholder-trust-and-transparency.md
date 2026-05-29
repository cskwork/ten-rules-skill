# Rule 09 — Policyholder Trust and Transparency

> 보장 내용과 제외 조항은 가입 전에 명확한 언어로 고객에게 전달되어야 한다.
> Coverage terms and exclusions must be communicated in plain language before the customer binds.

## Why

Insurance is a promise to pay under defined conditions that the customer may not need to invoke for years. Misalignment between what the customer believed they were buying and what the policy actually covers is the single largest driver of customer complaints, bad-faith litigation, and regulatory sanctions. Lemonade's model — 90-second digital bind — only works because clarity at point of sale prevents disputes at point of claim. Regulators in most states mandate plain language policy summaries (ACORD insurance score summaries, state-mandated disclosure forms); digital platforms must operationalize this at the UX and data layer, not just as legal fine print.

## How to apply

- Present a plain-language coverage summary (what is covered, what is excluded, coverage limits, deductibles) before the buy button; the summary must be version-controlled and match the exact policy form being bound.
- At claims time, surface the specific policy language relevant to the reported loss before asking the customer to continue; if the loss appears excluded, say so clearly with the policy language reference.
- Send renewal notices with an explicit diff of what changed from the prior term (price, coverage, terms); do not bury changes in a full policy reissue.
- For adverse underwriting decisions (decline, surcharge, restricted coverage), generate the legally required adverse action notice with plain-language reason codes automatically.
- Avoid dark patterns in the bind and renewal flows: do not auto-enroll in add-ons, do not hide cancellation paths, do not pre-check optional coverages.

## Checklist

- [ ] A plain-language coverage summary (covered perils, exclusions, limits, deductibles) is displayed before binding and is version-matched to the policy form.
- [ ] Claims intake surfaces the relevant policy language for the reported loss type before the customer proceeds.
- [ ] Renewal notices include a change diff from the prior term for price, coverage, and material terms.
- [ ] Adverse action notices are auto-generated with plain-language reason codes per state requirements.
- [ ] Bind and renewal flows have no dark patterns: no hidden auto-enroll, no obscured cancellation, no pre-checked optional coverage.

## References

- *The INSURTECH Book*, VanderLinden, Millie, Anderson, Chishti (Wiley, 2018) — https://www.oreilly.com/library/view/the-insurtech-book/9781119362210/
- Lemonade Transparency Chronicle (annual public report on claims and decisions) — https://www.lemonade.com/blog/transparency-chronicles/
- NAIC Model Laws (plain language and disclosure requirements) — https://content.naic.org/model-laws
- *InsurTech: A Legal and Regulatory View*, Marano & Noussia eds. (Springer, 2021) — https://link.springer.com/book/10.1007/978-3-030-27386-6
