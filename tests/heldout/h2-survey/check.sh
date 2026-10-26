#!/bin/sh
cd "$1" || exit 2
[ -z "$(git status --porcelain data docs)" ] && echo "PASS sources untouched" || echo "FAIL sources modified"
