return {
  "afreakk/unimpaired-which-key.nvim",
  dependencies = { "tummetott/unimpaired.nvim" },
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.add(require("unimpaired-which-key"))
  end,
}
