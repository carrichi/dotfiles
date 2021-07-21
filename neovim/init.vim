" CONFIGURACION INICIAL
""""""""""""""""""""""""""""

" Para colorar los numeros del lado izquierdo.
set number
" Para activar el mouse en el editor.
set mouse=a
" Para colocar un espacio al lado izquierdo.
set numberwidth=2
" Para que se reconozca la sintaxis de diferentes lenguajes.
syntax enable
syntax on
" Mostrar los comandos en el editor.
set showcmd
" Para que es ruler?
set ruler
" Para mostrar la linea que se esta editando.
" set cursorline
" Colocar una codificacion en el editor.
set encoding=utf-8
" Para mostrar las coincidencias en las busquedas.
set showmatch
" La cantidad de renglones para la sangria.
set sw=4
" Para mostrar la distancia entre mi linea actual y las demas.
set relativenumber
" Para no mostrar los modos en el que se encuentra el editor (ya lo proporciona la barra flotante)
set noshowmode
" Para que se guarde lo copiado en el sistema operativo.
set clipboard=unnamed

" ENLACE A LOS DEMAS ARCHIVOS DE CONFIFURACION 
"""""""""""""""""""""""""""""""""""""""""""""""""
so ./settings/plugins.vim
so ./settings/plugin-config.vim
so ./settings/keymaps.vim

" CONFIGURACION DE COLORES
""""""""""""""""""""""""""""
" Para que se utilicen los 256 colores de la terminal.

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

"colorscheme iceberg " De relax
colorscheme onedark " El mejor soportado.
" colorscheme palenight " Muy parecido a onedark pero algunos colores
" distintos.
