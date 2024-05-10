local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio" },
}

function M.config()
  local dap = require("dap")
  local dapui = require("dapui")
  local wk = require("which-key")
  dapui.setup()
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
  wk.register({
    ["<leader>dD"] = { ":lua require('dapui').toggle()<cr>", "toggle dap" },
  })
end

return M
