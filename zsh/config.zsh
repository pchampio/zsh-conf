# Save a ton of history
HISTSIZE=20000000
HISTFILE=~/.zsh_history
SAVEHIST=20000000

# Disable % eof
unsetopt prompt_cr prompt_sp

# colored completion - use my LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

eval `dircolors ~/dotfiles/dircolors/solarized.conf`

# Enable completion
# autoload -Uz compinit
# compinit

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef
