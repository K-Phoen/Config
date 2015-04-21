#!/bin/bash

echo "[-][mysql] Begin installation ..."

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.my.cnf ] && ln -s "`pwd`/my.cnf" ~/.my.cnf
[ ! -e ~/.grcat ] && ln -s "`pwd`/grcat" ~/.grcat

echo "[+][mysql] installation complete."
