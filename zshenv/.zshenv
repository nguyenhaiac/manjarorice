export ZDOTDIR=$HOME/.config/zsh
export PATH=$HOME/.local/bin/scripts/:$PATH
export PATH=$HOME/Applications/:$PATH
export PATH=$HOME/.local/bin/scripts/statusbar:$PATH
export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$HOME/racket/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=~/.local/bin:$PATH
export EDITOR=emacs
export TERMINAL=alacritty
export FILE=ranger
export BROWSER=firefox
export WORKON_HOME=$HOME/venv
export _JAVA_AWT_WM_NONREPARENTING=1
export SHELL=$(which zsh)
export weatherreport=$HOME/.weatherreport 

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export LOCATION=hanoi

# export GTK_IM_MODULE=xim
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=xim


export PYTHONPATH=$HOME/.local/python
export SHELL=/usr/bin/zsh
export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/python@3.8/lib/pkgconfig"
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/python@3.8/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/python@3.8/include"
export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.8/bin:$PATH"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
