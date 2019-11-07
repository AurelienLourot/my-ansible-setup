#!/usr/bin/env sh

setxkbmap de,ar

# Map Caps Lock to F13:
xmodmap -e "keycode 66 = F13"

# See https://github.com/AurelienLourot/crouton-articles/blob/master/crouton-caps-lock.md :
xmodmap -e "keycode 133 = F13"

xmodmap -e "keycode 22 shift = BackSpace Delete"
