# Module: `product` (root: `product/sbom.k`)

## Schema Mapping

| KCL Schema | Upstream ODCS Entity | Notes |
|---|---|---|
| `Sbom` (`product/sbom.k`) | `$defs.SBOM` | Name is `Sbom` (PascalCase-per-word), not `SBOM` (all-caps acronym) |

## Architecture Decisions

- Named `Sbom` rather than `SBOM` to follow the naming convention used throughout this port (PascalCase words, not preserved acronym casing): see also `InputContract`/`InputPort`/`OutputPort` in [[product-input]]/[[product-output]], none of which preserve upstream's arbitrary-case fragments verbatim either. This is purely cosmetic; upstream's `$defs.SBOM` and this port's `Sbom` are semantically identical.
- Not `Taggable`/`Extensible` (see [[common]]): upstream's `$defs.SBOM` has only `type`/`url`, no `tags`/`customProperties`/`authoritativeDefinitions`, so there's nothing to inherit.
- Lives directly under `product/` (its own file, `sbom.k`, in the shared `product` package) rather than under `product/output/`, even though it's currently only referenced from `OutputPort.sbom`: this keeps `product` importable by both `product.input` and `product.output` without a circular import; see `product/output/port.k`, which does `import product` for `product.Sbom` alongside `import product.input` for `input.InputContract`.

## Open Questions

- If a future ODPS revision adds an `sbom` field to `InputPort` as well (symmetric with `OutputPort`), `Sbom`'s current placement in the shared `product` package already supports that without moving files.
