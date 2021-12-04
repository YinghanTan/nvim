" nmap <leader>o <Plug>(vimpad-on)
" nmap <leader>f <Plug>(vimpad-off)
" nmap <leader>t <Plug>(vimpad-toggle)
" nmap <leader>r <Plug>(vimpad-refresh)
let g:vimpad_prefix_error = ' '
let g:vimpad_prefix = ' '


" number of spaces to add in front of output
let g:vimpad_add_space = 2


" number of spaces around the output
let g:vimpad_add_padding = 1

" Linking to the existing group
highlight link VimpadOutput      PmenuSel
highlight link VimpadOutputError PmenuSel
" highlight link VimpadOutputError Error

" " to see all the highlight groups
" :highlight



" " Round shape:
" " make sure to set the style to custom!
" let g:vimpad_style = 'custom'
" let g:vimpad_prefix = "\uE0B6"
" let g:vimpad_suffix= "\uE0B4"
" highlight VimpadOutput guifg=bg guibg=Cyan
" highlight VimpadPrefix guifg=bg guibg=Cyan gui=reverse
" highlight VimpadSuffix guifg=bg guibg=Cyan gui=reverse
" " make sure to set the style to custom!
" let g:vimpad_style_error = 'custom'
" let g:vimpad_prefix_error = "\uE0B6"
" let g:vimpad_suffix_error = "\uE0B4"
" highlight VimpadOutputError guifg=bg guibg=Red
" highlight VimpadPrefixError guifg=bg guibg=Red gui=reverse
" highlight VimpadSuffixError guifg=bg guibg=Red gui=reverse


