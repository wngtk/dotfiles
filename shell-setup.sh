#!/usr/bin/env bash

# bootstrap the shell environment

set -e
set -x

#######################
# BIN
#######################

function pull_repo() {
    cd $1
    git pull
    cd -
}

NVIM=$HOME/.neovim
mkdir -p $NVIM

if command -v nvim > /dev/null; then
    echo "NVIM appears to be installed"
else
    mkdir -p $NVIM/bin
    cd $NVIM/bin
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mv nvim.appimage nvim
    cd -
fi


# FZF
if [[ ! -f $HOME/.fzf/bin/fzf ]]; then
    git clone https://github.com/junegunn/fzf.git $HOME/.fzf
    yes | $HOME/.fzf/install
fi

#######################
# RUST
#######################

if [[ ! -d $HOME/.rustup ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

for crate in bat fd-find ripgrep eza
do
    $HOME/.cargo/bin/cargo install $crate
done
