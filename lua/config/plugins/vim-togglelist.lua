return {
  "milkypostman/vim-togglelist",
  lazy = "VeryLazy",
  keys = {
    { "yoQ", "<cmd>call ToggleQuickfixList()<cr>", desc = " Toggle [Q]uickfix", noremap = true, mode = "n" },
    { "yoL", "<cmd>call ToggleLocationList()<cr>", desc = " Toggle [L]oclist", noremap = true, mode = "n" },
  },
}
