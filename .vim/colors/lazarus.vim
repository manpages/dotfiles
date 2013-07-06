" Vim color file
" Maintainer : Sebastian-Torsten Tillmann <sttillmann@users.sourceforge.net>
" Last Change: 2006-10-04
" Version    : 1.0.0

set background=light
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="lazarus"

hi Comment    gui=Bold    ctermfg=Brown     ctermbg=NONE 
hi Constant   gui=NONE    ctermfg=Blue      ctermbg=NONE
hi Identifier gui=NONE    ctermfg=Red       ctermbg=NONE
hi Statement  gui=Bold    ctermfg=Black     ctermbg=NONE
hi PreProc    gui=Bold    ctermfg=Red       ctermbg=NONE
hi Type       gui=NONE    ctermfg=Black     ctermbg=NONE
hi Special    gui=NONE    ctermfg=Blue      ctermbg=NONE
hi Todo       gui=Italic  ctermfg=Red       ctermbg=NONE
hi Error      gui=NONE    ctermfg=Red       ctermbg=NONE

