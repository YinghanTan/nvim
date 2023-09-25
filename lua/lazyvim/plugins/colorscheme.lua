return {

  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        dim_inactive = false,
        transparent_mode = false,
        overrides = {
          -- DiffChange = {bg="#2D435D", fg="#FFFFFF",  reverse = false },
          -- DiffText = {bg="#33699A", fg="#FFFFFF", bold=true, reverse = false },
          -- DiffAdd = {bg="#2D4B4C", fg="#FFFFFF", reverse = false},
          -- DiffRemoved = { fg = "#B44A34", bg = "None", reverse = false},
          -- DiffDelete = { fg = "#B44A34", bg = "None", reverse = false}
          DiffChange = {bg="#458588", fg="#FFFFFF",  reverse = false },
          DiffText = {bg="#076678", fg="#FFFFFF", bold=true, reverse = false },
          DiffAdd = {bg="#98971a", fg="#FFFFFF", reverse = false},
          DiffRemoved = { fg = "#fb4934", bg = "None", reverse = false, bold=true, italic=true},
          DiffDelete = { fg = "#fb4934", bg = "None", reverse = false, bold=true, italic=true}
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- -- tokyonight
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = { style = "moon" },
  -- },

  -- -- catppuccin
  -- {
  --   "catppuccin/nvim",
  --   lazy = true,
  --   name = "catppuccin",
  --   opts = {
  --     integrations = {
  --       alpha = true,
  --       cmp = true,
  --       flash = true,
  --       gitsigns = true,
  --       illuminate = true,
  --       indent_blankline = { enabled = true },
  --       lsp_trouble = true,
  --       mason = true,
  --       mini = true,
  --       native_lsp = {
  --         enabled = true,
  --         underlines = {
  --           errors = { "undercurl" },
  --           hints = { "undercurl" },
  --           warnings = { "undercurl" },
  --           information = { "undercurl" },
  --         },
  --       },
  --       navic = { enabled = true, custom_bg = "lualine" },
  --       neotest = true,
  --       noice = true,
  --       notify = true,
  --       neotree = true,
  --       semantic_tokens = true,
  --       telescope = true,
  --       treesitter = true,
  --       which_key = true,
  --     },
  --   },
  -- },
}
