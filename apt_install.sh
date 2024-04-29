# Install essential packages.

sudo apt update

sudo apt -y install build-essential
sudo apt -y install cmake
sudo apt -y install ninja-build

cd
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=Release
sudo make install
