-- autocmd! remove all autocommands, if entered under a group it will clear that group
vim.cmd [[

  " Return to last edit position when opening files (You want this!)
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo,spectre_panel nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _bash
    autocmd Filetype sh setlocal ts=2 sw=2 sts=2 expandtab
    autocmd Filetype sh set tabstop=2     " a hard TAB displays as 2 columns
    autocmd Filetype sh set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype sh set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
    autocmd Filetype sh set expandtab     " insert spaces when hitting TABs
    autocmd Filetype sh set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype sh set foldmethod=indent "syntax highlighting items specify folds
    autocmd Filetype sh set foldcolumn=1 "defines 1 col at window left, to indicate folding
    " autocmd Filetype sh let javaScript_fold=1 "activate folding by sh syntax
    autocmd Filetype sh set foldlevelstart=99 "start file with all folds opened
  augroup end

  augroup _python
    autocmd Filetype python set tabstop=4     " a hard TAB displays as 4 columns
    autocmd Filetype python set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype python set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
    " autocmd Filetype python set textwidth=80  " lines longer than 79 columns will be broken
    autocmd Filetype python set expandtab     " insert spaces when hitting TABs
    autocmd Filetype python set autoindent    " align the new line indent with the previous line
    autocmd Filetype python set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype python set fileformat=unix    " round indent to multiple of 'shiftwidth'
    autocmd Filetype python set foldmethod=indent " fold base on indentation
    autocmd Filetype python set foldlevelstart=99 "start file with all folds opened
    autocmd Filetype python set foldcolumn=1 "defines 1 col at window left, to indicate folding
  augroup end

]]

