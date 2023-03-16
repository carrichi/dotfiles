vim.opt.list = true
--vim.opt.listchars:append "eol:" -- Show char at the end of line.

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true, -- show indent line with color.
  --show_current_context_start = true, -- underline start.
  char = '¦',
}

