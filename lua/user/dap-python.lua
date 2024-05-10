local M = {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
  }
}

function M.setup()
  require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
end

return M
