# Rule 01 — GTFS and GTFS-Realtime Feed Integrity

> 정확하고 최신의 GTFS 피드 없이는 승객이 시스템을 신뢰할 수 없다.
> Without accurate, current GTFS feeds, passengers cannot trust the system.

## Why

GTFS (General Transit Feed Specification) is the universal interchange format that Google Maps, Apple Maps, and every third-party transit app consume. A malformed or stale feed silently produces wrong schedules, missed transfers, and ghost trips across every downstream consumer simultaneously — a single bad file multiplies into millions of incorrect passenger journeys. GTFS-Realtime extends the static feed with live vehicle positions, trip updates, and service alerts using Protocol Buffers; without it, apps display scheduled times during actual delays, destroying rider trust. Transit agencies publishing to the National Transit Database (NTD) are also subject to FTA data-quality audits, making feed validity a regulatory matter, not only a UX concern.

## How to apply

- Validate every GTFS ZIP against the canonical specification at gtfs.org before publishing, using a tool such as the MobilityData GTFS Validator (github.com/MobilityData/gtfs-validator).
- Automate feed generation on a schedule that matches your operational data update cycle; never hand-edit CSV files in production.
- Publish GTFS-Realtime vehicle positions and trip updates at no more than 30-second intervals; alert feeds may be less frequent but must include an active period range.
- Use feed versioning: include a `feed_info.txt` with `feed_version` and `feed_start_date`/`feed_end_date` so consumers can detect staleness.
- Expose a `/gtfs/static` and `/gtfs/realtime` endpoint with cache-control headers and an ETag; never serve a feed that is older than your stated `feed_end_date`.

## Checklist

- [ ] GTFS ZIP passes MobilityData GTFS Validator with zero errors before each publish.
- [ ] GTFS-Realtime feed updates at least every 30 seconds for vehicle positions.
- [ ] `feed_info.txt` present with `feed_version`, `feed_start_date`, and `feed_end_date`.
- [ ] Feed staleness alert fires if the static feed has not been regenerated within the configured SLA.
- [ ] All required files present: `agency.txt`, `stops.txt`, `routes.txt`, `trips.txt`, `stop_times.txt`, `calendar.txt` or `calendar_dates.txt`.

## References

- GTFS Schedule Reference — MobilityData / gtfs.org — https://gtfs.org/documentation/schedule/reference/
- GTFS Realtime Reference — MobilityData / gtfs.org — https://gtfs.org/documentation/realtime/reference/
- MobilityData GTFS Validator — https://github.com/MobilityData/gtfs-validator
- FTA National Transit Database GTFS Weblinks (2023) — https://www.transit.dot.gov/ntd/data-product/2023-annual-database-general-transit-feed-specification-gtfs-weblinks
