#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$(readlink -e "$0")")"

# menuselect
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# normal
bindkey -M vicmd '=' which-command
bindkey -M vicmd '?' run-help
bindkey -M vicmd 'U' redo

# insert
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M viins '^s' history-incremental-search-forward
bindkey -M viins '^n' down-history
bindkey -M viins '^p' up-history
bindkey -M viins '^y' yank
bindkey -M viins '^u' kill-whole-line

# Confirm autocompletion in insert mode.
bindkey '^k' end-of-line

# Edit line in vim with ctrl-e:
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Set fzf bindings.
source "$SCRIPT_DIR/fzf.zsh"
bindkey '^f' fzf-c-widget
bindkey '^g' fzf-cd-widget
