#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

install_package() {
  local cmd=$1
  local pkg=$2

  if ! command -v "$cmd" &>/dev/null; then
    echo "Installing $pkg..."
    sudo pacman -Syu --noconfirm --needed "$pkg"
  else
    echo "$pkg is already installed."
  fi
}

# install packages
install_package git git
install_package zsh zsh
install_package zsh-completions zsh-completions
install_package zsh-autosuggestions zsh-autosuggestions
install_package zsh-syntax-highlighting zsh-syntax-highlighting
install_package starship starship
install_package tmux tmux
install_package nvim neovim
install_package unzip unzip
install_package ghostty ghostty

# install jetbrains mono font
FONT_DIR="$HOME/.local/share/fonts"
if ! fc-list | grep -qi "JetBrains"; then
  echo "Installing JetBrains Mono font..."
  mkdir -p "$FONT_DIR"
  FONT_ZIP="/tmp/JetBrainsMono.zip"
  curl -L -o "$FONT_ZIP" "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip"
  unzip -o "$FONT_ZIP" -d "$FONT_DIR"
  rm "$FONT_ZIP"
  fc-cache -fv
else
  echo "JetBrains Mono font already installed."
fi

source "$DOTFILES/symlink-configs.sh"