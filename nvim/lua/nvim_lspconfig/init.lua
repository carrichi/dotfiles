-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

vim.g.mapleader = ' '
local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<leader><leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.api.nvim_set_keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.api.nvim_set_keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.api.nvim_set_keymap('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.api.nvim_set_keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.api.nvim_set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.api.nvim_set_keymap('n', '<leader><leader>d', vim.lsp.buf.type_definition, bufopts)
  vim.api.nvim_set_keymap('n', '<leader><leader>r', vim.lsp.buf.rename, bufopts)
  vim.api.nvim_set_keymap('n', '<leader><leader>c', vim.lsp.buf.code_action, bufopts)
  vim.api.nvim_set_keymap('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.api.nvim_set_keymap('n', '<leader>F', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
