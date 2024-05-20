return {
  "linrongbin16/gitlinker.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = "VeryLazy",
  config = function()

    -- set keymaps
    vim.keymap.set("n", "<leader>ggy", "<cmd>GitLink!<cr>", { desc = "Git link"})
    vim.keymap.set("n", "<leader>ggY", "<cmd>GitLink! blame<cr>", { desc = "Git link blame"})

    require("gitlinker").setup({
      message = false,
      console_log = false,
    })
  end,
}
