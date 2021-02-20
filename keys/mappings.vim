" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

nnoremap <silent> <C-w>z :MaximizerToggle<CR>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Spell checking, Pressing \SS will toggle and untoggle spell checking
map <leader>Ss :setlocal spell!<cr>
" Spell checking, Pressing \ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>


" modify paste in visual mode to paste repeatedly
xnoremap <leader>p "_dP

" map <leader>pp :setlocal paste!<cr>             " Toggle paste mode on and off
" set pastetoggle=<leader>pt       " paste mode: avoid auto indent, treat chars
