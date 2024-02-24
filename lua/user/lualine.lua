local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  -- dependencies = {
  --   "AndreM222/copilot-lualine",
  -- },
}

function M.config()
  require("lualine").setup({
    options = {
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { "diagnostics" },
      -- lualine_x = { "copilot", "filetype" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive" },
  })
end

return M
