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

# AUTOJUMP
if [[ ! -d $HOME/.autojump/ ]]; then
    git clone https://github.com/wting/autojump.git /tmp/autojump
    cd /tmp/autojump
    ./install.py
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

for crate in bat fd-find ripgrep eza tealdeer git-delta
do
    $HOME/.cargo/bin/cargo install $crate
done
