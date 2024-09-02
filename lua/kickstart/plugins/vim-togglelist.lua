return {
  "milkypostman/vim-togglelist",
  lazy = "VeryLazy",
  keys = {
    { "yoQ", "<cmd>call ToggleQuickfixList()<cr>", { desc = "toggle [Q]uickfix", noremap = true } },
    { "yoL", "<cmd>call ToggleLocationList()<cr>", { desc = "toggle [L]oclist", noremap = true } },
  },
}
