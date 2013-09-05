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
Bundle 'Tail-Bundle'

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
set shiftwidth=2
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
map <F7> :w<CR>:!%:p<CR><CR>
imap <F7> <Esc>:w<CR>:!%:p<CR><CR>
map <Leader>R :w<CR>:!%:p<CR><CR>
map <F8> :w<CR>:!%:p 2>&1 >> /tmp/vimterm.out<CR><CR>
imap <F8> <Esc>:w<CR>:!%:p 2>&1 >> /tmp/vimterm.out<CR><CR>
map <Leader>r :w<CR>:!%:p 2>&1 >> /tmp/vimterm.out<CR><CR>
