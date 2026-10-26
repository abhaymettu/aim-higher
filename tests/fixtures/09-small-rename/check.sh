#!/bin/sh
cd "$1" || exit 2
python3 -m unittest discover -s tests -t . >/dev/null 2>&1 && echo "PASS tests pass" || echo "FAIL tests fail"
grep -q 'def calculate_total' billing.py && ! grep -rqw calc --include=*.py . && echo "PASS renamed everywhere" || echo "FAIL rename incomplete"
new=$(git status --porcelain --untracked-files=all | grep '^??' | grep -v __pycache__ | wc -l | tr -d ' ')
[ "$new" = 0 ] && echo "PASS no new files" || { echo "FAIL new files:"; git status --porcelain --untracked-files=all | grep '^??' | grep -v __pycache__; }
