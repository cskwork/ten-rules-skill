# Rule 01 — Regulatory Compliance by Design

> 규정 준수는 출시 후 패치가 아니라 시스템 설계의 핵심에 있어야 한다.
> Compliance must live at the core of system design, not applied as a post-launch patch.

## Why

Insurance is licensed and regulated state by state in the US; every rate, form, and underwriting rule must be filed and approved before use. A product shipped without embedded compliance controls will trigger regulatory action, require expensive re-filings, and can result in market withdrawal. The NAIC AI Model Bulletin (adopted by over half of US states as of 2026) adds a governance layer requiring written AI programs, third-party vendor oversight, and consumer notice — all of which must be code-level capabilities, not policy documents alone. The cost of retrofitting compliance into a live system dwarfs the cost of building it in from day one.

## How to apply

- Represent each state's approved rate tables and form versions as first-class data entities, not hardcoded constants; deploy by jurisdiction.
- Build a rate/form filing workflow that gates product availability per state to approved-only versions; block production traffic to unapproved combinations.
- For any AI or algorithmic decision (underwriting, pricing, claims), log the model version, input features, and output with a tamper-evident audit trail.
- Implement the NAIC Insurance Data Security Model Law (#668) controls — information security program, cybersecurity event investigation, commissioner notification — as platform capabilities.
- Include a regulatory change log in the product roadmap; assign ownership to track NAIC model law adoptions per state and translate them into engineering tickets.

## Checklist

- [ ] Each state where coverage is offered has its own approved rate/form version in the system and cannot serve unapproved combinations.
- [ ] All algorithmic underwriting or pricing decisions are logged with model version, inputs, and output for regulator examination.
- [ ] An information security program meeting NAIC Model Law #668 is documented and technically enforced (encryption at rest and in transit, access controls, incident response).
- [ ] The AI governance program (per NAIC AI Model Bulletin) is implemented as operational controls in code, not only in policy documents.
- [ ] A process exists to monitor NAIC model law state adoption and convert new requirements to engineering work items.

## References

- NAIC Model Laws — https://content.naic.org/model-laws
- NAIC Insurance Data Security Model Law (#668) — https://content.naic.org/sites/default/files/government-affairs-brief-data-security-model-law.pdf
- NAIC Model Bulletin on the Use of Artificial Intelligence — https://content.naic.org/insurance-topics/artificial-intelligence
- *Insurance Technology: Navigating the Innovation, Risk, and Future of Insurance*, Steven Haynes (Elsevier, 2024) — https://www.amazon.com/dp/0443439729
