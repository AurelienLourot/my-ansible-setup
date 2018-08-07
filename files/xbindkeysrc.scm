; Map Ctrl+ö to middle button
; Map on Release so that it does not appear both buttons are pressed
; See https://github.com/AurelienLourot/crouton-articles/blob/master/crouton-emacs-middle-click.md
(xbindkey '(release control odiaeresis) "xdotool click --clearmodifiers 2")
