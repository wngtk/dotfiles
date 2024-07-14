local g = vim.g
local o = vim.o
local opt = vim.opt

-- Add this to your init.lua
vim.cmd [[
augroup javascript_autocmd
    autocmd!
    autocmd FileType javascript inoremap ==<Space> ===<Space>
augroup END
]]


-- Better editor UI
-- o.termguicolors = true
o.number = true
o.relativenumber = true
o.cursorline = true

-- Better editing experience
-- tabs: go big or go home
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true

o.splitright = true
o.splitbelow = true

g.mapleader = " "
g.localmapleader = " "

-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

local function map(m, k, v)
        vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader>q", ":q<cr>")
map("n", "<leader>w", ":w<cr>")
map("n", "<leader>wq", ":wq<cr>")
map("n", "<C-h>", "<cmd>nohlsearch<cr>")
map("v", "<C-h>", "<cmd>nohlsearch<cr>")

-------------------------------------------------------------------------------
--
-- plugin configuration
--
-------------------------------------------------------------------------------
-- first, grab the manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- then, setup!
require("lazy").setup({
    -- quick navigation
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').create_default_mappings()
		end
	},
})
