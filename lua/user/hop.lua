local M = {
  "phaazon/hop.nvim",
  event = "BufRead",
  branch = "v2",
}

function M.config()

  local wk = require("which-key")
  wk.register {
    mode = { "n", "v" },
    ["<leader>\\f"] = {  "<cmd>HopChar2<cr>", "Find" },
    ["<leader>\\w"] = {  "<cmd>HopWord<cr>", "Word" },
    ["<leader>\\l"] = {  "<cmd>HopLineStart<cr>", "Line" },
  }

  require("hop").setup({})
  -- vim.cmd('hi HopNextKey guifg=#c2c52d')
  -- vim.cmd('hi HopNextKey1 guifg=#c2c52d')
  -- vim.cmd('hi HopNextKey2 guifg=#c2c52d')
  require("hop.highlight").insert_highlights()
end

return M

-- Reference
-- https://github.com/phaazon/hop.nvim#using-vim-plug

