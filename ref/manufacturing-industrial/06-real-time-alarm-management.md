# Rule 06 — Treat Alarms as Engineered Objects, Not Log Lines

> 경보는 단순한 로그가 아니라 설계된 운영 객체로 관리하라.
> Every alarm must be rationalized, documented, and managed as a designed artifact, not a side effect of logging.

## Why

Alarm floods kill operators. Studies in the process industry (ISA-18.2 / IEC 62682) show that operators managing more than 10 alarms per 10-minute window cannot respond effectively; above 30 alarms per 10 minutes, critical alarms are missed entirely. The 2005 Texas City refinery explosion and numerous DCS incidents are linked to alarm overload. In a fab or process plant, an untriaged alarm system means operators silence everything, losing the signal in the noise. ISA-18.2 requires every alarm to have a documented rationalization: consequence if unacknowledged, required response, and maximum allowable response time. Alarm management is therefore a safety and reliability discipline, not a UI preference.

## How to apply

- Maintain an Alarm Rationalization Database (ARDB) — one record per alarm tag containing: setpoint basis, consequence, operator response, maximum response time, and priority (Critical / High / Medium / Low).
- Set alarm priority based on consequence and time-to-respond, not on how loud the engineer wants a notification to be; Critical alarms must require acknowledgment within a defined time window.
- Target ISA-18.2 performance metrics: fewer than 1 alarm per 10 minutes in steady state; no more than 10 alarms per 10 minutes during upsets; standing alarms (active > 24 h) flagged for suppression review.
- Implement shelving and suppression workflows in the HMI/SCADA layer so operators can temporarily silence a known nuisance alarm with an expiry time and audit trail — never a permanent silent delete.
- Review alarm KPIs (flood rate, standing alarms, most-frequent alarms, bad actors) weekly during commissioning and monthly in production.

## Checklist

- [ ] An Alarm Rationalization Database exists with a record for every alarm tag.
- [ ] Alarm priority is assigned by consequence × time-to-respond, not subjective urgency.
- [ ] Steady-state alarm rate is measured; target < 1 alarm per 10 minutes per operator.
- [ ] Shelving and suppression require a documented reason and an expiry time.
- [ ] Monthly alarm KPI report is generated and acted on by operations and engineering.

## References

- ANSI/ISA-18.2-2016, *Management of Alarm Systems for the Process Industries* — https://www.isa.org/standards-and-publications/isa-standards/find-isa-standards/isa-18-2-2016
- IEC 62682:2014, *Management of Alarms for the Process Industries* — https://www.iec.ch/homepage
- EEMUA Publication 191, *Alarm Systems: A Guide to Design, Management and Procurement* — https://www.eemua.org
- Engineering Equipment and Materials Users Association (EEMUA) — https://www.eemua.org
