# Rule 01 — Cold Start: Seed the Atomic Network

> 가장 작은 가치 있는 네트워크를 먼저 채워라. 빈 광장에는 아무도 오지 않는다.
> Seed the smallest network that can sustain itself before opening to everyone.

## Why

An empty community is self-reinforcing failure: new visitors see no content, leave immediately, and the network never tips. Andrew Chen's cold-start theory shows that every successful network platform first found an "atomic network" — the minimum cluster of users that makes the product valuable to all members within it. For social platforms, launching to a general audience before this cluster exists guarantees churn that compounds. The cold-start problem is not a launch problem; it is a product-design problem that must be solved architecturally.

## How to apply

- Define your atomic network size before writing onboarding code: for a forum it may be 50 active posters in one niche; for a group-chat product it may be a single team of three.
- Constrain early access to a single topic, geography, school, or interest cluster — do not open all categories on day one.
- Use invite-only or waitlist mechanics to let the first cohort form social bonds before the platform scales; this raises content density and perceived activity for later arrivals.
- Pre-seed anchor content (staff posts, imported Q&A, curated links) so that the first organic visitor sees a live community, not a blank slate.
- Instrument "atomic network health" as a leading metric: track whether small clusters (e.g., sub-communities, channels, groups) cross a retention threshold before you promote them to wider discovery.

## Checklist

- [ ] Atomic network size is defined and documented for each community type the platform supports.
- [ ] Onboarding flow routes new users into an active sub-community, not an empty global feed.
- [ ] Pre-seeded content or staff presence exists in every newly created space until organic posts exceed a defined threshold.
- [ ] Launch rollout plan targets one dense cluster first rather than a broad geographic or demographic slice.
- [ ] Cold-start metrics (posts per new group per week, day-7 retention by cohort size) are instrumented before launch.

## References

- Andrew Chen, *The Cold Start Problem: How to Start and Scale Network Effects* (HarperBusiness, 2021) — https://a16z.com/books/the-cold-start-problem/
- Andrew Chen, "Chapter One: Cold Start" (public excerpt) — https://andrewchen.com/chapter-one-cold-start/
- Robert E. Kraut and Paul Resnick, *Building Successful Online Communities: Evidence-Based Social Design* (MIT Press, 2012) — https://mitpress.mit.edu/9780262528917/building-successful-online-communities/
