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

pgrep nm-applet || nm-applet &
onboard &

# Just in case we have a second screen plugged in, make sure we don't use it so that the desktop
# consoles have the size of the first screen:
undock

devilspie2 &
for i in $(seq 1 8)
do
  createDesktopConsole.sh $i
  sleep 0.1 # otherwise might be too fast for devilspie
done

focusDesktopConsole.sh &

xscreensaver &
