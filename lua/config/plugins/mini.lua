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
      -- -- Main textobject prefixes
      -- around = 'a',
      -- inside = 'i',
      -- -- Next/last variants
      -- around_next = 'an',
      -- inside_next = 'in',
      -- around_last = 'al',
      -- inside_last = 'il',
      -- -- Move cursor to corresponding edge of `a` textobject
      -- goto_left = 'g[',
      -- goto_right = 'g]',
    end,
  },
  {
    "echasnovski/mini.statusline",
    lazy = false,
    config = function()
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
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local function section_window_id()
              return tostring(vim.api.nvim_win_get_number(0))
            end

            return MiniStatusline.combine_groups({
              { hl = "MiniStatuslineModeVisual", strings = { section_window_id() } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- End left alignment
            })
          end,
        },
      })
    end,
  },
  {
    "echasnovski/mini.splitjoin",
    keys = {
      { "gS", mode = { "n", "x" }, desc = "toggle arguments" },
    },
    opts = {}, -- force load
  },
  {
    "echasnovski/mini.trailspace",
    event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ '<leader>lw', '<cmd>lua MiniTrailspace.trim()<CR>', desc = '[l]sp [w]hitespace' },
			{ '<leader>lW', '<cmd>lua MiniTrailspace.trim_last_lines()<CR>', desc = '[l]sp [W]hitelines' },
		},
    opts = {}, -- force load
  },
  {
    "echasnovski/mini.map",
    keys = {
      { "yoM", "<cmd>lua MiniMap.toggle()<cr>", mode = { "n", "x" }, desc = "[yo]toggle [M]inimap" },
    },
    opts = {}, -- force load
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      options = {
        border = "both",
        indent_at_cursor = false,
      },
      symbol = "▎",
    },
  },
  {
    "echasnovski/mini.align",
    opts = {},
    -- ga or gA
    -- split character or <s> split character
    -- <j> l c r n
    -- <m> char
  },
  {
    "echasnovski/mini.comment",
    opts = {},
    -- gc
  },
  {
    "echasnovski/mini.operators",
    opts = {},
    -- evaluate = 'g='
    -- exchange = 'gx'
    -- multiply = 'gm'
    -- replace = 'gr'
    -- sort = 'gs'
  },
}
-- vim: ts=2 sts=2 sw=2 et
