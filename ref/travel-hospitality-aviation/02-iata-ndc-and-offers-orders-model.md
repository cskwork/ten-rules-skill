# Rule 02 — IATA NDC and the Offers/Orders Model

> NDC 표준에 따라 운임을 오퍼로, 확정된 예약을 오더로 모델링하라.
> Model fares as Offers and confirmed reservations as Orders per the IATA NDC standard.

## Why

The legacy EDIFACT/GDS model encodes airline products as opaque fare basis codes that strip out ancillary content and personalization. IATA's New Distribution Capability (NDC) standard, now at version 21.3/24.1 with the Offers & Orders architecture, decouples product definition from distribution channel. Airlines building direct or indirect channels that ignore NDC will be unable to sell ancillaries (seat upgrades, bags, meals, lounge access) through third-party agents, or will duplicate product logic across every channel. More than 70 airlines have IATA Airline Retailing Maturity (ARM) Index certification as of 2025; travel software that does not support NDC messaging is architecturally obsolete for new airline distribution work.

## How to apply

- Represent a fare quote as an Offer (temporary, owned by the airline, has an OfferID and expiry); never persist fare logic in the OTA/agent layer.
- On booking confirmation, convert the accepted Offer into an Order (permanent record with OrderID); all post-booking operations (change, cancel, reissue) reference the OrderID, not a PNR string.
- When connecting to a GDS that translates NDC messages, confirm which NDC schema version the GDS exposes (21.3 is the most widely deployed as of 2025); map your internal data model to that version, not a proprietary GDS wrapper.
- Implement OrderChange and OrderCancel endpoints symmetrically with OrderCreate; partial order changes (adding one bag to a multi-leg itinerary) are a first-class operation.
- For ancillary merchandising, consume the airline's ServiceList response to display branded ancillary names and images; do not invent ancillary names in the UI layer.

## Checklist

- [ ] OfferIDs and their expiry timestamps are stored and checked before order creation.
- [ ] OrderID is the primary booking reference stored and displayed; PNR is a legacy cross-reference only.
- [ ] NDC schema version is pinned and documented; upgrades are treated as a breaking change requiring regression tests.
- [ ] Ancillary names, icons, and prices come from the airline's ServiceList, not from a local lookup table.
- [ ] OrderChange and OrderCancel are implemented and tested, not deferred as "phase 2."

## References

- IATA NDC fact sheet and standard documentation — https://www.iata.org/en/iata-repository/pressroom/fact-sheets/fact-sheet-ndc/
- IATA Airline Retailing program — https://www.iata.org/en/programs/airline-distribution/retailing/
- IATA Airline Retailing Maturity (ARM) Index — https://www.iata.org/en/programs/airline-distribution/retailing/arm/
