" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround' " Surround
    Plug 'tpope/vim-eunuch' " Files
    Plug 'airblade/vim-rooter' " Have the file system follow you around
    Plug 'tpope/vim-sleuth' " auto set indent settings
    Plug 'sheerun/vim-polyglot' " Better Syntax Support
    Plug 'ryanoasis/vim-devicons' "Cool icons
    Plug 'jiangmiao/auto-pairs' " Brackets autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
    Plug 'vim-airline/vim-airline' " Status Line
    Plug 'vim-airline/vim-airline-themes' " Status Line theme
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Find
    Plug 'junegunn/fzf.vim' " Fuzzy Find
    Plug 'tpope/vim-fugitive' " Git
    Plug 'tpope/vim-rhubarb' " Git
    Plug 'junegunn/gv.vim' " Git
    Plug 'voldikss/vim-floaterm' " Terminal
    " Plug 'mhinz/vim-startify' " Start Screen
    Plug 'liuchengxu/vim-which-key' " View Shortcut keys
    Plug 'honza/vim-snippets' " Snippets
    Plug 'mlaursen/vim-react-snippets'
    " Plug 'mattn/emmet-vim' " Snippets
    Plug 'metakirby5/codi.vim' " interactive Code
    Plug 'mbbill/undotree' " Undo Time Travel
    Plug 'ChristianChiarulli/far.vim' " Find and Replace
    Plug 'mattn/vim-gist' " Gist
    Plug 'mattn/webapi-vim' " Gist
    Plug 'norcalli/nvim-colorizer.lua' " colorizer
    Plug 'scrooloose/nerdtree' " File Explorer SideBar
    Plug 'szw/vim-maximizer' " Zoom window

    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-abolish'
    Plug 'vimwiki/vimwiki' " Note Taking
    " Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion' " Navigation
    Plug 'junegunn/rainbow_parentheses.vim' " Rainbow Brackets
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'} " Vim Practise
    Plug 'wellle/targets.vim' " for editing paired text objects


    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'godlygeek/tabular' " Alignment and formatting
    Plug 'nelstrom/vim-visual-star-search' " Enable * to search in visual mode
    Plug 'tomtom/tcomment_vim' " Code Commentting

    Plug 'michaeljsmith/vim-indent-object'
    Plug 'nathanaelkane/vim-indent-guides'


    Plug 'jremmen/vim-ripgrep'
    Plug 'pedrohdz/vim-yaml-folds'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'

    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-utils/vim-man'
    Plug 'leafgarland/typescript-vim'
    Plug 'dbeniamine/cheat.sh-vim'

    " Themes
    Plug 'mhinz/vim-signify'
    Plug 'joshdick/onedark.vim'

    Plug 'tpope/vim-obsession' " Save Sessions on tmux
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Turn your browser¹ into a Neovim client

    Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} " live server

call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" if exists('g:vscode')
"     " Easy motion for VSCode
"     Plug 'asvetliakov/vim-easymotion'
"     Plug 'machakann/vim-highlightedyank'
" else


