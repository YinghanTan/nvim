return {
  "troydm/zoomwintab.vim",
  lazy = true,
  keys = {
    { "<C-w>z", "<cmd>ZoomWinTabToggle<cr>", desc = "zoom" },
  },
  config = function()
    vim.g.zoomwintab_hidetabbar = 0
    vim.g.zoomwintab_remap = 0
  end,
}
