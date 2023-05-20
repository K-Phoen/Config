#!/bin/bash

echo "[-][packages] Begin installation ..."

pamac install \
    lsd \
    btop \
    code \
    git-delta \
    helm \
    rancher-k3d-bin \
    kubectl \
    jq \
    github-cli \
    base-devel \
    discord \
    clipit \
    pigz \
    docker \
    tmux \
    obsidian

sudo usermod -aG docker ${USER}

sudo systemctl start docker.service
sudo systemctl enable docker.service

echo "[+][packages] installation complete."
