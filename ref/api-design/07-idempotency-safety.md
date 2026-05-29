# Rule 07 — Make Operations Safe to Retry

> 재시도해도 안전하게. 멱등성으로 중복 실행을 막아라.
> Make operations safe to retry; use idempotency to prevent duplicate effects.

## Why

Networks fail mid-request, so clients retry, and without protection a retried POST can charge a card or create an order twice. Stripe popularized the idempotency-key pattern: the client sends a unique key, the server records the first outcome and replays it for any retry with the same key. This turns an unreliable network into exactly-once semantics, which is non-negotiable for payments and any state-changing call.

## How to apply

- Accept an `Idempotency-Key` header on non-idempotent operations (notably POST that creates resources).
- Store the key with the request fingerprint and the saved response; replay the stored result on retry.
- Reject a reused key whose request parameters differ, to catch accidental key collisions.
- Keep GET/PUT/DELETE naturally idempotent so they need no key (Rule 03).
- Define key retention (e.g. 24 hours) and require clients to generate fresh keys per logical operation.

## Checklist

- [ ] State-changing POST endpoints accept and honor an idempotency key
- [ ] A retried request with the same key returns the original result, not a duplicate effect
- [ ] Reusing a key with different parameters is rejected
- [ ] Key storage has a documented retention window

## References

- Stripe — Idempotent requests — https://docs.stripe.com/api/idempotent_requests
- Stripe Blog — Designing robust and predictable APIs with idempotency — https://stripe.com/blog/idempotency
