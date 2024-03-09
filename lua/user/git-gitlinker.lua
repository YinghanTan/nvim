local M = {
  "linrongbin16/gitlinker.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = "VeryLazy",
}

function M.config()

  local wk = require "which-key"
  wk.register {
    ["<leader>ggy"] = { "<cmd>GitLink!<cr>", "Git link" },
    ["<leader>ggY"] = { "<cmd>GitLink! blame<cr>", "Git link blame" },
  }

  require("gitlinker").setup {
    message = false,
    console_log = false,
  }
end

return M
