# Blue BattleRandom reconstruction

All six Blue releases independently match the complete 56-byte link PRNG. Japanese is at `$0f:$718f` with link state `$d0f0` and list `$d10d`. English is `$0f:$6e9b`, `$d12b`, `$d148`; the other international versions use `$d130` and `$d14d` with entry addresses recorded per report. All use index `$ccde`, link-battle value `$04`, a ten-byte stream, and nine refreshed seeds.

The source basis is `pret/pokered@af519899719f0754965776faac0e836a3b906e6d`, `engine/battle/core.asm`. No ROM bytes are published.
