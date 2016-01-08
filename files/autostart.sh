#!/bin/sh

xhost +  # allows any user to start X apps

xmodmap -e "keycode 133 = Caps_Lock"
xmodmap -e "keycode 22 shift = BackSpace Delete"

# Necessary in crouton. On classic Ubuntu, won't have any effect as cron is already running:
sudo cron

purgetrash.sh

pgrep nm-applet || nm-applet &

devilspie &
for i in $(seq 1 8)
do
    gnome-terminal --geometry=50x50+50+50 --window-with-profile=DesktopConsole$i &
    sleep 0.1 # otherwise might be too fast for devilspie
done

focusDesktopConsole.sh &
