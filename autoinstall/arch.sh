#!/bin/bash

echo "--- Upgrading system ---"
sudo pacman -Syu --noconfirm

# Install stow
sudo pacman -S --noconfirm stow

# Fonts
clear
echo "--- Setting up fonts ---"
stow fonts

clear
echo "--- Setting up terminal emulator ---"
# Clone source
git clone https://github.com/alacritty/alacritty.git
cd alacritty
# Install Rust compiler
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable
# Package deps
pacman -S --noconfirm cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python
# Build
cargo build --release
# Install desktop entries
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
# Stow config files
cd -
stow alacritty

clear
echo "--- Setting up shell ---"
# Install package
sudo pacman -S --noconfirm zsh
# Add plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ~/.config/zsh/plugins/zsh-completions
git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/plugins/pure
# Stow config files
stow zsh

echo "--- Setting up tmux ---"
sudo pacman -S --noconfirm tmux
stow tmux

echo "--- Setting up neovim ---"
# Install dependencies
sudo pacman -S --noconfirm base-devel cmake ninja curl git clang python-black luarocks ripgrep fzf fd
# Clone source
git clone https://github.com/neovim/neovim ~/Apps/neovim
cd ~/Apps/neovim
git pull
# Build and install source
make CMAKE_BUILD_TYPE=Release
sudo make install
# Stow config files
cd -
stow nvim

echo "--- Done setting up! ---"
