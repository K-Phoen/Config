#!/bin/bash

echo "[-][xmonad] Begin installation ..."

# we create symbolic links to the config files if they don't already exist
if [[ ! -d ~/.xmonad ]]; then
  mkdir ~/.xmonad
fi
[ ! -e ~/.xmonad/xmonad.hs ] && ln -s "`pwd`/xmonad.hs" ~/.xmonad/xmonad.hs

echo "[+][xmonad] installation complete."
