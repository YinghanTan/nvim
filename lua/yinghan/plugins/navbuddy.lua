return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  -- keys = {
  --   { "<leader><leader>n", "<cmd>Navbuddy<cr>", mode = { "n" }, desc = "nav buddy" },
  -- },
  config = function()

    local navbuddy = require "nvim-navbuddy"
    -- local actions = require("nvim-navbuddy.actions")
    navbuddy.setup({
      window = {
        border = "rounded",
      },
      icons = require("yinghan.library.icons").kind,
      lsp = { auto_attach = false },
    })
    vim.keymap.set("n", "<leader><leader>n", "<cmd>Navbuddy<cr>", { noremap = true, silent = true, desc = "Nav" })
  end,
}




-- vim.keymap.set("n", "<leader><leader>n", "<cmd>Navbuddy<cr>", { noremap = true, silent = true, desc = "Nav" })
