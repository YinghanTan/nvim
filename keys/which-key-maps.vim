" --- Reference --- 
" https://www.chrisatmachine.com/Neovim/15-which-key/


nnoremap <leader>aw :call TrimWhitespace()<CR>
    

" vimspector
" nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nnoremap <leader>dd :call vimspector#Launch()<CR>
" inspect word under cursor - normal mode
nmap <leader>di <Plug>VimspectorBalloonEval
" inspect word under cursor - visual mode
xmap <Leader>di <Plug>VimspectorBalloonEval

" ultisnips
xmap <leader>uc  <Plug>(coc-convert-snippet)

" toggle unimpaired
nnoremap yog :IndentGuidesToggle<cr>
nnoremap yom <Plug>MarkdownPreview
nnoremap yoC :ColorizerToggle<cr>

" --- Edit Files ---
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" --- --- ---

" --- disable mouse clicks ---
nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>

inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

" Selecting last pasted text 2 versions
" nnoremap gp `[v`]
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
