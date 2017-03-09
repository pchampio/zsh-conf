#!/bin/sh

if [ -d "$HOME/dotfiles/" ]; then
  printf "\033[1;31mError DIRECTORY $HOME/dotfiles/ exist !!\033[0m\n"
fi


if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: zsh is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v wget)" ]; then
  echo 'Error: wget is not installed.' >&2
  exit 1
fi

tell() {
  printf "\033[0;33m|-- ${*}\033[0m\n"
  printf "\033[0;31m" 1>&2 ;
  $* || {
    printf "\033[0m"
  }
}

explain() {
  printf "\033[0;34m${1}\033[0m\n"
}

rm -rf $HOME/.oh-my-zsh/
touch $HOME/.zsh_history

explain "Installation de oh-my-zsh"
  echo exit | sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


explain "Installation de zsh-syntax-highlighting"
  tell git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/syntax_highlighting

explain "Installation de zsh-completions"
  tell git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions

explain "Change default sh prompt to zsh '$ chsh -s $(which zsh)'"
  chsh -s $(which zsh)


explain "Clone sample dotfiles (come with a simple dotfiles Manager)"
  tell git clone https://github.com/Drakirus/zsh-conf.git $HOME/dotfiles/
  cd $HOME/dotfiles/


# dotfiles Manager
# every file in $dir (depth=1) will be symlink to $home with a dot
# exemple :

# la $HOME
# .gitconfig -> /home/drakirus/dotfiles/gitconfig
# .gitignore -> /home/drakirus/dotfiles/gitignore
# .gitmessage -> /home/drakirus/dotfiles/gitmessage
# .tmux.conf -> /home/drakirus/dotfiles/tmux.conf
# .vimrc -> /home/drakirus/dotfiles/vimrc
# .zshrc -> /home/drakirus/dotfiles/zshrc


ignoreRC="README.md|.gitignore|install.sh|dotfilesManager|capture.png"
dir=$HOME/dotfiles

explain "Create symlink for dotfiles"
# change to the dotfiles directory
cd $dir

files=`find . -maxdepth 1 -type f | sed 's|./||' | egrep -v $ignoreRC`

# create symlinks from the homedir to any files in the $HOME/dotfiles directory specified
for file in $files; do
  if [ -f $HOME/.$file ]; then
    tell rm $HOME/.$file
  fi
  tell ln -s $dir/$file $HOME/.$file
done


# run zsh
zsh && exit
