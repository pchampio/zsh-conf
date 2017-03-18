# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

setopt prompt_subst # enable command substition in prompt

export DOTFILES=$HOME/dotfiles
# source all .zsh files inside of the zsh/ directory
for config ($DOTFILES/**/*.zsh) source $config

export EDITOR='vim'

# faster startup
DISABLE_AUTO_UPDATE="true"

# User configuration


# add oh-my-zsh to zsh
source $ZSH/oh-my-zsh.sh
source $ZSH/syntax_highlighting/zsh-syntax-highlighting.zsh
source $ZSH/custom/plugins/zsh-completions/zsh-completions.plugin.zsh

# Show contents of directory after cd-ing into it
chpwd() {
  ls
  if [ -f ./venv/bin/activate ]; then
    source ./venv/bin/activate
  fi
}


# 10ms for key sequences
export KEYTIMEOUT=1

# vim as a man-page viewer

# PROMPT THEME
export PROMPT='%(?.%F{green}.%F{red})X_X ➜%f '
export RPROMPT='' # set asynchronously and dynamically
