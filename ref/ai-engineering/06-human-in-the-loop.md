# Rule 06 — Keep a Human in the Loop for High-Stakes Actions

> 위험이 큰 행동에는 사람을 반드시 끼워라.
> Keep a human in the loop for high-stakes actions.

## Why

LLM outputs are probabilistic, so any irreversible or consequential action they trigger carries real-world risk that no eval fully eliminates. The NIST AI RMF stresses human oversight and accountability proportional to potential harm. Automation is appropriate for low-stakes, reversible work; spending money, sending communications, deleting data, or taking legal/medical actions demands human confirmation.

## How to apply

- Classify actions by stakes and reversibility; automate only the low-stakes, reversible tier.
- Require explicit human approval before irreversible or high-impact actions execute.
- Show the human the evidence, the proposed action, and a clear reject path, not just an "OK" button.
- Make actions auditable and reversible where possible (dry-run, undo, soft-delete).
- Escalate to a human on low confidence, guardrail flags, or out-of-distribution inputs.

## Checklist

- [ ] Actions are tiered by stakes and reversibility
- [ ] High-stakes actions require explicit human approval
- [ ] Approval surfaces show evidence and a reject option
- [ ] Low-confidence or flagged cases escalate to a human

## References

- NIST AI Risk Management Framework — https://www.nist.gov/itl/ai-risk-management-framework
- NIST AI RMF Playbook — https://airc.nist.gov/AI_RMF_Knowledge_Base/Playbook
