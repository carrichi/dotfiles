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
Plug ('akinsho/bufferline.nvim', { tag = 'v2.*' })
-- Search
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' -- Dependency of Telescope
Plug 'nvim-treesitter/nvim-treesitter' -- Dependency of Telescope (for Parsers) (Syntax support multiple languages)
Plug 'junegunn/fzf' -- Alternative grep to Telescope
Plug 'junegunn/fzf.vim'
-- Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
-- Theme
Plug 'marko-cerovac/material.nvim'
--Plug 'tjdevries/colorbuddy.nvim' -- To create your OWN colorscheme!
-- Transparent
Plug 'xiyaowong/nvim-transparent'

----- Syntax support
-- HTML/CSS
Plug 'mattn/emmet-vim' -- Tags snippets
Plug 'norcalli/nvim-colorizer.lua' -- Show colors for CSS, HTML and JS -- Sutitute by Treesitter
-- Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'
-- Auto brackets
Plug 'windwp/nvim-autopairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' -- Repeat plug commands with '.'

----- Git
Plug 'tpope/vim-fugitive' -- Commands snippets
Plug 'lewis6991/gitsigns.nvim' -- UI functions

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
-- Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets' -- Add snippets in a lot of languages.
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
require("nvim_treesitter")
require("nvim_lsp_installer")
require("nvim_autopairs")
require("nvim_indent_blankline")
require("nvim_bufferline")
require("nvim_transparent")

