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
          find = "sf", -- Find surrounding (to the right)
          find_left = "Sf", -- Find surrounding (to the left)
          highlight = "hs", -- Highlight surrounding
          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      })

      -- StatusLine
      local MiniStatusline = require("mini.statusline")
      require("mini.statusline").setup({
        use_icons = vim.g.have_nerd_font,
        content = {
          -- Content for active window
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local diff = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })
            local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- End left alignment
              { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            })
          end,
          inactive = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local function section_window_id()
              return tostring(vim.api.nvim_win_get_number(0))
            end
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })

            return MiniStatusline.combine_groups({
              { hl = mode_hl, strings = { section_window_id() } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- End left alignment
            })
          end,
        },
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
