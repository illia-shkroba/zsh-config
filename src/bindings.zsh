#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$(readlink -e "$0")")"
source "$SCRIPT_DIR/widgets.zsh"

# menuselect
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# normal
bindkey -M vicmd '=' which-command
bindkey -M vicmd '?' run-help
bindkey -M vicmd 'U' redo
bindkey -M vicmd '^e' edit-command-line
bindkey -M vicmd '^f' fzf-c-widget
bindkey -M vicmd '^g' fzf-cd-widget
bindkey -M vicmd '^k' end-of-line
bindkey -M vicmd '^o' c-up-widget

# insert
bindkey -M viins '^e' edit-command-line
bindkey -M viins '^f' fzf-c-widget
bindkey -M viins '^g' fzf-cd-widget
bindkey -M viins '^k' end-of-line
bindkey -M viins '^n' down-history
bindkey -M viins '^o' c-up-widget
bindkey -M viins '^p' up-history
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M viins '^s' history-incremental-search-forward
bindkey -M viins '^u' kill-whole-line
bindkey -M viins '^y' yank
