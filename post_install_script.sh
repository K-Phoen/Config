#!/bin/bash

cd ~


echo "[-] Installation des paquets" 
sudo add-apt-repository ppa:chromium-daily/ppa

sudo apt-get -y install aptitude

sudo aptitude update && sudo aptitude safe-upgrade

sudo aptitude install -y git zsh geany pidgin gnome-do filezilla xchat dia monodevelop qtcreator vlc vim chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg chromium-codecs-ffmpeg-extra chromium-codecs-ffmpeg-nonfree netbeans eclipse
echo "[+] Installation OK"


echo "[-] Suppression des paquets inutiles"
sudo aptitude remove -y evolution empathy
echo "[+] Suppression OK"


echo "[-] Clonage du repo Config"
git clone https://K-Phoen@github.com/K-Phoen/Config.git
echo "[+] Repo cloné"


echo "[-] Mise en place des fichiers de configuration"
ln -s Config/zshrc .zshrc
ln -s Config/vimrc .vimrc
ln -s Config/vim .vim
echo "[+] Configuration OK"

echo "[-] Changement du shell par défaut"
sudo chsh kevin -s /bin/zsh
echo "[-] Shell changé"
