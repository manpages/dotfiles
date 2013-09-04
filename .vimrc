set nocompatible
filetype off
let mapleader=","

" ========================================================================
" Pathogen stuff
" ========================================================================
" call pathogen#incubate()
" call pathogen#helptags()

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

filetype plugin indent on  " required for Vundle
