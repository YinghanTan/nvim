return {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",

    -- Theme


    -- Editing
    {"tpope/vim-repeat", lazy = false},
    {"tpope/vim-eunuch", lazy = false},
    {"sheerun/vim-polyglot", lazy = false},
    {"wsdjeg/vim-fetch", lazy = false},
    {"tpope/vim-abolish", lazy = false},
    {"michaeljsmith/vim-indent-object", lazy = false},
    {"nathanaelkane/vim-indent-guides", lazy = false},
    {"tpope/vim-unimpaired", lazy = false},
    {"vimwiki/vimwiki", lazy = false},
    {"michal-h21/vimwiki-sync", lazy = false},
    {"godlygeek/tabular", lazy = false},
    {"MarcWeber/vim-addon-mw-utils", lazy = false},

    -- Navigation
    {
        "phaazon/hop.nvim",
        event = "BufReadPre", 
        config = function()
            require("hop").setup({})
        end
    },
    {"nelstrom/vim-visual-star-search", lazy = false},
    {"tpope/vim-commentary", lazy = false},
    {"suy/vim-context-commentstring", lazy = false},
    {
        "andymass/vim-matchup",
        event = { "BufReadPost" },
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = nil }
            vim.g.matchup_matchpref = { html = { nolists = 1 } }
            -- vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },

    -- LSP 2.0
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "ray-x/lsp_signature.nvim",
    {
        "folke/neodev.nvim",
        lazy = true,
    },
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
    {"SirVer/ultisnips", lazy = false},
    {"honza/vim-snippets", lazy = false},
    {"mlaursen/vim-react-snippets", lazy = false},
    { "tpope/vim-surround", event = "BufReadPre" },

    -- Tools
    {"voldikss/vim-floaterm", lazy = false},
    {"mbbill/undotree", lazy = false},
    {"mhinz/vim-grepper", lazy = false},
    {"kevinhwang91/rnvimr", lazy = false},
    {"iamcco/markdown-preview.nvim", lazy = false},
    {"glacambre/firenvim", lazy = false},
    {"jpalardy/vim-slime", lazy = false},
    "MunifTanjim/nui.nvim",
    "Bryley/neoai.nvim",
    {"dstein64/vim-startuptime", lazy = false},
    "kevinhwang91/nvim-ufo",
    -- kevinhwang91/promise-async

    -- Debugger
    {"puremourning/vimspector", lazy = false},
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",

    -- search
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
    {"tpope/vim-fugitive", lazy = false},
    {"tpope/vim-rhubarb", lazy = false},
    {"shumphrey/fugitive-gitlab.vim", lazy = false},
    {"tommcdo/vim-fubitive", lazy = false},
    {"junegunn/gv.vim", lazy = false},
    {"ruifm/gitlinker.nvim", lazy = false},
    {"tomtom/tlib_vim", lazy = false},

    -- UI improvements
    "karb94/neoscroll.nvim",
    {"ryanoasis/vim-devicons", lazy = false},
    "norcalli/nvim-colorizer.lua",
    "folke/todo-comments.nvim",
    {"troydm/zoomwintab.vim", lazy = false},

    -- Treesitter
    "p00f/nvim-ts-rainbow",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            local npairs = require "nvim-autopairs"
            npairs.setup {
                check_ts = true,
            }
        end,
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "mizlan/iswap.nvim",

    -- Docker
    "jamestthompson3/nvim-remote-containers",

}
