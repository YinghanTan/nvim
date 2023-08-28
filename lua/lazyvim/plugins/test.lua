return {
  {
    "nvim-neotest/neotest",
    dependencies = { "haydenmeade/neotest-jest", "marilari88/neotest-vitest" },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-plenary" },
    opts = function(_, opts)
      table.insert(opts.adapters, require("neotest-plenary"))
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = { "sidlatau/neotest-dart" },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-dart")({
          command = "flutter", -- Command being used to run tests. Defaults to `flutter`
          -- Change it to `fvm flutter` if using FVM
          -- change it to `dart` for Dart only tests
          use_lsp = true, -- When set Flutter outline information is used when constructing test name.
          -- Useful when using custom test names with @isTest annotation
          custom_test_method_names = {},
        })
      )
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-vim-test" },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-vim-test")({ ignore_filetypes = { "python", "lua" } })
      )
    end,
  },
}
