return {
  "sindrets/diffview.nvim",
  event = "VeryLazy", -- let lazy.nvim know can load later, not that important for the initial UI
  config = function()
    -- set keymaps
    vim.keymap.set("n", "<leader>gdH", "<cmd>DiffviewFileHistory<cr>", { desc = "branch diffview history" })
    vim.keymap.set("n", "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>", { desc = "file diffview history" })
  end,
}
