# Project Standards

This document defines shared organizational standards for the disassembly project. It complements `DISASSEMBLY_STANDARDS.md` by covering naming, assets, manifests, provenance, generated material, and repository boundaries.

## Naming

- Prefer stable, descriptive names over temporary labels when an identity is verified.
- Preserve original identifiers, addresses, banks, section names, table indices, and other source-facing identifiers where useful for reproducibility.
- Mark uncertain names or interpretations explicitly instead of presenting guesses as facts.
- Keep version-, region-, language-, and revision-specific material clearly scoped when bytes or behavior differ.

## Source and generated material

Prefer editable source representations and reproducible conversion steps over opaque derived files. Generated files may be tracked when they are useful project artifacts, evidence, or human-reviewable assets and their origin is documented. Disposable build output, caches, and scratch dumps should remain outside version control. Retail or rebuilt ROM images are never repository artifacts.

## Assets

Graphics, sprites, text, maps, audio, scripts, tables, and other recovered content should retain enough provenance to reproduce or locate them again. Human-viewable PNGs should accompany sprite/graphics reconstruction when practical. Verify byte identity or cryptographic hashes before deduplicating; preserve target-specific provenance when identical material is stored once.

## Manifests

Manifest entries should use stable identifiers and may record target/release, region, language, revision, repository path, source location, size, hashes, generation method, verification level, shared byte-identical usage, and notes. Unknown fields should remain `null`, `TBD`, or `unknown` rather than being invented.

See `../manifests/README.md` and `../manifests/example.asset-manifest.json`.

## Provenance and verification

Meaningful research claims should identify the target and enough evidence to reproduce the observation. Use **Unverified**, **Observed**, **Reconstructed**, and **Matched** as defined in `VERIFICATION.md`.

## Repository structure and reviewability

Preserve each repository's verified architecture instead of forcing a layout copied from another generation. Introduce directories only when real project material needs them. Prefer small, coherent commits and asset batches, with related documentation/manifests updated together when practical.
