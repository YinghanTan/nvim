return {
  "phaazon/hop.nvim",
  event = "BufRead",
  branch = "v2",
  config = function()

    -- set keymaps
    vim.keymap.set({ "n", "v" }, "<leader><leader>f", "<cmd>HopChar2<cr>", { desc = "hop find" })
    vim.keymap.set({ "n", "v" }, "<leader><leader>w", "<cmd>HopWord<cr>", { desc = "hop word" })
    vim.keymap.set({ "n", "v" }, "<leader><leader>l", "<cmd>HopLineStart<cr>", { desc = "hop line" })

    require("hop").setup({})
    require("hop.highlight").insert_highlights()
  end,
}
