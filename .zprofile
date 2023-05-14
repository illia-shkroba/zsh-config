export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

export GHCUP_USE_XDG_DIRS=y
export STACK_ROOT="${XDG_CONFIG_HOME:-$HOME/.config}/stack"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

export BROWSER='brave'
export EDITOR='nvim'
export TERMINAL='st'

if [ "$(tty)" = '/dev/tty1' ]
then
  startx
fi
