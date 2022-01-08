
" --- Ctrl-P Plugin ---
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>pb :CtrlPBuffer<CR>
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" --- --- ---

" --- vim ripgrep ctrlP ---
if executable('rg')
    let g:rg_derive_root='true'
endif
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" ag is fast enough that CtrlP doesn't need to cache
" Use ag in ctrl P for listing files
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
nnoremap <leader>ps :Rg<SPACE>
" --- --- ---
