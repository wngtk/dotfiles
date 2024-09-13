-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- move vertically by visual line
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- highlight last inserted text
vim.keymap.set('n', 'gV', '`[v`]')
-- (Shift)Tab (de)indents code
vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')
-- Jump to start and end of line using the home row keys
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
-- Quick save
vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>')
vim.keymap.set('n', '<Leader>q', '<Cmd>q<CR>')
-- Quick copy paste into system clipboard
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>d', '"+d')
vim.keymap.set('v', '<Leader>d', '"+d')
vim.keymap.set('n', '<Leader>p', '"+p')
vim.keymap.set('v', '<Leader>p', '"+p')
vim.keymap.set('n', '<Leader>P', '"+P')
vim.keymap.set('v', '<Leader>P', '"+P')
-- Clear highlights on search when pressing <ES> in normal mode
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

local vscode = require('vscode')
vim.notify = vscode.notify
vim.keymap.set('n', '<Leader>q', function()
	vscode.call('workbench.action.closeActiveEditor')
end)
vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
	vscode.with_insert(function()
		vscode.action("editor.action.addSelectionToNextFindMatch")
	end)
end)

-- bootstrap lazy
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

-- setup!
require("lazy").setup({
	spec = {
		-- quick navigation
		{
			'ggandor/leap.nvim', 
			config = function()
				require('leap').create_default_mappings()
			end
		},
		-- handy keymap for replacing up to next _ (like in variable names)
		{
			'bkad/CamelCaseMotion',
			config = function()
				vim.keymap.set('n', '<Leader>m', 'c<Plug>CamelCaseMotion_e')
			end
		}
	},
	-- Install plugin from command line
	-- nvim -u ~/.dotfiles/vscode/init.lua +"lua require('lazy').install()" +qa
	install = { missing = false },
	checker = { enabled = false },
})
