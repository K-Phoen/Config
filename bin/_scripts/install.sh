#!/bin/bash

[[ ! -d ~/bin ]] && mkdir ~/bin

for script in `ls`; do
  if [[ $script != "_scripts" ]]; then
    [ ! -e ~/bin/$script ] && ln -s "`pwd`/$script" ~/bin/$script
  fi
done
