" CONFIGURACION DE LOS PLUGINS
""""""""""""""""""""""""""""""""""

    " Lightline
let g:lightline = {
    \ 'active' : {
    \ 	'right' : [['kitestatus'],['gitbranch', 'filetype', 'percent', 'lineinfo']],
    \ },
    \ 'component_function' : {
    \ 	'gitbranch' : 'fugitive#head',
    \	'kitestatus' : 'kite#statusline'
    \ },
    \ 'component_type' : {
    \	'gitbranch' : 'warning'
    \ }, 
    \ 'colorscheme' : 'nord',
    \ 'subseparator' : {
    \ 	'right' : ''
    \ }
    \}

    " COC
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

    " Kite
let g:kite_supported_languages = ['javascript', 'python']

if &filetype == "javascript" || &filetype == "python"
    inoremap <c-space> <C-x><C-u>
else
    inoremap <silent><expr> <c-space> coc#refresh()
endif

let g:kite_tab_complete = 1

    " Emmet
let g:user_emmet_leader_key=','
