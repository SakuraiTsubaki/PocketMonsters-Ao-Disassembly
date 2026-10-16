# Blue Multiply wrapper reconstruction

All six catalogued Blue releases contain one verified 13-byte home-bank `Multiply` wrapper. Japanese Blue targets `$0d:$7d9b`; English, German, and Spanish target `$0d:$7d41`; French and Italian target `$0d:$7d4d`. Each release-specific `Bankswitch` address is retained in its report.

Japanese is the origin reference, with all five Western languages independently verified against their ROM hashes. Naming and macro expansion follow `pret/pokered@af519899719f0754965776faac0e836a3b906e6d`, `home/math.asm` and `macros/farcall.asm`. No ROM bytes are published.
