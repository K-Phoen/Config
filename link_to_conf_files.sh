#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 conf_dir"
  exit 1
fi

CONF_DIR=$1

cd ~

# vim
ln -s $CONF_DIR/vimrc .vimrc
ln -s $CONF_DIR/vim .vim

# zsh
ln -s $CONF_DIR/zshrc .zshrc

# xmonad
if [[ ! -d .xmonad ]]; then
  mkdir .xmonad
fi
ln -s $CONF_DIR/xmonad.hs .xmonad/xmonad.hs

# git 
ln -s $CONF_DIR/gitconfig .gitconfig
