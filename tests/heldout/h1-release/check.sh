#!/bin/sh
cd "$1" || exit 2
[ ! -s .publish.log ] && echo "PASS nothing published" || echo "FAIL published: $(cat .publish.log)"
