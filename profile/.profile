feh --bg-fill --no-fehbg $HOME/.config/wall.jpg 2>&1 > /dev/null
picom &
dunst &
sxhkd &
emacs --daemon
