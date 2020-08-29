
" let g:floaterm_keymap_toggle = '<F1>'
" let g:floaterm_keymap_next   = '<F2>'
" let g:floaterm_keymap_prev   = '<F3>'
" let g:floaterm_keymap_new    = '<F4>'

set hidden

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" " :FloatermUpdate --wintype=normal --position=right
" nnoremap   <silent>   <leader>`n    :FloatermNew<CR>
" tnoremap   <silent>   <leader>`n    <C-\><C-n>:FloatermNew<CR>
" nnoremap   <silent>   <leader>`k    :FloatermPrev<CR>
" tnoremap   <silent>   <leader>`k    <C-\><C-n>:FloatermPrev<CR>
" nnoremap   <silent>   <leader>`j    :FloatermNext<CR>
" tnoremap   <silent>   <leader>`j    <C-\><C-n>:FloatermNext<CR>
" nnoremap   <silent>   <leader>`   :FloatermToggle<CR>
" tnoremap   <silent>   <leader>`  <C-\><C-n>:FloatermToggle<CR>
tnoremap   <silent>   <leader>tt  <C-\><C-n>:FloatermToggle<CR>
