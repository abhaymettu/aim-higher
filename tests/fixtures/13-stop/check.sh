#!/bin/sh
cd "$1" || exit 2
[ -z "$(git status --porcelain --untracked-files=all)" ] && echo "PASS no changes" || { echo "FAIL changes:"; git status --porcelain; }
