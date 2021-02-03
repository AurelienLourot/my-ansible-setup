#!/usr/bin/env bash

exec > /tmp/autostart.log
exec 2>&1
set -x

. ~/.bash_aliases
shopt -s expand_aliases
alias

xhost +  # allows any user to start X apps

setxkb.sh
xbindkeys -f ~/.xbindkeysrc.scm

# Mount sdcard on chromebook:
sudo /usr/local/bin/mount_sdcard.sh

# Necessary in crouton. On classic Ubuntu, won't have any effect as cron is already running:
sudo cron

purgetrash.sh

xscreensaver &
