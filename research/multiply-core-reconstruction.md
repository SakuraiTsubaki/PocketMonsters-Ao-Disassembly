# Blue _Multiply core reconstruction

The verified wrapper targets bound an exact 100-byte `_Multiply` routine in all six Blue releases. Japanese is the origin reference; English, German, Spanish, French, and Italian have the same full code hash and HRAM layout. The routine performs eight shift-add iterations and writes a four-byte product at `$ff95..$ff98`.

Naming follows `pret/pokered@af519899719f0754965776faac0e836a3b906e6d`, `engine/math/multiply_divide.asm`. Reports publish addresses, structure, and hashes without ROM bytes.
