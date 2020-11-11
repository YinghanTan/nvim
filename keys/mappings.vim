" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>



" " Zoom / Restore window.
" function! s:ZoomToggle() abort
"     if exists('t:zoomed') && t:zoomed
"         execute t:zoom_winrestcmd
"         let t:zoomed = 0
"     else
"         let t:zoom_winrestcmd = winrestcmd()
"         resize
"         vertical resize
"         let t:zoomed = 1
"     endif
" endfunction
" command! ZoomToggle call s:ZoomToggle()


nnoremap <silent> <C-w>z :MaximizerToggle<CR>
