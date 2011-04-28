#!/bin/bash

flag="$@"

function relink() {
  ln -s -h -v $flag $2 $1
}

DOTFILES=$(pwd)

cd

relink .vim          $DOTFILES/vim
relink .vimrc        $DOTFILES/.vimrc
relink .gvimrc		 $DOTFILES/.gvimrc

relink .screenrc	 $DOTFILES/.screenrc
relink .tmux.conf	 $DOTFILES/.tmux.conf

relink .zshrc		 $DOTFILES/.zshrc
relink .zshenv		 $DOTFILES/.zshenv
relink .zsh			 $DOTFILES/.zsh

relink .gitconfig    $DOTFILES/.gitconfig
relink .gitignore    $DOTFILES/.gitignore
