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

  null_ls.setup({
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,

      require("none-ls.diagnostics.flake8"),
      require("none-ls.diagnostics.eslint"),
      require("none-ls.code_actions.eslint"),
      require("none-ls.formatting.eslint"),
      require("none-ls.diagnostics.cpplint"),
      require("none-ls.formatting.jq"),

      null_ls.builtins.completion.spell,
      formatting.fish_indent,
      diagnostics.fish,
      formatting.shfmt,

      null_ls.builtins.formatting.terraform_fmt,
      null_ls.builtins.diagnostics.terraform_validate,

      null_ls.builtins.diagnostics.hadolint,

      null_ls.builtins.diagnostics.markdownlint,

    },
  })
end

return M
