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
    }
  },
  renderer = {
    group_empty = true
  },
  filters = {
    dotfiles = true
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})
