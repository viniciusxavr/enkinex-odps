# Module: `common`

## Schema Mapping

| KCL Schema / Type | Upstream ODCS Entity | Notes |
|---|---|---|
| `CustomProperty` (`common/property.k`) | `$defs.CustomProperty` | 1:1 |
| `Description` (`common/description.k`) | `$defs.Description` | Inherits `AuthoritativeCustomizable`; upstream has no `tags` on `Description`, matched exactly |
| `AuthoritativeDefinition` (`common/authoritative.k`) | `$defs.AuthoritativeDefinition` | 1:1; `check` validates `url` against `urlPattern` |
| `urlPattern` (`common/url.k`) | `format: "uri"` (applied to `AuthoritativeDefinition.url`, `SBOM.url`, `ManagementPort.url`, `Support.url`/`.invitationUrl`) | Bare module-level regex constant, not a `$defs` entity |
| `Tags` (`common/discovery.k`) | `$defs.Tags` | 1:1: `type Tags = [str]` |
| `AuthoritativeCustomizable` (`common/custom.k`) | no upstream equivalent | Synthesized base schema: see below |
| `TagsDiscoverable` (`common/discovery.k`) | no upstream equivalent | Synthesized base schema: see below |

## Architecture Decisions

- `AuthoritativeCustomizable`/`TagsDiscoverable` were introduced to eliminate the `tags`/`customProperties`/`authoritativeDefinitions` trio that was duplicated across `InputPort`, `OutputPort`, `ManagementPort`, `Support`, `TeamMember`, `Team`, and the root `DataProduct`. JSON Schema has no inheritance mechanism, so upstream repeats this trio in every `$defs` entry that needs it; KCL does, so this port doesn't have to. The names, and the `common/custom.k`/`common/discovery.k` file split, mirror the equivalent `Customizable`/`AuthoritativeCustomizable` and `StableIdDiscoverable`/`TagsDiscoverable` base-schema families in `enkinex-odcs`, so the two sibling libraries describe the same capability with the same vocabulary.
- Split into two schemas, not one, because upstream's own entities aren't uniform: `$defs.Description` has `customProperties` + `authoritativeDefinitions` but deliberately **no** `tags`. Rather than give `Description` an unused `tags` field, or duplicate the pair a second time, `AuthoritativeCustomizable` holds the pair and `TagsDiscoverable(AuthoritativeCustomizable)` layers `tags` on top: every consumer inherits from whichever base matches its actual upstream shape.
- `Tags` is a `type` alias (`[str]`), not a `schema`, because `$defs.Tags` upstream is a bare array with no internal structure: a schema wrapper would add nothing.
- `urlPattern` lives as a bare regex string in its own file (`common/url.k`) rather than inside `AuthoritativeDefinition` (its original, single consumer at the time), because it's reused by 4 schemas across 4 different packages (`common`, `product`, `management`, `support`). A package-level constant avoids a circular or awkward cross-import just to reach one string.
- The regex accepts any RFC-3986-style `scheme:opaque-part`, not only `scheme://authority`, specifically so `mailto:`/`tel:`-style URIs pass. `Support.url`'s docstring explicitly names `mailto` as a valid scheme upstream, but the pattern this port inherited required `://` and silently rejected it: fixed in this pass.

## Open Questions

- `urlPattern` is a best-effort regex, not a full RFC 3986 validator. If KCL ever ships a native URI-checking builtin, this constant should be replaced rather than hand-maintained further.
- If KCL gains structural/duck-typed schema composition (satisfying a shape without nominal inheritance), the `AuthoritativeCustomizable`/`TagsDiscoverable` split could potentially collapse into a single schema with an optional `tags` field: revisit if that lands.
- Date/date-time regexes (`team.TeamMember.dateIn`/`.dateOut`, `odps.DataProduct.productCreatedTs`) aren't centralized here even though they're conceptually similar to `urlPattern`. Only two consumers exist today, so the duplication was left as-is rather than adding a `common/date.k` for two call sites: worth centralizing if a third date-like field appears.
