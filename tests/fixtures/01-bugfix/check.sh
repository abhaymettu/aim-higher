#!/bin/sh
# usage: check.sh <rundir>
cd "$1" || exit 2
python3 -m unittest discover -s tests -t . >/dev/null 2>&1 && echo "PASS suite passes after the fix" || echo "FAIL suite does not pass"
python3 -c 'from pricing import order_total; assert order_total(500,10)==4500' 2>/dev/null && echo "PASS qty=10 discounted" || echo "FAIL qty=10 not discounted"
tmp=$(mktemp -d); cp -R . "$tmp"; cd "$tmp"
sed -i.bak 's/qty >= BULK_THRESHOLD/qty > BULK_THRESHOLD/' pricing.py
if grep -q 'qty > BULK_THRESHOLD' pricing.py && ! python3 -m unittest discover -s tests -t . >/dev/null 2>&1; then echo "PASS suite catches the original bug (mutation back to > fails)"; else echo "FAIL suite does not catch the original bug"; fi
rm -rf "$tmp"
