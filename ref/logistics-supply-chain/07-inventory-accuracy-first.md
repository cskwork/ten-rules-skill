# Rule 07 — Treat Inventory Accuracy as a Safety-Critical Property

> 재고 정확도는 선택 사항이 아니다. 1%의 오차도 주문 이행과 고객 신뢰를 무너뜨린다.
> Inventory accuracy is not a reporting metric; a 1% discrepancy at scale means thousands of mis-ships, stockouts, and customer failures every day.

## Why

Every downstream process in a fulfillment operation — order promising, wave planning, replenishment, purchase ordering — depends on the WMS inventory as ground truth. When the system says a location holds 50 units and it actually holds 43, wave plans fail mid-pick, customer orders are promised against phantom stock, and carrier pickups arrive at empty docks. ASCM SCOR measures Source and Deliver process quality in part through inventory accuracy; industry benchmarks target 99.5%+ for high-performing DCs. The WMS is the last authoritative record between a supplier's shipment and a customer's delivery — there is no fallback system to correct its errors in real time.

## How to apply

- Enforce scan-confirm at every physical movement: inbound receipt, putaway, replenishment move, pick, pack, and ship. The system must not update location quantity without a scan event or explicit manual adjustment with reason code.
- Implement directed cycle-counting as a continuous background process: rank locations by velocity, days-since-last-count, and discrepancy history; automatically generate count tasks for operators rather than waiting for annual physical inventory.
- When a picker cannot find expected inventory (short-pick), force a system-recorded exception with reason code; never silently reduce the quantity and continue — surface the discrepancy immediately for investigation.
- Require a dual-count confirmation for any manual inventory adjustment above a configurable threshold (e.g., >10 units or >$500 value) before the adjustment posts to the ledger.
- Integrate WMS on-hand quantities with upstream ERP and downstream order management on every transaction, not on batch sync; stale OMS inventory feeds are a primary cause of overselling.

## Checklist

- [ ] Every physical inventory movement is gated by a scan event; no quantity changes without attribution.
- [ ] Cycle-count tasks are system-generated continuously and prioritised by risk score.
- [ ] Short-pick exceptions are recorded with reason code and routed to a supervisor queue — not auto-resolved.
- [ ] Manual adjustments above threshold require dual-count confirmation before posting.
- [ ] WMS inventory syncs to OMS and ERP on every transaction; batch-only sync intervals are documented and capped.

## References

- ASCM SCOR Digital Standard v14 — Source process, inventory management metrics — https://scor.ascm.org/
- Martin Christopher, "Logistics and Supply Chain Management" 6th ed., Pearson 2022 — https://www.pearson.com/en-us/subject-catalog/p/logistics-and-supply-chain-management/P200000007134/9781292416205
- ASCM — ASCM Dictionary (WMS, inventory accuracy, cycle count definitions) — https://www.ascm.org/additional-resources/ascm-dictionary/
