#!/bin/bash

for dir in `find . -maxdepth 1 -name '.git' -prune -o -type d -print`; do
  if [ -x "$dir/_scripts/install.sh" ]; then
    cd $dir       # go to the "module" dir
    ./_scripts/install.sh  # install it
    cd ..         # go back to the "modules" repository
  fi
done
