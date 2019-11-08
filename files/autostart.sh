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

# Just in case we have a second screen plugged in, make sure we don't use it so that the desktop
# consoles have the size of the first screen:
undock

for i in $(seq 1 8)
do
  createDesktopConsole.sh $i
done
for i in $(seq 1 5) # devilspie2 isn't reliable so we have to try several times
do
  devilspie2 &
  sleep 1
  killall devilspie2
done

focusDesktopConsole.sh &

xscreensaver &
