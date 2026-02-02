#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

echo "Symlinking dotfiles"

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf "$DOTFILES/ghostty/config" ~/.config/ghostty/config

# Git
ln -sf "$DOTFILES/git/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES/git/.gitignore_global" ~/.gitignore_global

# Zsh
ln -sf "$DOTFILES/zsh/.zshrc_aliases" ~/.zshrc_aliases
ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc

# Starship
ln -sf "$DOTFILES/starship/starship.toml" ~/.config/starship.toml

# tmux
ln -sf "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf

echo "Dotfiles symlinked"
