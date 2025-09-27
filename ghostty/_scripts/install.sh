#!/bin/bash

# we create symbolic links to the config files if they don't already exist
[ ! -e ~/.config/ghostty/config ] && ln -s "$(pwd)/config" ~/.config/ghostty/config
