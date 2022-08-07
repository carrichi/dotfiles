require('nvim-lsp-installer').setup{
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
      icons = {
          server_installed = "✓",
          server_pending = "➜",
          server_uninstalled = "✗"
      }
  }
}

--Enable (broadcasting) snippet capability for completion

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

---------------------------------------
---------------------------------------
------ SERVERS ADDED
---------------------------------------
---------------------------------------
-- Javascript
require('lspconfig')['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags
}
-- JSON
require('lspconfig')['jsonls'].setup{
  capabilities = capabilities
}
-- Python
-- Can be 'pyright' o 'jedi-languaje-server'
require('lspconfig')['jedi_language_server'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
-- HTML
require('lspconfig')['html'].setup{
  capabilities = capabilities
}
-- Emmet
require('lspconfig')['emmet_ls'].setup{
    capabilities = capabilities
}
-- CSS
require('lspconfig')['cssls'].setup{ -- Add server
  capabilities = capabilities
}
require('lspconfig')['cssmodules_ls'].setup{
  capabilities = capabilities
} -- Add Go-to-definition
-- SQL (MySQL, PostgreSQL, SQLite3)
-- Have an CALLBACK NOT FOUND ERROR.
--require('lspconfig')['sqlls'].setup{
  --root_dir = function()
    --return '/home/carl/.local/share/nvim/lsp_servers/sqlls'
  --end,
  --handlers = {
    --["textDocument/publishDiagnostics"] = vim.lsp.with(
      --vim.lsp.diagnostic.on_publish_diagnostics, {
        --virtual_text = true
      --}
      --)
  --},
  --connections = {
    --name = 'sqlls',
    --adapter = 'postgres',
    --host = 'localhost',
    --port = 5432,
    --user = 'postgres',
    --database = 'mtldb'
  --}
--}
require('lspconfig')['sqls'].setup{ -- nanotee/sqls
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client,bufnr)
  end
}
-- Dockerfile
require('lspconfig')['dockerls'].setup{
  capabilities = capabilities
}
-- Vue
require('lspconfig')['vuels'].setup{
  capabilities = capabilities
}
-- Eslint
require('lspconfig')['eslint'].setup{
  capabilities = capabilities
}
--vim.cmd[[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]] -- Fix all problems on save.
-- Lua
require('lspconfig')['sumneko_lua'].setup{
  capabilities = capabilities
}
-- Django
require('lspconfig')['tailwindcss'].setup{
  capabilities = capabilities
}

