# Rule 06 — Make Every EDI and API Exchange Idempotent

> EDI와 API 메시지는 중복 수신되어도 결과가 동일해야 한다. 물류 시스템은 재전송을 당연한 조건으로 설계해야 한다.
> Every inbound EDI transaction and carrier API call must produce identical results when received more than once; duplicate delivery is the normal case in logistics networks, not the exception.

## Why

Logistics EDI networks (VAN, AS2, SFTP) do not guarantee exactly-once delivery. Carriers retransmit EDI 214 status messages when they don't receive functional acknowledgments; 3PLs replay 856 ASNs after network failures; carrier APIs time out and clients retry. A non-idempotent integration will double-count inventory receipts, duplicate shipment records, fire duplicate customer notifications, and generate phantom charges. The GS1 EDI standard assigns a unique ISA control number to every interchange and a transaction set control number to every transaction specifically so that recipients can detect and discard duplicates — but most implementations ignore this. At the scale of a mid-size logistics operation (tens of thousands of transactions daily), duplicate events are a daily occurrence, not an edge case.

## How to apply

- Extract the ISA/GS/ST control numbers from every inbound EDI document and store them as a deduplication key before processing; reject or discard any transaction with a previously seen key.
- For REST/webhook integrations, require senders to include an idempotency key (UUID) in a request header; record processed keys with a TTL that covers the retry window (typically 24-72 hours).
- Design inbound processing as upsert operations against a natural business key (e.g., PRO number + carrier SCAC for 214 events) rather than blind inserts.
- Publish outbound messages with a stable message ID derived from the business event (e.g., SHA-256 of shipment ID + event type + event timestamp); downstream consumers can deduplicate on the same key.
- Test idempotency explicitly: replay every integration test scenario twice and assert that the second replay produces no change to state.

## Checklist

- [ ] Every inbound EDI transaction is deduplicated on ISA/GS/ST control numbers before processing.
- [ ] Inbound REST webhooks honour an idempotency-key header and track seen keys.
- [ ] All write operations against shipment, inventory, and billing records use upsert on natural business keys, not blind insert.
- [ ] Integration tests include a "replay" pass that asserts idempotency.
- [ ] Deduplication key store has an explicit TTL and is monitored for growth.

## References

- GS1 EDI Standard — ISA/GS/ST control number structure — https://www.gs1.org/standards/edi
- GS1 EDI Message Implementation Guidelines — https://www.gs1.org/standards/edi/guidelines
- ASCM SCOR Digital Standard v14 — Source and Deliver process integration — https://scor.ascm.org/
- Martin Christopher, "Logistics and Supply Chain Management" 6th ed., Pearson 2022 — https://www.pearson.com/en-us/subject-catalog/p/logistics-and-supply-chain-management/P200000007134/9781292416205
