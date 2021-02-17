#!/bin/sh

feh --bg-scale --no-fehbg $HOME/.config/wall.jpg 2>&1 >/dev/null
picom 2>&1 >/dev/null &
dunst 2>&1 >/dev/null &
sxhkd 2>&1 >/dev/null &
nm-applet 2>&1 >/dev/null &
pasystray 2>&1 >/dev/null &
/usr/local/bin/dwmblocks &
emacs --daemon 2>&1 >/dev/null &
udiskie --tray 2>&1 > /dev/null &
/home/hainguyen/.local/bin/scripts/dropbox.py start
ibus-daemon &
transmission-daemon &
mpd &
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
