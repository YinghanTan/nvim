-- require("config.lsp").setup()
-- require("config.cmp").setup()
-- require("config.luasnip").setup()

local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
      open_fn = function()
        return require("packer.util").float({border = "rounded"})
      end,
    }
  }
  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      })
      vim.cmd([[packadd packer.nvim]])
    end
    vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Load only when require

    use { "nvim-lua/plenary.nvim", module = "plenary" }
    use { 'nvim-lua/popup.nvim' }

    -- Notification
    use {
      "rcarriga/nvim-notify",
      event = "VimEnter",
      config = function()
        require("notify").setup({
          background_colour = "#000000",
        })
        vim.notify = require("notify")
      end,
    }

    -- Colorscheme
    use {
      "navarasu/onedark.nvim",
      config = function()
        vim.cmd("colorscheme onedark")
        require("config.one-dark").setup()
      end
    }

    -- Better Netrw
    use { "tpope/vim-vinegar" }

    -- WhichKey
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    -- IndentLine
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.indentblankline").setup()
      end,
    }

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("config.nvim-web-devicons").setup({ default = true })
      end,
    }

    if PLUGINS.telescope.enabled then
      use {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.1',
        opt = true,
        config = function()
          require("config.telescope").setup()
        end,
        cmd = { "Telescope" },
        module = "telescope",
        keys = { "<leader>f", "<leader>p" },
        wants = {
          "popup.nvim",
          "plenary.nvim",
          -- "telescope-fzf-native.nvim",
          "telescope-fzy-native.nvim",
          "telescope-project.nvim",
          "telescope-repo.nvim",
          "telescope-file-browser.nvim",
          "telescope-ui-select.nvim",
          "project.nvim",
          "telescope-bookmarks.nvim",
          "telescope-vimspector.nvim",
          "telescope-env.nvim",
          "escope-tele-tabby.nvim",
          "elescope-ultisnips.nvim",
        },
        requires = {
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim",
          -- { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
          "nvim-telescope/telescope-fzy-native.nvim",
          "nvim-telescope/telescope-project.nvim",
          "cljoly/telescope-repo.nvim",
          "nvim-telescope/telescope-file-browser.nvim",
          "nvim-telescope/telescope-ui-select.nvim",
          {
            "ahmedkhalf/project.nvim",
            config = function()
              require("config.project-nvim").setup {}
            end,
          },
          "dhruvmanila/telescope-bookmarks.nvim",
          "nvim-telescope/telescope-vimspector.nvim",
          "LinArcX/telescope-env.nvim",
          "TC72/telescope-tele-tabby.nvim",
          "fhill2/telescope-ultisnips.nvim",
        },
      }
    end


    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup({})
      end,
    }

    -- Better surround
    use { "tpope/vim-repeat" }
    use { "tpope/vim-eunuch" }
    use { "wsdjeg/vim-fetch" }
    use { "tpope/vim-abolish" }

    -- Plug 'michaeljsmith/vim-indent-object' " text Objects
    -- Plug 'nathanaelkane/vim-indent-guides' " text Objects
    use { "tpope/vim-surround", event = "InsertEnter" }
    use { "tpope/vim-unimpaired" }
    use { "vimwiki/vimwiki" }
    use { "michal-h21/vimwiki-sync" }
    use { "godlygeek/tabular" }

    -- " Plug 'monaqa/dial.nvim'  " Extended increment/decrement plugin
    -- " Plug 'kevinhwang91/nvim-bqf'  " Better quickfix window
    -- Plug 'nelstrom/vim-visual-star-search' " Enable * to search in visual mode
    -- Plug 'tomtom/tcomment_vim' " Code Commentting
    -- " Plug 'SirVer/ultisnips' " Ultisnips snippets

    -- use { "andymass/vim-matchup" }
    use { "honza/vim-snippets" }
    use { "voldikss/vim-floaterm" }
    use { "mbbill/undotree" }
    use { "mhinz/vim-grepper" }
    use { "kevinhwang91/rnvimr" }
    use { "puremourning/vimspector" }

    -- Post-install/update hook with call of vimscript function with argument
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }


    -- " Git
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-rhubarb" }
    use { "shumphrey/fugitive-gitlab.vim" }
    use { "tommcdo/vim-fubitive" }
    use { "junegunn/gv.vim" }
    use { "mattn/vim-gist" }
    use { "mattn/webapi-vim" }
    use { "rhysd/git-messenger.vim" }
    use { "ruifm/gitlinker.nvim" }
    use { "lewis6991/gitsigns.nvim" }


    use { "konfekt/fastfold" }
    -- Plug 'MarcWeber/vim-addon-mw-utils'
    -- Plug 'tomtom/tlib_vim'
    use {
      "karb94/neoscroll.nvim",
      config = function()
        require("config.neoscroll").setup()
      end,
    }
    -- Plug 'ryanoasis/vim-devicons' "Cool icons
    use { "folke/todo-comments.nvim" }
    use { "troydm/zoomwintab.vim" }

    -- " Languages
    -- Plug 'ianks/vim-tsx' " syntax highlighting for jsx in .tsx files
    -- Plug 'lervag/vimtex' " latex development
    -- Plug 'KeitaNakamura/tex-conceal.vim' " show math symbol instead of latex code
    -- Plug 'matze/vim-tex-fold'

    -- Motions
    use {
      "phaazon/hop.nvim",
      cmd = { "HopWord", "HopChar1" },
      config = function()
        require("config.hop").setup()
      end,
      disable = true
    }

    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
      ft = "markdown",
      cmd = { "MarkdownPreview" },
    }

    -- Status line
    use {
      "nvim-lualine/lualine.nvim",
      after = "nvim-treesitter",
      config = function()
        require("config.lualine").setup()
      end,
      wants = "nvim-web-devicons",
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufRead",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
    }
    -- use {'nvim-treesitter/playground'}
    -- use {'nvim-treesitter/nvim-treesitter-context'}
    -- Plug 'p00f/nvim-ts-rainbow' " Rainbow parentheses for neovim using tree-sitter
    -- Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    -- Plug 'windwp/nvim-ts-autotag'
    -- Plug 'mizlan/iswap.nvim'

    -- " Docker
    -- Plug 'jamestthompson3/nvim-remote-containers'

    -- FZF
    -- use { "junegunn/fzf", run = "./install --all", event = "VimEnter" } -- You don't need to install this if you already have fzf installed
    -- use { "junegunn/fzf.vim", event = "BufEnter" }

    -- -- FZF Lua
    -- use {
    --     "ibhagwan/fzf-lua",
    --     event = "BufEnter",
    --     wants = "nvim-web-devicons",
    -- }

    -- nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      wants = "nvim-web-devicons",
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      config = function()
        require("config.nvimtree").setup()
      end,
    }

    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      config = function()
        require("config.cmp").setup()
      end,
      wants = { "LuaSnip" },
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "quangnguyen30192/cmp-nvim-ultisnips",
        -- "hrsh7th/cmp-nvim-lsp-signature-help",
        -- "hrsh7th/cmp-calc",
        -- "f3fora/cmp-spell",
        -- "hrsh7th/cmp-emoji",
        {
          "L3MON4D3/LuaSnip",
          wants = "friendly-snippets",
          config = function()
            require("config.luasnip").setup()
          end,
        },
        "rafamadriz/friendly-snippets",
      },
      disable = false
    }

    -- Auto pairs
    use {
      "windwp/nvim-autopairs",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("config.autopairs").setup()
      end,
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      event = "BufReadPre",
      wants = {"nvim-lsp-installer", "lsp_signature.nvim", "cmp-nvim-lsp"}, -- for nvim-cmp
      config = function()
        require("config.lsp").setup()
      end,
      requires = {
        "williamboman/nvim-lsp-installer",
        "ray-x/lsp_signature.nvim",
      },
    }

    -- Bootstrap Neovim
    if packer_bootstrap then
      print("Restart Neovim required after installation!")
      require("packer").sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require("packer")
  packer.init(conf)
  packer.startup(plugins)
end

return M
