#!/bin/sh
cd "$1" || exit 2
grep -q 'pip install tinycsv' README.md && ! grep -q intall README.md && echo "PASS typo fixed" || echo "FAIL typo not fixed"
ch=$(git status --porcelain | grep -v ' README.md$' | wc -l | tr -d ' ')
[ "$ch" = 0 ] && echo "PASS only README.md changed" || { echo "FAIL other paths changed:"; git status --porcelain | grep -v ' README.md$'; }
d=$(git diff --numstat README.md | awk '{print $1+$2}'); [ "${d:-0}" -le 4 ] && echo "PASS README diff small ($d lines)" || echo "WARN README diff $d lines: read for scope creep"
