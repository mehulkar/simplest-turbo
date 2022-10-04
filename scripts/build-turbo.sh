#!/usr/bin/env bash

set -e

TURBO_SRC_DIR="$HOME/dev/vercel/turborepo/cli"
echo "> Building CLI from $TURBO_SRC_DIR"
pushd "$PWD" > /dev/null
cd "$TURBO_SRC_DIR"
make > /dev/null
popd > /dev/null
