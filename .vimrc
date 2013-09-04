set nocompatible
set noswapfile
filetype off
filetype plugin indent on  " required for Vundle
let mapleader=","

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ========================================================================
" Bundles
" ========================================================================
Bundle 'altercation/vim-colors-solarized'
Bundle 'wincent/Command-T'
Bundle 'Lokaltog/vim-easymotion'

" ========================================================================
" Fundamentals
" ========================================================================
set t_Co=256
syntax on
set background=dark
colorscheme solarized
set smartindent
set number
set tabstop=2
set expandtab
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>a

" ========================================================================
" Less annoyance
" ========================================================================
map Q <nop>
map K <nop>
nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>

" ========================================================================
" Run this file and grab the output
" ========================================================================
nnoremap <Leader>r :w<CR>o####<Esc>:r!time %:p<CR><CR>o<Esc>
nnoremap <Leader>R :w<CR>o####<Esc>:!%:p<CR><CR>o<Esc>
