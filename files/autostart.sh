#!/usr/bin/env bash

exec > /tmp/autostart.log
exec 2>&1
set -x

. ~/.bash_aliases
shopt -s expand_aliases
alias

xhost +  # allows any user to start X apps

setxkb.sh

purgetrash.sh
