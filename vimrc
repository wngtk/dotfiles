set nocompatible    " VI compatible mode is disabled so that VIm things work

" =============================================================================
"   PLUGINS
" =============================================================================
call plug#begin()

" Load plugins
" Per file editor config
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'

" Movement
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'wikitopian/hardmode'            " Disable arrow keys and similar
Plug 'farmergreg/vim-lastplace'

" Text Manipulation
Plug 'tpope/vim-sensible'             " Some better defaults
Plug 'tpope/vim-unimpaired'           " Pairs of mappings
Plug 'tpope/vim-surround'             " Surround with parentheses & co
Plug 'joom/vim-commentary'            " To comment stuff out
" Plug 'terryma/vim-multiple-cursors'   " Multiple cursors like sublime
Plug 'godlygeek/tabular'              " For alignment
Plug 'junegunn/vim-easy-align'        " Easier alignment
Plug 'foosoft/vim-argwrap'            " convert lists of arguments into blocks of arguments
" Interacts with coc Plug 'tpope/vim-endwise'              " Ends control flow indentifiers
Plug 'tpope/vim-repeat'               " Adds repeat thorugh . to other packages
Plug 'tpope/vim-speeddating'          " Dates in vim

" GUI enhancements
Plug 'itchyny/lightline.vim'          " Better Status Bar
Plug 'mhinz/vim-startify'             " Better start screen
Plug 'scrooloose/nerdtree'            " File explorer
" Plug 'ryanoasis/vim-devicons'         " Nice filetype icons (slow)

" Plug 'sjl/gundo.vim'                  " Undo Tree
Plug 'simnalamburt/vim-mundo'         " Gundo fork
Plug 'preservim/tagbar'               " Pane with tags
Plug 'machakann/vim-highlightedyank'  " Highlight yanks
Plug 'ojroques/vim-oscyank'           " Yank from remote sessions
Plug 'andymass/vim-matchup'           " Highlight corresponding blocks e.g. if - fi in bash
Plug 'kshenoy/vim-signature'          " Show marks in the gutter
" Plug 'yggdroot/indentline'            " Shows indentation levels
Plug 'tpope/vim-eunuch'               " Unix helpers
Plug 'moll/vim-bbye'                  " optional dependency for vim-symlink
Plug 'aymericbeaumet/vim-symlink'     " Resolve symlinks before editing, plays nicely with undodir
" Git GUI
Plug 'airblade/vim-gitgutter'         " Git gutter
Plug 'tpope/vim-fugitive'             " Git interface
Plug 'tpope/vim-rhubarb'                    " Enable GBrowse from fugitive for GitHub
Plug 'junegunn/gv.vim'                " TIG like navigation for vim
Plug 'xuyuanp/nerdtree-git-plugin'    " Show status of files in NerdTree
Plug 'tveskag/nvim-blame-line'        " Add git blame on line
" Tmux GUI
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'

" Syntactic language support
" Plug 'w0rp/ale'                        " Linting engine
" Plug 'maximbaz/lightline-ale'          " Lightline + Ale
" Plug 'plasticboy/vim-markdown'         " Markdown support
" Plug 'mzlogin/vim-markdown-toc'        " Markdown TOC builder
" Plug 'cespare/vim-toml'                " TOML support
" Plug 'stephpy/vim-yaml'                " YAML support
" Plug 'elzr/vim-json'                   " Better JSON support
" Plug 'rust-lang/rust.vim'              " Rust support
" Plug 'glench/vim-jinja2-syntax'        " Jinja2 support
" Plug 'lervag/vimtex'                   " Latex support
" Plug 'pearofducks/ansible-vim'         " Ansible support
" Plug 'mechatroner/rainbow_csv'         " CSV color coding
" Plug 'ap/vim-css-color'                " CSS colors
" Plug 'frazrepo/vim-rainbow'                " Rainbow parentheses
" Plug 'vim-pandoc/vim-pandoc'           " Pandoc support
" Plug 'vim-pandoc/vim-pandoc-syntax'    " Pandoc syntax
" Plug 'chrisbra/colorizer'              " Colorize color codes
" Plug 'vim-scripts/applescript.vim'
" Plug 'pprovost/vim-ps1'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'mattn/emmet-vim'
" Plug 'norcalli/nvim-colorizer.lua'     " Faster colorzier (only neovim,
" reconsider)
" Plug 'liuchengxu/vista.vim'
" Plug 'vim-python/python-syntax'
" Plug 'sentientmachine/pretty-vim-python'
" Plug 'isobit/vim-caddyfile'

" Colorschemes
" Plug 'morhetz/gruvbox'
" Plug 'chriskempson/base16-vim'         " Base16 themes
" Plug 'gerw/vim-hilinktrace'            " Syntax Highlighting Tracer
" Plug 'fatih/molokai'                  " Monokai and friends
" Plug 'crusoexia/vim-monokai'
" Plug 'phanviet/vim-monokai-pro'
" Plug 'patstockwell/vim-monokai-tasty'
" Plug 'erichdongubler/vim-sublime-monokai'
" Plug 'flazz/vim-colorschemes'          " Bunch of color schemes
Plug 'sainnhe/sonokai'                 " Monokai Pro-like scheme
" Plug 'tanvirtin/monokai.nvim'
" Plug 'srcery-colors/srcery-vim'

" Writing
" Plug 'junegunn/goyo.vim'               " Distraction free mode
" Plug 'junegunn/limelight.vim'          " Focus on current paragraph
" Plug 'rhysd/vim-grammarous'            " GrammarCheck using LanguageTool
" Plug 'ron89/thesaurus_query.vim'       " Synonym query

" Other
" Plug 'wakatime/vim-wakatime'           " Wakatime time tracking
" Plug 'liuchengxu/vim-which-key'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" =============================================================================
"  EDITOR SETTINGS
" =============================================================================

" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("+termguicolors")
    set termguicolors
    " The commands below are needed for tmux + termguicolors
    " This is only necessary if you use "set termguicolors".
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    silent! colorscheme sonokai
endif

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number              " show line numbers
set relativenumber      " show relative numbering
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype specific plugin files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " Show the status line at the bottom
set mouse+=a            " A necessary evil, mouse support
set noerrorbells visualbell t_vb=    "Disable annoying error noises
set splitbelow          " Open new vertical split bottom
set splitright          " Open new horizontal splits right
set linebreak           " Have lines wrap instead of continue off-screen
set scrolloff=12        " Keep cursor in approximately the middle of the screen
set updatetime=100      " Some plugins require fast updatetime
set ttyfast             " Improve redrawing
set lazyredraw          " https://github.com/vim/vim/issues/1735#issuecomment-383353563
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts

" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden              " Allows having hidden buffers (not displayed in any window)

" Sensible stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start     " Make backspace behave in a more intuitive way
nmap Q <Nop>
" 'Q' in normal mode enters Ex mode. You almost never want this.
" Unbind for tmux
map <C-a> <Nop>
map <C-x> <Nop>


"Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered
" turn off search highlight
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>
" Ignore files for completion
set wildignore+=*/.git/*,*/tmp/*,*.swp

" Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir


" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" This is especially useful for me since I spend my days in Python.
" Other acceptable values are marker, manual, expr, syntax, diff.
" Run :help foldmethod to find out what each of those do.

" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]

" Jump to start and end of line using the home row keys
map H ^
map L $

" (Shift)Tab (de)indents code
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Capital JK move code lines/blocks up & down
" TODO improve functionality
nnoremap K :move-2<CR>==
nnoremap J :move+<CR>==
xnoremap K :move-2<CR>gv=gv
xnoremap J :move'>+<CR>gv=gv

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" Very magic by default
" nnoremap ? ?\v
" nnoremap / /\v
" cnoremap %s/ %sm/

" Leader
let mapleader=" "

" =============================================================================
"   CUSTOM FUNCTIONS
" =============================================================================
"
" =============================================================================
"   PLUGIN CONFIG
" =============================================================================

" Sneak
let g:sneak#use_ic_scs = 1
highlight link Sneak None
" Needed if a plugin sets the colorscheme dynamically:
autocmd User SneakLeave highlight clear Sneak

" Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1

" hjkl  s j k t / ? g/   -- EasyMotion
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>/ <Plug>(easymotion-sn)

" Actually enhance f and sneak s
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" vim-sneak behaviour through easymotio
map <Leader>s <Plug>(easymotion-f2)
nmap <Leader>s <Plug>(easymotion-overwin-f2)


" CamelCaseMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" handy keymap for replacing up to next _ (like in variable names)
nmap <Leader>m c<Plug>CamelCaseMotion_e

" =============================================================================
"   CUSTOM SHORTCUTS  (LEADER, FN, &c)
" =============================================================================

nmap <Left> :bp<CR>
nmap <Right> :bn<CR>

nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

"  w wq q   --  Quick Save
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>Q :q!<CR>

" use clipboard in WSL2 need `vim-gtk3`
" sudo apt install -y vim-gtk3
"  y d p P   --  Quick copy paste into system clipboard
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" `  `v  `z  rv  -- edit vimrc/zshrc and load vimrc bindings
" nnoremap <Leader>` :Startify<CR>
nnoremap <Leader>`z :vsp ~/.zshrc<CR>
" nnoremap <Leader>`v :vsp ~/.vimrc<CR>
nnoremap <Leader>rv :source ~/.vimrc<CR>

" numbers
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <Leader>6 6gt<CR>
nnoremap <Leader>7 7gt<CR>
nnoremap <Leader>8 8gt<CR>
nnoremap <Leader>9 9gt<CR>
nnoremap <Leader>n :tabnew<CR>
nnoremap <Leader>x :tabclose<CR>

" -- Miscellaneous toggles
nnoremap <Leader>oe :NERDTreeToggle<CR>

" =============================================================================
" # Autocommands
" =============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.bk set readonly



" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.rss set filetype=xml


" Smart relative line like VSCodeVim
autocmd InsertEnter * set norelativenumber "Absolute line numbers in insert mode
autocmd InsertLeave * set relativenumber   "Relative line numbers otherwise

" =============================================================================
"   LOCAL CONFIG
" =============================================================================

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
