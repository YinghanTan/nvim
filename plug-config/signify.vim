
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" omap ih <plug>(signify-motion-inner-pending)
" xmap ih <plug>(signify-motion-inner-visual)
" omap ah <plug>(signify-motion-outer-pending)
" xmap ah <plug>(signify-motion-outer-visual)


nmap ]h <plug>(signify-next-hunk)
nmap [h <plug>(signify-prev-hunk)
nmap ]H 9999]h
nmap [H 9999[h

" default updatetime 4000ms is not good for async update
set updatetime=100

" set to only the VCS you use. Only these will be checked for when a new file gets opened.
let g:signify_vcs_list = ['git']
let g:signify_update_on_bufenter = 0

autocmd User SignifyHunk call s:show_current_hunk()
function! s:show_current_hunk() abort
    let h = sy#util#get_hunk_stats()
    if !empty(h)
        echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
    endif
endfunction
