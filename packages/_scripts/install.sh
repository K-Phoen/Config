#!/bin/bash

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
    fzf \
    bat \
    obsidian

sudo usermod -aG docker ${USER}

sudo systemctl start docker.service
sudo systemctl enable docker.service
