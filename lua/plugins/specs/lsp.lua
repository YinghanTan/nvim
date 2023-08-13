return not dots.LSP.enabled and {}
  or {
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
        { "folke/neodev.nvim", opts = {} },
        { "williamboman/mason.nvim", opts = true },
        "williamboman/mason-lspconfig.nvim",
        {
          "hrsh7th/cmp-nvim-lsp",
          cond = function()
            return require("core.utils.lazyvim").has("nvim-cmp")
          end,
        },
      },

      opts = {
        -- options for vim.diagnostic.config()
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
            -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
            -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
            -- prefix = "icons",
          },
          severity_sort = true,
        },
        -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the inlay hints.
        inlay_hints = {
          enabled = false,
        },
        -- add any global capabilities here
        capabilities = {},
        -- Automatically format on save
        autoformat = false,
        -- Enable this to show formatters used in a notification
        -- Useful for debugging formatter issues
        format_notify = false,
        -- options for vim.lsp.buf.format
        -- `bufnr` and `filter` is handled by the LazyVim formatter,
        -- but can be also overridden when specified
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },

        -- LSP Server Settings
        servers_to_not_setup = dots.LSP.config.opts.servers_to_not_setup or {},
        servers = dots.LSP.config.opts.servers or {},
        setup = dots.LSP.config.opts.setup or {},
      },
      config = function(_, opts)
        require("plugins.configs.lsp.config")(opts)
        -- local Util = require("util")
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {},
      },
      event = "VeryLazy",
      config = function(_, opts)
        require("plugins.configs.lsp.null")(opts)
      end,
      dependencies = "nvim-lua/plenary.nvim",
    },
  }
