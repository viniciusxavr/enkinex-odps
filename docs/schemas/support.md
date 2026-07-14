# Module: `support`

## Schema Mapping

| KCL Schema | Upstream ODCS Entity | Notes |
|---|---|---|
| `Support` (`support/support.k`) | `$defs.Support` | Inherits `common.Taggable` |

## Architecture Decisions

- Inherits `common.Taggable` (see [[common]]). `url` is required (matches upstream's `required: [channel, url]`) and always validated; `invitationUrl` is optional and validated only when present.
- Both `url` and `invitationUrl` accept the widened `common.urlPattern`: this schema's docstring is the one that names `mailto` as a valid scheme upstream ("Access URL using normal URL scheme (https, mailto, etc.)"), so `Support` was the original motivation for fixing that regex in this pass.
- `tool`/`scope` stay open `str`; upstream lists them as `examples` (`email`/`slack`/`teams`/`discord`/`ticket`/`other` and `interactive`/`announcements`/`issues`), and in practice support tooling varies per organization more freely than the lifecycle `status` field on `DataProduct` does.

## Open Questions

- Same open item as [[odps]] and [[management]]: if `tool`/`scope` should ever be closed unions, do it consistently with the other `examples`-only fields across the port, not in isolation.
