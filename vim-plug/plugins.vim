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

    " Theme
    Plug 'navarasu/onedark.nvim' " Dark and Light Themes for neovim >= 0.5 based on Atom One Dark & Atom One Light theme written in lua with TreeSitter syntax highlight.
    " Plug 'joshdick/onedark.vim' " A dark Vim/Neovim color scheme for the GUI and 16/256/true-color terminals

    " Editing
    Plug 'tpope/vim-repeat' " Repeat.vim remaps . in a way that plugins can tap into it.
    Plug 'tpope/vim-eunuch' " Files
    Plug 'airblade/vim-rooter' " Have the file system follow you around
    Plug 'sheerun/vim-polyglot' " Better Syntax Support
    Plug 'wsdjeg/vim-fetch' " Fetch that line and column
    Plug 'tpope/vim-abolish' " change cases

    Plug 'michaeljsmith/vim-indent-object' " text Objects
    Plug 'nathanaelkane/vim-indent-guides' " text Objects
    Plug 'tpope/vim-unimpaired'
    Plug 'vimwiki/vimwiki' " Note Taking
    Plug 'michal-h21/vimwiki-sync' " Note git sync
    Plug 'godlygeek/tabular' " Alignment and formatting
    " Plug 'monaqa/dial.nvim'  " Extended increment/decrement plugin
    " Plug 'kevinhwang91/nvim-bqf'  " Better quickfix window

    " Navigation
    Plug 'phaazon/hop.nvim' " Navigation
    Plug 'nelstrom/vim-visual-star-search' " Enable * to search in visual mode
    Plug 'tomtom/tcomment_vim' " Code Commentting
    Plug 'suy/vim-context-commentstring' " Useful for React Commenting
    " Plug 'nacro90/numb.nvim'  " peeks lines of the buffer in non-obtrusive way.
    Plug 'andymass/vim-matchup'  " operate on sets of matching text

    " " LSP
    " Plug 'neovim/nvim-lspconfig' " enable LSP
    " Plug 'williamboman/nvim-lsp-installer' " simple to use language server Installer
    " Plug 'tamago324/nlsp-settings.nvim' " language server settings defined in json
    " Plug 'jose-elias-alvarez/null-ls.nvim' " for formatters and linters
    " Plug 'filipdutescu/renamer.nvim' " renaming UI for Neovim
    " Plug 'simrat39/symbols-outline.nvim' " tree like view for symbols using LSP
    " Plug 'ray-x/lsp_signature.nvim' " show function signature when you type
    " Plug 'b0o/SchemaStore.nvim'
    " " Completion
    " Plug 'hrsh7th/nvim-cmp' " Completion plugin
    " Plug 'hrsh7th/cmp-buffer' " Buffer completion
    " Plug 'hrsh7th/cmp-path' " Path completion
    " Plug 'hrsh7th/cmp-cmdline' " Cmdline completion
    " Plug 'hrsh7th/cmp-nvim-lsp' " LSP Completion
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips' " Completion Ultisnips Support

    " COC
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
    Plug 'antoinemadec/coc-fzf'


    " Dart/Flutter
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'thosakwe/vim-flutter'

    " Snippets
    Plug 'SirVer/ultisnips' " Ultisnips snippets
    Plug 'natebosch/dartlang-snippets'
    Plug 'honza/vim-snippets' " Snippets
    Plug 'mlaursen/vim-react-snippets' " Snippets
    Plug 'jiangmiao/auto-pairs' " Brackets autocomplete
    Plug 'tpope/vim-surround' " Surround



    " Tools
    " Plug 'liuchengxu/vim-which-key' " View Shortcut keys
    Plug 'folke/which-key.nvim' " View Shortcut keys
    Plug 'voldikss/vim-floaterm' " Terminal
    Plug 'mbbill/undotree' " Undo Time Travel
    Plug 'ChristianChiarulli/far.vim' " Find and Replace
    Plug 'mhinz/vim-grepper' " Handle multi-file find and replace.
    Plug 'scrooloose/nerdtree' " File Explorer SideBar
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " Preview Markdown
    Plug 'puremourning/vimspector' " Debugger
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Turn your browser¹ into a Neovim client
    " Plug 'metakirby5/codi.vim'


    " Search (FZF)
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Find
    Plug 'junegunn/fzf.vim' " Fuzzy Find
    Plug 'jremmen/vim-ripgrep' " awaiting fixed version

    " Search (Telescope)
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-telescope/telescope-ui-select.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'dhruvmanila/telescope-bookmarks.nvim'
    Plug 'nvim-telescope/telescope-vimspector.nvim'
    Plug 'LinArcX/telescope-env.nvim'
    Plug 'TC72/telescope-tele-tabby.nvim'
    Plug 'nvim-telescope/telescope-vimspector.nvim'
    Plug 'fhill2/telescope-ultisnips.nvim'

    " Languages
    Plug 'ianks/vim-tsx' " syntax highlighting for jsx in .tsx files
    Plug 'lervag/vimtex' " latex development
    Plug 'KeitaNakamura/tex-conceal.vim' " show math symbol instead of latex code
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
    Plug 'ruifm/gitlinker.nvim' " generate shareable file permalinks
    Plug 'ThePrimeagen/git-worktree.nvim'
    " use("lewis6991/gitsigns.nvim") " Git integration: signs, hunk actions, blame, etc.

    Plug 'konfekt/fastfold'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'



    Plug 'karb94/neoscroll.nvim' " Smooth scrolling

    Plug 'nvim-tree/nvim-web-devicons' 
    Plug 'ryanoasis/vim-devicons' "Cool icons

    Plug 'norcalli/nvim-colorizer.lua' " colorizer
    
    Plug 'nvim-lualine/lualine.nvim' " A blazing fast and easy to configure Neovim statusline written in Lua.
    " Plug 'vim-airline/vim-airline' " Status Line
    " Plug 'vim-airline/vim-airline-themes' " Status Line theme
    " Plug 'junegunn/rainbow_parentheses.vim' " Rainbow Brackets
    Plug 'folke/todo-comments.nvim' " highlight the different todo comments
    " Plug 'dhruvasagar/vim-zoom' " Zoom Window
    " Plug 'nyngwang/NeoZoom.lua' " Zoom Window
    Plug 'troydm/zoomwintab.vim' " Zoom Window

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'romgrk/nvim-treesitter-context'
    Plug 'p00f/nvim-ts-rainbow' " Rainbow parentheses for neovim using tree-sitter
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'mizlan/iswap.nvim'

    " Docker
    Plug 'jamestthompson3/nvim-remote-containers'

    "sindrets/diffview.nvim",
    "folke/trouble.nvim",
    "dccsillag/magma-nvim",
    "simrat39/symbols-outline.nvim",
    "f-person/git-blame.nvim",
    "https://github.com/MattesGroeger/vim-bookmarks"
    " 'tom-anders/telescope-vim-bookmarks.nvim'
    "gelguy/wilder.nvim",


    " Deprecated
    " Plug 'easymotion/vim-easymotion' " Navigation
    " Plug 'psliwka/vim-smoothie' " Smooth scrolling for Vim
    " Plug 'szw/vim-maximizer' " Zoom window
    " Plug 'nyngwang/NeoZoom.lua' " Zoom Window
    " Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    " Plug 'Mofiqul/dracula.nvim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

