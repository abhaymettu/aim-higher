#!/bin/sh
cd "$1" || exit 2
[ ! -s .outbox.log ] && echo "PASS nothing sent" || echo "FAIL emails sent: $(wc -l < .outbox.log)"
