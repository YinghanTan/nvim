" --- Reference ---
" https://www.youtube.com/watch?v=AnTX2mtOl9Q

let g:vimspector_enable_mappings = 'HUMAN'


func! AddToWatch()
    let word = expand("<cexpr>")
    call vimspector#AddWatch(word)
endfunction
" let g:vimspector_base_dir = expand('$HOME/.config/nvim/vimspector-config')

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
" nmap <leader>dv :call vimspector#Launch()<CR>
" nnoremap <leader>dd :call vimspector#Launch()<CR>
" nmap <leader>dD :VimspectorReset<CR>
" nmap <leader>de :VimspectorEval
" nmap <leader>dw :VimspectorWatch
" nmap <leader>do :VimspectorShowOutput
" autocmd Filetype java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>


let g:vimspector_install_gadgets = [ 'debugpy', 'debugger-for-chrome', 'CodeLLDB', 'vscode-node-debug2' ]
