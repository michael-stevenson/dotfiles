#!/bin/bash

flag="$@"

function relink() {
  ln -s -h -v $flag $2 $1
}

DOTFILES=$(pwd)

cd

relink .vim          $DOTFILES/vim
relink .vimrc        $DOTFILES/vim/vimrc

relink .gitconfig    $DOTFILES/.gitconfig
relink .gitignore    $DOTFILES/.gitignore

