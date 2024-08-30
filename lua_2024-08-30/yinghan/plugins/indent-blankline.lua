return {
  "lukas-reineke/indent-blankline.nvim",
  -- event = { "BufReadPre", "BufNewFile" },
  event = "VeryLazy",
  commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
  config = function()
    vim.keymap.set("n", "yog", "<cmd>IndentBlanklineToggle<cr>", { desc = "toggle indent guide" })

    local icons = require("yinghan.library.icons")
    require("indent_blankline").setup({
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "text",
      },
      -- char = icons.ui.LineLeft,
      char = icons.ui.LineMiddle,
      -- context_char = icons.ui.LineLeft,
      context_char = icons.ui.LineMiddle,
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      use_treesitter = true,
      show_current_context = true,
    })
  end,
}

-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   main = "ibl",
--   branch = "master",
--   commit = "29be0919b91fb59eca9e90690d76014233392bef",
--   event = { "BufReadPre", "BufNewFile" },
--   opts = {
--     indent = { char = "┊" },
--   },
-- }
