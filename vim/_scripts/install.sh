#!/bin/bash

[ ! -d ~/.SpaceVim ] && git clone https://gitlab.com/SpaceVim/SpaceVim.git ~/.SpaceVim
[ ! -e ~/.SpaceVim.d ] && ln -s "`pwd`/SpaceVim.d" ~/.SpaceVim.d
[ ! -e ~/.vim ] && ln -s ~/.SpaceVim ~/.vim
[ ! -e ~/.config/nvim ] && ln -s ~/.SpaceVim ~/.config/nvim
