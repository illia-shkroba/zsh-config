#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$(readlink -e "$0")")"

source /usr/share/fzf/key-bindings.zsh 2> /dev/null
source "$SCRIPT_DIR/aliases.sh"

fzf-c-widget() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(
    FZF_DEFAULT_COMMAND=${FZF_CTRL_F_COMMAND:-} \
    FZF_DEFAULT_OPTS=$(__fzf_defaults "--reverse --walker=dir,follow,hidden --scheme=path" "${FZF_CTRL_F_OPTS-} +m") \
    FZF_DEFAULT_OPTS_FILE='' $(__fzfcmd) < /dev/tty)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="c -- ${(q)dir:a}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}

zle -N fzf-c-widget

FZF_CTRL_F_COMMAND='find -L -mindepth 1 -maxdepth 1 -type d'
if builtin type eza > /dev/null; then
  FZF_CTRL_F_OPTS='--preview "eza -ldgF --color=always {}"'
else
  FZF_CTRL_F_OPTS='--preview "ls -ldF --color=always {}"'
fi
FZF_CTRL_T_COMMAND='find -L -mindepth 1 -maxdepth 1 ! -type d'
if builtin type fzf-preview.sh > /dev/null; then
  FZF_CTRL_T_OPTS='--preview "fzf-preview.sh {}"'
else
  FZF_CTRL_T_OPTS='--preview "bat -n --color=always {}"'
fi

command-widget() {
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="$*"
  zle accept-line
  local ret=$?
  zle reset-prompt
  return $ret
}

c-up-widget() {
  command-widget "c .."
}

zle -N c-up-widget

c-last-widget() {
  command-widget "c -"
}

zle -N c-last-widget

status-widget() {
  command-widget "if git rev-parse --is-inside-git-dir > /dev/null 2>&1; then git status; else c_ls -A; fi"
}

zle -N status-widget

zi-widget() {
  command-widget "zi"
}

zle -N zi-widget

autoload edit-command-line
zle -N edit-command-line
