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
# NEOVIM
#######################

NVIM=$HOME/.neovim
mkdir -p $NVIM

# Create Python3 environment
# if [[ ! -d $NVIM/py3 ]]; then
#     python3 -m venv $NVIM/py3
#     PIP=$NVIM/py3/bin/pip
#     $PIP install --upgrade pip
#     $PIP install neovim
#     $PIP install 'python-language-server[all]'
#     $PIP install pylint isort jedi flake8
#     $PIP install black yapf
# fi

# Create node env
# if [[ ! -d $NVIM/node/bin ]]; then
#     NODE_SCRIPT=/tmp/install-node.sh
#     curl -sL https://install-node.now.sh/lts -o $NODE_SCRIPT
#     chmod +x $NODE_SCRIPT
#     mkdir -p $NVIM/node
#     PREFIX=$NVIM/node $NODE_SCRIPT -y
#     PATH="$NVIM/node/bin:$PATH"
#     npm install -g neovim
# fi

#######################
# RUST
#######################

if [[ ! -d $HOME/.rustup ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

for crate in bat fd-find ripgrep eza tealdeer git-delta proximity-sort
do
    $HOME/.cargo/bin/cargo install $crate
done
