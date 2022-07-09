------------------------------------------------
------------------------------------------------
-------------- LIST OF PLUGINS -----------------
------------------------------------------------
------------------------------------------------
-- Using Vim-Plug
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

----- UI
Plug 'kyazdani42/nvim-tree.lua' -- Show tree file
Plug 'christoomey/vim-tmux-navigator' -- Move in panels
Plug 'matze/vim-move' -- Move lines
Plug 'preservim/nerdcommenter' -- Toggle comments
Plug 'easymotion/vim-easymotion' -- Move in archive faster
-- Search
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' -- Dependency of Telescope
Plug 'nvim-treesitter/nvim-treesitter' -- Dependency of Telescope (for Parsers)
-- Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
-- Theme
Plug 'marko-cerovac/material.nvim'
--Plug 'tjdevries/colorbuddy.nvim' -- To create your OWN colorscheme!
-- Terminal
Plug ('akinsho/toggleterm.nvim', { tag = 'v1.*' })
-- Transparent
--Plug 'xiyaowong/nvim-transparent'

----- Syntax support
-- HTML/CSS
Plug 'mattn/emmet-vim' -- Tags snippets
Plug 'norcalli/nvim-colorizer.lua' -- Show colors for CSS, HTML and JS
-- JavaScript
Plug 'pangloss/vim-javascript'
-- Multiple languages
Plug 'sheerun/vim-polyglot'
-- Indent lines
Plug 'Yggdroot/indentLine'
-- Auto brackets
--Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs' -- Recomended por Neovim
Plug 'alvan/vim-closetag'
-- Lua
Plug 'tbastos/vim-lua'

----- Git
Plug 'tpope/vim-fugitive' -- Commands snippets
Plug 'lewis6991/gitsigns.nvim' -- UI functions

----- DB Client
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'kristijanhusak/vim-dadbod-ui'

----- Statusbar
Plug 'feline-nvim/feline.nvim'

----- Autocomplete
-- Languaje support
Plug 'neovim/nvim-lspconfig'
Plug 'prabirshrestha/vim-lsp' -- Util for lspconfig
Plug 'hrsh7th/nvim-cmp' -- Recommended by Neovim ESTE CONFIGURA LOS SERVIDORES.
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'petertriho/cmp-git'
-- SQL/Postgres
Plug 'lifepillar/pgsql.vim'
Plug 'nanotee/sqls.nvim'
-- Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'nvim-treesitter/nvim-treesitter' -- Optional from cmp-nvim-ultisnips,  requires Neovim nightly. (do :TSUpdate)
-- React
Plug 'mlaursen/vim-react-snippets'
-- Installer
Plug "williamboman/nvim-lsp-installer" -- Requiere de lspconfig

vim.call('plug#end')

------------------------------------------------
------------------------------------------------
---------- PLUGINS IN USE
------------------------------------------------
------------------------------------------------
---- Theme
require("theme_material")
---- Plugins
require("nvim_tree")
require("nvim_colorizer")
require("nvim_gitsigns")
require("nvim_feline")
require("nvim_lspconfig")
require("nvim_cmp")
require("nvim_toggleterm")
require("nvim_treesitter")
require("nvim_lsp_installer")
require("nvim_autopairs")
