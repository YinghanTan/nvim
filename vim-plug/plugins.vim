
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
    Plug 'airblade/vim-rooter' " Have the file system follow you around
    Plug 'michaeljsmith/vim-indent-object' " text Objects
    Plug 'nathanaelkane/vim-indent-guides' " text Objects
    Plug 'tpope/vim-unimpaired'
    Plug 'vimwiki/vimwiki' " Note Taking
    Plug 'easymotion/vim-easymotion' " Navigation
    Plug 'godlygeek/tabular' " Alignment and formatting
    Plug 'nelstrom/vim-visual-star-search' " Enable * to search in visual mode
    Plug 'tomtom/tcomment_vim' " Code Commentting
    Plug 'suy/vim-context-commentstring' " Useful for React Commenting and lua in viml


    " Neovim Lsp
    Plug 'neovim/nvim-lspconfig' " Language Server Protocol
    Plug 'glepnir/lspsaga.nvim' "  provides nice UIs for LSP functions
    Plug 'iamcco/diagnostic-languageserver' " Language Server that integrate with linter to support diagnostic features
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips' " For ultisnips users.
    Plug 'onsails/lspkind-nvim' " adds vscode-like pictograms to neovim built-in lsp:
    Plug 'windwp/nvim-autopairs'
    Plug 'vim-airline/vim-airline' " Status Line
    Plug 'vim-airline/vim-airline-themes' " Status Line theme
    Plug 'mhinz/vim-signify' " Signify (or just Sy) uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/lsp-colors.nvim'
    Plug 'hoob3rt/lualine.nvim'
    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'fhill2/telescope-ultisnips.nvim'

    Plug 'SirVer/ultisnips' " Ultisnips snippets
    Plug 'honza/vim-snippets' " Snippets
    Plug 'mlaursen/vim-react-snippets' " Snippets
    Plug 'tpope/vim-surround' " Surround
    " Plug 'folke/which-key.nvim' " View Shortcut keys lua
    Plug 'liuchengxu/vim-which-key' " View Shortcut keys

    " Tools
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Find
    Plug 'junegunn/fzf.vim' " Fuzzy Find
    Plug 'jremmen/vim-ripgrep' " awaiting fixed version
    Plug 'voldikss/vim-floaterm' " Terminal
    Plug 'mbbill/undotree' " Undo Time Travel
    Plug 'scrooloose/nerdtree' " File Explorer SideBar
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'} " Vim Practise
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'puremourning/vimspector' " Debugger
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Turn your browser¹ into a Neovim client
    Plug 'ChristianChiarulli/far.vim' " Find and Replace
    Plug 'mhinz/vim-grepper' " Handle multi-file find and replace.

    " Languages
    " Dart
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'natebosch/dartlang-snippets'
    " Python
    " Typescript
    Plug 'lervag/vimtex' " latex development
    " Git
    Plug 'tpope/vim-fugitive' " Git
    Plug 'tpope/vim-rhubarb' " enables Gbrowse for github
    Plug 'shumphrey/fugitive-gitlab.vim' " enables Gbrowse for gitlab
    Plug 'tommcdo/vim-fubitive' " enables Gbrowse for bitbucket
    Plug 'junegunn/gv.vim' " Git Commit Browser
    Plug 'mattn/vim-gist' " Gist
    Plug 'mattn/webapi-vim' " Gist & emmet
    Plug 'rhysd/git-messenger.vim' " Git commit info popup
    Plug 'joshdick/onedark.vim' " A dark Vim/Neovim color scheme for the GUI and 16/256/true-color terminals



    " UIUX
    Plug 'psliwka/vim-smoothie' " Smooth scrolling for Vim
    Plug 'szw/vim-maximizer' " Zoom window
    Plug 'norcalli/nvim-colorizer.lua' " colorizer


call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif



    " " Deprecated
    " " Autocomplete
    " Plug 'jiangmiao/auto-pairs' " Brackets autocomplete
    " Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
    " Plug 'antoinemadec/coc-fzf'
    " Plug 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}
    " Plug 'metakirby5/codi.vim' " interactive Code
    " Plug 'mhinz/vim-startify' " Start Screen
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'tpope/vim-commentary' " Code Commentting
    " Plug 'junegunn/vim-easy-align'
    " Plug 'ianding1/leetcode.vim' " LeetCode coding practise
    " Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} " view html, js, css live
    " Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multi cursors
    " Plug 'pedrohdz/vim-yaml-folds' "simple folding configuration for YAML - slow when file gets large
    " Plug 'konfekt/fastfold'
    " Plug 'vim-utils/vim-man' "View man pages in vim. Grep for the man pages.
    " Plug 'ryanoasis/vim-devicons' "Cool icons
    " Plug 'tpope/vim-speeddating' " Change dates fast
    " Plug 'tpope/vim-eunuch' " Files
    " Plug 'tpope/vim-sleuth' " auto set indent settings
    " Plug 'sheerun/vim-polyglot' " Better Syntax Support
    " Plug 'wellle/targets.vim' " for editing paired text objects
    " Plug 'thinca/vim-qfreplace'
    " Plug 'junegunn/rainbow_parentheses.vim' " Rainbow Brackets
    " Plug 'leafgarland/typescript-vim' " syntax highlighting for typescript keywords
    " Plug 'ianks/vim-tsx' " syntax highlighting for jsx in .tsx files
    " Plug 'tpope/vim-obsession' " Save Sessions on tmux
    " Plug 'MarcWeber/vim-addon-mw-utils' " snipmate dependencies
    " Plug 'tomtom/tlib_vim' " snipmate dependencies
    " Plug 'editorconfig/editorconfig-vim' " editor-agnostic file format for defining coding styles
    " Plug 'navarasu/onedark.nvim' " A dark Neovim color scheme for the GUI and 16/256/true-color terminals
    " Plug 'AckslD/nvim-whichkey-setup.lua'
