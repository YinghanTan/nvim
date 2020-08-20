" --- Standard Settings ---
syntax on
filetype plugin on
set noswapfile                  " do not create a swap file"
set nobackup                    " no backup because we have undodir"
set undodir=~/.vim/undodir
set undofile                    " creaets an undofile each time a file is opened with vim
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

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set hidden                      " Hide files in the background instead of closing them"
" set scrolloff=8
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

autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro

set splitbelow                  " Set new window split below
set splitright                  " Set new window split right
set shortmess+=I                " Don't five intro message when starting vim
" --- --- ---

" --- Indent ---
" for html/rb files, 2 spaces
filetype plugin indent on
set tabstop=4 softtabstop=4     " tab stop 4 spaces, distance of each space 1
set shiftwidth=4                " displacement of each shift is 4 spaces
" set smarttab                    " Be smart when using tabs
set expandtab                   " tabs are spaces
set smartindent                 " automatically add indent 
set autoindent                  " apply indentation of current line to next line
set nowrap                      " text do not get wrappped around at the end of the line
" autocmd Filetype html setlocal ts=2 sw=2 expandtab
" autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
autocmd Filetype javascript setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype javascript set foldmethod=syntax "syntax highlighting items specify folds
autocmd Filetype javascript set foldcolumn=1 "defines 1 col at window left, to indicate folding
autocmd Filetype javascript let javaScript_fold=1 "activate folding by JS syntax
autocmd Filetype javascript set foldlevelstart=99 "start file with all folds opened
" autocmd Filetype coffeescript setlocal ts=2 sw=2 sts=0 expandtab
" autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab
" --- --- ---

" --- Folding ---
set foldenable          " enable folding
set foldmethod=syntax   "syntax highlighting items specify folds
" set foldmethod=indent   "syntax highlighting items specify folds
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
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
highlight NonText guifg=#4a4a59 "Invisible character colors 
highlight SpecialKey guifg=#4a4a59 "Invisible character colors 
" set wrap " Enable text wrapping to next line 
set nolist
set listchars=tab:▸\ ,precedes:←,extends:→,eol:¬ ",trail:.
" --- --- ---

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


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
" set smarttab                " Makes tabbing smarter will realize you have 2 vs 4
" set laststatus=0            " Always display the status line
set background=dark         " tell vim what the background color looks like
" set showtabline=2           " Always show tabs
" set noshowmode              " We don't need to see things like -- INSERT -- anymore
set nobackup                " This is recommended by coc
set nowritebackup           " This is recommended by coc
set updatetime=300          " Faster completion
set timeoutlen=500          " By default timeoutlen is 1000 ms
" set formatoptions-=cro      " Stop newline continuation of comments
set clipboard=unnamedplus   " Copy paste between vim and everything else
set autochdir               " Your working directory will always be the same as your file directory
" --- --- ---
