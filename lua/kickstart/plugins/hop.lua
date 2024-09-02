return {
  "phaazon/hop.nvim",
  event = "BufRead",
  branch = "v2",
  config = function()
    -- set keymaps
    vim.keymap.set({ "n", "v" }, "<leader><leader>f", "<cmd>HopChar2<cr>", { desc = "hop [f]ind" })
    vim.keymap.set({ "n", "v" }, "<leader><leader>w", "<cmd>HopWord<cr>", { desc = "hop [w]ord" })
    vim.keymap.set({ "n", "v" }, "<leader><leader>l", "<cmd>HopLineStart<cr>", { desc = "hop [l]ine" })

    require("hop").setup({})
    require("hop.highlight").insert_highlights()
  end,
}
