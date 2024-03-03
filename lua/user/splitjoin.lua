local M = {
  "AndrewRadev/splitjoin.vim",
  lazy = false
}

function M.init()
  local wk = require("which-key")
  wk.register {
    mode = { "n", "v" },
    ["gS"] = { desc = "split" },
    ["gJ"] = { desc = "join" },
  }
end

return M
