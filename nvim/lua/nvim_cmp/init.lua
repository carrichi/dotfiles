-- From Neovim
---- nvim-cmp-setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    --['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { 
      behavior = cmp.ConfirmBehavior.Replace,
      select = true -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }, 
    ['<Tab>'] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, 
      { 'i', 's' }
    ),
    ['<S-Tab>'] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, 
      { 'i', 's' }
    ),
    }),
    sources = cmp.config.sources(
      {
        { name = 'nvim_lsp' },
        --{ name = 'ultisnips' }, -- For ultisnips users.
        { name = 'luasnip' }, -- For ultisnips users.
      },
    { 
      { name = 'buffer' } 
    }
  )
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources(
    {
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, 
    { { name = 'buffer' } }
  )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    { { name = 'path' } }, 
    { { name = 'cmdline' } }
  )
})

-- Setup lspconfig.
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

---------------------------------------
------ SERVERS ADDED
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
require('lspconfig')['sqlls'].setup{}
-- Dockerfile
require('lspconfig')['dockerls'].setup{}
-- Vue
require('lspconfig')['vuels'].setup{}
-- Eslint
--require('lspconfig')['eslint'].setup{}
--vim.cmd[[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]] -- Fix all problems on save.
