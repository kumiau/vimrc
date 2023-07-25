local set = vim.opt
local Plug = vim.fn['plug#']

vim.keymap.set('n', '<space>', ':')
set.ruler = true
vim.cmd [[
  syntax enable
]]
vim.wo.wrap = false

-- size of a hard tabstop
set.tabstop=2

-- size of an "indent"
set.shiftwidth=2

-- a combination of spaces and tabs are used to simulate tab stops at a width
-- other than the (hard)tabstop
set.softtabstop=2

-- make "tab" insert indents instead of tabs at the beginning of a line
set.smarttab=true
set.filetype="html"
set.smartindent=true

-- always uses spaces instead of tab characters
set.expandtab=true
set.textwidth=0 
set.wrapmargin=0

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'

vim.call('plug#end')
