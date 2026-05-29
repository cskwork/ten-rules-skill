# Rule 07 — Manage Infrastructure as Code

> 인프라를 버전 관리되는 선언적 코드로 다뤄라.
> Treat infrastructure as declarative, version-controlled code.

## Why

Hand-clicked, snowflake servers cannot be reproduced, reviewed, or recovered. Infrastructure as Code makes the desired state a declarative artifact in version control, so environments are reproducible, auditable, and consistent from dev to prod. GitOps extends this: Git is the single source of truth, and an agent continuously reconciles live state to the committed state, so drift is detected and corrected automatically. The Twelve-Factor App's parity and config principles share the same root: explicit, externalized, reproducible configuration.

## How to apply

- Declare infrastructure (compute, network, policy) in code and store it in version control.
- Make all changes via reviewed pull requests; never click-change production by hand.
- Keep environments parity-close so dev, staging, and prod differ only by config, not by drift.
- Separate config from code via environment variables or a secret manager, never hardcoded.
- Use GitOps reconciliation so live state converges to the committed desired state and drift is flagged.

## Checklist

- [ ] Infrastructure is defined declaratively in version control
- [ ] Production changes go through reviewed PRs, not manual edits
- [ ] Config and secrets are externalized, never committed to the repo
- [ ] Drift between desired and live state is detected and reconciled

## References

- The Twelve-Factor App — https://12factor.net/
- OpenGitOps — Principles — https://opengitops.dev/
