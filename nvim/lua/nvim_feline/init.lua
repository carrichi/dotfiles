if not pcall(require, "feline") then
  return
end

local colors = {
    bg = '#282c34',
    fg = '#abb2bf',
    yellow = '#e0af68',
    cyan = '#56b6c2',
    --darkblue = '#081633',
    darkblue = '#354259',
    green = '#98c379',
    orange = '#d19a66',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#61afef',
    red = '#e86671'
}

local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.red,
    VISUAL = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.violet,
    ['V-REPLACE'] = colors.violet,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow
}

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

local function count(diagnostics)
  local ocurrences = 0
  for _ in pairs(diagnostics) do
    ocurrences = ocurrences + 1
  end
  return ocurrences
end

-- With help of diagnostic-handlers-example
local lsp_get_diag = function(status)
    if status == 'WARN' then
      local warnings = count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }))
      return ' ' .. warnings
    elseif status == 'ERROR' then
      local errors = count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))
      return ' ' .. errors
    elseif status == 'HINT' then
      local hints = count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }))
      return ' ' .. hints
    end
end

local comps = {
    vi_mode = {
      left = {
        provider = function()
          return '  ' .. vi_mode_utils.get_vim_mode()
          end,
        hl = function()
          local val = {
            name = vi_mode_utils.get_mode_highlight_name(),
            fg = vi_mode_utils.get_mode_color(),
          }
          return val
          end,
          right_sep = ' '
        },
        right = {
            provider = '' ,
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color()
                }
                return val
            end,
            left_sep = ' ',
            right_sep = ' '
        }
    },
    file = {
        info = {
            provider = {
              name = 'file_info',
              opts = {
                type = 'relative-short',
                file_readonly_icon = '  ',
                file_modified_icon = '',
              }
            },
            hl = {
                fg = colors.blue,
                style = 'bold'
            }
        },
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        },
        type = {
            provider = 'file_type'
        },
        position = {
            provider = 'position',
            left_sep = ' ',
            hl = {
                fg = colors.cyan,
                style = 'bold'
            }
        },
    },
    left_end = {
        provider = function() return '' end,
        hl = {
            fg = colors.bg,
            bg = colors.blue,
        }
    },
    line_percentage = {
        provider = 'line_percentage',
        left_sep = ' ',
        hl = {
            style = 'bold'
        }
    },
    scroll_bar = {
        provider = 'scroll_bar',
        left_sep = ' ',
        hl = {
            fg = colors.blue,
            style = 'bold'
        }
    },
    diagnos = {
      err = {
          provider = function()
              return '' .. lsp_get_diag("ERROR")
          end,
          enabled = function() return lsp.diagnostics_exist('ERROR') end,
          --left_sep = ' ',
          right_sep = ' ',
          hl = {
              fg = colors.red,
          }
      },
      warn = {
          provider = function()
              return '' ..  lsp_get_diag("WARN")
          end,
          enabled = function() return lsp.diagnostics_exist('WARN') end,
          --left_sep = ' ',
          right_sep = ' ',
          hl = {
            fg = colors.yellow,
          }
      },
      hint = {
        provider = function()
          return 'ﯦ' ..  lsp_get_diag("HINT")
          end,
          enabled = function() return lsp.diagnostics_exist('HINT') end,
          --left_sep = ' ',
          right_sep = ' ',
          hl = {
            fg = colors.cyan,
          }
      },
    },
    lsp = {
      name = {
        provider = 'lsp_client_names',
        icon = '慎',
        -- left_sep = ' ',
        --right_sep = ' ',
        hl = {
          fg = colors.yellow,
          style = 'bold'
        }
      }
    },
    git = {
        branch = {
            provider = 'git_branch',
            icon = ' ',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            },
        },
        add = {
            provider = 'git_diff_added',
            hl = {
                fg = colors.green
            }
        },
        change = {
            provider = 'git_diff_changed',
            hl = {
                fg = colors.orange
            }
        },
        remove = {
            provider = 'git_diff_removed',
            hl = {
                fg = colors.red
            }
        }
    }
}

local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[2], comps.git.branch)
table.insert(components.active[2], comps.git.add)
table.insert(components.active[2], comps.git.change)
table.insert(components.active[2], comps.git.remove)
table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[3], comps.diagnos.err)
table.insert(components.active[3], comps.diagnos.warn)
table.insert(components.active[3], comps.diagnos.hint)
table.insert(components.active[3], comps.diagnos.info)
table.insert(components.active[3], comps.lsp.name)
table.insert(components.active[3], comps.file.position)
table.insert(components.active[3], comps.line_percentage)
table.insert(components.active[3], comps.scroll_bar)
table.insert(components.active[3], comps.vi_mode.right)


 --TreeSitter
 --local ts_utils = require("nvim-treesitter.ts_utils")
 --local ts_parsers = require("nvim-treesitter.parsers")
 --local ts_queries = require("nvim-treesitter.query")
--[[ table.insert(components.active[2], {
  provider = function()
    local node = require("nvim-treesitter.ts_utils").get_node_at_cursor()
    return ("%d:%s [%d, %d] - [%d, %d]")
      :format(node:symbol(), node:type(), node:range())
  end,
  enabled = function()
    local ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
    return ok and ts_parsers.has_parser()
  end
})]]

require'feline'.setup {
    colors = { bg = colors.bg, fg = colors.fg },
    components = components,
    vi_mode_colors = vi_mode_colors,
    force_inactive = {
        filetypes = {
            'NvimTree',
            'fugitive',
            'fugitiveblame'
        },
        buftypes = {'terminal'},
        bufnames = {}
    }
}
