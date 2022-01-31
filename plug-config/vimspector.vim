let g:vimspector_enable_mappings = 'HUMAN'


" nmap <leader>dv :call vimspector#Launch()<CR>
nmap <leader>dD :VimspectorReset<CR>
" nmap <leader>de :VimspectorEval
" nmap <leader>dw :VimspectorWatch
" nmap <leader>do :VimspectorShowOutput
" autocmd Filetype java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>

func! AddToWatch()
    let word = expand("<cexpr>")
    call vimspector#AddWatch(word)
endfunction
" let g:vimspector_base_dir = expand('$HOME/.config/nvim/vimspector-config')


let g:vimspector_install_gadgets = [ 'debugpy', 'debugger-for-chrome', 'CodeLLDB', 'vscode-node-debug2' ]
