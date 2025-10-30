-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------
-- never ever folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99
-- keep more context on screen while scrolling
vim.opt.scrolloff = 2
-- never show me line breaks if they're not there
vim.opt.wrap = false
-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = 'yes'
-- sweet sweet relative line numbers
vim.opt.relativenumber = true
-- and show the absolute line number for the current line
vim.opt.number = true
-- keep current content top + left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true
--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = 'list:longest'
-- when opening a file with a command (like :e),
-- don't suggest files like there:
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
-- tabs: i like 4 spaces
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append('iwhite')
--- and using a smarter algorithm
--- https://vimways.org/2018/the-power-of-diff/
--- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
--- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')
-- show a column at 80 characters as a guide for long lines
vim.opt.colorcolumn = '80'
--- except in Rust where the rule is 100 characters
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
-- show more hidden characters
-- also, show tabs nicer
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'

-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
-- quick-open, <cmd> is the same as :
vim.keymap.set('n', '<C-p>', '<cmd>Files<cr>')
-- e g H -- FZF
-- vim.keymap.set('n', '<leader>e', '<cmd>Files<cr>')
vim.keymap.set('n', '<leader>g', '<cmd>Rg<cr>')
vim.keymap.set('n', '<leader>H', '<cmd>History<cr>')
-- numbers
vim.keymap.set('n', '<leader>1', '1gt<CR>')
vim.keymap.set('n', '<leader>2', '2gt<CR>')
vim.keymap.set('n', '<leader>3', '3gt<CR>')
vim.keymap.set('n', '<leader>4', '4gt<CR>')
vim.keymap.set('n', '<leader>5', '5gt<CR>')
vim.keymap.set('n', '<leader>6', '6gt<CR>')
vim.keymap.set('n', '<leader>7', '7gt<CR>')
vim.keymap.set('n', '<leader>8', '8gt<CR>')
vim.keymap.set('n', '<leader>9', '9gt<CR>')
vim.keymap.set('n', '<leader>n', ':tabnew<CR>')
vim.keymap.set('n', '<leader>x', ':tabclose<CR>')
-- search buffers
vim.keymap.set('n', '<leader>;', '<cmd>Buffers<cr>')
-- quick-save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>')
vim.keymap.set('n', '<leader>Q', '<cmd>q!<cr>')
-- make missing : less annoying
vim.keymap.set('n', ';', ':')
-- Ctrl+h to stop searching
vim.keymap.set('v', '<C-h>', '<cmd>nohlsearch<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>nohlsearch<cr>')
-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')
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
vim.keymap.set('n', '<leader><leader>', '<c-^>')
-- <leader>, shows/hides hidden characters
vim.keymap.set('n', '<leader>,', ':set invlist<cr>')
-- always center search results
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })
-- "very magic" (less escaping needed) regexes by default
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')
-- open new file adjacent to current file
vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')
-- let the left and right arrows be useful: they can switch buffers
vim.keymap.set('n', '<left>', ':bp<cr>')
vim.keymap.set('n', '<right>', ':bn<cr>')
-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- handy keymap for replacing up to next _ (like in variable names)
vim.keymap.set('n', '<leader>m', 'ct_')
-- F1 is pretty close to Esc, so you probably meant Esc
vim.keymap.set('', '<F1>', '<Esc>')
vim.keymap.set('i', '<F1>', '<Esc>')
-- - |	-- split with leader
vim.keymap.set('n', '<leader>-', ':sp<cr>')
vim.keymap.set('n', '<leader>|', ':vsp<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>')

-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
-- make == to ===
vim.cmd [[
augroup javascript_autocmd
autocmd!
autocmd FileType javascript inoremap ==<Space> ===<Space>
augroup END
]]
-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
})
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function(ev)
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            -- except for in git commit messages
            -- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
            if not vim.fn.expand('%:p'):find('.git', 1, true) then
                vim.cmd('exe "normal! g\'\\""')
            end
        end
    end
})
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.orig', command = 'set readonly' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.bk', command = 'set readonly' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.pacnew', command = 'set readonly' })
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })
-- help filetype detection (add as needed)
--vim.api.nvim_create_autocmd('BufRead', { pattern = '*.ext', command = 'set filetype=someft' })
-- correctly classify mutt buffers
local email = vim.api.nvim_create_augroup('email', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '/tmp/mutt*',
    group = email,
    command = 'setfiletype mail',
})
-- also, produce "flowed text" wrapping
-- https://brianbuccola.com/line-breaks-in-mutt-and-vim/
vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'mail',
    group = email,
    command = 'setlocal formatoptions+=w',
})
-- nvim as manpager
local man = vim.api.nvim_create_augroup('ManFileType', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'man',
    group = man,
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', 'd', '<C-D>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, 'n', 'u', '<C-U>', { noremap = true, silent = true })
    end
})
-- shorter columns in text because it reads better that way
local text = vim.api.nvim_create_augroup('text', { clear = true })
for _, pat in ipairs({'text', 'markdown', 'mail', 'gitcommit'}) do
    vim.api.nvim_create_autocmd('Filetype', {
        pattern = pat,
        group = text,
        command = 'setlocal spell tw=72 colorcolumn=73',
    })
end
--- tex has so much syntax that a little wider is ok
vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'tex',
    group = text,
    command = 'setlocal spell tw=80 colorcolumn=81',
})
-- TODO: no autocomplete in text

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
    -- main color scheme
    {
        "wincent/base16-nvim",
        lazy = false, -- load at start
        priority = 1000, -- load first
        config = function()
            vim.cmd([[colorscheme gruvbox-dark-hard]])
            vim.cmd([[set termguicolors]])
            vim.o.background = 'dark'
            -- XXX: hi Normal ctermbg=NONE
            -- Make comments more prominent -- they are important.
            local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
            vim.api.nvim_set_hl(0, 'Comment', bools)
            -- Make it clearly visible which argument we're at.
            local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
            vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true })
            -- XXX
            -- Would be nice to customize the highlighting of warnings and the like to make
            -- them less glaring. But alas
            -- https://github.com/nvim-lua/lsp_extensions.nvim/issues/21
            -- call Base16hi("CocHintSign", g:base16_gui03, "", g:base16_cterm03, "", "", "")
        end
    },
    -- nice bar at the bottom
    {
        'itchyny/lightline.vim',
        lazy = false, -- also load at start since it's UI
        config = function()
            -- no need to also show mode in cmd line when we have bar
            vim.o.showmode = false
            vim.g.lightline = {
                active = {
                    left = {
                        { 'mode', 'paste' },
                        { 'readonly', 'filename', 'modified' }
                    },
                    right = {
                        { 'lineinfo' },
                        { 'percent' },
                        { 'fileencoding', 'filetype' }
                    },
                },
                component_function = {
                    filename = 'LightlineFilename'
                },
            }
            function LightlineFilenameInLua(opts)
                if vim.fn.expand('%:t') == '' then
                    return '[No Name]'
                else
                    return vim.fn.getreg('%')
                end
            end
            -- https://github.com/itchyny/lightline.vim/issues/657
            vim.api.nvim_exec(
                [[
                function! g:LightlineFilename()
                    return v:lua.LightlineFilenameInLua()
                endfunction
                ]],
                true
            )
        end
    },
    -- quick navigation
    {
        'ggandor/leap.nvim',
        config = function()
			vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
			vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
        end
    },
    -- better %
    {
        'andymass/vim-matchup',
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },
    -- auto-cd to root of git project
    -- 'airblade/vim-rooter'
    {
        'notjedi/nvim-rooter.lua',
        config = function()
            require('nvim-rooter').setup()
        end
    },
    -- fzf support for ^p
    {
        'junegunn/fzf.vim',
        dependencies = {
            { 'junegunn/fzf', dir = '~/.fzf', build = './install --all' },
        },
        config = function()
            -- stop putting a giant window over my editor
            vim.g.fzf_layout = { down = '~20%' }
            -- when using :Files, pass the file list through
            --
            --   https://github.com/jonhoo/proximity-sort
            --
            -- to prefer files closer to the current file.
            function list_cmd()
                local base = vim.fn.fnamemodify(vim.fn.expand('%'), ':h:.:S')
                if base == '.' then
                    -- if there is no current file,
                    -- proximity-sort can't do its thing
                    return 'fd --type file --follow'
                else
                    return vim.fn.printf('fd --type file --follow | proximity-sort %s', vim.fn.shellescape(vim.fn.expand('%')))
                end
            end
            vim.api.nvim_create_user_command('Files', function(arg)
                vim.fn['fzf#vim#files'](arg.qargs, { source = list_cmd(), options = '--tiebreak=index' }, arg.bang)
            end, { bang = true, nargs = '?', complete = "dir" })
        end
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                rust_analyzer = {}
            }
        },
        config = function()
			-- Setup language servers.

			-- Rust
			vim.lsp.config('rust_analyzer', {
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					["rust-analyzer"] = {
						cargo = {
							features = "all",
						},
						checkOnSave = {
							enable = true,
						},
						check = {
							command = "clippy",
						},
						imports = {
							group = {
								enable = false,
							},
						},
						completion = {
							postfix = {
								enable = false,
							},
						},
					},
				},
			})
			vim.lsp.enable('rust_analyzer')

			-- Bash LSP
			if vim.fn.executable('bash-language-server') == 1 then
				vim.lsp.enable('bashls')
			end

			-- texlab for LaTeX
			if vim.fn.executable('texlab') == 1 then
				vim.lsp.enable('texlab')
			end

			-- Ruff for Python
			if vim.fn.executable('ruff') == 1 then
				vim.lsp.enable('ruff')
			end

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<leader>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)

					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- TODO: find some way to make this only apply to the current line.
					if client.server_capabilities.inlayHintProvider then
					    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
					end

					-- None of this semantics tokens business.
					-- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
					client.server_capabilities.semanticTokensProvider = nil

					-- format on save for Rust
					if client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("RustFormat", { clear = true }),
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
        end
    },
	-- LSP-based code-completion
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED by nvim-cmp. get rid of it once we can
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'path' },
				}),
				experimental = {
					ghost_text = true,
				},
			})

			-- Enable completing paths in :
			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' }
				})
			})
		end
	},
	-- inline function signatures
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			-- Get signatures (and _only_ signatures) when in argument lists.
			require "lsp_signature".setup({
				doc_lines = 0,
				handler_opts = {
					border = "none"
				},
			})
		end
	},
    -- language support
    -- terraform
    {
        'hashivim/vim-terraform',
        ft = { "terraform" },
    },
    -- svelte
    {
        'evanleck/vim-svelte',
        ft = { "svelte" },
    },
    -- toml
    'cespare/vim-toml',
    -- yaml
    {
        "cuducos/yaml.nvim",
        ft = { "yaml" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    -- rust
    {
        'rust-lang/rust.vim',
        ft = { "rust" },
        config = function()
            vim.g.rustfmt_autosave = 1
            vim.g.rustfmt_emit_files = 1
            vim.g.rustfmt_fail_silently = 0
            vim.g.rust_clip_command = 'wl-copy'
        end
    },
    -- fish
    'khaveesh/vim-fish-syntax',
    -- markdown
    {
        'plasticboy/vim-markdown',
        ft = { "markdown" },
        dependencies = {
            'godlygeek/tabular',
        },
        config = function()
            -- never ever fold!
            vim.g.vim_markdown_folding_disabled = 1
            -- support front-matter in .md files
            vim.g.vim_markdown_frontmatter = 1
            -- 'o' on a list item should insert at same level
            vim.g.vim_markdown_new_list_item_indent = 0
            -- don't add bullets when wrapping:
            -- https://github.com/preservim/vim-markdown/issues/232
            vim.g.vim_markdown_auto_insert_bullets = 0
        end
    },
})
