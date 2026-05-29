# Rule 04 — Surface and Protect the System Constraint

> 병목 자원을 찾아내고, 그 자원의 처리량이 전체 흐름을 결정하게 하라.
> Find the single bottleneck that limits total throughput, then subordinate every other scheduling decision to protecting it.

## Why

Eliyahu Goldratt's Theory of Constraints, validated across decades of manufacturing and distribution operations, proves that a chain is only as strong as its weakest link. In logistics software this means: dock doors, sortation lines, single-lane bridges, customs inspection stations, and fulfillment wave-cut windows are all potential constraints. A TMS or WMS that optimises each local step independently — fastest route per driver, shortest pick path per order — while ignoring the system bottleneck will worsen throughput, not improve it. Scheduling software that does not model constraint capacity will overload the constraint and create cascading delays that no amount of downstream optimisation can recover.

## How to apply

- Model physical capacity constraints explicitly in the data layer: dock doors with time windows and vehicle-type restrictions, sortation-line throughput in units-per-hour, fulfillment-zone pick rates.
- When tendering or scheduling, check constraint availability before committing a slot; return a clear conflict error if the constraint is saturated rather than silently queuing.
- Prioritise highest-throughput work (high-velocity SKUs, time-definite shipments) through the constraint first; Goldratt's drum-buffer-rope model applied to warehouse slotting means placing fast-movers nearest to the constraint (shipping dock).
- Surface constraint utilisation as a first-class operations metric: real-time dock utilisation %, wave completion rate vs. plan, sortation-line throughput vs. rated capacity.
- Trigger alerts and suggest load-shifting options (move appointment, split wave, reroute through alternate facility) before the constraint saturates, not after.

## Checklist

- [ ] Physical capacity constraints (dock doors, sort lines, pick zones) are represented as first-class data entities with throughput limits.
- [ ] Scheduling rejects or warns on over-commitment of a constrained resource before confirmation.
- [ ] High-priority or time-critical work is given preferred access to the constraint.
- [ ] Constraint utilisation is visible in the operations dashboard as a real-time metric.
- [ ] Historical constraint data is available to support capacity-planning decisions.

## References

- Eliyahu M. Goldratt and Jeff Cox, "The Goal: A Process of Ongoing Improvement," North River Press, 40th Anniversary Edition — https://www.amazon.com/Goal-Process-Ongoing-Improvement/dp/0884271951
- Theory of Constraints Institute — https://www.tocinstitute.org/theory-of-constraints.html
- ASCM SCOR Digital Standard v14 — Plan process domain — https://scor.ascm.org/
