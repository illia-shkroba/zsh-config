# Enable colors and change prompt:
autoload -U colors && colors # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd   # Automatically cd into typed directory.
stty stop undef # Disable ctrl-s to freeze terminal.
setopt interactive_comments
setopt shwordsplit # sh standard word splitting

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
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
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2> /dev/null

# Load fzf autocompletion.
source /usr/share/fzf/key-bindings.zsh 2> /dev/null
source /usr/share/fzf/completion.zsh 2> /dev/null
source /usr/share/zsh/plugins/fzf-tab*/fzf-tab.plugin.zsh 2> /dev/null
# Set fzf cd binding.
bindkey '^f' fzf-cd-widget

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2> /dev/null

fastfetch

eval "$(starship init zsh)"
