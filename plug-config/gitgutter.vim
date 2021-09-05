
" Change these if you want
let g:gitgutter_sign_added               = '+'
let g:gitgutter_sign_removed             = '_'
let g:gitgutter_sign_delete_first_line   = '‾'
let g:gitgutter_sign_modified            = '~'
let g:gitgutter_sign_modified_removed    = '▎'
let g:gitgutter_preview_win_floating     = 1


let g:gitgutter_enabled = 1

highlight GitGutterAdd    guifg=#587C0C ctermfg=2
highlight GitGutterChange guifg=#0C7D9D ctermfg=3
highlight GitGutterDelete guifg=#94151B ctermfg=1

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

let g:gitgutter_show_msg_on_hunk_jumping = 0

omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)


