#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$(readlink -e "$0")")"

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
  BUFFER=" c -- ${(q)dir:a}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}

zle -N fzf-c-widget

FZF_CTRL_F_COMMAND='find -L -mindepth 1 -maxdepth 1 -type d'
if builtin type eza > /dev/null; then
  FZF_CTRL_F_OPTS='--preview "eza -ldgF --color=always --icons=auto {}"'
else
  FZF_CTRL_F_OPTS='--preview "ls -ldF --color=always {}"'
fi
FZF_CTRL_T_COMMAND='find -L -mindepth 1 -maxdepth 1'
if builtin type fzf-preview.sh > /dev/null; then
  FZF_CTRL_T_OPTS='--preview "fzf-preview.sh {}" --bind ctrl-f:"execute(nvim <<<{})"'
else
  FZF_CTRL_T_OPTS='--preview "bat -n --color=always {}" --bind ctrl-f:"execute(nvim <<<{})"'
fi

command-widget() {
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER=" $*"
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

cwd-history-widget() {
  local query=$LBUFFER
  LBUFFER="$(atuin search --cwd=. --print0 \
    | fzf \
      --scheme history \
      --nth 2 \
      --accept-nth 2 \
      --no-sort \
      --delimiter '\t' \
      --read0 \
      --ansi \
      --height "${FZF_TMUX_HEIGHT:-40%}" \
      --min-height 20+ \
      --border \
      --highlight-line \
      --wrap \
      --wrap-sign ' ↳ ' \
      --tac \
      --prompt 'cwd> ' \
      "--query=$query" \
      --bind ctrl-f:"execute(nvim +'"'normal $daW_d2aW'"' <<<{})" \
      --bind ctrl-r:toggle-sort \
      --bind ctrl-z:ignore)"
  local ret=$?

  # `fzf` got closed without picking any entry.
  # Initial query has to be restored.
  if [ "$ret" -eq 130 ]; then
    LBUFFER=$query
  fi

  zle reset-prompt
  return $ret
}

zle -N cwd-history-widget

history-widget() {
  local query=$LBUFFER
  LBUFFER="$(atuin search --print0 \
    | fzf \
      --scheme history \
      --nth 2 \
      --accept-nth 2 \
      --no-sort \
      --delimiter '\t' \
      --read0 \
      --ansi \
      --height "${FZF_TMUX_HEIGHT:-40%}" \
      --min-height 20+ \
      --border \
      --highlight-line \
      --wrap \
      --wrap-sign ' ↳ ' \
      --tac \
      --prompt 'global> ' \
      "--query=$query" \
      --bind ctrl-f:"execute(nvim +'"'normal $daW_d2aW'"' <<<{})" \
      --bind ctrl-r:toggle-sort \
      --bind ctrl-z:ignore)"
  local ret=$?

  # `fzf` got closed without picking any entry. Initial query has to be restored.
  if [ "$ret" -eq 130 ]; then
    LBUFFER=$query
  fi

  zle reset-prompt
  return $ret
}

zle -N history-widget

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
zstyle :zle:edit-command-line editor nvim \
  '+lua require("scratch").shell()' \
  '+0r !atuin search --format "{command}"' \
  '+normal G"_ddp' \
  '+setlocal filetype=sh'
