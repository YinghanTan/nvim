
" .............................................................................
" 'mbbill/undotree' Undo Time Travel
" .............................................................................

if has("persistent_undo")
    " set undodir=$HOME/.undodir
    " set undofile
    set undodir=~/.vim/undodir
    set undofile
    " creates an undofile each time a file is opened with vim
endif

let g:undotree_RelativeTimestamp = 1
let g:undotree_ShortIndicators = 1
let g:undotree_HelpLine = 0
let g:undotree_WindowLayout = 2
