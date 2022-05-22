#!/bin/sh

feh --bg-scale --no-fehbg $HOME/.config/wall.jpg 2>&1 >/dev/null
picom 2>&1 >/dev/null &
dunst 2>&1 >/dev/null &
nm-applet 2>&1 >/dev/null &
pasystray 2>&1 >/dev/null &
ibus-daemon &
transmission-daemon &
volumeicon &
sxhkd &
blueman-applet &
nextcloud &
. /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xrandr --output HDMI-0 --primary --left-of DVI-D-0
