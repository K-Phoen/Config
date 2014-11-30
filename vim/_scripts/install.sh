#!/bin/bash

echo "[-][vim] Begin installation ..."

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.vimrc ] && ln -s "`pwd`/vimrc" ~/.vimrc
[ ! -e ~/.vim ] && ln -s "`pwd`/vim" ~/.vim

echo "[+][vim] installation complete."
