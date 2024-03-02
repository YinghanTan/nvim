local M = {
"anuvyklack/pretty-fold.nvim",
  lazy = false,
}

function M.config()
  require('pretty-fold').setup()
end

return M
