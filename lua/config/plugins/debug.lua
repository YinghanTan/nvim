return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui", -- Creates a beautiful debugger UI
    "nvim-neotest/nvim-nio", -- Required dependency for nvim-dap-ui

    -- Installs the debug adapters for you
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    -- Add your own debuggers here
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
  },
  keys = function(_, keys)
    local dap = require("dap")
    local dapui = require("dapui")
    return {

      -- nvim-dap keys
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = " run with [a]rgs" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('󰀘 [B]reakpoint conditional')) end, desc = "󰀘 Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = " [b]reakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = " run/[c]ontinue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "󰇀 run to [C]ursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = " [g]o to line (No Execute)" },
      { "<leader>dj", function() require("dap").down() end, desc = " [j]Down" },
      { "<leader>dk", function() require("dap").up() end, desc = " [k]Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = " run [l]ast" },
      { "<leader>di", function() require("dap").step_into() end, desc = " step [i]nto" },
      { "<leader>do", function() require("dap").step_out() end, desc = " step [o]ut" },
      { "<leader>dn", function() require("dap").step_over() end, desc = " step over/[n]ext" },
      { "<leader>dP", function() require("dap").pause() end, desc = " [P]ause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = " [r]epl" },
      { "<leader>ds", function() require("dap").session() end, desc = "󱃐 [s]ession" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "󰱝 [t]erminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "󰜬 [w]idgets" },

      -- nvim-dap-ui keys
      { "<leader>du", function() require("dapui").toggle({ }) end, desc = "󰹙 dap [u]i" },
      { "<leader>de", function() require("dapui").eval() end, desc = "󰪚 [e]val", mode = {"n", "v"} },

      { "<leader>dvf", function() require("dapui").float_element() end, desc = "[f]loat" },

      unpack(keys),
    }
  end,
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        -- "delve",
        "debugpy",
        "js-debug-adapter",
        "chrome-debug-adapter",
      },
    })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    -- dapui.setup()
    dapui.setup()

    vim.fn.sign_define("DapBreakpoint", {text=" ", texthl="", linehl="", numhl=""})
    vim.fn.sign_define("DapBreakpointCondition", {text="󰀘 ", texthl="", linehl="", numhl=""})
    vim.fn.sign_define("DapLogPoint", {text=" ", texthl="", linehl="", numhl=""})
    vim.fn.sign_define("DapStopped", {text=" ", texthl="", linehl="", numhl=""})
    vim.fn.sign_define("DapBreakpointRejected", {text=" ", texthl="", linehl="", numhl=""})

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end


    -- Install golang specific config
    require("dap-go").setup({
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has("win32") == 0,
      },
    })
    require("dap-python").setup("python")
  end,
}
