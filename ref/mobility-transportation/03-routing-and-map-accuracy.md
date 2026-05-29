# Rule 03 — Routing and Map Accuracy

> 직선 거리로 경로를 계산하면 승객과 기사 모두 길을 잃는다.
> Calculating routes with straight-line distance loses both passenger and driver.

## Why

Transportation apps make navigation commitments: the ETA shown to a rider and the turn-by-turn given to a driver must reflect actual road topology, one-way streets, turn restrictions, speed limits, and live traffic. Straight-line (Haversine) distance is only appropriate for proximity searches, never for route calculation. OSRM (Open Source Routing Machine), built on OpenStreetMap data, delivers sub-millisecond route queries on continental road networks using contraction hierarchies — making it the reference open-source engine for this vertical. Map inaccuracy in transit creates cascading failures: an incorrect turn restriction causes a driver to circle the block, inflating the fare and the ETA simultaneously, which triggers support tickets and chargebacks.

## How to apply

- Use a road-network routing engine (OSRM, Valhalla, or a commercial equivalent such as Google Routes API / HERE Routing) for all ETA calculations and driver navigation; never use Haversine for anything the user sees.
- Snap driver GPS coordinates to the nearest road segment (map-matching) before displaying position or computing ETA; raw GPS traces are noisy and will show drivers driving through buildings.
- Separate routing profiles by vehicle type: car, motorcycle, bicycle, accessible vehicle (avoid narrow lanes), and heavy vehicle (bridge weight limits) — OSRM supports custom Lua profiles.
- Cache route responses at the (origin-cell, destination-cell, time-of-day-bucket) level; a 30-second TTL eliminates most redundant queries without staleness risk.
- Monitor route quality with a shadow comparison: log the planned route vs the GPS trace driven and alert when divergence exceeds a threshold — this surfaces outdated map data.

## Checklist

- [ ] All ETA calculations use road-network routing, not straight-line distance.
- [ ] Driver positions are map-matched to road segments before display or ETA use.
- [ ] Routing profiles exist for each vehicle type the platform supports.
- [ ] Route cache TTL is set and cache hit rate is monitored.
- [ ] Route vs. actual trace divergence metric is logged and alerted.

## References

- OSRM HTTP API Documentation — project-osrm.org — https://project-osrm.org/docs/v5.24.0/api/
- OSRM GitHub — Project-OSRM/osrm-backend — https://github.com/Project-OSRM/osrm-backend
- OpenStreetMap Wiki — Open Source Routing Machine — https://wiki.openstreetmap.org/wiki/Open_Source_Routing_Machine
