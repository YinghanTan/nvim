return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.keymap.set("n", "yoC", "<cmd>ColorizerToggle<cr>", { desc = "colorizer" })

    require("colorizer").setup({
      filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "css",
        "html",
        "astro",
        "lua",
      },
      user_default_options = {
        names = false,
        rgb_fn = true,
        hsl_fn = true,
        tailwind = "both",
      },
      buftypes = {},
    })
  end,
}
