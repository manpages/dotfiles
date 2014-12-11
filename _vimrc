""""""""""""""""""""""""""""""
set nocompatible
set noswapfile
set number
set relativenumber
set smartindent
set tabstop=2
set shiftwidth=2
set backspace=2
set expandtab
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
syntax off
""""""""""""""""""""""""""""""
let mapleader=","
set pastetoggle=<Leader>v
map <Leader>. :tabprevious<CR>
map <Leader>/ :tabnext<CR>
map Q <nop>
map K <nop>
nnoremap <PageUp> <nop>
noremap <PageDown> <nop>
