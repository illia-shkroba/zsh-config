#!/usr/bin/env sh

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

tmuxc() {
  tmux set-buffer "$@" "$(cat)"
}

v() {
  if [ -f 'Session.vim' ]; then
    nvim -S 'Session.vim' "$@"
  else
    nvim "$@"
  fi
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
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
