# Japanese Pocket Monsters Ao — Virtual Console source census

Research restart date: 2026-09-14

## Public reconstruction evidence

`Narishma-gb/pokeblue` builds both the Japanese cartridge target and a 3DS Virtual Console patch target:

- Cartridge SHA-1: `0da501e3e5c51ab8fef55b092dcdd7e6b050e424`
- VC patch: `DMGAPEJ0.C62.patch`
- VC patch SHA-1: `b179b89345e209575e4e59ad9a7997868e1ef83c`

Public source files:

- `vc/pokeblue.patch.template`
- `vc/vc_constants.asm`

Upstream: https://github.com/Narishma-gb/pokeblue

## Patch-template behaviors visible in the public source

The patch template is not just a checksum blob. It labels multiple emulator/VC hooks and mitigation regions, including:

- save-data limit metadata (`SaveLimit`);
- wireless transfer wait/start/end hooks;
- wireless zero-byte send hooks;
- network-delay fixes;
- exchange hooks for RNG/unknown state, party structures, and patch lists;
- link-cable fake-connection / wireless prompt behavior;
- input blocking around quick-save/link flow;
- trade save-end hook;
- changed link-closed inactivity message;
- battle RNG return hooks;
- photosensitivity / flashing-reduction (`FPA`) regions for battle animations.

The template therefore provides source-level evidence that the VC release is an adaptation layer, not a byte-identical cartridge execution environment.

## Research rule

- Cartridge behavior remains the original baseline.
- VC hooks/patches are recorded as later official modifications.
- Labels in the public template are useful but still require code-address and behavior verification against the reconstructed cartridge source.
- Ao VC findings must not be silently generalized to Red/Green or Pikachu; each title's patch templates are surveyed independently.
