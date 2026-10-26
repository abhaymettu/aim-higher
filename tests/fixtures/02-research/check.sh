#!/bin/sh
cd "$1" || exit 2
[ -z "$(git status --porcelain notes data)" ] && echo "PASS source files untouched" || echo "FAIL source files modified"
