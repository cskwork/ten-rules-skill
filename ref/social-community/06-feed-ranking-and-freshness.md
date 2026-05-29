# Rule 06 — Feed Ranking and Freshness: Rank by Relevance and Recency; Never Bury New Voices

> 알고리즘이 기득권을 더 키우면 커뮤니티는 굳는다. 신선함과 다양성을 랭킹에 설계하라.
> When algorithms amplify the already-powerful, the community ossifies. Design freshness and diversity into ranking.

## Why

Feed ranking in community platforms has a compounding inequality problem: engagement-optimized ranking surfaces already-popular content and already-popular contributors, which attracts more engagement to them, which ranks them higher — a rich-get-richer loop described by Reed's Law and observed empirically in Reddit, Twitter, and YouTube. Over time, new contributors cannot break in, content diversity collapses, and the platform stops reflecting its community. Unlike algorithmic feeds for media consumption (Netflix, Spotify), community feeds must serve both discovery and participation: users are potential creators, not just consumers, and ranking must protect their ability to be heard.

## How to apply

- Use a time-decay factor in ranking formulas (e.g., Wilson score with a freshness multiplier) so that older high-engagement posts do not permanently dominate new ones.
- Expose an explicit "New" or "Rising" sort on every community surface as a first-class UI element, not buried in a dropdown; this is the primary entry point for new contributors.
- Implement anti-monopolization: cap the share of feed positions a single author or topic can occupy in any given rendering (e.g., no more than 3 consecutive posts from one author).
- Separate ranking signals for "show me what's popular" (engagement-heavy) from "show me what's new in my communities" (chronological or lightly ranked); let users switch between modes.
- Audit ranking output quarterly for contribution diversity: measure the Gini coefficient of content distribution across contributors and set an acceptable threshold.

## Checklist

- [ ] Feed ranking formula includes an explicit time-decay component.
- [ ] A "New" or "Rising" sort is accessible in at most two taps/clicks from any community feed.
- [ ] Author/topic concentration cap is implemented and verified in feed output tests.
- [ ] Multiple sort modes (popular, new, rising) are exposed to users with clear labels.
- [ ] Quarterly ranking diversity audit is scheduled with a defined concentration threshold.

## References

- Reed's Law (David P. Reed, 1999) — https://en.wikipedia.org/wiki/Reed%27s_law
- Metcalfe's Law and network value — https://en.wikipedia.org/wiki/Metcalfe%27s_law
- Andrew Chen, "Social network death spiral: How Metcalfe's Law can work against you" — https://andrewchen.com/social-network-death-spiral-how-metcalfes-law-can-work-against-you/
- Robert E. Kraut and Paul Resnick, *Building Successful Online Communities* (MIT Press, 2012) — https://mitpress.mit.edu/9780262528917/building-successful-online-communities/
