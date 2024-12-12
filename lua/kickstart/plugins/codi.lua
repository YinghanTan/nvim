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
  keys = {
    { "<leader>co", "<cmd>Codi<cr>", desc = "Codi On" },
    { "<leader>cO", "<cmd>Codi!<cr>", desc = "Codi On" },
    { "<leader>cn", "<cmd>CodiSelect<cr>", desc = "Codi On" },
    { "<leader>ce", "<cmd>CodiExpand<cr>", desc = "Codi On" },
  }
}
