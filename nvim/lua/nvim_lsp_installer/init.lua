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
  flags = lsp_flags
}
-- HTML
require('lspconfig')['html'].setup{
  capabilities = capabilities
}
-- CSS
require('lspconfig')['cssls'].setup{ -- Add server
  capabilities = capabilities
}
require('lspconfig')['cssmodules_ls'].setup{} -- Add Go-to-definition
-- SQL (MySQL, PostgreSQL, SQLite3)
require('lspconfig')['sqlls'].setup{
  root_dir = function() 
    return '$HOME/.local/share/nvim/lsp_servers/sqlls'
  end
}
require('lspconfig')['sqls'].setup{ -- nanotee/sqls
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client,bufnr)
  end
}
-- Dockerfile
require('lspconfig')['dockerls'].setup{}
-- Vue
require('lspconfig')['vuels'].setup{}
-- Eslint
require('lspconfig')['eslint'].setup{}
vim.cmd[[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]] -- Fix all problems on save.
-- Lua
require('lspconfig')['sumneko_lua'].setup{}

