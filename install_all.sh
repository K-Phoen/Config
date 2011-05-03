#!/bin/bash

for dir in `find . -maxdepth 1 -name '.git' -prune -o -type d -print`; do
  if [ -x "$dir/install.sh" ]; then
    cd $dir       # go to the "module" dir
    ./install.sh  # install it
    cd ..         # go back to the "modules" repository
  fi
done
