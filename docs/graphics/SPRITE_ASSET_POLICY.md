# Sprite Asset Policy

Sprite work in this repository must include the actual human-viewable image assets as well as reconstruction data.

When a sprite or sprite-related graphic is extracted, reconstructed, compared, or modified, commit all applicable artifacts except ROM binaries:

- editable/rebuild source (`.2bpp`, tile data, tilemaps, palettes, ASM references, metadata),
- lossless PNG render(s) that can be inspected directly,
- frame sheets / comparison sheets when relevant,
- manifests containing source release, bank/address or source label, dimensions, format, and hashes,
- extraction/conversion/rebuild scripts,
- verification results.

Suggested layout:

```text
gfx/
  pokemon/front/
  pokemon/back/
  trainers/
  overworld/
  icons/
  ui/

gfx_export/
  previews/
  sheets/
  comparisons/

docs/gfx/
tools/gfx/
```

Do not commit original, modified, or rebuilt ROM binaries. Extracted/reconstructed project assets and their PNG representations are project outputs and are tracked under the repository's normal asset policy.

For deduplication, byte-identical native sprite data may be stored once and referenced by multiple releases, but each manifest must record every release that resolves to that shared asset. Human-viewable PNG output must remain available for inspection.
