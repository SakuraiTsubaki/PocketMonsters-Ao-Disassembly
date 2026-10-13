# Main font loader provenance

The Japanese origin release and all five official global Blue releases were
scanned independently for the Gen I 1bpp font-loading routine. Every verified
ROM contains exactly one matching loader, and every loader resolves to the
same source offset and source hash already recorded by that release's font
extraction report.

Japanese Blue loads the 1,024-byte font from `0x11E99`; the global releases
load their language-specific font from `0x11A80`. Loader code positions differ
slightly by localization and are recorded individually in the manifest and
analysis reports. This proves the runtime code-to-asset relationship rather
than relying only on a known data offset.

The reports contain ROM identity, loader location, banked address, source
range, and hashes. They contain neither instruction bytes nor font bytes.

