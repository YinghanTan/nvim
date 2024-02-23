local M = {
    "troydm/zoomwintab.vim",
    lazy = true,
    keys = {
      { "<C-w>z", "<cmd>ZoomWinTabToggle<cr>", desc = "zoom" },
    },
}

function M.config()
  vim.g.zoomwintab_hidetabbar = 0
  vim.g.zoomwintab_remap = 0
end

return M
