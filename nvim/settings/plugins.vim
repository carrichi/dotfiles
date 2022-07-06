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
" Plug 'vim-airline/vim-airline'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Plugin para moverse entre las ventanas de neovim.
Plug 'christoomey/vim-tmux-navigator'

" Plugin para colocar colores en el editor.
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

" Plugins para autocompletado de codigo.
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Syntaxis support 
  " Varios lenguajes
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'

" Git
Plug 'tpope/vim-fugitive'

" Indent lines
Plug 'Yggdroot/indentLine'

" Icons
Plug 'ryanoasis/vim-devicons'

" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons'

" Auto brackets
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
"Para encerrar las variables en () Plug 'tpope/vim-surround'

" Snippets
Plug 'SirVer/ultisnips'
  " For vim ?
Plug 'honza/vim-snippets'
  " Snippets para React
Plug 'mlaursen/vim-react-snippets'

" Para realizar busquedas desde terminal.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'

call plug#end()
