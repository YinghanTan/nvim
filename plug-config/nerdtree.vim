" --- NERDTree Plugin ---
" nnoremap <leader>nt :NERDTreeToggle<CR>
" nnoremap <leader>nb :NERDTreeFromBookmark<Space>
" nnoremap <silent> <leader>nf :NERDTreeFind<CR>
" let NERDTreeMapOpenInTab="o"


" Auto Refresh nerdtree
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" --- --- ---

