-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = vim.keycode("<Space>")
vim.g.mapleader = " "
-- Edit my Vimrc file
-- vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<cr>")
-- numbers
vim.keymap.set("n", "<leader>1", "1gt<CR>")
vim.keymap.set("n", "<leader>2", "2gt<CR>")
vim.keymap.set("n", "<leader>3", "3gt<CR>")
vim.keymap.set("n", "<leader>4", "4gt<CR>")
vim.keymap.set("n", "<leader>5", "5gt<CR>")
vim.keymap.set("n", "<leader>6", "6gt<CR>")
vim.keymap.set("n", "<leader>7", "7gt<CR>")
vim.keymap.set("n", "<leader>8", "8gt<CR>")
vim.keymap.set("n", "<leader>9", "9gt<CR>")
vim.keymap.set("n", "<leader>n", ":tabnew<CR>")
vim.keymap.set("n", "<leader>x", ":tabclose<CR>")
-- search buffers
vim.keymap.set("n", "<leader>;", "<cmd>Buffers<cr>")
-- quick-save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>")
vim.keymap.set("n", "<leader>Q", "<cmd>q!<cr>")
-- make missing : less annoying
vim.keymap.set("n", ";", ":")
-- Ctrl+h to stop searching
vim.keymap.set("v", "<C-h>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<C-h>", "<cmd>nohlsearch<cr>")
-- Jump to start and end of line using the home row keys
vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")
-- y d p P Quick copy paste into system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>d", '"+d')
vim.keymap.set("v", "<leader>d", '"+d')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>P", '"+P')
-- <leader><leader> toggles between buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")
-- <leader>, shows/hides hidden characters
vim.keymap.set("n", "<leader>,", ":set invlist<cr>")
-- always center search results
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "*", "*zz", { silent = true })
vim.keymap.set("n", "#", "#zz", { silent = true })
vim.keymap.set("n", "g*", "g*zz", { silent = true })
-- "very magic" (less escaping needed) regexes by default
vim.keymap.set("n", "?", "?\\v")
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("c", "%s/", "%sm/")
-- open new file adjacent to current file
vim.keymap.set("n", "<leader>o", ':e <C-R>=expand("%:p:h") . "/" <cr>')
-- let the left and right arrows be useful: they can switch buffers
vim.keymap.set("n", "<left>", ":bp<cr>")
vim.keymap.set("n", "<right>", ":bn<cr>")
-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
-- handy keymap for replacing up to next _ (like in variable names)
vim.keymap.set("n", "<leader>m", "ct_")
-- F1 is pretty close to Esc, so you probably meant Esc
vim.keymap.set("", "<F1>", "<Esc>")
vim.keymap.set("i", "<F1>", "<Esc>")
-- - |	-- split with leader
vim.keymap.set("n", "<leader>-", ":sp<cr>")
vim.keymap.set("n", "<leader>|", ":vsp<cr>")
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>")
vim.keymap.set("n", "<leader>S", ":set spell!<CR>", { silent = true })
-- Navigate vim panes better
-- I use "alexghergh/nvim-tmux-navigation"
-- vim.keymap.set("n", "<c-k>", ":wincmd k<cr>")
-- vim.keymap.set("n", "<c-j>", ":wincmd j<cr>")
-- vim.keymap.set("n", "<c-h>", ":wincmd h<cr>")
-- vim.keymap.set("n", "<c-l>", ":wincmd l<cr>")
-- Lazy
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { silent = true })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
