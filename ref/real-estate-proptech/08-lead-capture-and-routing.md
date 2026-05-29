# Rule 08 — Lead Capture and Licensed-Agent Routing

> 문의는 허가받은 중개인에게 즉시 연결되어야 한다 — 지연은 거래 기회를 소멸시킨다.
> Every inquiry must reach a licensed agent immediately — delay destroys conversion in a market where buyers contact multiple portals simultaneously.

## Why

Real estate portals monetize primarily through lead fees paid by agents and brokers. The value of a lead degrades sharply with response time: studies from InsideSales (now XANT) show a 10x drop in contact rate after the first five minutes. The routing logic is also legally constrained: in most U.S. states, only a licensed real estate salesperson or broker may provide advice, negotiate terms, or facilitate a transaction. Misrouting a buyer inquiry to an unlicensed assistant or to an agent whose license has lapsed creates unlicensed-practice-of-real-estate liability. Co-broke rules enforced by MLS also govern how listing agent and buyer agent compensation flows, affecting which agent receives a buyer-side inquiry on a given listing.

## How to apply

- Validate agent license status against the state's real estate commission API or the ARELLO license database before routing any lead; do not rely solely on the agent's self-reported license number.
- Implement lead routing SLA enforcement: the system must attempt delivery (SMS + email + CRM webhook) within 60 seconds of form submission; escalate to a backup agent if the primary does not acknowledge within five minutes.
- Capture lead source, listing ID, and session UTM parameters at the moment of form submission and attach them to the CRM record; this is required for portal billing reconciliation with brokerages.
- For chatbot or AI-assisted initial inquiry handling, disclose that the user is interacting with an automated system and transfer to a human agent before any property-specific advice is provided.
- Store lead routing logs immutably: which agent received the lead, timestamp, delivery method, and acknowledgment status; this supports dispute resolution on co-broke fee splits.

## Checklist

- [ ] Agent license validation runs against an authoritative state database before first lead delivery.
- [ ] Lead delivery attempts within 60 seconds; escalation fires within 5 minutes of non-acknowledgment.
- [ ] Lead record includes source, listing ID, and UTM parameters at creation.
- [ ] Chatbot interactions disclose automation and transfer before giving property-specific advice.
- [ ] Lead routing log is immutable and retained for at least 36 months.

## References

- ARELLO (Association of Real Estate License Law Officials) license lookup — https://www.arello.org/
- NAR IDX Policy on buyer inquiry routing — https://www.nar.realtor/internet-data-exchange-idx-policy
- iHomeFinder IDX and lead routing features — https://www.ihomefinder.com/blog/agent-and-broker-resources/idx-feed-real-estate/
- Luxury Presence: IDX home search tools 2025 — https://www.luxurypresence.com/blogs/idx-home-search-tools-real-estate/
