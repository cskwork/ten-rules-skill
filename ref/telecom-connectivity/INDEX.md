# Telecom & Connectivity — 10 Rules (index)

Source: Grounded in TM Forum Frameworx (eTOM, SID, Open APIs), 3GPP TS 32.290 converged charging specifications, GSMA Open Gateway and SGP.32 eSIM specifications, IETF/ITU-T network reliability standards, and NPAC/iconectiv number portability administration doctrine. Building software for this industry means operating inside a regulated, real-time, carrier-grade environment where a five-minute outage violates SLAs, every transaction carries monetary and legal weight, and the underlying data models are defined by international standards bodies, not the product team.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-tmforum-sid-data-model.md` | Model domain entities using TM Forum SID | subscriber provisioning, product catalog, service inventory, party management |
| 02 | `02-carrier-grade-availability.md` | Design for 99.999% uptime from day one | billing systems, core network APIs, provisioning pipelines, any path that blocks activation |
| 03 | `03-converged-charging-3gpp.md` | Implement charging per 3GPP converged charging | rating, mediation, online/offline charging, CDR generation, quota management |
| 04 | `04-etom-process-alignment.md` | Align workflows to eTOM process framework | order management, trouble ticketing, SLA assurance, fulfillment, network operations |
| 05 | `05-number-portability-compliance.md` | Treat number portability as a hard dependency | subscriber activation, MSISDN assignment, MNP/LNP queries, porting workflows |
| 06 | `06-tmforum-open-api-conformance.md` | Expose and consume TM Forum Open APIs | integration with third-party BSS/OSS, partner onboarding, API gateway design |
| 07 | `07-regulatory-lawful-intercept.md` | Build lawful intercept and regulatory hooks in from the start | call detail records, data retention, CALEA/ETSI LI, GDPR erasure with legal-hold carve-outs |
| 08 | `08-network-slice-aware-design.md` | Propagate network slice context through the software stack | 5G slice selection, QoS policy enforcement, enterprise SLA tiers, IoT vs consumer segmentation |
| 09 | `09-esim-remote-provisioning.md` | Follow GSMA RSP specifications for eSIM and profile management | eSIM activation, MVNO profile download, IoT fleet provisioning, SGP.22/SGP.32 flows |
| 10 | `10-api-monetization-open-gateway.md` | Expose network capabilities through GSMA Open Gateway / CAMARA APIs | developer portal, network API productisation, fraud prevention, SIM-based auth |

Default for "BSS/OSS integration or subscriber lifecycle work": read 01, 02, 03, 04 at minimum.
