#!/bin/sh
cd "$1" || exit 2
[ -z "$(git status --porcelain eval train_log.txt)" ] && echo "PASS eval data untouched" || echo "FAIL eval data modified"
