#!/usr/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup"
NVIM_CONF="$HOME/.config/nvim"
TMUX_CONF="$HOME/.tmux.conf"
GIT_CONFIG="$HOME/.gitconfig"
TMUX_TPM="$HOME/.tmux/plugins/tpm"

# do backup
echo "==> Backing up existing dotfiles to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
[ -e "$NVIM_CONF" ] && cp -r "$NVIM_CONF" "$BACKUP_DIR"
[ -e "$TMUX_CONF" ] && cp "$TMUX_CONF" "$BACKUP_DIR"

# do tmux
echo "==> Create .tmux.conf symlink"
[ -e "$TMUX_TPM" ] && git clone https://github.com/tmux-plugins/tpm "$TMUX_TPM"
ln -s "$DOTFILES_DIR/tmux/tmux-main.conf" "$TMUX_CONF" 

# do neovim
echo "==> Create nvim symlink"
ln -s "$DOTFILES_DIR/nvim/nvim-main" "$HOME/$NVIM_INIT"

# do git
echo "==> Create .gitconfig symlink"
ln -s "$DOTFILES_DIR/git/gitconfig" "$GIT_CONFIG"
