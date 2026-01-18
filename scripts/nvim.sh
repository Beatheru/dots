#!/bin/bash

# Setup Neovim
echo "Setting up Neovim"
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git