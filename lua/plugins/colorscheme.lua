return {

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

  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require('gruvbox').setup({
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
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
        overrides = {
          -- DiffChange = {bg="#rgbcolor", fg="#rgbcolor", ...},
          -- DiffAdd = {bg="#rgbcolor", fg="#rgbcolor", ...},
          DiffDelete = {bg="none" },
          -- DiffText = {bg="#rgbcolor", fg="#rgbcolor", ...},
        }
      })
      vim.cmd("colorscheme gruvbox")
    end
  },

}


-- local colors = require("gruvbox.palette").colors;
--
-- function FixGruvbox()
--   vim.api.nvim_set_hl(0, 'DiffviewDiffAddAsDelete', { bg = "#431313" })
--   vim.api.nvim_set_hl(0, 'DiffDelete', { bg = "none", fg = colors.dark2 })
--   vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = "none", fg = colors.dark2 })
--   vim.api.nvim_set_hl(0, 'DiffAdd', { bg = "#142a03" })
--   vim.api.nvim_set_hl(0, 'DiffChange', { bg = "#3B3307" })
--   vim.api.nvim_set_hl(0, 'DiffText', { bg = "#4D520D" })
-- end
-- FixGruvbox()
--
-- vim.api.nvim_create_autocmd(
--   "ColorScheme",
--     { pattern = { "gruvbox" }, callback = FixGruvbox }
-- )
