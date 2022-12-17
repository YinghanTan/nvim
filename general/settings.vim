" --- Reference ---
" https://www.chrisatmachine.com/Neovim/02-vim-general-settings/
" https://www.youtube.com/watch?v=hSHATqh8svM

" --- Standard Settings ---

" remove dots or spaces to indicate folded line
set fillchars=vert:│,diff:╱,foldclose:,foldopen:,fold:\ ,msgsep:─
syntax on                                       " Turn on syntax highlighting
filetype on
filetype plugin on
filetype plugin indent on
set nocompatible                                " incompatible with vi
set noswapfile                                  " do not create a swap file                                        "
set nobackup                                    " no backup because we have undodir                                "
set incsearch                                   " starting search before typing the parameter completes
set ignorecase                                  " Ignore case when searching
set smartcase                                   " search only include case when a case is added
set hlsearch                                    " highlight search results
set showmatch                                   " highlight matching brackets [{()}]
set nolazyredraw                                " Don't redraw while executing macros (good performance config)
set magic                                       " For regular expressions turn magic on
set noerrorbells                                " No error sounds
set t_vb=                                       " turn off visual bell
set novisualbell                                " turn off visual bell
set timeoutlen=500                              " Time in milliseconds to wait for a mapped sequence to complete.
set ttimeoutlen=20                              " Time in milliseconds to wait for a key code sequence to complete
set colorcolumn=79                              " Color column at 80 characters to keep code short
highlight ColorColumn ctermbg=0 guibg=lightgrey
set hidden                                      " Hide files in the background instead of closing them "
set showmode                                    " Last line                                            "
set showcmd
set cursorline                                  " highlight current line
" set relativenumber                              " show relative row numbers
set number                                      " show line numbers
set wildmenu                                    " visual autocomplete for command menu
set wildmode=longest:full,list:full
set ruler                                       " show current row and column
set encoding=utf-8                              " encoding/format
set history=1000                                " increate the undo limit
set t_Co=256
set scrolloff=3                                 " line buffer of 3 lines when scrolling
set nocp " netrw

autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro

set splitbelow                  " Set new window split below
set splitright                  " Set new window split right
set shortmess+=I                " Don't five intro message when starting vim
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
set laststatus=2                   " Always show the status line
                                   " Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
highlight NonText guifg=#4a4a59    " Invisible character colors
highlight SpecialKey guifg=#4a4a59 " Invisible character colors
set nolist
set listchars=tab:▸\ ,precedes:←,extends:→,eol:¬ ",trail:.
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
" write or save file with sudo
" cmap w!! w !sudo tee %
" --- --- ---

" --- NVIM Settings ---
set pumheight=10            " Makes popup menu smaller
set fileencoding=utf-8      " The encoding written to file
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
set timeoutlen=800          " By default timeoutlen is 1000 ms
set clipboard=unnamedplus   " Copy paste between vim and everything else
set autochdir               " Your working directory will always be the same as your file directory
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
" set smartindent                 " automatically add indent 
set autoindent                  " apply indentation of current line to next line
set nowrap                      " text do not get wrappped around at the end of the line
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html set tabstop=2     " a hard TAB displays as 2 columns
autocmd Filetype html set softtabstop=2 " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype html set shiftwidth=2  " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype html set shiftround    " round indent to multiple of 'shiftwidth'
autocmd Filetype html set foldmethod=indent "syntax highlighting items specify folds
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
" autocmd Filetype ruby setlocal ts=2 sw=2 expandtab


au BufNewFile,BufRead *.handlebars setlocal filetype=jst
au BufNewFile,BufRead *.ejs set filetype=jst
autocmd Filetype jst setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype jst set shiftround        " round indent to multiple of 'shiftwidth'
autocmd Filetype jst set foldmethod=indent " syntax highlighting items specify folds



" Yaml Formatting
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab


" Javascript Settings
au BufNewFile,BufRead *.jsx setlocal filetype=javascriptreact
autocmd Filetype javascriptreact setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascriptreact set shiftround                " round indent to multiple of 'shiftwidth'
autocmd Filetype javascriptreact set foldmethod=indent         " syntax highlighting items specify folds

autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype javascript set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype javascript set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype javascript set expandtab                      " insert spaces when hitting TABs
autocmd Filetype javascript set shiftround                     " round indent to multiple of 'shiftwidth'
" autocmd Filetype javascript setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype javascript set foldmethod=indent              " syntax highlighting items specify folds
autocmd Filetype javascript set foldcolumn=1                   " defines 1 col at window left, to indicate folding
autocmd Filetype javascript let javaScript_fold=1              " activate folding by JS syntax
autocmd Filetype javascript set foldlevelstart=99             " start file with all folds opened

" Javascript Settings
au BufNewFile,BufRead *.jsx setlocal filetype=javascriptreact
autocmd Filetype js setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype js set tabstop=2                             " a hard TAB displays as 2 columns
autocmd Filetype js set softtabstop=2                         " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype js set shiftwidth=2                          " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype js set expandtab                             " insert spaces when hitting TABs
autocmd Filetype js set shiftround                            " round indent to multiple of 'shiftwidth'
" autocmd Filetype js setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype js set foldmethod=indent                     " syntax highlighting items specify folds
autocmd Filetype js set foldcolumn=1                          " defines 1 col at window left, to indicate folding
autocmd Filetype js let javaScript_fold=1                     " activate folding by JS syntax
autocmd Filetype js set foldlevelstart=99                     " start file with all folds opened



" for js/coffee:w/jade files, 4 spaces
" autocmd Filetype coffeescript setlocal ts=2 sw=2 sts=0 expandtab
" autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab
" --- --- ---

" --- OS Configuration ---
if has('unix')
    let s:uname = system("uname")
    call system("command -v termux-setup-storage")
    if s:uname == "Darwin\n"
        " Do Mac stuff here
        let g:system = 'mac'
        let g:python3_host_prog='$HOME/.pyenv/versions/3.9.9/bin/python3' " ubuntu
        let g:node_host_prog = '$HOME/.nvm/versions/node/v16.9.0/lib/node_modules/neovim/bin/cli.js' " Mac
    elseif exists("$WSL_DISTRO_NAME")
        " Do wsl stuff here
        let g:system = 'wsl'
        let g:python3_host_prog='$HOME/.pyenv/versions/3.9.9/bin/python3' " ubuntu
        let g:node_host_prog = '$HOME/.nvm/versions/node/v16.13.1/lib/node_modules/neovim/bin/cli.js' " Ubuntu
    elseif v:shell_error == 0
        " Do termux stuff here
        let g:system = 'termux'
        let s:termux_prefix = '/data/data/com.termux/files/usr'
        let g:python3_host_prog='/data/data/com.termux/files/usr/bin/python3' " ubuntu
        let g:node_host_prog = '/data/data/com.termux/files/usr/lib/node_modules/neovim/bin/cli.js' " Ubuntu
    else
        " Do Linux stuff here
        let g:system = 'linux'
        let g:python3_host_prog='$HOME/.pyenv/versions/3.9.9/bin/python3' " ubuntu
        let g:node_host_prog = '$HOME/.nvm/versions/node/v16.13.1/lib/node_modules/neovim/bin/cli.js' " Ubuntu
    endif
elseif has('win32')
    " Do Windows stuff here
    let g:system = 'windows'
endif
" --- --- ---

" Python Settings
" let g:loaded_python_provider = 0
autocmd Filetype python set tabstop=4         " a hard TAB displays as 4 columns
autocmd Filetype python set softtabstop=4     " insert/delete 4 spaces when hitting a TAB/BACKSPACE
autocmd Filetype python set shiftwidth=4      " operation >> indents 4 columns; << unindents 4 columns
" autocmd Filetype python set textwidth=80      " lines longer than 79 columns will be broken
autocmd Filetype python set expandtab         " insert spaces when hitting TABs
autocmd Filetype python set autoindent        " align the new line indent with the previous line
autocmd Filetype python set shiftround        " round indent to multiple of 'shiftwidth'
autocmd Filetype python set fileformat=unix   " round indent to multiple of 'shiftwidth'
autocmd Filetype python set foldmethod=indent " fold base on indentation
autocmd Filetype python set foldlevelstart=99 " start file with all folds opened
autocmd Filetype python set foldcolumn=1      " defines 1 col at window left, to indicate folding
" Flagging Unnecessary Whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Html Django Settings
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2 expandtab

" Typescript settings
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd Filetype typescript set tabstop=2             " a hard TAB displays as 2 columns
autocmd Filetype typescript set softtabstop=2         " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype typescript set shiftwidth=2          " operation >> indents 2 columns; << unindents 2 columns
" autocmd Filetype typescript set textwidth=80           " lines longer than 79 columns will be broken
autocmd Filetype typescript set expandtab             " insert spaces when hitting TABs
autocmd Filetype typescript set autoindent            " align the new line indent with the previous line
autocmd Filetype typescript set shiftround            " round indent to multiple of 'shiftwidth'
autocmd Filetype typescript set foldmethod=indent     " syntax highlighting items specify folds
autocmd Filetype typescript set foldcolumn=1          " defines 1 col at window left, to indicate folding
autocmd Filetype typescript set foldlevelstart=99     " start file with all folds opened

autocmd Filetype typescript.tsx set tabstop=2         " a hard TAB displays as 2 columns
autocmd Filetype typescript.tsx set softtabstop=2     " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype typescript.tsx set shiftwidth=2      " operation >> indents 2 columns; << unindents 2 columns
" autocmd Filetype typescript.tsx set textwidth=80       " lines longer than 79 columns will be broken
autocmd Filetype typescript.tsx set expandtab         " insert spaces when hitting TABs
autocmd Filetype typescript.tsx set autoindent        " align the new line indent with the previous line
autocmd Filetype typescript.tsx set shiftround        " round indent to multiple of 'shiftwidth'
autocmd Filetype typescript.tsx set foldmethod=indent " syntax highlighting items specify folds
autocmd Filetype typescript.tsx set foldcolumn=1      " defines 1 col at window left, to indicate folding
autocmd Filetype typescript.tsx set foldlevelstart=99 " start file with all folds opened


" Git Settings
autocmd FileType gitcommit set textwidth=80 " lines longer than 72 columns will be broken
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" Ruby Settings
" let g:ruby_host_prog='/opt/homebrew/opt/ruby/bin/ruby'
let g:loaded_ruby_provider = 0

" Perl Settings
let g:loaded_perl_provider = 0


" json
autocmd Filetype json set tabstop=2         " a hard TAB displays as 2 columns
autocmd Filetype json set softtabstop=2     " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype json set shiftwidth=2      " operation >> indents 2 columns; << unindents 2 columns
" autocmd Filetype json set textwidth=80      " lines longer than 79 columns will be broken
autocmd Filetype json set expandtab         " insert spaces when hitting TABs
autocmd Filetype json set autoindent        " align the new line indent with the previous line
autocmd Filetype json set shiftround        " round indent to multiple of 'shiftwidth'
autocmd Filetype json set foldmethod=indent " syntax highlighting items specify folds
autocmd Filetype json set foldcolumn=1      " defines 1 col at window left, to indicate folding
autocmd Filetype json set foldlevelstart=99 " start file with all folds opened

" Bash Settings
au BufNewFile,BufRead *.sh setlocal filetype=sh
autocmd Filetype sh setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype sh set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype sh set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype sh set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype sh set expandtab                      " insert spaces when hitting TABs
autocmd Filetype sh set shiftround                     " round indent to multiple of 'shiftwidth'
autocmd Filetype sh set foldmethod=indent              " syntax highlighting items specify folds
autocmd Filetype sh set foldcolumn=1                   " defines 1 col at window left, to indicate folding
" autocmd Filetype sh let javaScript_fold=1 "activate folding by sh syntax
autocmd Filetype sh set foldlevelstart=99              "start file with all folds opened


" zsh Settings
au BufNewFile,BufRead *.zsh setlocal filetype=zsh
autocmd Filetype zsh setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype zsh set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype zsh set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype zsh set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype zsh set expandtab                      " insert spaces when hitting TABs
autocmd Filetype zsh set shiftround                     " round indent to multiple of 'shiftwidth'
autocmd Filetype zsh set foldmethod=indent              " syntax highlighting items specify folds
autocmd Filetype zsh set foldcolumn=1                   " defines 1 col at window left, to indicate folding
" autocmd Filetype zsh let javaScript_fold=1 "activate folding by sh syntax
autocmd Filetype zsh set foldlevelstart=99              "start file with all folds opened

" LaTeX
au BufNewFile,BufRead *.tex,*.sty,*.cls setlocal filetype=tex
autocmd Filetype tex setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype tex set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype tex set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype tex set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype tex set expandtab                      " insert spaces when hitting TABs
autocmd Filetype tex set shiftround                     " round indent to multiple of 'shiftwidth'
autocmd Filetype tex set foldmethod=indent              " syntax highlighting items specify folds
autocmd Filetype tex set foldcolumn=1                   " defines 1 col at window left, to indicate folding
" autocmd Filetype tex let javaScript_fold=1 "activate folding by sh syntax
autocmd Filetype tex set foldlevelstart=99              "start file with all folds opened
setlocal autoindent
let g:tex_indent_items=0
let g:tex_indent_and=0
let g:tex_indent_brace=0



" dart Settings
" au BufNewFile,BufRead *.dart setlocal filetype=dart
autocmd Filetype dart setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype dart set tabstop=2                      " a hard TAB displays as 2 columns
autocmd Filetype dart set softtabstop=2                  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
autocmd Filetype dart set shiftwidth=2                   " operation >> indents 2 columns; << unindents 4 columns
autocmd Filetype dart set expandtab                      " insert spaces when hitting TABs
autocmd Filetype dart set shiftround                     " round indent to multiple of 'shiftwidth'
autocmd Filetype dart set foldmethod=indent              " syntax highlighting items specify folds
autocmd Filetype dart set foldcolumn=1                   " defines 1 col at window left, to indicate folding
autocmd Filetype dart set autoindent
" autocmd Filetype dart let javaScript_fold=1 "activate folding by dart syntax
" autocmd Filetype dart set foldlevelstart=99 "start file with all folds opened

" Ultisnips Auto Reload
autocmd BufWritePost *.snippets :call UltiSnips#RefreshSnippets()

" Disable F1 for Help Menu
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" make Y Behave nice
nnoremap Y y$

" keep cursor centered 
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap [ [<c-g>u
inoremap ( (<c-g>u
inoremap { {<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'


" Moving text
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Selecting last pasted text 2 versions
" nnoremap gp `[v`]
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" --- disable mouse clicks ---
nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>

inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

" --- Edit Files ---
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" --- --- ---

" --- Diff ---
set diffopt=vertical,filler,context:3,foldcolumn:1,indent-heuristic,algorithm:patience,internal " vertical splits when in diff, filler lines for left right symmetry between diffs, 3 context lines for each chunk, 1 column gutter for git diff
" --- --- ---


" --- Shada ---
set shadafile=$HOME/.config/nvim/shada/main.shada
set shada=!,'100,<100,s100,h,f1,/10000,:10000 
set updatetime=10000
