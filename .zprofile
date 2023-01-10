export BROWSER='brave'
export EDITOR='nvim'
export TERMINAL='st'
export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export STACK_ROOT="${XDG_CONFIG_HOME:-$HOME/.config}/stack"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GHCUP_USE_XDG_DIRS=y

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

if [ "$(tty)" = '/dev/tty1' ]
then
  startx
fi
