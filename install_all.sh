#!/bin/bash

YELLOW="\e[033m"
GREEN="\e[032m"
RESET="\e[0m"

for dir in `find . -maxdepth 1 -name '.git' -prune -o -type d -print`; do
  dir_name=$(basename $dir)

  if [ -x "$dir/_scripts/install.sh" ]; then
    echo -e "[-][${YELLOW}${dir_name}${RESET}] Begin installation ..."

    cd $dir       # go to the "module" dir
    ./_scripts/install.sh  # install it
    cd ..         # go back to the "modules" repository

    echo -e "[+][${GREEN}${dir_name}${RESET}] installation complete."
  fi
done
