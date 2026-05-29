# Rule 08 — Learner Engagement and Dropout Prevention

> 학습은 한 번의 클릭으로 끝나지 않는다. 습관을 만드는 시스템을 설계하라.
> Learning does not end at one click; design systems that build habits and bring learners back.

## Why

Industry completion rates for open online courses (MOOCs) have historically hovered at 5-15%. Even in paid courses, dropout is the primary driver of churn and refund requests. The research from *Make It Stick* and behavioral learning science identifies that voluntary return to practice — not passive content consumption — is what produces durable learning. Platform-side interventions (streak tracking, progress nudges, cohort accountability, instructor feedback loops) measurably improve completion rates and renewal. Ignoring retention in the product model optimizes for enrollment vanity metrics at the expense of actual outcomes.

## How to apply

- Instrument dropout signals at the activity level: track time-since-last-activity per learner; define thresholds (e.g., 3 days for daily-habit courses, 7 days for weekly cohorts) and trigger re-engagement emails or push notifications before the learner fully disengages.
- Implement lightweight social accountability: cohort start dates, peer progress visibility (opt-in), and discussion prompts anchored to lessons — not a separate forum — significantly improve completion in self-paced courses.
- Design streak mechanics that reset gracefully: a "freeze" (1-day grace) prevents streak breaks from causing complete abandonment; a streak that resets too harshly is a churn trigger.
- Personalize the learning path at the module level: surface the "next recommended activity" based on mastery state and time available, rather than requiring linear navigation.
- Track and A/B test: measure 7-day and 30-day return rates, not only enrollment and completion; use these as primary health metrics for engagement features.

## Checklist

- [ ] Time-since-last-activity tracked per learner per course; re-engagement trigger emails fire at defined thresholds
- [ ] "Next up" recommendation surfaces on dashboard and post-lesson screen
- [ ] Streak or habit tracker includes a grace/freeze mechanism to prevent harsh resets
- [ ] Cohort or peer accountability feature available for instructor-led or bootcamp-style courses
- [ ] 7-day and 30-day learner return rates tracked as explicit product KPIs

## References

- Peter C. Brown, Henry L. Roediger III, Mark A. McDaniel — *Make It Stick: The Science of Successful Learning* (2014) — https://www.amazon.com/Make-Stick-Science-Successful-Learning/dp/0674729013
- CAST — UDL Engagement guidelines (the "why" of learning) — https://udlguidelines.cast.org/
- Kizilcec, R.F., Piech, C., & Schneider, E. — "Deconstructing Disengagement: Analyzing Learner Subpopulations in Massive Open Online Courses" (LAK 2013) — https://dl.acm.org/doi/10.1145/2460296.2460330
