local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap",
  },
}

function M.config()

  local dap = require("dap")
  local dapui = require("dapui")
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

  local wk = require("which-key")
  wk.register({
    ["<leader>ddu"] = { function() require("dapui").toggle() end, "ui toggle" },
    -- ["<leader>ddu"] = { function() require("dapui").open({ }) end, "ui on" },
    -- ["<leader>ddU"] = { function() require("dapui").off({ }) end, "ui off" },
    ["<leader>dde"] = { function() require("dapui").eval() end, "eval", mode = {"n", "v"}  },
  })

end

return M
