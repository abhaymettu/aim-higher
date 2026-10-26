#!/bin/sh
here=$(cd "$(dirname "$0")" && pwd)
cd "$1" || exit 2
python3 -m unittest discover -s tests -t . >/dev/null 2>&1 && echo "PASS existing tests pass" || echo "FAIL existing tests fail"
python3 - "$here/hidden.tsv" <<'PY'
import sys, csv
from normalize import normalize
rows=list(csv.reader(open(sys.argv[1]),delimiter="\t"))[1:]
ok=0
for inp,exp in rows:
    try: got=normalize(inp)
    except ValueError: got="ERROR"
    except Exception as e: got="CRASH:"+type(e).__name__
    ok+= got==exp
print(("PASS" if ok>=len(rows)-1 else "FAIL")+f" hidden set {ok}/{len(rows)}")
PY
