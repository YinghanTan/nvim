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
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "nvim-lualine/lualine.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "lukas-reineke/indent-blankline.nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"
  use "kyazdani42/nvim-web-devicons"
  -- use "akinsho/bufferline.nvim"
  -- use "moll/vim-bbye"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters


  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
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

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "tpope/vim-fugitive"
  use "lewis6991/gitsigns.nvim" -- Git integration: signs, hunk actions, blame, etc.
  use "tpope/vim-rhubarb" -- enables Gbrowse for github
  use "shumphrey/fugitive-gitlab.vim" -- enables Gbrowse for gitlab
  use "tommcdo/vim-fubitive" -- enables Gbrowse for bitbucket

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"
  use "kevinhwang91/rnvimr" -- ranger file explorer for Neovim.

  -- Note Taking
  use "vimwiki/vimwiki" -- Note Taking
  use "michal-h21/vimwiki-sync" -- Note git sync

  -- Comment

  -- Text Edit
  use "tpope/vim-surround" -- Surround
  use "tpope/vim-unimpaired"
  use "easymotion/vim-easymotion" -- Navigation
  use "godlygeek/tabular" -- Alignment and formatting
  use "nelstrom/vim-visual-star-search" -- Enable * to search in visual mode
  use "mbbill/undotree" -- Undo Time Travel
  use "puremourning/vimspector" -- Debugger

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
