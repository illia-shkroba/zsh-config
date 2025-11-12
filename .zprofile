export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_STATE_HOME="$HOME/.local/state"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"
export ATUIN_NOBIND="true"
export AZURE_CONFIG_DIR="$XDG_DATA_HOME/azure"
if [ -f "$XDG_CONFIG_HOME/cabal/config" ]; then
  export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
  export CABAL_DIR="$XDG_DATA_HOME/cabal"
fi
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export FZF_DEFAULT_OPTS_FILE="$ZDOTDIR/etc/fzfrc"
export GHCUP_USE_XDG_DIRS=y
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export MINIKUBE_HOME="$XDG_DATA_HOME/minikube"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export R_LIBS_USER="$XDG_DATA_HOME/R"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite_history"
export STACK_ROOT="$XDG_CONFIG_HOME/stack"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

prepend_path() {
  case ":$PATH:" in
    *:"$1":*) ;;
    *)
      PATH="$1${PATH:+:$PATH}"
      ;;
  esac
}

prepend_path "$HOME/.local/bin/scripts"
prepend_path "$HOME/.local/bin"

export PATH

unset -f prepend_path

export BROWSER='qutebrowser'
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export MANWIDTH='999'
export TERMINAL='st'

if [ "$(tty)" = '/dev/tty1' ]; then
  startx
fi
