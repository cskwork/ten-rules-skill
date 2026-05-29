# Rule 07 — Connectivity Resilience

> 간헐적 연결은 예외가 아닌 기본 상태로 설계하라
> Treat intermittent connectivity as the normal state, not an edge case.

## Why

Connected devices operate in environments that cloud engineers rarely experience: tunnels, warehouses, remote fields, moving vehicles, and dense urban RF environments where connectivity drops constantly. A device that stops functioning, corrupts state, or loses data during a connectivity gap is unreliable in the field regardless of how well the cloud backend performs. Building offline-first resilience — local queuing, idempotent sync, graceful degradation — is categorically different from handling a cloud service outage and must be baked into the device and gateway software from the initial design, not retrofitted later. Claire Rowland et al. in "Designing Connected Products" identify intermittent connectivity as the single most common source of poor IoT user experience.

## How to apply

- Implement a store-and-forward queue on the device or gateway: buffer outbound messages to persistent storage (not only RAM) so they survive power cycles and are delivered in order once connectivity resumes.
- Use exponential backoff with jitter on all reconnection attempts; cap the maximum interval and add a ceiling to prevent infinite retry storms when the broker is genuinely unavailable.
- Define and test three states explicitly: fully connected, degraded (connected but high latency / packet loss), and offline. Each state must have a defined behavior for UI, alerting, and data handling.
- Make all cloud sync operations idempotent: if the device resends a buffered batch, the backend must deduplicate by message ID rather than double-counting.
- For cellular and LPWAN links, implement heartbeat intervals tuned to network keep-alive requirements; detect silent disconnects via Last Will and Testament and missed heartbeats, not only TCP errors.

## Checklist

- [ ] Store-and-forward queue writes to persistent storage (survives reboot).
- [ ] Reconnection logic uses exponential backoff with jitter; maximum interval is capped.
- [ ] All cloud ingestion endpoints are idempotent with deduplication by message ID.
- [ ] Three connectivity states (online / degraded / offline) are tested and have documented device behavior.
- [ ] LWT messages are configured and tested by pulling the network cable and observing platform alert.

## References

- Claire Rowland, Elizabeth Goodman, Martin Charlier — "Designing Connected Products: UX for the Consumer Internet of Things" (O'Reilly, 2015) — https://www.oreilly.com/library/view/designing-connected-products/9781449372682/
- AWS IoT Core Connectivity and Message Broker — https://docs.aws.amazon.com/iot/latest/developerguide/iot-message-broker.html
- OASIS MQTT v5.0 (Last Will and Testament, Session Expiry) — https://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html
- Azure IoT Hub Reliability Best Practices — https://learn.microsoft.com/en-us/azure/well-architected/service-guides/azure-iot-hub
