" CONFIGURACION INICIAL
""""""""""""""""""""""""""""
" Para colorar los numeros del lado izquierdo.
set number
" Para activar el mouse en el editor.
set mouse=a
" Para colocar un espacio al lado izquierdo.
set numberwidth=3
" Para que se reconozca la sintaxis de diferentes lenguajes.
syntax enable " YA LA TIENE INTEGRADA.
" Mostrar los comandos en el editor.
set showcmd " YA LA TIENE INTEGRADA.
" Para que es ruler?
set ruler
" Para mostrar la linea que se esta editando.
set cursorline
" Colocar una codificacion en el editor.
set encoding=utf-8 " YA LA TIENE INTEGRADA.
" Para mostrar las coincidencias en las busquedas.
set showmatch " YA LA TIENE INTEGRADA
" Para mostrar la distancia entre mi linea actual y las demas.
" set relativenumber
" Para no mostrar los modos en el que se encuentra el editor (ya lo proporciona la barra flotante)
set noshowmode
" Para que se guarde lo copiado en el sistema operativo.
set clipboard=unnamedplus

filetype on
filetype indent on
filetype plugin on

" ENLACE A LOS DEMAS ARCHIVOS DE CONFIFURACION 
"""""""""""""""""""""""""""""""""""""""""""""""""
so $HOME/.config/nvim/settings/plugins.vim
so $HOME/.config/nvim/settings/config.vim
so $HOME/.config/nvim/settings/keymaps.vim

" CONFIGURACION DE COLORES
""""""""""""""""""""""""""""

" Para que se utilicen los 256 colores de la terminal.

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
endif

" Cambiar los colores por defecto
colorscheme onedark

" La cantidad de renglones para la sangria.
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Aplicar transparencia
hi Normal guibg=NONE ctermbg=NONE

" Aplicar sintaxis para ENSAMBLADOR
autocmd BufNew,BufRead *.asm set ft=masm

" Searching
set hlsearch  "Highlight matches"
set incsearch "incremental searching"
set ignorecase "searches are case insensitive"
set smartcase  "unless they contain at least one capital letter"

" Identation
set sw=2

" COC______________________________________________
" Text Edit might fail if hidden is not set
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Better display for messages
set cmdheight=1
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

