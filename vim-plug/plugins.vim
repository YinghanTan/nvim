" --- Reference ---
" https://www.chrisatmachine.com/Neovim/01-vim-plug/

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Editing
    Plug 'tpope/vim-repeat' " Repeat.vim remaps . in a way that plugins can tap into it.
    Plug 'tpope/vim-eunuch' " Files
    Plug 'airblade/vim-rooter' " Have the file system follow you around
    Plug 'sheerun/vim-polyglot' " Better Syntax Support

    Plug 'michaeljsmith/vim-indent-object' " text Objects
    Plug 'nathanaelkane/vim-indent-guides' " text Objects
    Plug 'tpope/vim-unimpaired'
    Plug 'vimwiki/vimwiki' " Note Taking
    Plug 'michal-h21/vimwiki-sync' " Note git sync
    Plug 'easymotion/vim-easymotion' " Navigation
    Plug 'godlygeek/tabular' " Alignment and formatting
    Plug 'nelstrom/vim-visual-star-search' " Enable * to search in visual mode
    Plug 'tomtom/tcomment_vim' " Code Commentting

    " New / Testing
    Plug 'suy/vim-context-commentstring' " Useful for React Commenting
    " Plug 'yuki-uthman/nvim-vimpad'
    Plug 'metakirby5/codi.vim'

    " Autocomplete
    Plug 'jiangmiao/auto-pairs' " Brackets autocomplete
    Plug 'SirVer/ultisnips' " Ultisnips snippets
    Plug 'honza/vim-snippets' " Snippets
    Plug 'mlaursen/vim-react-snippets' " Snippets
    Plug 'tpope/vim-surround' " Surround
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
    Plug 'antoinemadec/coc-fzf'

    " Dart
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'natebosch/dartlang-snippets'

    " Tools
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Find
    Plug 'junegunn/fzf.vim' " Fuzzy Find
    Plug 'jremmen/vim-ripgrep' " awaiting fixed version
    Plug 'voldikss/vim-floaterm' " Terminal
    Plug 'mbbill/undotree' " Undo Time Travel
    Plug 'ChristianChiarulli/far.vim' " Find and Replace
    Plug 'mhinz/vim-grepper' " Handle multi-file find and replace.
    Plug 'scrooloose/nerdtree' " File Explorer SideBar
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'liuchengxu/vim-which-key' " View Shortcut keys
    " Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'} " Vim Practise - no longer working
    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'puremourning/vimspector' " Debugger
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Turn your browser¹ into a Neovim client

    " Languages
    Plug 'ianks/vim-tsx' " syntax highlighting for jsx in .tsx files
    Plug 'lervag/vimtex' " latex development
    Plug 'matze/vim-tex-fold'
    " Git
    Plug 'tpope/vim-fugitive' " Git
    Plug 'tpope/vim-rhubarb' " enables Gbrowse for github
    Plug 'shumphrey/fugitive-gitlab.vim' " enables Gbrowse for gitlab
    Plug 'tommcdo/vim-fubitive' " enables Gbrowse for bitbucket
    Plug 'junegunn/gv.vim' " Git Commit Browser
    Plug 'mattn/vim-gist' " Gist
    Plug 'mattn/webapi-vim' " Gist
    Plug 'rhysd/git-messenger.vim' " Popup Git messages

    Plug 'konfekt/fastfold'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'

    " UIUX
    Plug 'joshdick/onedark.vim' " A dark Vim/Neovim color scheme for the GUI and 16/256/true-color terminals
    Plug 'psliwka/vim-smoothie' " Smooth scrolling for Vim
    Plug 'ryanoasis/vim-devicons' "Cool icons
    Plug 'szw/vim-maximizer' " Zoom window
    Plug 'norcalli/nvim-colorizer.lua' " colorizer
    Plug 'vim-airline/vim-airline' " Status Line
    Plug 'vim-airline/vim-airline-themes' " Status Line theme
    Plug 'junegunn/rainbow_parentheses.vim' " Rainbow Brackets

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

