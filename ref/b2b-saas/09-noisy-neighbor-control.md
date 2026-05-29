# Rule 09 — Noisy Neighbor Control

> 한 테넌트의 부하가 다른 테넌트의 성능을 저하시켜서는 안 된다
> One tenant's load must never degrade another tenant's experience.

## Why

In a pooled multi-tenant architecture, all tenants share compute, database, queue, and network resources. A single tenant running a large data export, a bulk import, or a spike in API calls can exhaust connection pools, saturate CPU, or fill queue partitions — degrading every other tenant on the shared infrastructure. This is the noisy-neighbor problem. Enterprise buyers run their own load tests during trials; if they trigger degradation in another tenant's session, they immediately flag it as an architectural disqualifier. The fix is not to provision for the worst case on every tenant; it is to enforce per-tenant resource quotas and gracefully throttle overuse.

## How to apply

- Enforce per-tenant rate limits on all ingress paths (API, webhook receiver, file upload, bulk endpoints). Return HTTP 429 with a `Retry-After` header and clear error messaging that the limit is per-tenant, not global.
- Tag all database queries with a tenant context (via connection pool labels or pg_stat_statements tags) so you can identify which tenant is driving query load in production monitoring.
- Use separate queue partitions or priority lanes per tenant tier so a high-volume tenant's background jobs do not block real-time operations for other tenants.
- Set per-tenant concurrency limits on long-running operations (bulk exports, report generation, data sync jobs). Queue excess work rather than executing it immediately.
- Define resource quota tiers aligned with pricing plans (Starter: 100 API calls/min; Pro: 1,000; Enterprise: custom). Make quotas visible in the tenant's admin dashboard.
- Alert on tenants who consistently hit rate limits — it is a signal for upsell (Rule 07) and also for capacity planning.

## Checklist

- [ ] Per-tenant API rate limits are enforced at the gateway or middleware layer and return 429 with `Retry-After`.
- [ ] Database query monitoring is tagged by tenant so noisy-tenant queries can be identified and throttled.
- [ ] Long-running background jobs use a per-tenant concurrency cap and a work queue.
- [ ] Resource quota tiers are defined, documented, and surfaced in the tenant admin UI.
- [ ] Rate-limit breach events are logged and trigger an internal alert for capacity and upsell review.

## References

- Tod Golding, *Building Multi-Tenant SaaS Architectures* (O'Reilly, 2024) — Chapter on Noisy Neighbor and Tenant Isolation Controls — https://www.oreilly.com/library/view/building-multi-tenant-saas/9781098140632/
- AWS SaaS Factory — Noisy Neighbor patterns in multi-tenant architectures — https://aws.amazon.com/partners/programs/saas-factory/
- IETF RFC 6585 — Additional HTTP Status Codes (429 Too Many Requests) — https://datatracker.ietf.org/doc/html/rfc6585
