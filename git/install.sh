#!/bin/bash

echo "[-][git] Begin installation ..."

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.gitconfig ] && ln -s "`pwd`/gitconfig" ~/.gitconfig

echo "[+][git] installation complete."
