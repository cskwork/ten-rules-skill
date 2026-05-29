# Rule 06 — Recommender System Design

> 두 단계 검색 구조로 개인화된 콘텐츠 추천을 제공하고 지속적으로 평가하라.
> Deliver personalized recommendations through a two-stage retrieval architecture and continuously evaluate ranking quality.

## Why

The recommender system is a primary growth and retention lever for streaming platforms: Netflix reports that over 80% of hours watched are driven by recommendations rather than search. A flat, single-stage ranking over an entire catalog of millions of titles is computationally infeasible at request time. The industry-standard solution is a two-stage architecture: a fast candidate retrieval stage (approximate nearest-neighbor over user and item embeddings) followed by a slower, richer reranking stage. Recommending content the user cannot access (wrong territory, DRM-incompatible device, expired license) wastes model capacity and harms trust. Cold-start users (new subscribers) need a separate strategy because collaborative filtering degrades with sparse history.

## How to apply

- Implement a two-stage pipeline: retrieval stage generates O(100-1000) candidates using ANN (Approximate Nearest Neighbor) search over learned item embeddings; ranking stage applies a full feature set (watch history, time-of-day, device, popularity trend) to sort candidates.
- Filter candidates after retrieval but before ranking against entitlement (subscription tier, territory, device DRM compatibility) and content policy (age rating vs. user profile) to avoid surfacing inaccessible content.
- Use implicit feedback signals (completion rate, rewatches, shares, explicit thumbs) for model training; do not use only binary watch/not-watch because viewing duration is far more signal-rich.
- Implement a cold-start strategy for new users: show popularity-ranked content filtered by stated preferences or onboarding survey answers until sufficient implicit signal accumulates.
- Evaluate recommendation quality offline with holdout sets (precision@K, NDCG) and online with A/B tests measuring long-session engagement, return visit rate, and downstream subscription renewal rate — not just click-through rate.

## Checklist

- [ ] Two-stage retrieval-then-ranking pipeline is in place; single-stage full-catalog ranking is not used at request time.
- [ ] Entitlement and content policy filtering runs after candidate retrieval, before ranking.
- [ ] Model training uses watch duration and completion rate as primary signals.
- [ ] Cold-start path is implemented for new users and new content items.
- [ ] Recommendation quality is measured with online A/B tests; CTR alone is not the sole metric.

## References

- Charu C. Aggarwal, "Recommender Systems: The Textbook" (Springer, 2016) — https://www.amazon.com/Recommender-Systems-Textbook-Charu-Aggarwal/dp/3319296574
- Koren, Y., "Collaborative Filtering with Temporal Dynamics" (KDD 2009) — https://dl.acm.org/doi/10.1145/1557019.1557072
- Netflix Tech Blog, "System Architectures for Personalization and Recommendation" — https://netflixtechblog.com/system-architectures-for-personalization-and-recommendation-e081aa94b5d8
- ACM, "Streaming Recommender Systems" (WWW 2017) — https://dl.acm.org/doi/10.1145/3038912.3052627
