# Rule 03 — Test Early and Test Often

> 크게 한 번보다 작게 자주 테스트하라. 빠른 반복이 완벽한 한 방을 이긴다.
> Many small tests beat one big study; iterate early and often.

## Why

Nielsen Norman Group's "Why You Only Need to Test with 5 Users" shows that five participants can surface roughly 85% of the most evident usability problems (assuming each problem has a high chance of being seen in a session), so running three small tests reveals more than one large one. Steve Krug's "rocket surgery" approach makes testing cheap enough to do monthly. Catching issues before code ships is dramatically cheaper than after launch.

## How to apply

- Test the riskiest assumption with about 5 users, fix the top issues, then test again.
- Test paper sketches, prototypes, and competitors, not only finished builds.
- Schedule recurring lightweight sessions (e.g., a morning a month) rather than one annual study.
- Fix the most serious problems between rounds so each round finds new issues.
- Keep sessions short and informal; lower ceremony means more rounds get run.

## Checklist

- [ ] Testing happens on a recurring cadence, not once per release
- [ ] At least one round used a prototype or sketch, not finished product
- [ ] Top issues from each round are fixed before the next round
- [ ] Per-round participant count stays small (around 5 for qualitative)

## References

- Nielsen Norman Group, Why You Only Need to Test with 5 Users — https://www.nngroup.com/articles/why-you-only-need-to-test-with-5-users/
- Steve Krug, Rocket Surgery Made Easy — https://sensible.com/rocket-surgery-made-easy/
