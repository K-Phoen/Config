#!/bin/bash

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.tmux.conf ] && ln -s "`pwd`/tmux.conf" ~/.tmux.conf

[ ! -d ~/.config/tmux/plugins/catppuccin ] && git clone --branch v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux