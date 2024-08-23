#!/bin/bash

set -e

cd /tmp
git clone -b release-0.10 https://github.com/neovim/neovim.git --depth=1
cd neovim
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/.neovim install
