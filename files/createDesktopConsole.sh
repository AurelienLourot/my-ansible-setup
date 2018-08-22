#!/usr/bin/env bash

# Create a terminal and use it as background of desktop number $1

gnome-terminal --geometry=50x50+50+50 --window-with-profile=DesktopConsole$1 &
