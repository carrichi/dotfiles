-----------------------------------
-- Configuracion del EDITOR
-----------------------------------
local cmd = vim.cmd
local api = vim.api
local autostart = api.nvim_create_augroup("AutoStart", { clear = true })
local g = vim.g -- :global
local opt = vim.opt -- :set (For global vim option and local buffer options, global and local)

----- Default options
opt.number = true
opt.mouse = 'a'
opt.numberwidth = 3 opt.showcmd = true -- Nvim (por defecto)
opt.encoding = 'utf-8' -- Nvim (por defecto)
opt.ruler = true -- Que hace ruler?
opt.cursorline = true
opt.relativenumber = true
api.nvim_create_autocmd({"BufNew", "BufRead"}, { command = "set noshowmode", group = autostart })
opt.clipboard = 'unnamedplus'
opt.lazyredraw = true -- Para no reescribir todo el archivo al guardar ??

----- Split window
--cmd[[set nosplitright]]

----- Theme
opt.termguicolors = true

----- Transparencia
--TODO: Transparencia?
cmd[[hi Normal guibg=NONE ctermbg=NONE]]

----- Syntax
-- Events :h events
--api.nvim_create_autocmd({"BufNew", "BufRead"}, { command = "syntax on", group = autostart })
api.nvim_create_autocmd({"BufNew", "BufRead"}, { command = "filetype on", group = autostart })
api.nvim_create_autocmd({"BufNew", "BufRead"}, { command = "filetype indent on", group = autostart })
api.nvim_create_autocmd({"BufNew", "BufRead"}, { command = "filetype plugin on", group = autostart })
-- Asm
api.nvim_create_autocmd("FileType", {pattern = "*.asm",  command = "set ft=masm", group = autostart })

----- Identation
opt.cindent = true
opt.autoindent = true
opt.shiftwidth = 2
opt.tabstop = 2

----- Searching
opt.hlsearch = true -- Hightlight matches
opt.incsearch = true -- Incremental searching
opt.ignorecase = true -- Searches are case insensitive
opt.smartcase = true -- Unless they contain at least one capital letter

----- DBUI
g.dbs = { mtldb = 'postgres =//localhost/mtldb' }

----- COC?
-- Text Edit might fail if hidden is not set
opt.hidden = true -- For buffers?
-- Some servers have issues with backup files, se #649
api.nvim_create_autocmd({"BufNew", "BufRead"}, {command = "set nobackup", group = autostart })
api.nvim_create_autocmd({"BufNew", "BufRead"}, {command = "set nowritebackup", group = autostart })
-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable, delays and poor user experience.
opt.updatetime = 300
-- Better display for messages
opt.cmdheight = 1 -- Nvim (por defecto)
-- Don't pass messages to |ins-completion-menu|.
api.nvim_create_autocmd({"BufNew", "BufRead"}, {command = "set shortmess +=c", group = autostart })

----- Emmet
g.user_emmet_mode = 'n'
g.user_emmet_install_global = 0
api.nvim_create_autocmd("FileType", {pattern = "html, css",  command = "EmmetInstall", group = autostart })
g.user_emmet_leader_key = ','
-- Add Responsivness
g.user_emmet_settings = {
  variables = {lang = 'en'},
  html = {
    snippets = {
      html = "<!DOCTYPE html>\n" ..
              "<html lang=\"${lang}\">\n" ..
              "<head>\n" ..
              "\t<meta charset=\"${charset}\">\n" ..
              "\t<title></title>\n" ..
              "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" ..
              "</head>\n" ..
              "<body>\n\t${child}|\n</body>\n" ..
              "</html>"
    }
  }
}

