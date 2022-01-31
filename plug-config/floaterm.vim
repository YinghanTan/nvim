
" let g:floaterm_keymap_toggle = '<F1>'
" let g:floaterm_keymap_next   = '<F2>'
" let g:floaterm_keymap_prev   = '<F3>'
" let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" " :FloatermUpdate --wintype=normal --position=right
tnoremap   <silent>   <leader>tc  <C-\><C-n>:FloatermToggle<CR>
" nnoremap   <silent>   <leader>`n    :FloatermNew<CR>
" tnoremap   <silent>   <leader>`n    <C-\><C-n>:FloatermNew<CR>
" nnoremap   <silent>   <leader>`k    :FloatermPrev<CR>
" tnoremap   <silent>   <leader>`k    <C-\><C-n>:FloatermPrev<CR>
" nnoremap   <silent>   <leader>`j    :FloatermNext<CR>
" tnoremap   <silent>   <leader>`j    <C-\><C-n>:FloatermNext<CR>
" nnoremap   <silent>   <leader>`   :FloatermToggle<CR>
" tnoremap   <silent>   <leader>`  <C-\><C-n>:FloatermToggle<CR>

" --- nvim-toggle-terminal ---
" tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
" --- --- ---



function! IpythonOpen()
	FloatermNew --wintype=normal --position=right --width=0.5
	normal h
	normal 
	FloatermSend (cd %:p:h ; ipython --no-autoindent; clear)
	" brackets necessary above, runs a minishell
	call feedkeys("\<Esc>")
endfunction
