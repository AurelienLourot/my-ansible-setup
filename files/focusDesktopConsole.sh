#!/usr/bin/env bash
while true; do
  echo "----"
  desktopId=$(xdotool get_desktop)
  numWindows=$(xdotool search --desktop $desktopId --class . | wc -l)
  echo "Current desktop $desktopId has $numWindows window(s)."
  if [[ "$numWindows" == "1" ]]
  then
    xdotool search --desktop $desktopId --class . windowfocus
  fi
  sleep 1
done
