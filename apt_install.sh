# Install essential packages.

sudo apt update

sudo apt -y install build-essential
sudo apt -y install cmake
sudo apt -y install ninja-build

git clone https://github.com/neovim/neovim ~/neovim
cd ~/neovim && make CMAKE_BUILD_TYPE=Release
sudo make install

sudo apt -y install clang-format black luarocks ripgrep

sudo apt -y install zsh

sudo apt -y install tmux

