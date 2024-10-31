#!/usr/bin/env sh

alias config='vim ~/.config/nvim/lua/options.lua'
alias d='docker'
alias g='git'
alias hoogle='hoogle --database ~/.cache/hoogle/database.hoo'
alias ipython='ipython --no-banner'
alias l='ls -lF'
alias ll='ls -lAF'
alias m='man'
alias sxiv='nsxiv'
alias tmux='tmux -u'
alias trr='transmission-remote'
alias trs='transmission-show'
alias v='nvim'
alias vim='nvim'
alias ytfzf='ytfzf --detach --show-thumbnails --async-thumbnails'

# enable color support
if [ -x /usr/bin/dircolors ]; then
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

c() {
  cd "$@" || return
  ls -lF --color=auto
}

tmuxc() {
  tmux set-buffer "$@" "$(cat)"
}
