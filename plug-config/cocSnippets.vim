
" " --- Coc Snippets ---
" " let g:UltiSnipsExpandTrigger="<leader><tab>"
" " let g:UltiSnipsJumpForwardTrigger="<C-j>"
" " let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDir = "ultisnips"
" let g:UltiSnipsSnippetDirectories = ['ultisnips']
" nmap <leader>ue :UltiSnipsEdit<cr>
" " --- --- --- ---


" --- Coc Snippets ---
" Use <C-l> for trigger snippet expand.
imap <leader><tab> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>uc  <Plug>(coc-convert-snippet)


nmap <leader>ue :CocCommand snippets.editSnippets<cr>
nmap <leader>uf :CocCommand snippets.openSnippetFiles<cr>
nmap <leader>us :CocList snippets<cr>

" --- --- --- ---
