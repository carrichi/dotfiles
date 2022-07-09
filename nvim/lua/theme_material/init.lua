require('material').setup({
  italics = {
    comments = true,
    keywords = true,
    functions = false,
		strings = false,
		variables = false
  },
  contrast = {
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		line_numbers = false, -- Enable contrast background for line numbers
		sign_column = false, -- Enable contrast background for the sign column
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		popup_menu = false, -- Enable lighter background for the popup menu
	},
  high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},
  disable = {
    colored_cursor = true, -- Disable the colored cursor
    term_colors = true, -- Prevent the theme from setting terminal colors
    borders = false, -- Disable borders between verticaly split windows
    background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
    eob_lines = false -- Hide the end-of-buffer lines
  },
  --lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
  custom_hightlights = {},
  plugins = {
    nvim_cmp = true,
    gitsigns = true,
    telescope = true,
    nvim_tree = true,
  },
})
----- Styles available
-- darker
-- lighter
-- oceanic
-- palenight
-- deep ocean
vim.g.material_style = 'palenight'
vim.cmd[[colorscheme material]]
