return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    -- language specific tests
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
    "lawrence-laz/neotest-zig",
    "rcasia/neotest-bash",
    "olimorris/neotest-rspec",
    "sidlatau/neotest-dart" ,
  },
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>tt"] = { "<cmd>lua require'neotest'.run.run()<cr>", "Test Nearest" },
      ["<leader>tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Test File" },
      ["<leader>td"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Test" },
      ["<leader>ts"] = { "<cmd>lua require('neotest').run.stop()<cr>", "Test Stop" },
      ["<leader>ta"] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach Test" },
    })

    ---@diagnostic disable: missing-fields
    require("neotest").setup {
      adapters = {
        require("neotest-python")({
          dap = {
            justMyCode = false,
            console = "integratedTerminal",
          },
          args = { "--log-level", "DEBUG", "--quiet" },
          runner = "pytest",
        }),
        require("neotest-vitest"),
        require("neotest-zig"),
        require("neotest-vim-test"){
          ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
        },
        require("neotest-rspec"),
        require("neotest-dart"){ command = "flutter" },
      },
    }
  end
}
