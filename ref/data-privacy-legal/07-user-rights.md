# Rule 07 — Honor User Rights Over Their Data

> 열람, 삭제, 이동 요청을 정해진 기한 안에 처리하라. 데이터는 결국 그 사람의 것이다.
> Fulfill access, erasure, and portability requests on time; the data ultimately belongs to the person.

## Why

GDPR Chapter 3, CCPA/CPRA, and Korea PIPA all grant individuals enforceable rights to access, correct, delete, and port their personal data, generally within a fixed deadline (GDPR: one month; Korea PIPA: portability right effective March 2025, allowing individuals to request transfer of data to another provider). These rights are what make the other principles real to the user. Failing to fulfill them on time is directly enforceable and a common source of complaints.

## How to apply

- Build a request intake path and verify the requester's identity before acting.
- Map where each person's data lives so you can find all of it, including backups and vendors.
- Provide access and portability exports in a structured, machine-readable format.
- Propagate erasure to processors, backups, and downstream copies, not just the primary store.
- Track each request against its legal deadline and log the outcome.

## Checklist

- [ ] A documented intake and identity-verification process exists for requests.
- [ ] A data map locates all copies of a person's data, including with vendors.
- [ ] Exports are machine-readable and cover the data the person is entitled to.
- [ ] Erasure reaches backups, caches, and processors, not only the main database.
- [ ] Requests are tracked against their statutory deadlines.

## References

- GDPR Chapter 3 rights of the data subject — https://gdpr-info.eu/chapter-3/
- California CCPA/CPRA (CPPA) — https://cppa.ca.gov/
- Korea Personal Information Protection Commission (PIPC) — https://www.pipc.go.kr/eng/
