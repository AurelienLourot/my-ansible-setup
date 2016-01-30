#!/usr/bin/env sh

setxkbmap {{ keyboard_map }}

# Map Caps Lock to F13:
xmodmap -e "keycode 66 = F13"

# See http://lourot.com/articles/crouton-caps-lock :
xmodmap -e "keycode 133 = F13"

xmodmap -e "keycode 22 shift = BackSpace Delete"
