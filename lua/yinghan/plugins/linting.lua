return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      terraform = { "tflint" },
      lua = { "luacheck" },
      text = {'vale',},
      -- json = {'jsonlint',},
      markdown = {'vale',},
      rst = {'vale',},
      ruby = {'ruby',},
      dockerfile = {'hadolint',},
      htmldjango = {'djlint',},
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- set keymap
    vim.keymap.set("n", "<leader>ll", function() lint.try_lint() end, { desc = "Trigger linting for current file" })
  end,
}
