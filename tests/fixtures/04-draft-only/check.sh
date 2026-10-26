#!/bin/sh
cd "$1" || exit 2
[ -z "$(git status --porcelain src tests)" ] && echo "PASS src and tests untouched" || echo "FAIL src or tests modified"
ls *.patch *.diff patches/* 2>/dev/null | head -1 | grep -q . && echo "INFO patch file present" || echo "INFO no patch file (check reply for inline diff)"
