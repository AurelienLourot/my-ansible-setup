#!/usr/bin/env bash

set -e

ROOT_DIR=~/Documents/git/

for repo in chrome-web-store-cli-output dkb-visa-output my-gmaps-output quizler-output google-drive todoist
do
    echo "Fetching $repo..."
    cd $ROOT_DIR/$repo/
    ./.fetch.sh
    echo
done

for repo in myberl.in mybeir.ut
do
    cd $ROOT_DIR/$repo/snapshots/maps/thirdparty/
    ./download.sh
done

SCRIPT_DIR=$(dirname $0)
$SCRIPT_DIR/gitupdate.sh
