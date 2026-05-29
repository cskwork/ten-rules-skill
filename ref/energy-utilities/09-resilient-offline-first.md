# Rule 09 — Field and Substation Software Must Operate Without WAN Connectivity

> 변전소와 현장 소프트웨어는 WAN 연결 없이도 핵심 기능을 수행해야 한다.
> Substation and field software must perform all safety-critical and operational functions without relying on WAN or cloud connectivity.

## Why

Utility field operations — substation automation, remote terminal units (RTUs), distribution management, mobile workforce management — occur in environments where wide-area network connectivity is intermittent, unreliable, or deliberately severed during emergencies. A substation that cannot perform protection switching because its automation HMI lost connectivity to a cloud orchestration layer has traded a grid reliability risk for a software architecture convenience. NERC reliability standards explicitly require that protection, monitoring, and control functions not be dependent on communication paths that traverse the public internet. Beyond regulation, power outages — the very events that most demand field crew software — are correlated with communication infrastructure failures. The offline-first pattern is therefore not a feature addition; it is the correct default for any software that a grid operator or field crew depends on to restore power.

## How to apply

- Architect substation HMIs, RTUs, and field crew applications with a local data store that holds all data and logic needed for normal operations; the WAN path is used for synchronization and supervisory monitoring, not for serving operational requests.
- Define a clear subset of functions that must work offline (primary operations: switching, tagging, work order execution, protection status), and a set that can degrade gracefully (secondary: report generation, centralized logging, historical trend analysis) — document this split explicitly before development.
- Implement a conflict-resolution strategy for data synchronized after a period of offline operation; the most common pattern in utility field apps is last-write-wins with a timestamped operation log that allows supervisors to review and reconcile divergent state after reconnection.
- For substation automation systems, local SCADA and HMI functions must run on local servers within the Electronic Security Perimeter; do not route any real-time control action through a cloud intermediary.
- Test the offline path as a first-class scenario: simulate WAN failure in CI and in staging, confirm that all tier-1 operations complete without errors, and measure the quality and completeness of the sync after reconnection.

## Checklist

- [ ] Tier-1 operational functions (switching, tagging, work order execution, protection status) are tested to complete successfully with WAN interface mocked as unavailable.
- [ ] Local data store holds all reference data and pending operations; no online dependency exists in the hot path.
- [ ] Conflict-resolution strategy for post-offline sync is documented and tested with concurrent edit scenarios.
- [ ] Reconnection sync is tested for completeness; no data loss occurs for operations performed while offline.
- [ ] Substation automation control actions do not traverse a cloud intermediary.

## References

- NIST SP 800-82 Rev. 3: Guide to Operational Technology (OT) Security — https://csrc.nist.gov/pubs/sp/800/82/r3/final
- NERC CIP-014: Physical Security (independence of control systems from public networks) — https://www.nerc.com/pa/Stand/Pages/CIPStandards.aspx
- IEC 61850: Local autonomy requirements for substation automation systems — https://webstore.ansi.org/industry/smartgrid/iec-61850
