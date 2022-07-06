"" CONFIGURACION DE LOS PLUGINS
""""""""""""""""""""""""""""""""""

" let g:closetag_filenames = '*.html, *.js, *.jsx, *.ts, *.tsx'

  " Lightline
let g:lightline = {
  \ 'colorscheme' : 'nord',
  \ 'active' : {
  \   'left' : [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified'],
  \   ],
  \   'right' : [
  \     ['gitbranch', 'percent', 'lineinfo'],
  \   ],
  \ },
  \ 'component_function' : {
  \ 	'gitbranch' : 'fugitive#head',
  \ },
  \ 'subseparator' : {
  \ 	'right' : '',
  \ },
  \ }

  " Indent
let g:indentLine_setColors = 239
let g:indentLine_char = '¦'

  " Emmet
    " Para funcionamiento unicamente en modo Normal
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'variables': {'lang': 'es'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\ 'javascript' : {
\    'extends' : 'jsx'
\  }
\}


"UltiSnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"

" Nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1

" FZF
let $FZF_DEFAULT_OPTS='--layout=reverse'
" vim fugitive
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" Vim polyglot
" El plugin vim-jsx-pretty utiliza vim-polyglot
" Se desabilita de polyglot para que no se rompa.
"let g:polyglot_disabled = ['jsx']

" LSP CONFIGURACION
" require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}

lua << EOF
EOF

" Snippet configuration
"let g:utilSnipsExpandTrigger="<tab>"
