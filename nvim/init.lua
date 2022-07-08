------------------------------------------
-- CONFIGURACION INICIAL
------------------------------------------
cmd = vim.cmd
exec = vim.api.nvim_exec
fn = vim.fn
g = vim.g -- :global
go = vim.go -- :setglobal
-- o = vim.o -- :set (For global vim option, just global)
opt = vim.opt -- :set (For global vim option and local buffer options, global and local)
wo = vim.wo -- :setlocal
require('settings') -- Apply configuration

------------------------------------------
-- PLUGINS
------------------------------------------
require('plugins')

------------------------------------------
-- KEYMAPS
------------------------------------------
require('keymaps')
