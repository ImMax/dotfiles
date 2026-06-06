#!/usr/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup"
NVIM_CONF="$HOME/.config/nvim"
TMUX_CONF="$HOME/.tmux.conf"
GIT_CONFIG="$HOME/.gitconfig"

# do backup
echo "==> Backing up existing dotfiles to $BACKUP_DIR"

mkdir -p "$BACKUP_DIR"
cp -r "$NVIM_CONF" "$BACKUP_DIR"
cp "$TMUX_CONF" "$BACKUP_DIR"

# do tmux
echo "==> Create .tmux.conf symlink"
ln -s "$DOTFILES_DIR/tmux/tmux-main.conf" "$TMUX_CONF" 

# do neovim
echo "==> Create nvim symlink"
ln -s "$DOTFILES_DIR/nvim/nvim-main" "$HOME/$NVIM_INIT"

# do git
echo "==> Create .gitconfig symlink"
ln -s "$DOTFILES_DIR/git/gitconfig" "$GIT_CONFIG"
