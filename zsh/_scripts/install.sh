#!/bin/bash

[ -e ~/.zshrc ] && rm ~/.zshrc
ln -s "`pwd`/zshrc" ~/.zshrc
[ ! -e ~/.zsh.d ] && ln -s "`pwd`/zsh.d" ~/.zsh.d
[ ! -e ~/.zimrc ] && ln -s "`pwd`/zimrc" ~/.zimrc

# change the default login shell if it's not zsh
current_user=`whoami`
shell_is_zsh=`cat /etc/passwd | grep $current_user | cut -d '/' -f 5`

if [ "$shell_is_zsh" != "zsh" ]; then
  echo "[-][zsh] Changement du shell par défaut"
  chsh -s /bin/zsh
  echo "[+][zsh] Shell changé"
fi
