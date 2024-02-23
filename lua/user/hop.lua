local M = {
  "phaazon/hop.nvim",
  event = "BufRead",
  branch = "v2",
  keys = {
    { "<leader>\\f", "<cmd>HopChar2<cr>", desc = "Find" },
    { "<leader>\\w", "<cmd>HopWord<cr>", desc = "Word" },
    { "<leader>\\l", "<cmd>HopLineStart<cr>", desc = "Line" },
    { "<leader>\\f", "<cmd>HopChar2<cr>", mode = "v", desc = "Find" },
    { "<leader>\\w", "<cmd>HopWord<cr>", mode = "v", desc = "Word" },
    { "<leader>\\l", "<cmd>HopLineStart<cr>", mode = "v", desc = "Line" },
  },
}

function M.config()
  require("hop").setup({})
  -- vim.cmd('hi HopNextKey guifg=#c2c52d')
  -- vim.cmd('hi HopNextKey1 guifg=#c2c52d')
  -- vim.cmd('hi HopNextKey2 guifg=#c2c52d')
  require("hop.highlight").insert_highlights()
end

return M

-- Reference
-- https://github.com/phaazon/hop.nvim#using-vim-plug

