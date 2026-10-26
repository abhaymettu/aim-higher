#!/bin/sh
# usage: run-fixture.sh prepare <fixture-dir> <runs-root>   -> prints the fresh run directory
#        run-fixture.sh check   <fixture-dir> <run-dir>     -> prints PASS/FAIL/WARN/INFO lines
set -e
cmd=$1; fx=$(cd "$2" && pwd); name=$(basename "$fx")
case $cmd in
  prepare)
    mkdir -p "$3"; run=$(mktemp -d "$3/$name.XXXX")
    cp -R "$fx/workspace/." "$run/"
    git -C "$run" init -q
    printf "__pycache__/\n*.pyc\n" > "$run/.git/info/exclude"
    git -C "$run" add -A
    git -C "$run" -c user.name=fixture -c user.email=fixture@example.invalid commit -q -m baseline
    echo "$run" ;;
  check)
    sh "$fx/check.sh" "$3" ;;
  *) echo "usage: $0 prepare|check <fixture-dir> <dir>" >&2; exit 2 ;;
esac
