# Rule 08 — Network Effects and Retention: Optimize for DAU/MAU Stickiness, Not Vanity Metrics

> 가입자 수는 허영이고, 재방문율이 진실이다. 네트워크 효과는 습관에서 나온다.
> Registrations are vanity; return rate is truth. Network effects are built from habits, not headcounts.

## Why

Community platforms derive their defensibility from network effects — the value each user gets increases as more users participate (Metcalfe's Law: value scales as N²; Reed's Law: group-forming networks scale as 2^N). But network effects only compound if users return. DAU/MAU — the ratio of daily active users to monthly active users — is the industry-standard stickiness measure: WhatsApp reached 72%, the average social platform sits between 10–20%. A platform can show impressive MAU growth while its DAU/MAU decays, signaling that the network effect is weakening even as headlines look positive. The engineering and product decisions that drive DAU/MAU are distinct from those that drive sign-ups.

## How to apply

- Track DAU, WAU, MAU, and the DAU/MAU ratio as primary health metrics; report them weekly alongside new registrations so decay is visible before it becomes critical.
- Design the social graph or subscription model so that following/joining a community creates an automatic re-entry reason: new posts from followed communities appear in a notification or digest.
- Implement a smart notification system: batch low-priority signals (weekly digest), send high-priority signals immediately (reply to your post, mention). Never send notifications that do not link to content the recipient has a stake in.
- Build a "re-engagement hook" into the onboarding flow: before a user's first session ends, ensure they have followed at least three communities or three other users — this is the minimum social graph size associated with day-7 retention.
- Set and monitor cohort retention curves (day-1, day-7, day-30) by acquisition channel and onboarding variant; treat a flattening retention curve as a product emergency, not a normal metric.

## Checklist

- [ ] DAU/MAU ratio is instrumented and reported weekly to the product team.
- [ ] Every user who completes registration follows at least one community or user before their session ends.
- [ ] Notification system distinguishes high-priority (immediate) from low-priority (batched) events, with user control over both.
- [ ] Cohort retention curves (D1/D7/D30) are tracked per acquisition channel.
- [ ] Re-engagement email or push campaign is active and measured by return-visit rate, not open rate.

## References

- Metcalfe's Law — https://en.wikipedia.org/wiki/Metcalfe%27s_law
- Reed's Law (David P. Reed, 1999) — https://en.wikipedia.org/wiki/Reed%27s_law
- Andrew Chen, *The Cold Start Problem* (HarperBusiness, 2021) — https://a16z.com/books/the-cold-start-problem/
- Adasight, "The DAU/MAU Ratio: Key Metrics for Assessing User Engagement" — https://www.adasight.com/blog/understanding-the-dau-mau-ratio-key-metrics-for-assessing-user-engagement
