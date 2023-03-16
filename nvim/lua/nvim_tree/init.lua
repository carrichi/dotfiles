----------------------------------------------
----------------------------------------------
-- NVIM-TREE SETUP
----------------------------------------------
----------------------------------------------

require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "t", action = 'tabnew' },
        { key = "v", action = 'vsplit' },
        { key = "n", action = 'create' },
        { key = "?", action = 'toggle_help' },
      }
    },
    side = 'left',
    relativenumber = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = 'icon',
  },
  filters = {
    dotfiles = true
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  diagnostics = {
    enable = true
  },
  log = {
    enable = false,
    truncate = true,
    types = {
      git = true,
      profile = true,
    },
  }
})
