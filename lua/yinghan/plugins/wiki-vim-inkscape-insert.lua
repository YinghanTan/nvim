return {
  "Bercio/vim-inkscape-insert",
  event = "Bufenter *.md",
  -- lazy = false,
  config = function()
    vim.g.inkscape_graphs_dir = "./assets/"
  end,
}
