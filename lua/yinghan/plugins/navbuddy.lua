return {
  "SmiteshP/nvim-navbuddy",
  branch = "master",
  commit = "f137a3466a6cd1965cdcc5398daff54e66eebbe5",
  dependencies = {
    -- {
    --   "neovim/nvim-lspconfig",
    --   commit = "d5b6d4366dfd7a1071b930defd365e6d0be258de"
    -- },
    {
      "SmiteshP/nvim-navic",
      commit = "8649f694d3e76ee10c19255dece6411c29206a54"
    },
    {
      "MunifTanjim/nui.nvim",
      commit = "c3c7fd618dcb5a89e443a2e1033e7d11fdb0596b"
    },
  },
  config = function()
    local wk = require("which-key")
    wk.register {
      ["<leader><leader>n"] = { "<cmd>Navbuddy<cr>", "Nav" },
    }

    local navbuddy = require "nvim-navbuddy"
    -- local actions = require("nvim-navbuddy.actions")
    navbuddy.setup({})

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    keymap("n", "<m-s>", ":silent only | Navbuddy<cr>", opts)
    keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts)
  end,
}
