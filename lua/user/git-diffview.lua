local M = {
  "sindrets/diffview.nvim",
  lazy = false,
}

function M.config()

  local wk = require "which-key"
  wk.register {
    ["<leader>gdH"] = { "<cmd>DiffviewFileHistory<cr>", "branch diffview history" },
    ["<leader>gdh"] = { "<cmd>DiffviewFileHistory %<cr>", "file diffview history" }
  }

end

return M
