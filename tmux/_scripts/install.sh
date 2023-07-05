#!/bin/bash

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.tmux.conf ] && ln -s "`pwd`/tmux.conf" ~/.tmux.conf

[ ! -d ~/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
