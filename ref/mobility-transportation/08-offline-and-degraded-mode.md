# Rule 08 — Offline and Degraded-Mode Operation

> 신호가 없는 순간에도 기사와 승객은 이동을 완료할 수 있어야 한다.
> Even without a signal, driver and passenger must be able to complete the trip.

## Why

Mobility apps operate in environments where connectivity is structurally unreliable: tunnels, rural roads, parking garages, stadiums on event nights, and international roaming. A driver whose app loses connection mid-trip must still be able to navigate and complete the fare; a rider in a tunnel must not see the trip silently drop. Unlike a social media app where offline simply means stale content, a transportation app handles an in-progress financial transaction and a safety-critical physical journey. Any unhandled offline edge case that results in an incomplete trip, a lost fare, or a driver unable to end a ride creates both a financial dispute and a support escalation.

## How to apply

- Cache the full active trip state (route, fare parameters, driver/rider contact) on-device at trip start; the app must operate the navigation and metering functions offline for at least 30 minutes without server contact.
- Use an optimistic local state machine for trip events (pickup confirmed, trip started, trip ended); sync events to the server with idempotent retry when connectivity returns — never require a round-trip to the server to advance trip state.
- Pre-download map tiles for the active route at trip start so the navigation map renders without a network request during the trip.
- Implement a graceful degradation banner: when the driver app detects offline state, show a clear indicator and switch navigation to the locally cached route; do not silently freeze.
- For payment, store a trip-end payload locally and retry submission with exponential backoff; do not charge the rider until server acknowledgment is received, but do not block trip completion on payment submission.

## Checklist

- [ ] Active trip state is fully cached on-device at trip start.
- [ ] Trip can be started, progressed, and ended locally without server connectivity.
- [ ] Map tiles for the active route are pre-fetched and available offline.
- [ ] Offline indicator is shown to the driver; app does not silently freeze or crash.
- [ ] Trip-end payment payload retries with idempotent key; no duplicate charges on reconnect.

## References

- GTFS Realtime Best Practices — feed consumers should handle feed unavailability gracefully — https://gtfs.org/documentation/realtime/best-practices/
- OECD MaaS Data Architecture — resilience and fallback recommendations — https://www.oecd.org/en/publications/mix-and-maas-data-architecture-for-mobility-as-a-service_4272475b-en.html
- OSRM HTTP API Documentation — local routing for offline navigation — https://project-osrm.org/docs/v5.24.0/api/
