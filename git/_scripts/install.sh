#!/bin/bash

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.gitconfig ] && ln -s "`pwd`/gitconfig" ~/.gitconfig
[ ! -e ~/.gitignore.global ] && ln -s "`pwd`/gitignore.global" ~/.gitignore.global
