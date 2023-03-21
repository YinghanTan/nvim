local M = {}
function M.setup()
  vim.g.indent_blankline_char = ""
  vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
  vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
  vim.g.indent_blankline_show_trailing_blankline_indent = false
end
return M
