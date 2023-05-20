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
    obsidian

echo "[+][packages] installation complete."
