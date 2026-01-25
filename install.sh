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
install_package tmux tmux
install_package nvim neovim
install_package unzip unzip

# install ghostty
if ! command -v ghostty &>/dev/null; then
  echo "Installing Ghostty..."
  GH_LATEST=$(curl -s https://api.github.com/repos/ghostty/ghostty/releases/latest | grep "browser_download_url.*linux_amd64" | cut -d '"' -f 4)
  curl -L "$GH_LATEST" -o /tmp/ghostty.tar.gz
  tar -xzf /tmp/ghostty.tar.gz -C /tmp
  sudo mv /tmp/ghostty /usr/local/bin/ghostty
  rm /tmp/ghostty.tar.gz
else
  echo "Ghostty is already installed."
fi

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