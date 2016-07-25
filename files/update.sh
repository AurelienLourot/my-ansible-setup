#!/usr/bin/env bash

set -e

ROOT_DIR=~/Documents/git/

cd $ROOT_DIR/google-drive/grive/
grive

cd $ROOT_DIR/myberl.in/snapshots/maps/thirdparty/
./download.sh

cd $ROOT_DIR/cliist/
./cliist.py -A > $ROOT_DIR/todoist/todoist.txt

SCRIPT_DIR=$(dirname $0)
$SCRIPT_DIR/gitupdate.sh
