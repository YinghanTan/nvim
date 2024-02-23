local M = {
  'tummetott/unimpaired.nvim',
  lazy = false, -- make sure we load this during startup
}

function M.config()
  require('unimpaired').setup {
    -- add any options here or leave empty
  }
end

return M
