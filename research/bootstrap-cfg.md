# Japanese bootstrap control-flow graph

A depth-one CFG begins at $1f3a. Its internal WRAM-clear loop is retained as an edge without duplicating an overlapping block, while the fallthrough block at $1f6e is decoded through its terminating jump to $42d6. The two contiguous blocks cover 176 exact ROM bytes. Analysis, RGBDS source, provenance manifest, and tests are committed without ROM data; release status remains unchanged.

