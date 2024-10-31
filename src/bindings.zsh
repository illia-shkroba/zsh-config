#!/usr/bin/env zsh

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

bindkey '^[[P' delete-char

# Use ^r
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# Use ^n ^p
bindkey '^n' down-history
bindkey '^p' up-history

# Use ^u ^y
bindkey -M viins '^y' yank
bindkey -M viins '^u' kill-whole-line

# Confirm autocompletion in insert mode.
bindkey '^k' end-of-line

# Edit line in vim with ctrl-e:
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
