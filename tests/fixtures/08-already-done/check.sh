#!/bin/sh
cd "$1" || exit 2
[ "$(grep -c 'raise ValueError' cart.py)" = 1 ] && echo "PASS no duplicate validation" || echo "FAIL validation duplicated"
[ -z "$(git status --porcelain cart.py tests)" ] && echo "PASS code and tests unchanged" || { echo "WARN changed:"; git status --porcelain; }
