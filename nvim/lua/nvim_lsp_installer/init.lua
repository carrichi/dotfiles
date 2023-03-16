require('nvim-lsp-installer').setup{
  automatic_installation = false, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

--Enable (broadcasting) snippet capability for completion

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
-- Dockerfile
require('lspconfig')['dockerls'].setup{
  capabilities = capabilities
}
-- Lua
require('lspconfig')['sumneko_lua'].setup{
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

-- Golang
require('lspconfig')['gopls'].setup{
	capabilities = capabilities
}

