# Rule 08 — Churn and Retention Signals

> 시청 참여 신호를 분석하여 구독 해지를 예측하고 선제적으로 방어하라.
> Analyze engagement signals to predict subscription cancellation and act before it happens.

## Why

Subscriber acquisition costs in streaming are high; retaining an existing subscriber is four to eight times cheaper than acquiring a new one. Churn is not random: it follows predictable signals — declining session frequency, shortened watch duration, increased browse-without-play events, and failure to start a new series after finishing one. Netflix and other large streamers operate dedicated churn prediction models that score each subscriber weekly and trigger targeted retention interventions. Without a structured engagement data pipeline that captures these signals at the session level, churn becomes visible only at cancellation — too late to act.

## How to apply

- Capture session-level engagement events: session start, content played, playback duration, completion flag, explicit ratings, search queries with no click, and explicit cancellation survey responses; store them in an append-only event log.
- Compute per-subscriber engagement features on a rolling 7-day and 30-day window: sessions per week, average watch duration, completion rate, and days since last session; these are the primary inputs to churn prediction models.
- Train a binary churn classifier (logistic regression or gradient boosting as baseline; neural approaches for scale) on historical cancel events; retrain at least monthly as content catalog and user mix shift.
- Integrate churn score into automated retention workflows: subscribers above a churn probability threshold receive targeted content recommendations, win-back offers (a temporary discount or bonus content), or a personalized "what to watch next" notification.
- Measure retention program effectiveness with holdout A/B tests — not just conversion rate of the intervention, but downstream 30-day renewal rate.

## Checklist

- [ ] Session-level engagement events are captured and stored in an append-only event log.
- [ ] Rolling engagement features (sessions/week, completion rate, days since last session) are computed per subscriber.
- [ ] Churn prediction model is trained on historical cancel events and retrained at least monthly.
- [ ] Churn score drives at least one automated retention workflow.
- [ ] Retention interventions are A/B tested; 30-day renewal rate is the primary success metric.

## References

- Tien Tzuo & Gabe Weisert, "Subscribed: Why the Subscription Model Will Be Your Company's Future" (Portfolio, 2018) — https://www.amazon.com/Subscribed-Subscription-Model-Companys-Future/dp/0525536469
- Netflix Tech Blog, "It's All A/Bout Testing: The Netflix Experimentation Platform" — https://netflixtechblog.com/its-all-a-bout-testing-the-netflix-experimentation-platform-4e1ca458c15
- Netflix Tech Blog, "Data Compression for Large-Scale Streaming Experimentation" — https://netflixtechblog.com/data-compression-for-large-scale-streaming-experimentation-c20bfab8b9ce
