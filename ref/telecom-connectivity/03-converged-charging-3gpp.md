# Rule 03 — Implement Charging Per 3GPP Converged Charging Architecture

> 과금 시스템은 3GPP 통합 과금 아키텍처(CHF/CCS)를 기준으로 구현하며, 온라인·오프라인 과금을 단일 경로로 처리해야 한다
> Build the charging stack against 3GPP TS 32.290 converged charging: one Charging Function handles both real-time quota management and CDR generation.

## Why

5G replaced the separate 4G Online Charging System (OCS) and Offline Charging System (OFCS) with a single 5G Converged Charging System (CCS) containing a Charging Function (CHF). Software built on the old dual-path model accumulates reconciliation debt — mismatches between real-time quota exhaustion and CDR-based invoicing that produce revenue leakage or overbilling, both of which attract regulatory action. The 3GPP-defined CHF exposes charging services over the Service-Based Interface (SBI), aligning with the broader 5G service-based architecture; any implementation that bypasses SBI creates an integration barrier with every Network Function in the core.

## How to apply

- Model the charging flow as: Network Function sends Nchf_ConvergedCharging_Create/Update/Release → CHF evaluates quota, applies rating, emits Charging Data Records (CDRs) — do not split these into separate online/offline codepaths.
- Implement quota management with a credit pool: grants are issued for a time or volume window; exhaustion triggers a re-authorisation request before the session is interrupted, not after.
- Store CDRs to durable, append-only storage before acknowledging the charging request; loss of a CDR is irreversible revenue leakage.
- Implement mediation (format normalisation and deduplication) as a separate stage between CHF output and the billing/invoicing system; never feed raw CDRs directly into invoicing.
- Test for the split-billing scenario: a single data session that crosses a quota boundary mid-record must produce two correctly attributed CDRs, not one rounded record.

## Checklist

- [ ] CHF implements 3GPP TS 32.290 Nchf service-based interface, not a proprietary OCS protocol
- [ ] CDRs are written to durable storage before the charging response is returned
- [ ] Quota exhaustion triggers re-authorisation before session interruption
- [ ] Mediation layer deduplicates CDRs before passing to billing
- [ ] Split-session CDR scenario is covered by an automated integration test

## References

- 3GPP TS 32.290 — Services, operations and procedures of converged charging using SBI — https://www.3gpp.org/DynaReport/32290.htm
- Analysys Mason — 5G Charging Standards: Contributors and Implications — https://www.analysysmason.com/contentassets/0150978e8a534bf896a388be3acb5e28/analysys_mason_5g_charging_standards_perspective_march2023.pdf
- Ericsson — How does 5G actually bring in any cash? — https://www.ericsson.com/en/blog/2020/4/how-does-5g-actually-bring-in-any-cash
- Journal of ICT Standardization — Charging and Billing Architecture for 5G Network — https://journals.riverpublishers.com/index.php/JICTS/article/view/6397
