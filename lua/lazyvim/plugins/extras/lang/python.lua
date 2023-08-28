return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ruff_lsp = {},
      },
    },
    setup = {
      ruff_lsp = function()
        require("lazyvim.util").on_attach(function(client, _)
          if client.name == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end)
      end,
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },


  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = { "nvim-neotest/neotest-python" },
  --   opts = function(_, opts)
  --     table.insert(
  --       opts.adapters,
  --       require("neotest-python")({
  --         -- Extra arguments for nvim-dap configuration
  --         -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
  --         dap = { justMyCode = false },
  --         -- Command line arguments for runner
  --         -- Can also be a function to return dynamic values
  --         args = { "--log-level", "DEBUG" },
  --         -- Runner to use. Will use pytest if available by default.
  --         -- Can be a function to return dynamic value.
  --         runner = "pytest",
  --         -- Custom python path for the runner.
  --         -- Can be a string or a list of strings.
  --         -- Can also be a function to return dynamic value.
  --         -- If not provided, the path will be inferred by checking for
  --         -- virtual envs in the local directory and for Pipenev/Poetry configs
  --         python = ".venv/bin/python",
  --         -- Returns if a given file path is a test file.
  --         -- NB: This function is called a lot so don't perform any heavy tasks within it.
  --         is_test_file = function(file_path) end,
  --       })
  --     )
  --   end,
  -- },


  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class" },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {},
    keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
