#!/bin/bash

echo "[-][tmux] Begin installation ..."

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.tmux.conf ] && ln -s "`pwd`/tmux.conf" ~/.tmux.conf

echo "[+][tmux] installation complete."
