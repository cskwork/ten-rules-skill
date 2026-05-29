# Rule 09 — UGC Data Model: Model Content, Reactions, and Threads as First-Class Entities

> 콘텐츠 모델이 흔들리면 커뮤니티의 모든 기능이 흔들린다. 처음부터 올바르게 설계하라.
> When the content model is unstable, every community feature built on it is unstable. Design it correctly from the start.

## Why

User-generated content in community platforms has structural requirements that differ from editorial CMS content: posts are edited after the fact, deleted posts leave social traces (replies, reactions, votes), threads are deeply nested, and content must survive moderation actions (removal, restoration, re-removal) without losing relational integrity. Retrofitting these requirements onto a naive content model — one that hard-deletes rows, stores thread depth in the application layer, or conflates authorship with visibility — causes cascading schema migrations and data inconsistencies that compound with every new feature. The data model is the platform's skeleton; unlike UI, it cannot be easily changed after millions of rows exist.

## How to apply

- Model every content object (post, comment, media attachment) as an immutable record with a separate mutable state envelope (visibility, moderation_status, edit_history_id); never hard-delete user content rows.
- Store deleted content as a tombstone (content nulled, author preserved, timestamps preserved, deletion_reason and deleted_by stored); this maintains thread integrity, audit trails, and appeals eligibility.
- Model edit history as an append-only log linked to the content object, not as an in-place update; expose edit history to users as a transparency feature.
- Represent thread depth using a closure table or materialized path pattern, not a recursive parent_id FK; nested community threads routinely exceed 5 levels and recursive FK queries do not scale.
- Separate reaction/vote counts from content rows using an event-sourced or append-only votes table; real-time aggregation under write-heavy voting load is a separate problem from content retrieval.

## Checklist

- [ ] Content rows are never hard-deleted; a tombstone state exists with deletion metadata.
- [ ] Moderation status and visibility are stored in a separate state record, not as columns on the content row.
- [ ] Edit history is stored as an append-only log and is readable by the original author at minimum.
- [ ] Thread hierarchy is stored using closure table or materialized path, and depth is tested to at least 10 levels.
- [ ] Votes/reactions use an append-only or event-sourced table; counts are derived, not stored as mutable integers on the content row.

## References

- Robert E. Kraut and Paul Resnick, *Building Successful Online Communities: Evidence-Based Social Design* (MIT Press, 2012) — https://mitpress.mit.edu/9780262528917/building-successful-online-communities/
- Santa Clara Principles on Transparency and Accountability in Content Moderation (2021 edition) — https://santaclaraprinciples.org/
- Andrew Chen, *The Cold Start Problem* (HarperBusiness, 2021) — https://a16z.com/books/the-cold-start-problem/
