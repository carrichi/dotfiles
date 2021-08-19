" CONFIGURACION INICIAL
""""""""""""""""""""""""""""

" Para colorar los numeros del lado izquierdo.
set number
" Para activar el mouse en el editor.
set mouse=a
" Para colocar un espacio al lado izquierdo.
set numberwidth=2
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
" La cantidad de renglones para la sangria.
set sw=4
" Para mostrar la distancia entre mi linea actual y las demas.
set relativenumber
" Para no mostrar los modos en el que se encuentra el editor (ya lo proporciona la barra flotante)
set noshowmode
" Para que se guarde lo copiado en el sistema operativo.
set clipboard=unnamedplus

"set background=dark

filetype on
filetype indent on
filetype plugin on

" ENLACE A LOS DEMAS ARCHIVOS DE CONFIFURACION 
"""""""""""""""""""""""""""""""""""""""""""""""""
so $HOME/.config/nvim/settings/plugins.vim
so $HOME/.config/nvim/settings/plugin-config.vim
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

" Cambiar los colores por defecto
colorscheme onedark

" Aplicar transparencia
hi Normal guibg=NONE ctermbg=NONE
