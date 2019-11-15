#!/usr/bin/env bash

set -e

for i in $(find -L ~/Documents/git/ -maxdepth 3 -name .fetch.sh)
do
  repo=$(dirname $i)
  echo "Fetching $repo..."
  cd $repo
  ./.fetch.sh "$@"
  echo
done

SCRIPT_DIR=$(dirname $0)
$SCRIPT_DIR/gitupdate.sh
