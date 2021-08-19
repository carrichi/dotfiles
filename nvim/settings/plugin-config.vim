" CONFIGURACION DE LOS PLUGINS
""""""""""""""""""""""""""""""""""

  " Lightline
let g:lightline = {
  \ 'active' : {
  \   'right' : [['cocstatus'],['gitbranch', 'filetype', 'percent', 'lineinfo']],
  \ },
  \ 'component_function' : {
  \ 	'gitbranch' : 'fugitive#head',
  \   'cocstatus' : 'cos#status',
  \ },
  \ 'component_type' : {
  \	  'gitbranch' : 'warning',
  \ }, 
  \ 'colorscheme' : 'nord',
  \ 'subseparator' : {
  \ 	'right' : ''
  \ },
  \}

" Para que se actualice la barra flotante
autocmd User CocStatusChange, CocDiagnosticChange call lightline#update()

  " COC
inoremap <silent><expr> <c-space> coc#refresh()
autocmd FileType scss setl iskeyword+=@-@

  " use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

  " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

  " Indent
let g:indentLine_setColors = 239
let g:indentLine_char = '¦'

  " Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \    'indentation' : 4
  \}
