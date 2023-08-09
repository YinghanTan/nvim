-- Reference
-- https://github.com/phaazon/hop.nvim#using-vim-plug

return {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    branch = "v2",
    keys = {
      { "<leader>\\f", "<cmd>HopChar2<cr>", desc = "Find" },
      { "<leader>\\w", "<cmd>HopWord<cr>", desc = "Word" },
      { "<leader>\\l", "<cmd>HopLineStart<cr>", desc = "Line" },
      { "<leader>\\f", "<cmd>HopChar2<cr>", mode = "v", desc = "Find" },
      { "<leader>\\w", "<cmd>HopWord<cr>", mode = "v", desc = "Word" },
      { "<leader>\\l", "<cmd>HopLineStart<cr>", mode = "v", desc = "Line" },
    },
    config = function()
      require("hop").setup({})
    end,
  },
}
