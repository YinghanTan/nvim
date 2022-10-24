" --- Reference ---
" https://www.chrisatmachine.com/Neovim/12-git-integration/
" https://www.youtube.com/watch?v=PO6DxfGPQvw&t=12s

" nmap <leader>gs :G<CR>
" nmap <leader>gj :diffget //3<CR>
" nmap <leader>gf :diffget //2<CR>

" let g:fugitive_summary_format =  '%C(auto)%h%d %<(90,trunc)%s %<(12,trunc)%cr %C(auto)%C(blue)%an'
let g:fugitive_summary_format = "%<(12,trunc)%an | %<(14,trunc)%cr | %s"

" " choose LOCAL
" nnoremap \ggf :diffget LOCAL<Bar>diffupdate<CR>
" " choose REMOTE
" nnoremap \ggj :diffget REMOTE<Bar>diffupdate<CR>
" " choose BASE
" nnoremap \ggg :diffget BASE<Bar>diffupdate<CR>
" " choose both
" nnoremap \ggb :/>>>>>>>/;?<<<<<<<?,.g/^\(<<<<<<<\\|=======\\|>>>>>>>\)/d<CR>


" Open current line in the browser
" nnoremap <Leader>gB :.GBrowse<CR>

" Open visual selection in the browser
" vnoremap <Leader>g!B :GBrowse!<CR>
