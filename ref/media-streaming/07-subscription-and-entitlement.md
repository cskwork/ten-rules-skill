# Rule 07 — Subscription and Entitlement

> 모든 콘텐츠 접근 요청을 구독 자격 확인 게이트를 통과시켜라.
> Route every content access request through a subscription entitlement gate before any asset is served.

## Why

Entitlement enforcement is the revenue gate of a streaming platform: every bypass is a direct revenue loss and potential licensing violation. Entitlement is more complex than a simple "is subscribed?" check: a user may have multiple profiles under a household plan, access a subset of the catalog on a cheaper ad-supported tier, be in a free-trial window, or have individual TVOD (Transactional Video on Demand) purchases on top of an SVOD subscription. License agreements with content owners specify exactly which rights (territory, resolution, tier) must be enforced; failure is a contract breach. Entitlement must be resolved at playback request time, not at browse time, because subscriptions can lapse between browse and play.

## How to apply

- Model entitlement as a set of grants: each grant links a user account to a content item (or collection), a resolution ceiling (SD/HD/4K), a territory list, an expiry time, and a DRM security level. Never derive entitlement from session state alone.
- Resolve entitlement at playback token request time (not at browse/search time); issue a short-lived, signed playback token (JWT or equivalent, 15-30 minute TTL) that encodes the resolved entitlement; downstream services (license server, CDN token auth) validate this token, not the subscription database.
- Design subscription tiers as data, not code: tier capabilities (resolution, simultaneous streams, download, ad-free) are stored in a configuration table, not hardcoded in conditional logic; adding a new tier requires no code deploy.
- Implement a concurrent stream limit check at playback start; issue unique stream session tokens and reject a new stream when the limit for the plan is reached, to comply with household-sharing license terms.
- Separate billing state (payment succeeded / failed / grace period) from entitlement state; a user in a grace period should retain access for a defined window (e.g., 7 days) rather than being immediately locked out.

## Checklist

- [ ] Entitlement is resolved at playback token issuance, not at browse time.
- [ ] Playback tokens are short-lived (< 30 minutes) and signed; downstream services validate signatures.
- [ ] Subscription tier capabilities are data-driven, not hardcoded in application conditionals.
- [ ] Concurrent stream limit is enforced using unique session tokens, not IP checks.
- [ ] Grace period for failed payments is implemented; duration is configurable per plan.

## References

- Tien Tzuo & Gabe Weisert, "Subscribed: Why the Subscription Model Will Be Your Company's Future" (Portfolio, 2018) — https://www.amazon.com/Subscribed-Subscription-Model-Companys-Future/dp/0525536469
- Zuora, "Subscription Economy Index" — https://www.zuora.com/resource/subscription-economy-index/
- Netflix Tech Blog, "Keystone: Real-Time Stream Processing Platform" (entitlement event sourcing) — https://netflixtechblog.com/keystone-real-time-stream-processing-platform-a3ee651812a
