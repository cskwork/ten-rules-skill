# Rule 09 — Model the Order Lifecycle as an Explicit, Auditable State Machine

> 주문 상태는 명시적인 상태 기계로 관리하고 모든 전환 이력을 감사 로그로 남겨라.
> An order that can be in an undefined state between "paid" and "shipped" is an operational and financial liability.

## Why

An order in an e-commerce system passes through a predictable but branching lifecycle: placed, payment authorized, payment captured, picking, packed, shipped, delivered, return requested, returned, refunded — with cancellation possible at several points. When this lifecycle is implicit (status strings set ad-hoc across multiple services), it becomes impossible to enforce which transitions are legal, to audit what happened when a refund dispute arises, or to reason about partial fulfillment or split shipments. Financial reconciliation depends on a correct, auditable record of every state transition and its timestamp. Unlike a user profile or a product record, order state carries legal and financial weight: chargebacks, tax filings, and consumer protection regulations all require you to prove the history.

## How to apply

- Define an explicit enum of order states and an explicit allowed-transitions map; any transition not in the map raises an error rather than silently setting a string field.
- Record every state transition as an immutable event in an `order_events` table: `(order_id, from_state, to_state, actor, reason, timestamp)`; never delete or update these rows.
- Separate payment state from fulfillment state: an order can be "payment captured / fulfillment pending" or "payment captured / partially shipped" — collapsing both into one status field loses information.
- Expose order state to customers in plain language ("Your order is being packed", not "status: PICKING_CONFIRMED") mapped from the internal enum at the presentation layer.
- Implement idempotency on state transition endpoints: a duplicate webhook from a payment processor or shipping carrier must not trigger a second transition.
- Write state machine tests that assert illegal transitions are rejected; do not rely only on happy-path tests.

## Checklist

- [ ] All valid order states and their legal transitions are defined in one place in the codebase.
- [ ] Every state transition is recorded as an immutable event with actor, timestamp, and reason.
- [ ] Payment state and fulfillment state are tracked separately.
- [ ] Duplicate transition requests (same idempotency key) are handled gracefully, not applied twice.
- [ ] Unit tests cover at least three illegal-transition scenarios.

## References

- Nielsen Norman Group — E-commerce User Experience (order transparency) — https://www.nngroup.com/reports/ecommerce-user-experience/
- Martin Fowler — State Machine Pattern — https://martinfowler.com/eaaDev/StateMachine.html
- Stripe — Idempotency in payment systems — https://stripe.com/docs/api/idempotent_requests
