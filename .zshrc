# Enable colors and change prompt:
autoload -U colors && colors # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
stty stop undef # Disable ctrl-s to freeze terminal.

# Options:
setopt append_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history # Useful for `edit-command-line` widget.
setopt interactive_comments
setopt rm_star_silent
setopt shwordsplit

# History in cache directory:
HISTSIZE=1000000000
SAVEHIST=1000000000
HISTFILE="$XDG_CACHE_HOME/zsh/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Load aliases.
source "$ZDOTDIR/src/aliases.sh"
# Load bindings.
source "$ZDOTDIR/src/bindings.zsh"

# Load autosuggestions.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Load fzf autocompletion.
source /usr/share/fzf/completion.zsh 2> /dev/null

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

fastfetch

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source "$XDG_DATA_HOME/cargo/env"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.zsh
