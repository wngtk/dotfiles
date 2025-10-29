#!/bin/bash

set -e

cd /tmp
rm -rf neovim
git clone --branch stable --depth=1 https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/.neovim install
