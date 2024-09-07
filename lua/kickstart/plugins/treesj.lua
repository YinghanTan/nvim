return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  init = function()
    local wk = require("which-key")
    wk.add({
      mode = { "n", "v" },
      { "<leader>\\j", "<cmd>TSJToggle<cr>", desc = "toggle [j]oin" },
    })
  end,
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      max_join_length = 180,
    })
  end,
}
