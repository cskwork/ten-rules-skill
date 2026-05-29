# Rule 04 — Retrieval Practice Engine (Spaced Repetition)

> 배움은 다시 꺼내는 연습에서 굳어진다. 간격을 두고 반복 출제하라.
> Learning solidifies through retrieval practice; schedule repeated testing at expanding intervals.

## Why

Brown, Roediger, and McDaniel's *Make It Stick: The Science of Successful Learning* (Harvard University Press, 2014) synthesizes decades of cognitive science showing that retrieval practice (testing oneself) produces far stronger long-term retention than re-reading or re-watching. Spaced repetition — increasing the interval between review sessions — multiplies this effect. EdTech platforms that rely on passive consumption (video-watch = lesson complete) produce fast forgetting curves and poor real-world skill transfer, which erodes learner outcomes, damages Net Promoter Score, and undermines enterprise renewal rates.

## How to apply

- Implement a spaced-repetition scheduler: after a learner answers a question correctly, schedule the next review at an expanding interval (e.g., 1 day, 3 days, 1 week, 2 weeks); reset the interval on an incorrect answer.
- Surface low-stakes retrieval questions at the start of each new lesson covering prior material (interleaving), not only at the end of a unit.
- Do not mark a concept "mastered" on a single correct answer; require a minimum of two correct retrievals at spaced intervals before the concept exits the review queue.
- Provide learners with visible mastery state per concept so they understand why they are being re-tested; frame it as "strengthening" not "failing."
- Store per-learner item-level response history (item ID, timestamp, response, correctness) to power the scheduler; do not collapse this to a single score.

## Checklist

- [ ] Spaced-repetition interval algorithm implemented and unit-tested for correct interval expansion and reset on failure
- [ ] Retrieval questions appear at lesson start (prior concepts) and lesson end (current concepts)
- [ ] Mastery threshold requires at least two spaced correct retrievals, not one
- [ ] Per-item response history stored at the database level (not aggregated)
- [ ] Learner-facing mastery UI clearly explains the review schedule rationale

## References

- Peter C. Brown, Henry L. Roediger III, Mark A. McDaniel — *Make It Stick: The Science of Successful Learning* (2014, Harvard University Press) — https://www.amazon.com/Make-Stick-Science-Successful-Learning/dp/0674729013
- Harvard University Press — *Make It Stick* book page — https://www.hup.harvard.edu/books/9780674729018
- Roediger, H.L. & Karpicke, J.D. — "Test-Enhanced Learning" (Psychological Science, 2006) — https://journals.sagepub.com/doi/10.1111/j.1467-9280.2006.01693.x
