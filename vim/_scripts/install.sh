#!/bin/bash

echo "[-][vim] Begin installation ..."

[ ! -d ~/.SpaceVim ] && git clone git@github.com:SpaceVim/SpaceVim.git ~/.SpaceVim
[ ! -e ~/.SpaceVim.d ] && ln -s "`pwd`/SpaceVim.d" ~/.SpaceVim.d
[ ! -e ~/.vim ] && ln -s ~/.SpaceVim ~/.vim
[ ! -e ~/.config/nvim ] && ln -s ~/.SpaceVim ~/.config/nvim

echo "[+][vim] installation complete."
