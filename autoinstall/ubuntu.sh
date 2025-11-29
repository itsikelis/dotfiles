# Install essential packages.

# Upgrade system
sudo apt -y update
sudo apt -y upgrade

# Install stow
sudo apt -y install stow

## FONTS ##
stow fonts

## ZSH ##
sudo apt -y install zsh
# Add plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ~/.config/zsh/plugins/zsh-completions
git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/plugins/pure

stow zsh

## NEOVIM ##
# Install dependencies
sudo apt -y install build-essential \
                    cmake \
                    ninja-build \
                    clang-format \
                    black \
                    luarocks \
                    ripgrep \
                    fzf \
                    clang \
                    ripgrep \
                    fd

# Clone the neovim repo
git clone https://github.com/neovim/neovim ~/Apps/neovim && cd ~/Apps/neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

stow nvim

## ALACRITTY ##
# Install dependencies
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && . "$HOME/.cargo/env"
sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python

# Install Alacritty terminal emulator
git clone https://github.com/alacritty/alacritty.git ~/Apps/alacritty && cd ~/Apps/alacritty
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# Install desktop entry (optional)
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Shell completions
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

# Install desktop targets
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

stow alacritty

## TMUX ##
sudo apt -y install tmux
stow tmux
