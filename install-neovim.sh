#!/bin/bash

set -e

TARGET_BRANCH=release-0.11
DEST_DIR=neovim-${TARGET_BRANCH}

cd /tmp
if [[ ! -d $DEST_DIR ]]; then
    git clone -b ${TARGET_BRANCH} https://github.com/neovim/neovim.git --depth=1 $DEST_DIR
fi

cd $DEST_DIR
git pull

make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/.neovim install
