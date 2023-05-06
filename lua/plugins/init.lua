return {
    "folke/which-key.nvim",
    "nvim-lua/popup.nvim",
    { "nvim-lua/plenary.nvim", cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },

    -- Theme

    "navarasu/onedark.nvim",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
   {'nvim-tree/nvim-tree.lua', dependencies = {'nvim-tree/nvim-web-devicons'}},
    "ahmedkhalf/project.nvim",


    -- Editing
    "tpope/vim-repeat",
    "tpope/vim-eunuch",
    "sheerun/vim-polyglot",
    "wsdjeg/vim-fetch",
    "tpope/vim-abolish",
    "michaeljsmith/vim-indent-object",
    "nathanaelkane/vim-indent-guides",
    "tpope/vim-unimpaired",
    "vimwiki/vimwiki",
    "michal-h21/vimwiki-sync",
    "godlygeek/tabular",
    "MarcWeber/vim-addon-mw-utils",

    -- Navigation
    "phaazon/hop.nvim",
    "nelstrom/vim-visual-star-search",
    "tpope/vim-commentary",
    "suy/vim-context-commentstring",
    "andymass/vim-matchup",

    -- LSP 2.0
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "ray-x/lsp_signature.nvim",
    {
        "folke/neodev.nvim",
        lazy = true,
    },
    "RRethy/vim-illuminate",
    { "jose-elias-alvarez/null-ls.nvim", lazy = true },
    "b0o/SchemaStore.nvim",

    -- Completion 2.0
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    { "hrsh7th/cmp-nvim-lsp", lazy = true },
    { "hrsh7th/cmp-buffer", lazy = true },
    { "hrsh7th/cmp-path", lazy = true },

    "ray-x/cmp-treesitter",
    "petertriho/cmp-git",
    "quangnguyen30192/cmp-nvim-ultisnips",

    -- -- COC
    -- "neoclide/coc.nvim",
    -- "antoinemadec/coc-fzf",

    -- Snippets
    "SirVer/ultisnips",
    "honza/vim-snippets",
    "mlaursen/vim-react-snippets",
    "tpope/vim-surround",

    -- Tools
    "folke/which-key.nvim",
    "voldikss/vim-floaterm",
    "mbbill/undotree",
    "mhinz/vim-grepper",
    "kevinhwang91/rnvimr",
    "iamcco/markdown-preview.nvim",
    "glacambre/firenvim",
    "jpalardy/vim-slime",
    "MunifTanjim/nui.nvim",
    "Bryley/neoai.nvim",
    "dstein64/vim-startuptime",
    "kevinhwang91/nvim-ufo",
    -- kevinhwang91/promise-async

    -- Debugger
    "puremourning/vimspector",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",

    -- search
    "ibhagwan/fzf-lua",
    "nvim-telescope/telescope.nvim",
    "fannheyward/telescope-coc.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "dhruvmanila/telescope-bookmarks.nvim",
    "nvim-telescope/telescope-vimspector.nvim",
    "cljoly/telescope-repo.nvim",
    "AckslD/nvim-neoclip.lua",
    "nvim-telescope/telescope-project.nvim",
    "LinArcX/telescope-command-palette.nvim",
    "TC72/telescope-tele-tabby.nvim",
    "nvim-telescope/telescope-dap.nvim",


    -- Git
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "shumphrey/fugitive-gitlab.vim",
    "tommcdo/vim-fubitive",
    "junegunn/gv.vim",
    "ruifm/gitlinker.nvim",
    "lewis6991/gitsigns.nvim",
    "tomtom/tlib_vim",

    -- UI improvements
    "karb94/neoscroll.nvim",
    "ryanoasis/vim-devicons",
    "norcalli/nvim-colorizer.lua",
    "folke/todo-comments.nvim",
    "troydm/zoomwintab.vim",

    -- Treesitter
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    "nvim-treesitter/playground",
    "romgrk/nvim-treesitter-context",
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
    "windwp/nvim-autopairs",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "mizlan/iswap.nvim",

    -- Docker
    "jamestthompson3/nvim-remote-containers",

}
