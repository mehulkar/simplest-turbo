#!/usr/bin/env bash

set -e

TURBO_SRC_DIR="$HOME/dev/vercel/turbo/cli"
TURBO_FRESH_BIN="$TURBO_SRC_DIR/turbo"

task="build"

echo "> Running turbo run $task from $TURBO_FRESH_BIN"
echo "=========================="
$TURBO_FRESH_BIN run "$task" --dry-run
echo "=========================="
