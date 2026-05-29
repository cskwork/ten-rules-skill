# Rule 09 — Eliminate Toil Through Automation

> 반복적이고 가치 없는 수작업은 자동화로 없애라.
> Automate away repetitive, low-value manual work.

## Why

The Google SRE Book defines toil as work that is manual, repetitive, automatable, tactical, devoid of enduring value, and that scales linearly with service growth. Unchecked, toil consumes the engineering time that should go to durable improvements, and it burns out on-call. Google caps toil at roughly 50% of an SRE's time precisely so engineering capacity is protected. Automating toil compounds: each fix frees time to fix the next.

## How to apply

- Measure toil so you know where the hours actually go; you cannot reduce what you do not track.
- Distinguish toil from real engineering and from overhead; only the automatable, value-free repetition is the target.
- Automate the highest-frequency, highest-pain tasks first for the best return.
- Build self-service tooling so routine requests no longer require a human in the loop.
- Cap operational load per person so engineers retain time for project work.

## Checklist

- [ ] Toil is measured, not just complained about
- [ ] The top recurring manual tasks are identified and prioritized for automation
- [ ] Routine operational requests have a self-service path
- [ ] Per-person operational load stays under an agreed ceiling

## References

- Google SRE — Eliminating Toil — https://sre.google/sre-book/eliminating-toil/
- Google SRE Workbook — Eliminating Toil — https://sre.google/workbook/eliminating-toil/
