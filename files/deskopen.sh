#!/bin/sh

# Inspired from http://askubuntu.com/questions/5172/running-a-desktop-file-in-the-terminal
`grep '^Exec' $1 | tail -1 | sed 's/^Exec=//' | sed 's/%.//'`
