return {
  "SmiteshP/nvim-navbuddy",
  event = "VeryLazy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- local wk = require("which-key")
    -- wk.register({
    --   ["<leader><leader>n"] = { "<cmd>Navbuddy<cr>", "Nav" },
    -- })

    local navbuddy = require("nvim-navbuddy")
    -- local actions = require("nvim-navbuddy.actions")
    navbuddy.setup({
      window = {
        border = "rounded",
      },
      icons = require("yinghan.library.icons").kind,
      lsp = { auto_attach = true },
    })

    vim.keymap.set("n", "<leader><leader>n", "<cmd>Navbuddy<cr>", { noremap = true, silent = true, desc = "Nav" })
    -- vim.keymap.set("n", "<m-s>", "<cmd>silent only | Navbuddy<cr>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<m-o>", "<cmd>silent only | Navbuddy<cr>", { noremap = true, silent = true })
  end,
}
