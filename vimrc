set number
set noswapfile

nmap <Left> :bp<CR>
nmap <Right> :bn<CR>

let mapleader=" "

nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

"  w wq q   --  Quick Save
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>Q :q!<CR>

" hjkl  s j k t / ? g/   -- EasyMotion
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

" Actually enhance f and sneak s
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" vim-sneak behaviour through easymotio
map <Leader>s <Plug>(easymotion-f2)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
