" CONFIGURACION DE PLUGINS
""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" Plugin para atajos de teclado en html.
Plug 'mattn/emmet-vim'

" Plugin para muestra de color en css.
Plug 'ap/vim-css-color'

" Plugin para mostrar el arbol en la carpeta del archivo.
Plug 'preservim/nerdtree'

" Plugins para la barra flotante.
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Plugins para tema de la barra flotante.
Plug 'hallzy/lightline-onedark'

" Plugin para moverse entre las ventanas de neovim.
Plug 'christoomey/vim-tmux-navigator'

" Plugin para colocar colores en el editor.
" Plug 'cocopon/iceberg.vim'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
" Plug 'drewtempelmeyer/palenight.vim'

" Plugin para autocompletado de codigo.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'tpope/vim-fugitive'

call plug#end()
