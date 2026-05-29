# Rule 09 — Revenue and Yield Controls

> 광고 수익은 가격 통제 없이 자동화에 맡기면 바닥으로 떨어진다. 플로어 가격과 수익 규칙을 명시적으로 설계하라.
> Ad revenue collapses when automation runs without price controls; design floor prices, header bidding priority, and yield rules explicitly rather than letting the exchange race to the bottom.

## Why

Programmatic auctions are second-price by default, meaning the winning bidder pays one cent above the second-highest bid. Without carefully configured floor prices, a publisher's premium inventory can clear at a fraction of its direct-sold CPM, permanently anchoring buyer expectations at that low price through algorithmic learning. Header bidding (Prebid.js for web, Prebid Mobile for apps) opened publisher inventory to more demand sources but introduced a new complexity: bid duplication, auction manipulation, and latency-induced timeouts that reduce fill rates. Publishers who set no floors, allow uncapped bid caching, or fail to configure sellers.json correctly lose 20–40% of addressable revenue to information asymmetry that favors buyers.

## How to apply

- Set dynamic floor prices per ad unit based on historical win rates, seasonality, and audience quality; static global floors leave revenue on the table and block premium buyers.
- Configure Prebid.js timeout at or below 1,000 ms; add a `failsafe` bid from your primary SSP at or above your floor so fill rate does not collapse when header bidding times out.
- Publish an accurate sellers.json file at `yourdomain.com/sellers.json`; include every SSP and reseller you authorize; remove stale entries quarterly.
- Implement bid caching protections: set `tmax` in your OpenRTB config, reject bids with timestamps older than one auction cycle, and monitor for bid shading anomalies.
- Track revenue per mille (RPM) by ad unit, placement, device type, and geography as primary yield KPIs; alert on RPM drops exceeding 10% week-over-week.

## Checklist

- [ ] Floor prices are dynamic per ad unit and audience segment, not a single global value
- [ ] Prebid.js timeout configured; failsafe SSP bid covers floor when header bidding times out
- [ ] sellers.json published, complete, and audited quarterly
- [ ] Bid caching / bid shading protections configured in OpenRTB `tmax`
- [ ] RPM monitored per ad unit with automated alerting on significant drops

## References

- IAB Tech Lab OpenRTB 2.6 (tmax, floor price fields) — https://github.com/InteractiveAdvertisingBureau/openrtb2.x/blob/main/2.6.md
- Prebid.js documentation — https://docs.prebid.org/
- IAB Tech Lab sellers.json specification — https://iabtechlab.com/sellers-json/
