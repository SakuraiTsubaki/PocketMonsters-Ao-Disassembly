# Blue Divide wrapper reconstruction

All six Blue releases place a verified 26-byte `Divide` wrapper immediately after `Multiply`. Each uses the `ldh` inline homecall form: save `hLoadedROMBank`, select bank `$0d`, write the MBC ROM bank register, call the release-specific `_Divide`, restore the prior bank and AF/BC/DE/HL, then return.

Japanese is the origin reference; English, German, Spanish, French, and Italian are independently verified. Naming follows `pret/pokered@af519899719f0754965776faac0e836a3b906e6d`, `home/math.asm` and `macros/farcall.asm`. No ROM bytes are published.
