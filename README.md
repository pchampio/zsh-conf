## A easy and customisable start-up configuration for zsh


### Install
```
sh -c "$(wget https://github.com/Drakirus/zsh-conf/blob/master/install.sh -O -)"
```

Come with a dotfiles Manager (`./dotfilesManager`).  
The dotfilesManager symlinks all the file in ~/dotfiles/ in the $HOME

#### Exemple  
``` bash
$ la $HOME

 .gitconfig -> /home/drakirus/dotfiles/gitconfig
 .gitignore -> /home/drakirus/dotfiles/gitignore
 .gitmessage -> /home/drakirus/dotfiles/gitmessage
 .tmux.conf -> /home/drakirus/dotfiles/tmux.conf
 .vimrc -> /home/drakirus/dotfiles/vimrc
 .zshrc -> /home/drakirus/dotfiles/zshrc
```

#### from

``` bash
$ ls $HOME/dotfiles/

 gitconfig
 gitignore
 gitmessage
 tmux.conf
 vimrc
 zshrc
 README.md
 dircolors/
 zsh/
```
