## Reference: Arch-wiki, Luke Smith.

# History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$XDG_CACHE_HOME/zsh/histfile"

# Enable zoxide ( a smarter cd command )
eval "$(zoxide init zsh)"

# Disable ctrl-s to freeze terminal
stty stop undef

# Allowing comments in interactive zsh commands
setopt interactive_comments

# Set the default prompt
autoload -U promptinit
promptinit
prompt redhat

# Auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		

# Needed for "History search" and to "Edit line in vim"
autoload -Uz \
	up-line-or-beginning-search \
	down-line-or-beginning-search \
	edit-command-line 
zle -N 	up-line-or-beginning-search
zle -N 	down-line-or-beginning-search
zle -N 	edit-command-line

# Load aliases and keybinding
[ -f "$ZDOTDIR/keybinding" ] && source "$ZDOTDIR/keybinding"
[ -f "$ZDOTDIR/aliases" ] && source "$ZDOTDIR/aliases"

# Load auto suggestions
# https://github.com/zsh-users/zsh-autosuggestions
autosuggestions="$HOME/git/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
[ -f "$autosuggestions" ] && source "$autosuggestions"

# Load syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
syntax_highlighting="$HOME/git/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
[ -f "$syntax_highlighting" ] && source "$syntax_highlighting" 
