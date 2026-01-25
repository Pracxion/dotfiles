#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

echo "Installing dotfiles..."

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf "$DOTFILES/ghostty/config.toml" ~/.config/ghostty/config.toml

# Git
ln -sf "$DOTFILES/git/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES/git/.gitignore_global" ~/.gitignore_global

# Zsh
ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc

# tmux
ln -sf "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf

echo "Dotfiles installed"
