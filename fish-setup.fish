#!/usr/bin/env fish

if not command -v fisher > /dev/null
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end

if not command -v nvm > /dev/null
    fisher install jorgebucaran/nvm.fish
end

nvm install lts
set --universal nvm_default_version lts

if not command -v pnpm > /dev/null
    npm install -g pnpm
end
