" set conceallevel=1
" let g:tex_conceal='abdmg'




" " PDF Viewer:
" " http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
" let g:tex_flavor='latex'
" let g:vimtex_view_method = 'zathura'
" let g:vimtex_quickfix_mode=0
" " Ignore mappings
" let g:vimtex_mappings_enabled = 0
" " Error Suppression:
" " https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt
" let g:vimtex_log_ignore = [
"         \ 'Underfull',
"         \ 'Overfull',
"         \ 'specifier changed to',
"         \ 'Token not allowed in a PDF string',
"       \ ]
" let g:vimtex_context_pdf_viewer=1
" let g:vimtex_context_pdf_viewer= 'okular'
" let g:vimtex_compiler_latexmk = { 
"         \ 'executable' : 'latexmk',
"         \ 'options' : [ 
"         \   '-xelatex',
"         \   '-file-line-error',
"         \   '-synctex=1',
"         \   '-interaction=nonstopmode',
"         \ ],
"         \}
" let g:vimtex_compiler_latexmk = { 
"         \ 'executable' : 'latexmk',
"         \ 'options' : [ 
"         \   '-xelatex',
"         \   '-interaction=batchmode',
"         \   '-synctex=1',
"         \   '-interaction=nonstopmode',
"         \ ],
"         \}


let g:tex_flavor = 'latex'

" use vimtex as default compiler
let g:vimtex_compiler_latexmk_engines={'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines={'_':'xelatex'}

" use zathura as the default pdf reviewer
let g:vimtex_view_method='zathura'

" show the compiler hint
let g:vimtex_quickfix_mode = 1

" hide the last two lines
set conceallevel=1

let g:tex_conceal='abdmg'

" Ignore mappings
let g:vimtex_mappings_enabled = 0

" Error Suppression:
" https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt
let g:vimtex_log_ignore = [
        \ 'Underfull',
        \ 'Overfull',
        \ 'specifier changed to',
        \ 'Token not allowed in a PDF string',
      \ ]
let g:vimtex_context_pdf_viewer=1
let g:vimtex_context_pdf_viewer= 'okular'

let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-interaction=batchmode',
        \ ],
        \}


" SET SERVERNAME
" function! SetServerName()
"   if has('win32')
"     let nvim_server_file = $TEMP . "/curnvimserver.txt"
"   else
"     let nvim_server_file = "/tmp/curnvimserver.txt"
"   endif
"   let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
"   call system(cmd)
" endfunction

" augroup vimtex_common
"     autocmd!
"     autocmd FileType tex call SetServerName()
" augroup END


" let g:vimtex_syntax_conceal_cites = {
"       \ 'type': 'brackets',
"       \ 'icon': '📖',
"       \}


" let g:vimtex_quickfix_latexlog = {
"           \ 'overfull' : 0,
"           \ 'underfull' : 0,
"           \ 'packages' : {
"           \   'default' : 0,
"           \ },
"           \}
" let g:vimtex_quickfix_ignored_warnings = [
"         \ 'Underfull',
"         \ 'Overfull',
"         \ 'specifier changed to',
"         \ 'Token not allowed in a PDF string',
"       \ ]

" let g:vimtex_log_verbose = "0"
