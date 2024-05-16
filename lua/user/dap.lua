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

function M.config()

  -- require("core.utils").load_mappings("dap")
  -- require('dap').setup()

  local wk = require("which-key")
  wk.register({
    ["<leader>ddb"] = {function() require("dap").toggle_breakpoint() end, "break" },
    ["<leader>ddB"] = {function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "Break conditional" },
    ["<leader>ddC"] = {function() require("dap").run_to_cursor() end, "run to cursor" },
    ["<leader>ddg"] = {function() require("dap").goto_() end, "go to line" },
    ["<leader>ddi"] = {function() require("dap").step_into() end, "step in" },
    ["<leader>ddj"] = {function() require("dap").down() end, "down" },
    ["<leader>ddk"] = {function() require("dap").up() end, "up" },
    ["<leader>ddl"] = {function() require("dap").run_last() end, "run last" },
    ["<leader>ddo"] = {function() require("dap").step_out() end, "step out" },
    ["<leader>ddO"] = {function() require("dap").step_over() end, "step over" },
    ["<leader>ddp"] = {function() require("dap").pause() end, "pause" },
    ["<leader>ddr"] = {function() require("dap").repl.toggle() end, "repl toggle" },
    ["<leader>dds"] = {function() require("dap").session() end, "session" },
    ["<leader>ddt"] = {function() require("dap").terminate() end, "terminate" },
    ["<leader>ddw"] = {function() require("dap.ui.widgets").hover() end, "widgets" },
  })

end

return M
