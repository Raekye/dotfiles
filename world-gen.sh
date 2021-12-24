#!/usr/bin/env bash

find . -regex '.*\.\(h\|c\|hpp\|cpp\|cc\)' > cscope.files
# -b: only build database
# -q: build reverse database, makes things faster
# -k: kernel mode, don't look in default include dir (typically `/usr/include`)
# -R: look recursively
# -i: input file
cscope -b -q -k -R -i cscope.files

echo "World generated."
