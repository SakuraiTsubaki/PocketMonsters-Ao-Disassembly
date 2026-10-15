# Blue Random wrapper reconstruction

All six verified Blue releases contain one complete 17-byte `Random` home-bank wrapper. Japanese uses `$3ea0`, far-calls `$04:$7fee`, and calls `Bankswitch` at `$3636`. English, German, Spanish, French, and Italian use release-specific addresses and call the corresponding verified `Random_`; all return `hRandomAdd=$ffd3` while preserving BC, DE, and HL.

The basis is `pret/pokered@af519899719f0754965776faac0e836a3b906e6d`, `home/random.asm` and `macros/farcall.asm`. Evidence order is Japanese, English, then the remaining official languages because there is no official Korean Generation I release. No ROM bytes are published.
