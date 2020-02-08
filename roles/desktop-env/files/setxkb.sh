#!/usr/bin/env sh

setxkbmap de,ar

# Map Caps Lock to F13:
xmodmap -e "keycode 66 = F13"

# See https://github.com/AurelienLourot/crouton-articles/blob/master/crouton-caps-lock.md :
xmodmap -e "keycode 133 = F13"

xmodmap -e "keycode 22 shift = BackSpace Delete"

## Useful stuff for when you break your left wrist ;)
##
## # https://askubuntu.com/questions/375056/re-mapping-alt-gr-key
## xmodmap -e "clear mod5"; sleep 1
## xmodmap -e "keycode 108 = Alt_L"
##
## xmodmap -e "keycode 21 = at"
## xmodmap -e "keycode 94 mod1 = pipe"
