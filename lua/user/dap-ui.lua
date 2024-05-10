local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio" },
}

function M.config()
  require("dapui").setup()
end

return M
