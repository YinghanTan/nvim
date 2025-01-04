return {
  "voldikss/vim-floaterm",
  config = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
  end,
  cmd = {
    "FloatermToggle",
    "FloatermNew",
  },
  keys = {
    { "<leader>tt", "<cmd>FloatermToggle<cr>", desc = "[t]erminal [t]oggle", mode = {"n", "t"} }
  }
}
