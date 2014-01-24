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
Bundle 'Zenburn'
Bundle 'wincent/Command-T'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Tail-Bundle'
Bundle 'elixir-lang/vim-elixir'
"Bundle 'Floobits/floobits-vim'
Bundle 'Markdown'

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
map <Leader>. :tabprevious<CR>
map <Leader>/ :tabnext<CR>

map <C-h> :noh<CR>
map <Leader>z :noh<CR>

" ========================================================================
" Less annoyance
" ========================================================================
map Q <nop>
map K <nop>
nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>

" ========================================================================
" Filetypes
" ========================================================================
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.md,*.markdown set filetype=markdown

" ========================================================================
" Run this file and grab the output
" ========================================================================
map <F7> :w<CR>:!%:p<CR><CR>
imap <F7> <Esc>:w<CR>:!%:p<CR><CR>
map <Leader>R :w<CR>:!%:p<CR><CR>
map <F8> :w<CR>:!%:p 2>&1 >> ~/.vimterm.out<CR><CR>
imap <F8> <Esc>:w<CR>:!%:p 2>&1 >> ~/.vimterm.out<CR><CR>
map <Leader>r :w<CR>:!%:p 2>&1 >> ~/.vimterm.out<CR><CR>
map <Leader>\ :tabnew ~/nut.sh<CR>:Tail ~/.vimterm.out<CR>:set modifiable<CR>
map <Leader>c :!echo -n > ~/.vimterm.out<CR><CR>

" ========================================================================
" Status line
" ========================================================================
set statusline= " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%m%r%w " flags
set statusline+=[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}] " file format
set statusline+=%= " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ " highlight
set statusline+=%b,0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset
set laststatus=2
