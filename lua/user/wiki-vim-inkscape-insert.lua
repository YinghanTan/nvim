local M = {
  "Bercio/vim-inkscape-insert",
  event = "Bufenter *.md"
  -- lazy = false,
}

function M.config()
  vim.g.inkscape_graphs_dir = "./assets/"
end

return M
