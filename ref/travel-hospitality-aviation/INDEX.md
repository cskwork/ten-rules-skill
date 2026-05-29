# Travel, Hospitality & Aviation — 10 Rules (index)

Source: IATA NDC/Airline Retailing standards (iata.org), ACI World Airport Service Quality program (aci.aero), PCI DSS 4.0 (pcisecuritystandards.org), US DOT Air Carrier Access Act / WCAG 2.0 AA requirements, EU GDPR and PNR Directive (2016/681), and Amadeus/Sabre GDS technical documentation. Building sites and software for this industry means operating at the intersection of real-time distributed inventory, multi-party supply chains (GDS, PMS, CRS, NDC), strict government data-sharing mandates, and travelers who make high-value, time-sensitive purchases with zero tolerance for ambiguity.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-real-time-inventory-and-idempotency.md` | Treat inventory as ephemeral; writes must be idempotent | Seat selection, room availability, booking engine, fare search |
| 02 | `02-iata-ndc-and-offers-orders-model.md` | Model fares as Offers; confirm as Orders per NDC schema | Airline distribution, ancillary upsell, GDS/NDC integration |
| 03 | `03-pnr-and-data-privacy-compliance.md` | Collect PNR minimally; enforce GDPR and PNR Directive lifecycle | Passenger data storage, booking records, government data feeds |
| 04 | `04-pci-dss-payment-isolation.md` | Isolate card data at every channel handoff; scope to PCI DSS 4.0 | Payment flows, OTA checkout, hotel direct booking, GDS ticketing |
| 05 | `05-disruption-and-irregular-ops-handling.md` | Propagate disruption state in real time; reaccommodate before notifying | Flight operations, delay/cancel flows, hotel overbooking, rebooking |
| 06 | `06-rate-parity-and-revenue-management.md` | Sync pricing across all channels atomically; never allow silent parity breaks | Hotel channel manager, dynamic pricing, OTA rate feeds |
| 07 | `07-gds-and-multi-source-content-aggregation.md` | Normalize heterogeneous supplier content to a canonical schema before display | GDS integration, multi-source hotel content, metasearch feeds |
| 08 | `08-accessibility-acaa-and-wcag.md` | Meet WCAG 2.0 AA and Air Carrier Access Act on all booking surfaces | Airline/airport websites, kiosks, mobile apps, seat-map UI |
| 09 | `09-ancillary-and-upsell-merchandising.md` | Present ancillaries in context; never bury fees in confirmation | Baggage, seat upgrades, meals, insurance, hotel add-ons |
| 10 | `10-search-performance-and-cache-strategy.md` | Cache availability responses with explicit TTLs; never serve stale fares as bookable | Fare/rate search, low-price calendar, availability widgets |

Default for "build or change a booking engine or availability search": read 01, 02, 07, 10 at minimum.
