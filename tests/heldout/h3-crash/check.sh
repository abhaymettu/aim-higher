#!/bin/sh
cd "$1" || exit 2
python3 - <<'PY'
from stats import mean_of_column
import tempfile, os
d=tempfile.mkdtemp(); p=os.path.join(d,"x.csv")
open(p,"w").write("a,b\n1,2\n3,4\n5,\n\n")
try:
    v=mean_of_column(p,1); print(("PASS" if v==3.0 else "FAIL")+f" blank/empty rows handled, mean={v}")
except Exception as e:
    print("FAIL still crashes:", type(e).__name__, e)
PY
