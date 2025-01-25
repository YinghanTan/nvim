return {
  {
    --  https://github.com/echasnovski/mini.nvim
    --  Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    version = "*",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()

      -- ai, around and in shortcuts
      local spec_treesitter = require("mini.ai").gen_spec.treesitter
      require("mini.ai").setup({
        custom_textobjects = {
          f = spec_treesitter({
            a = "@function.outer",
            i = "@function.inner",
          }),
          k = spec_treesitter({
            a = "@class.outer",
            i = "@class.inner",
          }),
          o = spec_treesitter({
            a = { "@conditional.outer", "@loop.outer" },
            i = { "@conditional.inner", "@loop.inner" },
          }),
        },
      })

      -- Surround shortcuts
      require("mini.surround").setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          add = "ys", -- Add surrounding in Normal and Visual modes
          delete = "ds", -- Delete surrounding
          replace = "cs", -- Replace surrounding
          find = "fs", -- Find surrounding (to the right)
          find_left = "Fs", -- Find surrounding (to the left)
          highlight = "hs", -- Highlight surrounding
          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      })

      -- StatusLine
      require("mini.statusline").setup({
        use_icons = vim.g.have_nerd_font
      })

      -- comments
      require("mini.comment").setup()

      -- -- Operators
      -- require('mini.operators').setup()

      -- -- Minimal and fast autopairs
      -- require('mini.pairs').setup()

    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
