# Rule 02 — Idempotent Payment Operations

> 결제 요청은 네트워크 오류로 인해 재시도되더라도 단 한 번만 처리되어야 한다.
> A payment request must be processed exactly once, even when retried after a network failure.

## Why

Payment networks, mobile clients, and orchestration services all retry on timeout or connection loss. Without idempotency, a retry charges the customer twice, debits the sender twice, or creates duplicate refunds — all of which cause real financial harm and require expensive manual remediation. The Stripe API design blog (stripe.com) codified this pattern for the industry: every mutating operation accepts a client-supplied idempotency key, and the server returns the cached response for any key it has already processed. This is now a baseline expectation for any payment or transfer API.

## How to apply

- Accept an idempotency key (e.g., `Idempotency-Key` header) on every POST endpoint that creates or mutates a financial resource.
- Store (key, status, response_body) in a fast durable store (Redis with AOF persistence, or a DB table) on first receipt.
- On a duplicate key: return the stored response without re-executing the operation; return the same HTTP status code as the original.
- Generate keys as UUIDs v4 on the client side; never derive them from user PII or amounts.
- Set a TTL on stored keys (24 hours is the Stripe convention); after expiry, treat the request as new.
- Apply idempotency at the service boundary, not just the database layer, so that all side effects (ledger entries, webhooks, notifications) are also deduplicated.

## Checklist

- [ ] All payment/transfer/refund POST endpoints accept and enforce an idempotency key.
- [ ] Duplicate keys return the original response without re-posting ledger entries.
- [ ] Idempotency key storage is durable and survives a server restart.
- [ ] Client SDK or documentation specifies UUID v4 for key generation.
- [ ] Load tests confirm no double-charge under concurrent retries of the same key.

## References

- Stripe — "Designing robust and predictable APIs with idempotency" — https://stripe.com/blog/idempotency
- Stripe API Reference — "Idempotent requests" — https://docs.stripe.com/api/idempotent_requests
- System Design Newsletter — "How Stripe Prevents Double Payment Using Idempotent API" — https://newsletter.systemdesign.one/p/idempotent-api
