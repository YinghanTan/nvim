" test function
function general#DeleteTrailingWS() abort
    normal mz
    %s/\v\s+$//ge
    normal `z
endfunc
" nnoremap <leader>rs :call DeleteTrailingWS()<cr>

