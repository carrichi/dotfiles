-----------------------------------
-- Configuracion del EDITOR
-----------------------------------

----- Default options
opt.number = true
opt.mouse = a
opt.numberwidth = 3
opt.syntax = enable -- Nvim (por defecto)
opt.showcmd = true -- Nvim (por defecto)
opt.encoding = 'utf-8' -- Nvim (por defecto)
opt.ruler = true -- Que hace ruler?
-- o.cursorline = true
-- o.relativenumber = true
--o.noshowmode = true -- El modo esta en la statusbar.
opt.clipboard = unnamedplus
opt.lazyredraw = true -- Para no reescribir todo el archivo al guardar ??

----- Theme
opt.filetype = on
opt.termguicolors = true

----- Transparencia
cmd[[hi Normal guibg=NONE ctermbg=NONE]]

----- Syntax
cmd[[filetype on]]
cmd[[filetype indent on]]
cmd[[filetype plugin on]]
-- ASM
cmd[[autocmd BufNew,BufRead *.asm set ft=masm]]

----- Identation
-- opt.tabstop = 4
-- opt.softtabstop = 4
-- opt.shiftwidth = 4
opt.sw = 2

----- Searching
opt.hlsearch = true -- Hightlight matches
opt.incsearch = true -- Incremental searching
opt.ignorecase = true -- Searches are case insensitive
opt.smartcase = true -- Unless they contain at least one capital letter

----- COC?
-- Text Edit might fail if hidden is not set
opt.hidden = true -- For buffers?
-- Some servers have issues with backup files, se #649
cmd[[set nobackup]]
cmd[[set nowritebackup]]
-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable, delays and poor user experience.
opt.updatetime = 300
-- Better display for messages
opt.cmdheight = 1 -- Nvim (por defecto)
-- Don't pass messages to |ins-completion-menu|.
cmd[[set shortmess +=c]]

-- Always show the signcolumn, oherwise it would shift the text each time diagnostics appear/become resolved.
--opt.signcolumn=number

