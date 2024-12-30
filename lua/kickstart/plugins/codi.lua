return {
  "metakirby5/codi.vim",
  priority = 1000,
  lazy = true,
  opts = {
  },
  cmd = {
    "Codi",
    "CodiExpand",
  },
  config = function()
  end,
  keys = {
    { "<leader>co", "<cmd>Codi<cr>", desc = "[c]odi [o]n" },
    { "<leader>cO", "<cmd>Codi!<cr>", desc = "[c]odi [O]ff" },
    { "<leader>cs", "<cmd>CodiSelect<cr>", desc = "[c]odi [s]elect" },
    { "<leader>ce", "<cmd>CodiExpand<cr>", desc = "[c]odi [e]xpand" },
  }
}
