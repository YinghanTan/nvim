local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim"
  }
}

function M.config()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics =  null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      diagnostics.flake8,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
      formatting.fish_indent,
      diagnostics.fish,
      formatting.shfmt,
    },
  }
end

return M
