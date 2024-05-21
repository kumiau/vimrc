package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"
require 'term'

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
set.number=true

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set({ 'n', 't' }, "<S-Tab>", ToggleTerminal)

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'pmizio/typescript-tools.nvim'
Plug 'nvimdev/lspsaga.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

vim.call('plug#end')

-- Lualine

require('lualine').setup {
  options = { theme = 'molokai' },
  sections = {
    lualine_c = {{'filename', path = 1}}
  }
}

-- TypeScript

local status, nvim_lsp = pcall(require, "lspconfig")

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- LspSaga
local lspsaga = require('lspsaga') 
lspsaga.setup({lightbulb = { enable = false }})
