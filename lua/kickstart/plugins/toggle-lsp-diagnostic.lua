return {
  "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
  event = "VeryLazy",
  config = function()
    require("toggle_lsp_diagnostics").init({ start_on = true })

    -- set keymap
    vim.keymap.set("n", "yoe", "<Plug>(toggle-lsp-diag-vtext)<Plug>(toggle-lsp-diag-underline)", { desc = "Toggle [e]rror/diagnostics" })
  end,
}
