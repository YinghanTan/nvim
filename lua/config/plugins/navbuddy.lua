return {
  "SmiteshP/nvim-navbuddy",
  branch = "master",
  commit = "f137a3466a6cd1965cdcc5398daff54e66eebbe5",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader><leader>n", "<cmd>Navbuddy<cr>", desc = "󱣱 [n]avbuddy" },
  },
  config = function()
    require("nvim-navbuddy").setup({
      window = {
        border = "rounded",
      },
      lsp = {
        auto_attach = true,
        preference = nil,
      },
    })

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap

    -- keymap("n", "<m-s>", ":silent only | Navbuddy<cr>", opts)
    -- keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts)
  end,
}
