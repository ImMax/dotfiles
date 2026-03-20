#!/usr/bin/bash

set -e
# do tmux

# do neovim

NVIM_CONF=".config/nvim"
NVIM_INIT="$NVIM_CONF/init.lua"

mkdir -p "$HOME/$NVIM_CONF"
ln -s "$PWD/nvim/$NVIM_INIT" "$HOME/$NVIM_INIT"
ls -l "$HOME/$NVIM_INIT"

