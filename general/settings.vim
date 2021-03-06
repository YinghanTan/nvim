
" " python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF




" --- Standard Settings ---

syntax on
filetype plugin on
filetype plugin indent on
set noswapfile                  " do not create a swap file"
set nobackup                    " no backup because we have undodir"
set incsearch                   " starting search before typing the parameter completes
set ignorecase                  " Ignore case when searching
set smartcase                   " search only include case when a case is added
set hlsearch                    " highlight search results
set lazyredraw                  " Don't redraw while executing macros (good performance config)
set magic                       " For regular expressions turn magic on
set noerrorbells                " No error sounds
set t_vb=                       " turn off visual bell
set novisualbell                " turn off visual bell
set tm=500
set colorcolumn=+1
highlight ColorColumn ctermbg=0 guibg=lightgrey
set hidden                      " Hide files in the background instead of closing them"
set showmode
set showcmd
set cursorline                  " highlight current line
set relativenumber              " show relative row numbers
set number                      " show line numbers
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to.
set showmatch                   " highlight matching brackets [{()}]
set ruler                       " show current row and column
set encoding=utf-8
set history=1000                " increate the undo limit
set t_Co=256
" set scrolloff=8

autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro

set splitbelow                  " Set new window split below
set splitright                  " Set new window split right
set shortmess+=I                " Don't five intro message when starting vim
" --- --- ---


" --- Folding ---
set foldenable          " enable folding
" set foldmethod=syntax   "syntax highlighting items specify folds - slow when file gets large
set foldmethod=indent   "syntax highlighting items specify folds
set foldcolumn=1        "defines 1 col at window left, to indicate folding
set foldlevelstart=99   "start file with all folds opened
" set fillchars=fold:-    " remove ---- in folds
" --- --- ---


" --- Better copy & paste ---
" set clipboard^=unnamed,unnamedplus
set clipboard=unnamedplus
" --- --- ---


" --- Normalise Backspace ---
" imap <C-BS> <C-W>
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" --- --- ---

" --- Syntax ---
set omnifunc=syntaxcomplete#Complete        " AutoCompletion Insert Mode - <C-X><C-O> Navigate - <C-N><C-P>
nnoremap gV `[v`]   " highlight last inserted text
" --- --- ---

" --- Theme ---
set laststatus=2                        " Always show the status line
" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
highlight NonText guifg=#4a4a59 "Invisible character colors 
highlight SpecialKey guifg=#4a4a59 "Invisible character colors 
" set wrap " Enable text wrapping to next line 
set nolist
set listchars=tab:???\ ,precedes:???,extends:???,eol:?? ",trail:.
" --- --- ---

" --- Ignore compiled files ---
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
" --- --- ---


" --- Resize ---
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
" --- --- ---

" --- Refresh VIMRC on Save ---
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vim alternatively you can run :source $MYVIMRC
" You can't stop me
cmap w!! w !sudo tee %
" --- --- ---

" --- NVIM Settings ---
set pumheight=10            " Makes popup menu smaller
set fileencoding=utf-8      "The encoding written to file
set cmdheight=2             " More space for displaying messages"
set iskeyword+=-            " treat dash separated words as a word text object
set mouse=a                 " enable your mouse
set splitbelow              " Horizontal splits will automatically be below
set splitright              " Vertical splits will automatically be to the right
set t_Co=256                " Support 256 colors
set conceallevel=0          " So that I can see `` in markdown files
set background=dark         " tell vim what the background color looks like
set nobackup                " This is recommended by coc
set nowritebackup           " This is recommended by coc
set updatetime=100          " Faster completion
set timeoutlen=500          " By default timeoutlen is 1000 ms
set clipboard=unnamedplus   " Copy paste between vim and everything else
set autochdir               " Your working directory will always be the same as your file directory
set diffopt=vertical
set textwidth=0
set wrapmargin=0
set noshowmode              " We don't need to see things like -- INSERT -- anymore
" set smarttab                " Makes tabbing smarter will realize you have 2 vs 4
" set laststatus=0            " Always display the status line
" set showtabline=2           " Always show tabs
" set formatoptions-=cro      " Stop newline continuation of comments
" --- --- ---

" --- Indentation ---
" for html/rb files, 2 spaces

filetype plugin indent on
set tabstop=4 softtabstop=4     " tab stop 4 spaces, distance of each space 1
set shiftwidth=4                " displacement of each shift is 4 spaces
" set smarttab                    " Be smart when using tabs
set expandtab                   " tabs are spaces
set smartindent                 " automatically add indent 
set autoindent                  " apply indentation of current line to next line
set nowrap                      " text do not get wrappped around at the end of the line
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html set shiftround    " round indent to multiple of 'shiftwidth'
autocmd Filetype html set foldmethod=indent "syntax highlighting items specify folds
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
" autocmd Filetype ruby setlocal ts=2 sw=2 expandtab


au BufNewFile,BufRead *.handlebars setlocal filetype=jst
au BufNewFile,BufRead *.ejs set filetype=jst
autocmd Filetype jst setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype jst set shiftround    " round indent to multiple of 'shiftwidth'
autocmd Filetype jst set foldmethod=indent "syntax highlighting items specify folds



" Yaml Formatting
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab


" Javascript Settings
au BufNewFile,BufRead *.jsx setlocal filetype=javascriptreact
" let g:node_host_prog = expand('~/.nvm/versions/node/v15.5.0/lib/node_modules/neovim/bin/cli.js')
" let g:node_host_prog = '.nvim/versions/node/v15.5.0/bin/neovim-node-host'
let g:node_host_prog = '/opt/homebrew/lib/node_modules/neovim/bin/cli.js' " Mac
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript set tabstop=2     " a hard TAB displays as 2 columns
autocmd Filetype javascript set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype javascript set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype javascript set expandtab     " insert spaces when hitting TABs
autocmd Filetype javascript set shiftround    " round indent to multiple of 'shiftwidth'
" autocmd Filetype javascript setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype javascript set foldmethod=indent "syntax highlighting items specify folds
autocmd Filetype javascript set foldcolumn=1 "defines 1 col at window left, to indicate folding
autocmd Filetype javascript let javaScript_fold=1 "activate folding by JS syntax
autocmd Filetype javascript set foldlevelstart=99 "start file with all folds opened

" Javascript Settings
au BufNewFile,BufRead *.jsx setlocal filetype=javascriptreact
" let g:node_host_prog = expand('~/.nvm/versions/node/v15.5.0/lib/node_modules/neovim/bin/cli.js')
" let g:node_host_prog = '.nvim/versions/node/v15.5.0/bin/neovim-node-host'
autocmd Filetype js setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype js set tabstop=2     " a hard TAB displays as 2 columns
autocmd Filetype js set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype js set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype js set expandtab     " insert spaces when hitting TABs
autocmd Filetype js set shiftround    " round indent to multiple of 'shiftwidth'
" autocmd Filetype js setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype js set foldmethod=indent "syntax highlighting items specify folds
autocmd Filetype js set foldcolumn=1 "defines 1 col at window left, to indicate folding
autocmd Filetype js let javaScript_fold=1 "activate folding by JS syntax
autocmd Filetype js set foldlevelstart=99 "start file with all folds opened



" for js/coffee:w/jade files, 4 spaces
" autocmd Filetype coffeescript setlocal ts=2 sw=2 sts=0 expandtab
" autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab
" --- --- ---

" Python Settings
let g:python3_host_prog='$HOME/.pyenv/versions/3.9.1/bin/python3' " Mac
" let g:python_host_prog='/usr/local/bin/python2' " Mac
" let g:python3_host_prog='/home/yinghan/.local/lib/python3.8' " Ubuntu
autocmd Filetype python set tabstop=4     " a hard TAB displays as 4 columns
autocmd Filetype python set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
autocmd Filetype python set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
autocmd Filetype python set textwidth=80  " lines longer than 79 columns will be broken
autocmd Filetype python set expandtab     " insert spaces when hitting TABs
autocmd Filetype python set autoindent    " align the new line indent with the previous line
autocmd Filetype python set shiftround    " round indent to multiple of 'shiftwidth'
autocmd Filetype python set fileformat=unix    " round indent to multiple of 'shiftwidth'
autocmd Filetype python set foldmethod=indent " fold base on indentation
autocmd Filetype python set foldlevelstart=99 "start file with all folds opened
autocmd Filetype python set foldcolumn=1 "defines 1 col at window left, to indicate folding
" Flagging Unnecessary Whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Typescript settings
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd Filetype typescript set tabstop=2     " a hard TAB displays as 2 columns
autocmd Filetype typescript set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype typescript set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
autocmd Filetype typescript set textwidth=80  " lines longer than 79 columns will be broken
autocmd Filetype typescript set expandtab     " insert spaces when hitting TABs
autocmd Filetype typescript set autoindent    " align the new line indent with the previous line
autocmd Filetype typescript set shiftround    " round indent to multiple of 'shiftwidth'
autocmd Filetype typescript set foldmethod=indent "syntax highlighting items specify folds
autocmd Filetype typescript set foldcolumn=1 "defines 1 col at window left, to indicate folding
autocmd Filetype typescript set foldlevelstart=99 "start file with all folds opened

autocmd Filetype typescript.tsx set tabstop=2     " a hard TAB displays as 2 columns
autocmd Filetype typescript.tsx set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype typescript.tsx set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
autocmd Filetype typescript.tsx set textwidth=80  " lines longer than 79 columns will be broken
autocmd Filetype typescript.tsx set expandtab     " insert spaces when hitting TABs
autocmd Filetype typescript.tsx set autoindent    " align the new line indent with the previous line
autocmd Filetype typescript.tsx set shiftround    " round indent to multiple of 'shiftwidth'
autocmd Filetype typescript.tsx set foldmethod=indent "syntax highlighting items specify folds
autocmd Filetype typescript.tsx set foldcolumn=1 "defines 1 col at window left, to indicate folding
autocmd Filetype typescript.tsx set foldlevelstart=99 "start file with all folds opened


" Git Settings
autocmd FileType gitcommit set textwidth=80 " lines longer than 72 columns will be broken

" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" Ruby Settings
let g:ruby_host_prog='/opt/homebrew/opt/ruby/bin/ruby'

" json
autocmd Filetype json set tabstop=2     " a hard TAB displays as 2 columns
autocmd Filetype json set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype json set shiftwidth=2  " operation >> indents 2 columns; << unindents 2 columns
autocmd Filetype json set textwidth=80  " lines longer than 79 columns will be broken
autocmd Filetype json set expandtab     " insert spaces when hitting TABs
autocmd Filetype json set autoindent    " align the new line indent with the previous line
autocmd Filetype json set shiftround    " round indent to multiple of 'shiftwidth'
autocmd Filetype json set foldmethod=indent "syntax highlighting items specify folds
autocmd Filetype json set foldcolumn=1 "defines 1 col at window left, to indicate folding
autocmd Filetype json set foldlevelstart=99 "start file with all folds opened

" Bash Settings
au BufNewFile,BufRead *.sh setlocal filetype=sh
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

" Disable F1 for Help Menu
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>
