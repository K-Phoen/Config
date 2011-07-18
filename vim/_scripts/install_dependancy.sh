#!/bin/bash

dep=$1

# check the arguments
if [[ "$dep" = "" ]]; then
  echo "[!][vim] What should I install ? You did not gave me a name or anything..."

  exit 1
fi


echo "[-][vim][$dep] Begin installation ..."

DEPENDANCY_PATH="./$dep"

if [[ ! -d $DEPENDANCY_PATH ]]; then
  echo "[!][vim][$dep] The $DEPENDANCY_PATH does not exist: dependancy not installed"
  exit 2
fi

# record in the cache the files installed by this dependancy
find $DEPENDANCY_PATH \( -name .git -o -name README -o -name Rakefile -o -name .gitignore \) -prune -o -type f -print > "_cache/$dep"

# install syntastic
for item in `find $DEPENDANCY_PATH -maxdepth 1 \( -name '.git' -o -name README -o -name Rakefile -o -name .gitignore \) -prune -o -print`; do
  if [[ $item = "$DEPENDANCY_PATH" ]] ; then
    continue
  fi

  cp -R "$item" "./vim"
done

echo "[+][vim][$dep] installation complete."
