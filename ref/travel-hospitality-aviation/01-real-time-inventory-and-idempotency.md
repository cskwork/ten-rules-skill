# Rule 01 — Real-Time Inventory and Idempotency

> 재고는 순간마다 변한다. 모든 예약 쓰기 작업은 멱등성을 보장해야 한다.
> Inventory is momentary; every booking write must be idempotent.

## Why

Airline seats and hotel rooms are finite, shared resources consumed concurrently by thousands of sessions. A GDS seat count can change between a shopper's search response and their payment confirmation — a window of seconds. Without idempotency keys on every reservation mutation, network retries silently create duplicate bookings, each triggering a real fare charge and a real room hold. The industry standard is to treat availability data as a read-through cache and the actual booking confirmation as the only source of truth.

## How to apply

- Assign a client-generated idempotency key (UUID v4) to every booking, modification, and cancellation request; re-submit the same key on retry rather than generating a new one.
- Treat all availability responses (seat maps, fare quotes, room rates) as point-in-time snapshots with an explicit expiry — store the expiry alongside the quoted price and re-validate at checkout before collecting payment.
- Use optimistic locking or compare-and-swap at the inventory record level; reject conflicting writes with HTTP 409 and surface a "price or availability changed" message, not a generic error.
- Model the booking state machine explicitly: `PENDING` → `CONFIRMED` → `TICKETED` (airlines) or `RESERVED` → `CONFIRMED` (hotels); never skip states.
- Implement distributed locking (e.g., Redis SETNX with TTL) on the seat or room record during the payment window; release the lock on confirmation or timeout.
- Emit an idempotency audit log entry for every write; ops teams need proof of whether a retry was absorbed or executed.

## Checklist

- [ ] Every booking endpoint accepts and stores an idempotency key; duplicate keys return the cached response without re-executing.
- [ ] Quoted prices carry an expiry timestamp; checkout validates the price is still valid before charging.
- [ ] Inventory lock TTL is shorter than the session timeout so abandoned carts release inventory promptly.
- [ ] State machine transitions are enforced in code; invalid transitions return a clear error.
- [ ] Retry logic in all GDS/supplier API clients uses the same idempotency key, not a new one.

## References

- IATA NDC Offers & Orders Architecture — https://www.iata.org/en/programs/airline-distribution/retailing/ndc/
- Amadeus Self-Service APIs developer documentation — https://developers.amadeus.com/
- "Designing Data-Intensive Applications" (Martin Kleppmann, O'Reilly) — https://dataintensive.net/
