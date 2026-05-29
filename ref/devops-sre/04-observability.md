# Rule 04 — Make Systems Observable

> 추측하지 말고 계측하라. 지표, 로그, 추적으로 시스템을 들여다보라.
> Do not guess, instrument: see the system through metrics, logs, and traces.

## Why

You cannot operate, debug, or set an SLO for a system you cannot see. Observability is the property of being able to ask new questions of a running system without shipping new code, built on the three pillars: metrics, logs, and traces. The Google SRE Book ties monitoring directly to SLOs, and OpenTelemetry is now the vendor-neutral standard for emitting this telemetry, so instrumentation is no longer optional plumbing.

## How to apply

- Instrument code with OpenTelemetry so telemetry is portable across backends.
- Cover the RED method for request-driven services: Rate, Errors, Duration.
- Emit structured logs (key-value or JSON) with correlation/trace IDs, never bare strings, and never log secrets or PII.
- Propagate a trace context across service boundaries so a single request is followable end to end.
- Alert on symptoms users feel (SLO burn) rather than on every internal cause.

## Checklist

- [ ] Metrics, logs, and traces exist for every critical service
- [ ] A request is traceable end to end via a propagated correlation ID
- [ ] Logs are structured and free of secrets and PII
- [ ] Alerts fire on user-facing symptoms, not on noise

## References

- OpenTelemetry — https://opentelemetry.io/docs/
- Google SRE — Monitoring Distributed Systems — https://sre.google/sre-book/monitoring-distributed-systems/
