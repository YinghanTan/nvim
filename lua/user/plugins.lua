local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "nvim-lualine/lualine.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"
  use "kyazdani42/nvim-web-devicons"
  -- use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"


  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions
  use "hrsh7th/cmp-emoji" -- emoji completions
  use "hrsh7th/cmp-nvim-lua" -- lua completions
  use "David-Kunz/cmp-npm" -- npm completions

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim" -- renaming UI for Neovim
  use "simrat39/symbols-outline.nvim" -- tree like view for symbols using LSP
  use "ray-x/lsp_signature.nvim" -- show function signature when you type

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Treesitter
  -- use {
  --   "nvim-treesitter/nvim-treesitter",
  --   run = ":TSUpdate",
  -- }
  use "nvim-treesitter/nvim-treesitter"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- Comment
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- Git
  use "lewis6991/gitsigns.nvim" -- Git integration: signs, hunk actions, blame, etc.
  use "f-person/git-blame.nvim"-- A git blame plugin for neovim
  use "ruifm/gitlinker.nvim" -- generate shareable file permalinks
  use 'mattn/vim-gist' -- Gist
  use 'mattn/webapi-vim' -- Gist


  -- File Explorer
  use "kyazdani42/nvim-tree.lua" -- File Explorer

  
  -- Text Edit
  use "Shatur/neovim-session-manager"
  use "kevinhwang91/nvim-bqf" -- Better quickfix window
  use "MattesGroeger/vim-bookmarks" -- allows toggling bookmarks per line
  use "monaqa/dial.nvim" -- Extended increment/decrement plugin
  use "nacro90/numb.nvim" -- peeks lines of the buffer in non-obtrusive way.
  use "andymass/vim-matchup" -- operate on sets of matching text
  use "phaazon/hop.nvim" -- Easymotion Replacement
  use "windwp/nvim-spectre" -- A search panel for neovim.
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }
  use "folke/todo-comments.nvim"
  use "tversteeg/registers.nvim" -- Show register contents
  use { "nyngwang/NeoZoom.lua", } -- Zoom window
  use 'norcalli/nvim-colorizer.lua' -- colorizer
  use "karb94/neoscroll.nvim" -- Smooth scrolling for vim

  -- Vimscript plugins
  use 'tpope/vim-repeat' -- Repeat.vim remaps . in a way that plugins can tap into it.
  use 'tpope/vim-eunuch' -- Files
  use 'michaeljsmith/vim-indent-object' -- text Objects
  use 'nathanaelkane/vim-indent-guides' -- text Objects
  use "tpope/vim-unimpaired" -- common mappings for toggling optons
  -- Note Taking
  use "vimwiki/vimwiki" -- Note Taking
  use "michal-h21/vimwiki-sync" -- Note git sync
  use 'godlygeek/tabular' -- Alignment and formatting
  use "tpope/vim-surround" -- Surround
  use "kevinhwang91/rnvimr" -- ranger file explorer for Neovim.
  -- Git
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb" -- enables Gbrowse for github
  use "shumphrey/fugitive-gitlab.vim" -- enables Gbrowse for gitlab
  use "tommcdo/vim-fubitive" -- enables Gbrowse for bitbucket
  use 'junegunn/gv.vim' -- Git Commit Browser
  use 'rhysd/git-messenger.vim' -- Popup Git messages

  use "mbbill/undotree" -- Undo Time Travel
  use "puremourning/vimspector" -- Debugger
  use 'metakirby5/codi.vim'
  use { -- Turn your browser¹ into a Neovim client
      'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end
  }
  use 'lervag/vimtex' -- latex development
  use 'matze/vim-tex-fold'

  -- Plug 'honza/vim-snippets' " Snippets
  -- Plug 'mlaursen/vim-react-snippets' " Snippets
  -- Plug 'dart-lang/dart-vim-plugin'
  -- Plug 'natebosch/dartlang-snippets'
  -- use 'rhysd/git-messenger.vim' " Popup Git messages

  -- Deprecated

  -- use "easymotion/vim-easymotion" -- Navigation
  --  use 'psliwka/vim-smoothie' -- Smooth scrolling for Vim
  -- use 'szw/vim-maximizer' -- Zoom window
  -- use "nelstrom/vim-visual-star-search" -- Enable * to search in visual mode

  -- use "rcarriga/nvim-notify" -- configurable notification manager for NeoVim
  -- use "unblevable/quick-scope" -- Preview f,t navigation
  -- use "blackCauldron7/surround.nvim" -- Surround

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


-- Packer --
-- :PackerUpdate
-- :PackerSync
-- :PackerStatus
