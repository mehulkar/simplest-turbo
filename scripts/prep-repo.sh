#!/usr/bin/env bash

exit
set -e

deleteCache="false"
changeCode="false"


while [[ "$#" -gt 0 ]]; do
    case $1 in
        --delete-cache) deleteCache="true" ;;
        --change-code) changeCode="true" ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

echo "done parsing args"

if [ "$deleteCache" == "true" ]; then
  echo "> ⚠️  Deleting ./node_modules/.cache/turbo"
  rm -rf ./node_modules/.cache/turbo
  echo "> ⚠️  Deleting apps/a/.turbo"
  echo "> ⚠️  Deleting apps/b/.turbo"
  rm -rf apps/a/.turbo/
else
  echo "> Keeping cache"
fi

function changeFile() {
  file=$1
  echo "> ⚠️  Changing code in $file"
  before=$(jq .description < "$file")
  node ./scripts/change-pkg.js "$file"
  after=$(jq .description < "$file")
  if [ "$before" != "$after" ]; then
    echo "> $file description changed from $before to $after"
  else
    echo "$file description did not change"
    exit 1
  fi
}

if [ "$changeCode" == "true" ]; then
  changeFile "apps/a/package.json"
  changeFile "apps/b/package.json"
else
  echo "> Not changing code code"
fi
