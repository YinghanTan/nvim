return {
  -- You can easily change to a different colorscheme.
  -- change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

  "ellisonleao/gruvbox.nvim",
  priority = 1000, -- make sure plugin loads before others
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd("colorscheme gruvbox")

    -- You can configure highlights by doing something like:
    -- vim.cmd.hi("Comment gui=none")
  end,
  config = function()
    require("gruvbox").setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
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
        DiffChange = { bg = "#458588", fg = "#FFFFFF", reverse = false },
        DiffText = { bg = "#076678", fg = "#FFFFFF", bold = true, reverse = false },
        DiffAdd = { bg = "#98971a", fg = "#FFFFFF", reverse = false },
        DiffRemoved = { fg = "#fb4934", bg = "None", reverse = false, bold = true, italic = true },
        DiffDelete = { fg = "#fb4934", bg = "None", reverse = false, bold = true, italic = true },
      },
    })
  end,
}
