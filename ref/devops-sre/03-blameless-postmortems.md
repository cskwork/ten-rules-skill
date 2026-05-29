# Rule 03 — Run Blameless Postmortems

> 사람을 탓하지 말고 시스템에서 배워라.
> Blame the system, not the person, and learn from every incident.

## Why

Outages are inevitable; not learning from them is the real failure. The Google SRE Book mandates blameless postmortems: when people fear punishment they hide facts, and the organization repeats the same failure. The DORA 2024 research confirms psychological safety is among the strongest predictors of delivery performance. Assume everyone acted reasonably given what they knew, and fix the conditions that made the error possible.

## How to apply

- Write a postmortem for every incident over an agreed severity threshold; make it routine, not a punishment.
- Focus the narrative on systems, signals, and decisions in context, never on naming a culprit.
- Build a timeline, root contributing factors, and concrete action items with owners and due dates.
- Track action items to completion; an untracked postmortem changes nothing.
- Share postmortems widely so other teams inherit the lesson.

## Checklist

- [ ] A postmortem template and severity trigger exist and are followed
- [ ] Language describes systems and decisions, not individual blame
- [ ] Every postmortem has owned, dated, tracked action items
- [ ] Postmortems are discoverable and read across teams

## References

- Google SRE — Postmortem Culture: Learning from Failure — https://sre.google/sre-book/postmortem-culture/
- DORA — Capabilities — https://dora.dev/capabilities/
