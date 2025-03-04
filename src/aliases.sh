#!/usr/bin/env zsh

if builtin type eza > /dev/null; then
  c_ls() {
    eza -lgF --color=auto "$@"
  }
else
  c_ls() {
    ls -lF --color=auto "$@"
  }
fi

c() {
  cd "$@" || return
  c_ls
}

cp-image() {
  xclip -selection clipboard -target image/png -i "$@"
}

tmuxc() {
  tmux set-buffer "$@" "$(cat)"
}

v() {
  if [ -e "$XDG_CACHE_HOME/nvim/server.pipe" ]; then
    nvim "$@"
  else
    nvim --listen "$XDG_CACHE_HOME/nvim/server.pipe" "$@"
  fi
}

vs() {
  paths=()
  while [ "$#" -gt 0 ]; do
    paths+=("$(realpath "$1")")
    shift
  done
  nvim --server "$XDG_CACHE_HOME/nvim/server.pipe" --remote-tab "${paths[@]}"
}

aliascp() {
  xclip -selection clipboard << 'EOF'
c_ls() {
  ls -lF --color=auto "$@"
}

c() {
  cd "$@" || return
  c_ls
}

v() {
  if type nvim > /dev/null; then
    nvim "$@"
  elif type vim > /dev/null; then
    vim "$@"
  elif type vi > /dev/null; then
    vi "$@"
  else
    less "$@"
  fi
}

alias d='docker'
alias g='git'
alias l='c_ls'
alias ll='c_ls -A'
alias m='man'
EOF
}

alias config='vim ~/.config/nvim/lua/options.lua'
alias d='docker'
alias g='git'
alias hoogle='hoogle --database ~/.cache/hoogle/database.hoo'
alias ipython='ipython --no-banner'
alias l='c_ls'
alias ll='c_ls -A'
alias m='man'
alias screenkey='screenkey -t 0.5 -s small --opacity 0.3'
alias sxiv='nsxiv'
alias t='tmux -u'
alias tmux='tmux -u'
alias trr='transmission-remote'
alias trs='transmission-show'
alias vim='nvim'
alias ytfzf='ytfzf --detach --show-thumbnails --async-thumbnails'

# enable color support
if [ -x /usr/bin/dircolors ]; then
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
