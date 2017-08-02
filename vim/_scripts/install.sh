#!/bin/bash

echo "[-][vim] Begin installation ..."

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.config/nvim/ ] && ln -s "`pwd`/vim" ~/.config/nvim

echo "[+][vim] installation complete."
