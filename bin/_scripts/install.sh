#!/bin/bash

echo "[-][bin] Begin installation ..."

[[ ! -d ~/bin ]] && mkdir ~/bin

for script in `ls`; do
  if [[ $script != "_scripts" ]]; then
    [ ! -e ~/bin/$script ] && ln -s "`pwd`/$script" ~/bin/$script
  fi
done

echo "[+][bin] installation complete."
