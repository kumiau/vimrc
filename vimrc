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
