
if exists(":Tabularize")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t| :Tabularize /|<CR>
  vmap <Leader>t| :Tabularize /|<CR>
  nmap <Leader>t[ :Tabularize /[<CR>
  vmap <Leader>t[ :Tabularize /[<CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
  nmap <Leader>t, :Tabularize /,\zs<CR>
  vmap <Leader>t, :Tabularize /,\zs<CR>
  nnoremap <leader>tb :Tabularize /
endif
