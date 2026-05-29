# Rule 07 — Group and Space Governance: Give Sub-Community Owners Real Governance Tools

> 하위 커뮤니티는 플랫폼의 소작농이 아니다. 진짜 권한을 줘야 진짜 책임을 진다.
> Sub-communities are not tenant farmers of the platform. Real authority requires real tools.

## Why

Platforms like Reddit, Discord, and Stack Exchange scale moderation by distributing it: volunteer moderators govern thousands of sub-communities, dramatically reducing the platform-level moderation burden. This distributed model only works if sub-community owners have genuine governance tools — custom rules, post filters, moderator roles with distinct permission levels, and the ability to act on their community's norms without waiting for platform staff. Platforms that centralize all moderation authority consistently fail to scale content quality; platforms that empower local governance (with platform-level guardrails) sustain quality at billions of posts.

## How to apply

- Provide every sub-community with a structured rule editor where moderators write rules that appear to members at the point of posting, not just in a sidebar they never read.
- Implement a moderator role hierarchy with at least three levels: owner, moderator, junior/trainee moderator — each with documented, configurable permission sets (remove posts, ban users, pin posts, edit wiki).
- Give moderators a moderation log (action, actor, timestamp, reason) that is visible to the full moderator team and, for removal actions, to the affected user.
- Allow moderators to set community-level post requirements (required flair, post title format, minimum account age, karma threshold) enforced automatically, not just in a posted rule.
- Define clear escalation paths from sub-community moderators to platform T&S staff for issues that exceed community-level authority (illegal content, doxxing, coordinated harassment).

## Checklist

- [ ] Sub-community rule editor exists and rules are surfaced at the post-creation screen.
- [ ] At least three moderator permission tiers are implemented with distinct, configurable capabilities.
- [ ] Moderation action log is maintained and accessible to the full moderator team.
- [ ] Automated post-requirement enforcement (account age, flair, keyword filters) is available to moderators without requiring platform staff involvement.
- [ ] Escalation path from community moderators to platform T&S is documented and reachable within the moderator UI.

## References

- Robert E. Kraut and Paul Resnick, *Building Successful Online Communities: Evidence-Based Social Design* (MIT Press, 2012) — https://mitpress.mit.edu/9780262528917/building-successful-online-communities/
- Santa Clara Principles on Transparency and Accountability in Content Moderation (2021 edition) — https://santaclaraprinciples.org/
- Discord, "Transparency in Moderation" — https://discord.com/safety/transparency-in-moderation
