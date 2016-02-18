; Map Shift+click to middle button
; Map on Release so that it does not appear both buttons are pressed
; See http://lourot.com/articles/crouton-emacs-middle-click
(xbindkey '(release shift "b:1") "xdotool click --clearmodifiers 2")
