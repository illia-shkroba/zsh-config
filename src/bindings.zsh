#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$(readlink -e "$0")")"

source "$SCRIPT_DIR/widgets.zsh"

# normal
bindkey -M vicmd '=' which-command
bindkey -M vicmd 'U' redo
bindkey -M vicmd '^ ' autosuggest-execute
bindkey -M vicmd '^]' c-last-widget
bindkey -M vicmd '^_' run-help
bindkey -M vicmd '^b' cwd-history-widget
bindkey -M vicmd '^f' fzf-c-widget
bindkey -M vicmd '^g' fzf-cd-widget
bindkey -M vicmd '^k' autosuggest-accept
bindkey -M vicmd '^o' c-up-widget
bindkey -M vicmd '^r' history-widget
bindkey -M vicmd '^s' status-widget
bindkey -M vicmd '^v' edit-command-line
bindkey -M vicmd '^x' zi-widget

# insert
bindkey -M viins '^ ' autosuggest-execute
bindkey -M viins '^]' c-last-widget
bindkey -M viins '^_' run-help
bindkey -M viins '^b' cwd-history-widget
bindkey -M viins '^f' fzf-c-widget
bindkey -M viins '^g' fzf-cd-widget
bindkey -M viins '^k' autosuggest-accept
bindkey -M viins '^n' down-history
bindkey -M viins '^o' c-up-widget
bindkey -M viins '^p' up-history
bindkey -M viins '^r' history-widget
bindkey -M viins '^s' status-widget
bindkey -M viins '^u' kill-whole-line
bindkey -M viins '^v' edit-command-line
bindkey -M viins '^x' zi-widget
bindkey -M viins '^y' yank
