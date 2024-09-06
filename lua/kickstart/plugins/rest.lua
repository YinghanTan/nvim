return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  commit = "c27a0bcb84ab5534d89065d638119ed2dbbae189",
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>\\a", "<Plug>RestNvim<CR>", desc = "api" },
    })

    require("rest-nvim").setup()
  end,
}
