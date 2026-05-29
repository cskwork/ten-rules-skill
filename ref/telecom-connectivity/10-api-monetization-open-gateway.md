# Rule 10 — Expose Network Capabilities via GSMA Open Gateway and CAMARA APIs

> 네트워크 역량의 외부 노출은 GSMA Open Gateway와 CAMARA API 표준을 통해 상품화하고, 자체 독점 인터페이스를 만들지 않는다
> Productise network capabilities (SIM-based auth, QoD, fraud signals) through GSMA Open Gateway / CAMARA API specifications, not proprietary endpoints.

## Why

GSMA Open Gateway, backed by the Linux Foundation's CAMARA project, is the industry's converging standard for exposing carrier network capabilities to application developers via standardised, operator-agnostic RESTful APIs. Carriers that expose proprietary network APIs instead create a per-operator integration burden that developers reject in favour of competitors with standardised access; the "write once, deploy across all operators" promise of CAMARA is the commercially decisive argument for enterprise customers choosing a connectivity partner. Key network APIs with immediate commercial value include Number Verification (SIM-based silent authentication), Quality on Demand (QoD), Device Location, SIM Swap fraud detection, and Device Status.

## How to apply

- Map every planned network-capability exposure to the corresponding CAMARA API specification before building: check the CAMARA GitHub repository for the current spec version and conformance requirements.
- Deploy an API gateway layer that handles CAMARA-specified authentication (OAuth 2.0 with OIDC, network-based SIM authentication via purpose-limited tokens) independently of the backend network function implementation.
- Implement a developer portal with self-service onboarding, sandbox environment, usage-based billing integration (tied to the charging layer from Rule 03), and SLA tiers mapped to network slices (Rule 08).
- Enforce purpose limitation: CAMARA APIs that expose sensitive network signals (location, SIM swap history) must require explicit subscriber consent capture and scope-limited tokens; do not allow re-use of a location token for fraud-check purposes.
- Monitor API monetisation metrics per product (revenue per 1,000 API calls, adoption rate, error rate per API consumer) as a separate P&L; network API revenue is a distinct business line from connectivity revenue.

## Checklist

- [ ] Each exposed network capability maps to a named CAMARA API specification and version
- [ ] API gateway enforces OAuth 2.0 with network-based SIM authentication per CAMARA auth spec
- [ ] Developer portal includes sandbox, self-service onboarding, and usage-based billing
- [ ] Sensitive-signal APIs (location, SIM swap) require subscriber consent and scope-limited tokens
- [ ] API monetisation is tracked as a separate revenue stream with per-product metrics

## References

- GSMA Open Gateway — Unlocking the Power of Network APIs — https://www.gsma.com/solutions-and-impact/gsma-open-gateway/open-gateway-unlocking-the-power-of-network-apis/
- GSMA Open Gateway: State of the Market H2 2024 — https://eu-assets.contentstack.com/v3/assets/blt23eb5bbc4124baa6/blt85b8246f902c5786/6761e86ae2ba1d6d60f7629b/111224-Open-Gateway-State-of-the-Market-H2-2024.pdf
- CAMARA Project (Linux Foundation) — https://camaraproject.org/
- WSO2 — GSMA Open Gateway: The Standard That Turns Network Capabilities Into Developer-Friendly Products — https://wso2.com/library/blogs/gsma-open-gateway/
