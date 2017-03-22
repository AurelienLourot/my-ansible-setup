#!/usr/bin/env bash

set -e

ROOT_DIR=~/Documents/git/

cd $ROOT_DIR/google-drive/grive/
grive

for repo in myberl.in mybeir.ut
do
    cd $ROOT_DIR/$repo/snapshots/maps/thirdparty/
    ./download.sh
done

cd $ROOT_DIR/todoist/
todoist s
todoist l > todoist.txt
git commit --allow-empty -am .
git push

SCRIPT_DIR=$(dirname $0)
$SCRIPT_DIR/gitupdate.sh
