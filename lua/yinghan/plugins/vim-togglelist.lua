return {
  "milkypostman/vim-togglelist",
  lazy = "VeryLazy",
  keys = {
    { "yoQ", "<cmd>call ToggleQuickfixList()<cr>", {desc="toggle quickfix", noremap=true } },
    { "yoL", "<cmd>call ToggleLocationList()<cr>", {desc="toggle loclist", noremap=true } },
  },
}
