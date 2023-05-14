export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

export ANSIBLE_HOME="$XDG_CACHE_HOME/ansible"
export AZURE_CONFIG_DIR="$XDG_DATA_HOME/azure"
export GHCUP_USE_XDG_DIRS=y
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export STACK_ROOT="$XDG_CONFIG_HOME/stack"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

export BROWSER='brave'
export EDITOR='nvim'
export TERMINAL='st'

if [ "$(tty)" = '/dev/tty1' ]
then
  startx
fi
