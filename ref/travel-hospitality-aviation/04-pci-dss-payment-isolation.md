# Rule 04 — PCI DSS Payment Isolation

> 카드 데이터는 발생 즉시 범위를 축소하고, 모든 채널 경계에서 격리하라.
> Minimize card data scope at the point of capture and isolate it at every channel boundary.

## Why

A single hotel or airline booking may route card data through a website front-end, a payment gateway, a GDS system, the airline's or hotel's PMS, and a fraud-screening service — each a distinct PCI scope boundary. PCI DSS 4.0 (mandatory from March 2025) added 64 new requirements including mandatory multi-factor authentication, continuous risk assessment, and strict virtual card controls. OTAs that are Merchant of Record face Level 1 or Level 2 compliance obligations. Non-compliance fines from card networks can reach $100,000 per month, and a breach affecting stored card data triggers mandatory disclosure and reputational damage that disproportionately harms trust-dependent travel bookings.

## How to apply

- Tokenize card data at the earliest possible point: use a certified payment gateway's JavaScript SDK or hosted payment page so raw PANs never touch your application servers; this eliminates your servers from PCI scope for storage.
- For GDS-routed ticketing (BSP/ARC settlement), use IATA's designated virtual card or BSP settlement flow; do not pass raw card numbers through your own middleware.
- Apply network segmentation: place all cardholder data environment (CDE) components in a dedicated VLAN/subnet with deny-all ingress rules; no CDE service should be reachable from the public internet directly.
- Store only the last four digits, card brand, and a payment gateway token; never store full PAN, CVV, or expiry in any database, log file, or analytics event.
- Implement MFA for all personnel and systems with CDE access; PCI DSS 4.0 requires this without exception.
- Run quarterly vulnerability scans (ASV-approved) and annual penetration tests against the CDE; schedule these as recurring CI/CD pipeline gates, not ad hoc events.

## Checklist

- [ ] No raw PAN reaches application servers; tokenization happens at gateway SDK level.
- [ ] CDE is network-isolated; firewall rules are documented and reviewed quarterly.
- [ ] Logs and analytics pipelines are scrubbed of card data at the point of emission.
- [ ] MFA is enforced for every user and service account with CDE access.
- [ ] PCI DSS SAQ or ROC is current; next assessment date is tracked in the project runbook.

## References

- IATA PCI DSS compliance guidance for travel agents — https://www.iata.org/en/services/finance/pci-dss/
- PCI DSS v4.0 standard document (PCI SSC) — https://www.pcisecuritystandards.org/document_library/?category=pcidss&document=pci_dss
- PCI Security Standards Council — https://www.pcisecuritystandards.org/
- Vervotech: PCI DSS prerequisites for OTAs — https://vervotech.com/blog/pci-dss-compliance-prerequisites-for-otas/
