# Module: `odps` (root package: `odps.k`)

## Schema Mapping

| KCL Schema / Type | Upstream ODCS Entity | Notes |
|---|---|---|
| `DataProduct` | root document object (top-level `properties`, not a `$defs` entry) | The whole descriptor |
| `KindType` | `properties.kind.enum` | Single-value enum promoted to a named literal union |
| `ApiVersionType` | `properties.apiVersion.enum` | Closed union `"v0.9.0" \| "v1.0.0"` |
| `StatusType` | `properties.status.examples` | Upstream leaves `status` open (`examples`, not `enum`); the port closes it: see below |

## Architecture Decisions

- `DataProduct` inherits `common.TagsDiscoverable` (see [[common]]) instead of repeating `tags`/`customProperties`/`authoritativeDefinitions` inline. The docstring still lists all three so `kcl doc generate` output stays complete for consumers of the generated docs.
- `status` was promoted from an open `str` to the closed `StatusType` union, even though upstream only gives it `examples`, not an `enum`: unlike `ManagementPort.type`/`.content`, `Support.tool`/`.scope`, and `AuthoritativeDefinition.type`, which stay open `str` despite being `examples`-only too. This is a deliberate, non-uniform call: `status` is a small, stable lifecycle enum that most consumers branch on, so closing it catches typos early. The other `examples` fields are open-ended vocabularies (support tool names, management-port content types) where new values are expected to appear in practice before the spec (or this port) catches up.
- `productCreatedTs` keeps its own inline ISO-8601 date-time regex `check` rather than sharing a "Timestamp" alias with `team.TeamMember`'s date-only checks: the two formats differ (date-time vs. date-only) and there was only one date-time consumer, so a shared abstraction wasn't justified yet.

## Open Questions

- If a future revision needs `ManagementPort.type`/`.content`, `Support.tool`/`.scope`, or `AuthoritativeDefinition.type` closed too, revisit `status`'s precedent: either close all `examples`-only fields consistently, or reopen `status` to match the rest.
- `ApiVersionType` keeps `"v0.9.0"` for back-compat with older documents even though the practical default is `"v1.0.0"`; if upstream formally deprecates `v0.9.0`, drop it from the union.
