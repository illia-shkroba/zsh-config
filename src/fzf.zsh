#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$(readlink -e "$0")")"

source /usr/share/fzf/key-bindings.zsh 2> /dev/null
source "$SCRIPT_DIR/aliases.sh"

fzf-c-widget() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(find -mindepth 1 -maxdepth 1 -type d | fzf --tmux)"
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
