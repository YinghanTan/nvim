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
    Plug 'nvim-lualine/lualine.nvim' "A blazing fast and easy to configure Neovim statusline written in Lua.
    Plug 'nvim-tree/nvim-web-devicons' " A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
    Plug 'nvim-tree/nvim-tree.lua' "A File Explorer For Neovim Written In Lua
    Plug 'ahmedkhalf/project.nvim' " project.nvim is an all in one neovim plugin written in lua that provides superior project management.

    " Editing
    Plug 'tpope/vim-repeat' " Repeat.vim remaps . in a way that plugins can tap into it.
    Plug 'tpope/vim-eunuch' " Files
    Plug 'sheerun/vim-polyglot' " Better Syntax Support
    Plug 'wsdjeg/vim-fetch' " Fetch that line and column
    Plug 'tpope/vim-abolish' " change cases

    Plug 'michaeljsmith/vim-indent-object' " text Objects
    Plug 'nathanaelkane/vim-indent-guides' " text Objects
    Plug 'tpope/vim-unimpaired'
    Plug 'vimwiki/vimwiki' " Note Taking
    Plug 'michal-h21/vim-zettel'
    Plug 'michal-h21/vimwiki-sync' " Note git sync
    Plug 'godlygeek/tabular' " Alignment and formatting
    " Plug 'monaqa/dial.nvim'  " Extended increment/decrement plugin
    " Plug 'kevinhwang91/nvim-bqf'  " Better quickfix window

    " Navigation
    Plug 'phaazon/hop.nvim' " Navigation
    Plug 'nelstrom/vim-visual-star-search' " Enable * to search in visual mode
    Plug 'tpope/vim-commentary' " Code Commenting
    Plug 'suy/vim-context-commentstring' " Useful for React Commenting
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

    " " LSP 2.0
    " Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' } " :MasonUpdate updates registry contents
    " Plug 'williamboman/mason-lspconfig.nvim' " mason-lspconfig.nvim closes some gaps that exist between mason.nvim and lspconfig
    " Plug 'neovim/nvim-lspconfig' " enable LSP
    " Plug 'ray-x/lsp_signature.nvim' " show function signature when you type
    " Plug 'folke/neodev.nvim' " Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    " Plug 'RRethy/vim-illuminate' " Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
    " Plug 'jose-elias-alvarez/null-ls.nvim' " for formatters and linters
    " Plug 'b0o/SchemaStore.nvim' " A Neovim Lua plugin providing access to the SchemaStore catalog.

    " " Completion 2.0
    " Plug 'hrsh7th/nvim-cmp' " Completion plugin
    " Plug 'hrsh7th/cmp-nvim-lsp' " LSP Completion
    " Plug 'hrsh7th/cmp-buffer' " Buffer completion
    " Plug 'hrsh7th/cmp-path' " Path completion
    " Plug 'hrsh7th/cmp-cmdline' " Cmdline completion
    " Plug 'hrsh7th/cmp-nvim-lua'
    " Plug 'ray-x/cmp-treesitter'
    " Plug 'petertriho/cmp-git' " git completion
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips' " Completion Ultisnips Support

    " COC
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
    Plug 'antoinemadec/coc-fzf'

    " Snippets
    Plug 'SirVer/ultisnips' " Ultisnips snippets
    Plug 'honza/vim-snippets' " Snippets
    Plug 'mlaursen/vim-react-snippets' " Snippets
    Plug 'tpope/vim-surround' " Surround

    " Tools
    Plug 'folke/which-key.nvim' " View Shortcut keys
    Plug 'voldikss/vim-floaterm' " Terminal
    Plug 'mbbill/undotree' " Undo Time Travel
    Plug 'mhinz/vim-grepper' " Handle multi-file find and replace.
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " Preview Markdown
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Turn your browser¹ into a Neovim client
    Plug 'jpalardy/vim-slime' " Grab some text and send it to a target, most probably: GNU Screen, tmux or Vim Terminal.
    Plug 'MunifTanjim/nui.nvim' " UI Component Library for Neovim.
    " Plug 'jackMort/ChatGPT.nvim' " ChatGPT is a Neovim plugin that allows you to interact with OpenAI's GPT-3 language model.
    Plug 'Bryley/neoai.nvim' " NeoAI is a Neovim plugin that brings the power of OpenAI's GPT-4 directly to your editor.
    Plug 'dstein64/vim-startuptime'

    " Debugger
    Plug 'puremourning/vimspector' " Debugger
    Plug 'mfussenegger/nvim-dap' " nvim-dap is a Debug Adapter Protocol client implementation for Neovim.
    Plug 'rcarriga/nvim-dap-ui' " A UI for nvim-dap which provides a good out of the box configuration.
    Plug 'theHamsta/nvim-dap-virtual-text' " This plugin adds virtual text support to nvim-dap. nvim-treesitter is used to find variable definitions.
    " Plug 'Pocco81/dap-buddy.nvim' " Dap Buddy allows you to manage debuggers provided by nvim-dap. It should ease out the process of installing, configuring and interacting with said debuggers.
    " Plug 'nvim-telescope/telescope-dap.nvim' " Integration for nvim-dap with telescope.nvim.

    " Search (FZF)
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Find
    Plug 'junegunn/fzf.vim' " Fuzzy Find
    Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
    Plug 'jremmen/vim-ripgrep' " awaiting fixed version
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

    " Search (Telescope)
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
    Plug 'fannheyward/telescope-coc.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-ui-select.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'dhruvmanila/telescope-bookmarks.nvim', { 'tag': '*' }
    Plug 'nvim-telescope/telescope-vimspector.nvim'
    Plug 'cljoly/telescope-repo.nvim'
    Plug 'AckslD/nvim-neoclip.lua'
    Plug 'nvim-telescope/telescope-project.nvim' " An extension for telescope.nvim that allows you to switch between projects.
    Plug 'LinArcX/telescope-command-palette.nvim' " a neovim plugin written entirely in lua that will help you to access your custom commands/function/key-bindings.
    Plug 'TC72/telescope-tele-tabby.nvim'

    Plug 'nvim-telescope/telescope-vimspector.nvim'
    Plug 'fhill2/telescope-ultisnips.nvim' " Integration for ultisnips.nvim with telescope.nvim.
    Plug 'debugloop/telescope-undo.nvim' " Visualize your undo tree and fuzzy-search changes in it.
    Plug 'ANGkeith/telescope-terraform-doc.nvim' " provides its users with ability to search and browse terraform providers docs.
    Plug 'aaronhallaert/advanced-git-search.nvim'

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
    Plug 'mattn/webapi-vim' " Gist
    Plug 'ruifm/gitlinker.nvim' " generate shareable file permalinks
    Plug 'ThePrimeagen/git-worktree.nvim'
    Plug 'lewis6991/gitsigns.nvim' " Git integration: signs, hunk actions, blame, etc.

    " Plug 'konfekt/fastfold'
    Plug 'kevinhwang91/nvim-ufo'
    Plug 'kevinhwang91/promise-async'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'



    Plug 'karb94/neoscroll.nvim' " Smooth scrolling
    Plug 'ryanoasis/vim-devicons' "Cool icons
    Plug 'norcalli/nvim-colorizer.lua' " colorizer
    " Plug 'junegunn/rainbow_parentheses.vim' " Rainbow Brackets
    Plug 'folke/todo-comments.nvim' " highlight the different todo comments
    Plug 'troydm/zoomwintab.vim' " Zoom Window

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'romgrk/nvim-treesitter-context'
    Plug 'p00f/nvim-ts-rainbow' " Rainbow parentheses for neovim using tree-sitter
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'windwp/nvim-autopairs'
    " Plug 'jiangmiao/auto-pairs' " Brackets autocomplete
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'mizlan/iswap.nvim'

    " Docker
    Plug 'jamestthompson3/nvim-remote-containers'

    "sindrets/diffview.nvim",
    "folke/trouble.nvim",
    "dccsillag/magma-nvim",
    "simrat39/symbols-outline.nvim",
    " 'tom-anders/telescope-vim-bookmarks.nvim'
    "gelguy/wilder.nvim",


    " Deprecated
    " Plug 'easymotion/vim-easymotion' " Navigation
    " Plug 'psliwka/vim-smoothie' " Smooth scrolling for Vim
    " Plug 'vim-airline/vim-airline' " Status Line
    " Plug 'vim-airline/vim-airline-themes' " Status Line theme
    " Plug 'scrooloose/nerdtree' " File Explorer SideBar
    " Plug 'airblade/vim-rooter' " Have the file system follow you around
    " Plug 'liuchengxu/vim-which-key' " View Shortcut keys

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

