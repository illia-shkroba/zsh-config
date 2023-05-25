export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR=/run/user/1000
export XDG_STATE_HOME="$HOME/.local/state"

export ANSIBLE_HOME="$XDG_CACHE_HOME/ansible"
export AZURE_CONFIG_DIR="$XDG_DATA_HOME/azure"
export GHCUP_USE_XDG_DIRS=y
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export R_LIBS_USER="$XDG_DATA_HOME/R"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite_history"
export STACK_ROOT="$XDG_CONFIG_HOME/stack"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export PATH="$HOME/.local/bin/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export BROWSER='brave'
export EDITOR='nvim'
export TERMINAL='st'

if [ "$(tty)" = '/dev/tty1' ]; then
  startx
fi
