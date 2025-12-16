#!/bin/bash

echo "--- Upgrading system ---"
sudo apt -y update
sudo apt -y upgrade

# Install stow
sudo apt -y install stow

# Fonts
echo "--- Setting up fonts ---"
stow fonts

echo "--- Setting up terminal emulator ---"
# Clone source
git clone https://github.com/alacritty/alacritty.git ~/Apps/alacritty
cd ~/Apps/alacritty
# Install Rust compiler
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable
# Package deps
sudo apt -y install cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
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

echo "--- Setting up shell ---"
# Install package
sudo apt -y install zsh
# Add plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ~/.config/zsh/plugins/zsh-completions
git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/plugins/pure

stow zsh

echo "--- Setting up tmux ---"
sudo apt -y install tmux
stow tmux

echo "--- Setting up neovim ---"
# Install dependencies
sudo apt -y install build-essential cmake ninja-build clang-format black luarocks ripgrep fzf clang ripgrep fd
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
