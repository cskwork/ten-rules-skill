# Rule 03 — SOC 2 Enterprise Readiness

> SOC 2 Type II는 엔터프라이즈 시장의 입장권이다
> SOC 2 Type II is the entry ticket to the enterprise market.

## Why

Over 60% of enterprises require a SOC 2 report before procurement approval, and roughly one-third of B2B SaaS companies report having lost deals specifically because they lacked security certification. SOC 2 Type II (controls operating over a 6-12 month observation period) signals that the company has operational discipline — not just documented policies. The five Trust Services Criteria (Security, Availability, Processing Integrity, Confidentiality, Privacy) map directly to what enterprise buyers care about in their vendor security questionnaires. Building controls retroactively is far more expensive than designing them in from the start.

## How to apply

- Treat the SOC 2 Security category as the mandatory baseline; add Availability and Confidentiality criteria next, as they are the most commonly requested by enterprise buyers.
- Instrument audit logging from day one: every privileged action (admin login, config change, data export, permission grant/revoke) must produce a tamper-evident, timestamped log stored separately from application logs.
- Establish a formal vulnerability management process: scan dependencies on every CI build, triage CVEs within defined SLAs (e.g., critical within 24 h), and document remediation.
- Define and test a written incident response plan. SOC 2 auditors look for evidence the plan was exercised (tabletop drills or real incident post-mortems).
- Use an automation platform (Drata, Vanta, or similar) to map controls to evidence continuously rather than scrambling before the audit window opens.
- Scope vendor risk: audit all sub-processors your platform relies on; the enterprise customer's security team will ask for this list.

## Checklist

- [ ] Audit logs cover all privileged and data-access events and are immutable for at least 12 months.
- [ ] Dependency scanning runs on every CI build with documented CVE triage SLAs.
- [ ] Written incident response plan exists and has been exercised at least once.
- [ ] Background-check and security-training process is documented for all employees with production access.
- [ ] Sub-processor list is maintained, reviewed quarterly, and available to customers on request.

## References

- AICPA SOC 2 Trust Services Criteria (2017, updated 2022) — https://www.aicpa-cima.com/resources/download/2017-trust-services-criteria
- Drata SOC 2 Compliance Guide — https://drata.com/compliance-hub/soc-2
- Tod Golding, *Building Multi-Tenant SaaS Architectures* (O'Reilly, 2024) — Chapter on SaaS Operations and Compliance — https://www.oreilly.com/library/view/building-multi-tenant-saas/9781098140632/
