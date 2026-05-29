# Rule 08 — Govern Dependencies and the Supply Chain

> 남이 만든 코드와 빌드 파이프라인의 위험을 관리하라.
> Govern the risk in third-party code and your build pipeline.

## Why

Vulnerable and Outdated Components rank #6 in the OWASP Top 10 (2021), and the next entry, A08 Software and Data Integrity Failures, covers compromised build pipelines and untrusted updates. Modern apps are mostly third-party code, so an unpatched library or poisoned package becomes your vulnerability. NIST SSDF (SP 800-218) makes provenance and integrity a core practice.

## How to apply

- Inventory dependencies and generate a Software Bill of Materials (SBOM).
- Scan dependencies continuously (SCA) and patch known-vulnerable versions promptly.
- Pin versions and use a lockfile; verify integrity with hashes or signatures.
- Pull packages and base images only from trusted, controlled registries.
- Verify the integrity of builds, updates, and CI/CD plugins; protect pipeline credentials.
- Remove unused dependencies and features to shrink the attack surface.

## Checklist

- [ ] An SBOM exists and is regenerated on each release.
- [ ] An SCA tool runs in CI and fails the build on high-severity known vulnerabilities.
- [ ] Dependency versions are pinned via a lockfile with integrity verification.
- [ ] Packages and base images come only from trusted, vetted sources.
- [ ] CI/CD credentials and plugins are restricted, and build artifacts are integrity-checked.

## References

- OWASP Top 10 (2021), A06 Vulnerable and Outdated Components — https://owasp.org/Top10/2021/A06_2021-Vulnerable_and_Outdated_Components/
- NIST SSDF SP 800-218 — https://csrc.nist.gov/projects/ssdf
