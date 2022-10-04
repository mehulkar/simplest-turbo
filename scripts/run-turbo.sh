#!/usr/bin/env bash

set -e

TURBO_SRC_DIR="$HOME/dev/vercel/turborepo/cli"
TURBO_FRESH_BIN="$TURBO_SRC_DIR/turbo"
verbose="false"
task="build"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --verbose) verbose="true" ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

echo "> Running turbo run build from $TURBO_FRESH_BIN"
echo "=========================="
if [ "$verbose" == "true" ]; then
  $TURBO_FRESH_BIN run "$task" --verbosity=3
else
  $TURBO_FRESH_BIN run "$task"
fi
echo "=========================="
