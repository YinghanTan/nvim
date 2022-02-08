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
    autocmd Filetype sh set tabstop=2     " a hard TAB displays as 2 columns
    autocmd Filetype sh set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype sh set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
    autocmd Filetype sh set expandtab     " insert spaces when hitting TABs
    autocmd Filetype sh set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype sh set foldmethod=indent "syntax highlighting items specify folds
    autocmd Filetype sh set foldcolumn=1 "defines 1 col at window left, to indicate folding
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
    autocmd Filetype python set foldcolumn=1 "defines 1 col at window left, to indicate folding
    autocmd Filetype python set foldlevelstart=99 "start file with all folds opened
  augroup end


  augroup _javascript
    autocmd Filetype javascript set tabstop=2     " a hard TAB displays as 2 columns
    autocmd Filetype javascript set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype javascript set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
    autocmd Filetype javascript set expandtab     " insert spaces when hitting TABs
    autocmd Filetype javascript set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype javascript set foldmethod=indent "syntax highlighting items specify folds
    autocmd Filetype javascript set foldcolumn=1 "defines 1 col at window left, to indicate folding
    autocmd Filetype javascript let javaScript_fold=1 "activate folding by JS syntax
    autocmd Filetype javascript set foldlevelstart=99 "start file with all folds opened
  augroup end

  augroup _typescript
    autocmd Filetype typescript set tabstop=2     " a hard TAB displays as 2 columns
    autocmd Filetype typescript set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype typescript set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
    " autocmd Filetype typescript set textwidth=80  " lines longer than 79 columns will be broken
    autocmd Filetype typescript set expandtab     " insert spaces when hitting TABs
    autocmd Filetype typescript set autoindent    " align the new line indent with the previous line
    autocmd Filetype typescript set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype typescript set foldmethod=indent "syntax highlighting items specify folds
    autocmd Filetype typescript set foldcolumn=1 "defines 1 col at window left, to indicate folding
    autocmd Filetype typescript set foldlevelstart=99 "start file with all folds opened
  augroup end

  augroup _typescript
    autocmd Filetype typescript.tsx set tabstop=2     " a hard TAB displays as 2 columns
    autocmd Filetype typescript.tsx set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype typescript.tsx set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
    " autocmd Filetype typescript.tsx set textwidth=80  " lines longer than 79 columns will be broken
    autocmd Filetype typescript.tsx set expandtab     " insert spaces when hitting TABs
    autocmd Filetype typescript.tsx set autoindent    " align the new line indent with the previous line
    autocmd Filetype typescript.tsx set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype typescript.tsx set foldmethod=indent "syntax highlighting items specify folds
    autocmd Filetype typescript.tsx set foldcolumn=1 "defines 1 col at window left, to indicate folding
    autocmd Filetype typescript.tsx set foldlevelstart=99 "start file with all folds opened
  augroup end

  augroup _yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
  augroup end

  augroup _html
    autocmd Filetype html set tabstop=2     " a hard TAB displays as 2 columns
    autocmd Filetype html set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype html set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
    autocmd Filetype html set expandtab     " insert spaces when hitting TABs
    autocmd Filetype html set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype html set foldmethod=indent "syntax highlighting items specify folds
  augroup end

  augroup _css
    autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
  augroup end


  " Git Settings
  autocmd FileType gitcommit set textwidth=80 " lines longer than 72 columns will be broken

  " In Git commit messages, also colour the 51st column (for titles)
  autocmd FileType gitcommit set colorcolumn+=51

  augroup _json
    autocmd Filetype json set tabstop=2     " a hard TAB displays as 2 columns
    autocmd Filetype json set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype json set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
    " autocmd Filetype json set textwidth=80  " lines longer than 79 columns will be broken
    autocmd Filetype json set expandtab     " insert spaces when hitting TABs
    autocmd Filetype json set autoindent    " align the new line indent with the previous line
    autocmd Filetype json set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype json set foldmethod=indent "syntax highlighting items specify folds
    autocmd Filetype json set foldcolumn=1 "defines 1 col at window left, to indicate folding
    autocmd Filetype json set foldlevelstart=99 "start file with all folds opened
  augroup end

  augroup _tex
    au BufNewFile,BufRead *.tex,*.sty,*.cls setlocal filetype=tex
    autocmd Filetype tex setlocal ts=2 sw=2 sts=2 expandtab
    autocmd Filetype tex set tabstop=2     " a hard TAB displays as 2 columns
    autocmd Filetype tex set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype tex set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
    autocmd Filetype tex set expandtab     " insert spaces when hitting TABs
    autocmd Filetype tex set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype tex set foldmethod=indent "syntax highlighting items specify folds
    autocmd Filetype tex set foldcolumn=1 "defines 1 col at window left, to indicate folding
    " autocmd Filetype tex let javaScript_fold=1 "activate folding by sh syntax
    autocmd Filetype tex set foldlevelstart=99 "start file with all folds opened
  augroup end

  augroup _dart
    autocmd Filetype dart setlocal ts=2 sw=2 sts=2 expandtab
    autocmd Filetype dart set tabstop=2     " a hard TAB displays as 2 columns
    autocmd Filetype dart set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
    autocmd Filetype dart set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
    autocmd Filetype dart set expandtab     " insert spaces when hitting TABs
    autocmd Filetype dart set shiftround    " round indent to multiple of 'shiftwidth'
    autocmd Filetype dart set foldmethod=indent "syntax highlighting items specify folds
    autocmd Filetype dart set foldcolumn=1 "defines 1 col at window left, to indicate folding
  augroup end

]]

