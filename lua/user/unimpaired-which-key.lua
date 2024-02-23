local M = {
  "afreakk/unimpaired-which-key.nvim",
  lazy = false, -- make sure we load this during startup
  dependencies = { "tummetott/unimpaired.nvim" }
}

function M.config()
  local wk = require("which-key")
  local uwk = require("unimpaired-which-key")
  wk.register(uwk.normal_mode)
  wk.register(uwk.normal_and_visual_mode, { mode = { "n", "v" } })
end

return M
