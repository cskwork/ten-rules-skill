# Rule 02 — Inventory State as Single Source of Truth

> 재고 상태는 하나의 원천에서만 관리하라.
> Every channel reads from and writes to one authoritative inventory record; no channel keeps its own copy.

## Why

Overselling — accepting orders for stock that does not exist — destroys customer trust and triggers costly cancellation, apology, and refund workflows. In multi-channel retail (storefront, marketplace, POS, mobile app), each channel that maintains its own stock counter guarantees eventual divergence. The industry target for inventory accuracy is 95–99%; below that, stockout and oversell rates rise non-linearly. Unlike most data, inventory state changes in real time during flash sales: a decrement operation that is not atomic (read-then-write) will race under concurrent load and double-sell the last unit.

## How to apply

- Model inventory as an event log (reserve, confirm, release, adjust) rather than a mutable counter; derive current stock from the log to enable auditability and replay.
- Use database-level atomic decrements (e.g., `UPDATE inventory SET qty = qty - 1 WHERE qty > 0 AND sku = ?`) or optimistic locking with a version counter to prevent oversell races.
- Expose one inventory service or API; all channels — web, mobile, marketplace connectors, POS — read and write through it, never directly to the underlying table.
- Display availability states explicitly on the product page: "In Stock", "Only 3 left", "Ships in 5–7 days", "Out of Stock — notify me". Never display a stale number you cannot guarantee.
- Reserve stock at add-to-cart with a short TTL (e.g., 15 minutes) and release the reservation if checkout does not complete within that window.
- Reconcile physical counts against the system record on a defined cycle (daily for high-velocity SKUs, weekly for long-tail).

## Checklist

- [ ] Inventory decrements are atomic; no read-modify-write outside a transaction or CAS operation.
- [ ] A single inventory service is the write authority; no channel writes stock directly to a separate store.
- [ ] Cart-stage stock reservations expire automatically if not confirmed by a completed order.
- [ ] Product pages show meaningful availability text, not raw integers copied from a warehouse field.
- [ ] Inventory accuracy is measured and reported (target: 95% or above).

## References

- Baymard Institute — Product Page UX (availability communication) — https://baymard.com/research/product-page
- GS1 — Inventory Management Best Practices for Retail — https://www.gs1.org/industries/retail
- Martin Fowler — Event Sourcing (event-log pattern for mutable state) — https://martinfowler.com/eaaDev/EventSourcing.html
