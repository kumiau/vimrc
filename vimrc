noremap <space> :
set ruler
syntax enable
set nowrap
 
" size of a hard tabstop
set tabstop=2
 
" size of an "indent"
set shiftwidth=2
 
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
 
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
filetype indent on
set filetype=html
set smartindent
 
" always uses spaces instead of tab characters
set expandtab
set textwidth=0
set wrapmargin=0
 
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
 
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
 
" Declare the list of plugins.
Plug 'jiangmiao/auto-pairs'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
 
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
