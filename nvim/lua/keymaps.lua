--------------------------------------
-- KEYMAPS
--------------------------------------
----- Function to create keymaps
local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

----- Default VIM keymaps
-- Leaderkey
g.mapleader = ' '

-- Modify archives
mapper('n', '<leader>w', ':w<CR>') -- Save
mapper('n', '<leader>W', ':x<CR>') -- Save en close
mapper('n', '<leader>q', ':q<CR>') -- Close
mapper('n', '<leader>m', ':noh<CR>') -- Clean search
mapper('n', '<leader>Q', ':q!<CR>') -- Force close

-- Modify text
mapper('n', '<leader>yy', ':t.<CR>') -- Duplicate current line

-- Move tabs
mapper('n', '<leader>h', ':tabp<CR>') -- Previous tab
mapper('n', '<leader>l', ':tabn<CR>') -- Next tab

-- NvimTree
mapper('n', '<leader>t', ':NvimTreeFindFileToggle<CR>') -- Open Tree

-- Telescope
mapper('n', '<leader>f', ':Telescope find_files<CR>') -- Search archives (in current directory)
mapper('n', '<leader>s', ':Telescope live_grep<CR>') -- Search text (in current directory)
mapper('n', '<leader><leader>b', ':Telescope buffers<CR>') -- Show buffers
mapper('n', '<leader>h', ':Telescope help_tags<CR>') -- Show ALL tags to view documentation.

-- Easymotion
mapper('n', '<leader><leader>s', '<Plug>(easymotion-s2)') -- Search in current file (with two chars)

-- DBUI - Dadbod
mapper('n', '<leader>b', ':DBUIToggle<CR>') -- Toggle UI

-- Gitsigns
mapper('n', '<leader>gh', ':Gitsigns toggle_current_line_blame<CR>') -- Disable show last commit in line

