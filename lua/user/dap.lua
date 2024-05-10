local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
    "williamboman/mason.nvim",
  },
}

function M.setup()
  local wk = require("which-key")
  wk.register({
    ["<leader>ddb"] = { ":DapToggleBreakpoint<CR>", "toggle breakpoint" },
    ["<leader>ddc"] = { ":DapContinue<CR>", "continue" },
    ["<leader>ddo"] = { ':lua require("dapui").open()<CR>', "open ui" },
  })
end

return M
