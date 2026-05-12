#!/usr/bin/env zsh

if builtin type eza > /dev/null; then
  c_ls() {
    eza -lgF --color=auto --icons=auto "$@"
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

dump-image() {
  xclip -selection clipboard -target image/png -o "$@"
}

load-image() {
  xclip -selection clipboard -target image/png -i "$@"
}

alias clip='xclip -selection clipboard'
alias d='docker'
alias g='git'
alias ipython='ipython --no-banner'
alias l='c_ls'
alias ll='c_ls -A'
alias sxiv='nsxiv'
alias t='tmux -u'
alias tmux='tmux -u'
alias v='nvim'
alias vim='nvim'

# enable color support
if [ -x /usr/bin/dircolors ]; then
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
