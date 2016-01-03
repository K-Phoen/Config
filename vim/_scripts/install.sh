#!/bin/bash

echo "[-][vim] Begin installation ..."

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.nvimrc ] && ln -s "`pwd`/vimrc" ~/.nvimrc
[ ! -e ~/.nvim ] && ln -s "`pwd`/vim" ~/.nvim

echo "[+][vim] installation complete."
