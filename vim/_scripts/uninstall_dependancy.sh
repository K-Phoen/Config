#!/bin/bash

dep=$1
echo $1

# check the arguments
if [[ "$dep" = "" ]]; then
  echo "[!][vim] What should I uninstall ? You did not gave me a name or anything..."

  exit 1
fi


echo "[-][vim][$dep] Uninstalling..."

# check if the dependancy is installed
if [[ ! -e "_cache/$dep" ]]; then
  echo "[!][vim][$dep] This dependancy is not installed!"

  exit 2
fi

for item in `cat "_cache/$dep"`; do
  file=`echo $item | sed -e "s:$dep:vim:"`
  rm $file

  if [[ $? != 0 ]]; then
    echo "[!][vim][$dep] Error while uninstalling, you should probably do it yourself :/"
    exit 3
  fi
done

rm "_cache/$dep"

echo "[+][vim][$dep] Successfully uninstalled!"
