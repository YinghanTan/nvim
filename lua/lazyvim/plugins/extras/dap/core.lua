return {
  "mfussenegger/nvim-dap",

  dependencies = {

    -- fancy UI for the debugger
    {
      "rcarriga/nvim-dap-ui",
      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      },
      opts = {},
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
      end,
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    -- which key integration
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        defaults = {
          ["<leader>d"] = { name = "+debug" },
          ["<leader>da"] = { name = "+adapters" },
        },
      },
    },

    -- mason.nvim integration
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "mason.nvim", "nvim-telescope/telescope.nvim" },
      -- telescope
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,kkkkkkkkkk
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
        },
      },
    },
  },

  -- stylua: ignore
  keys = {
    { "<leader>dA", function() require("dap").continue() end, desc = "Continue" },
    -- { "<leader>dBc", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    -- { "<leader>dBd", function() require"dap".clear_breakpoints() end, desc = "Breakpoint Condition" },
    -- { "<leader>dBB", '<cmd>Telescope dap list_breakpoints<CR>', desc = "breakpoints all" },
    -- { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    -- { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    -- { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    -- { "<leader>ds", function() require("dap").step_into() end, desc = "Step Into" },
    -- { "<leader>dS", function() require("dap").step_out() end, desc = "Step Out" },
    -- { "<leader>dn", function() require("dap").step_over() end, desc = "Step Over" },
    -- { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    -- { "<leader>d?", function()
    --   local widgets = require "dap.ui.widgets";
    --   widgets.centered_float(widgets.scopes)
    -- end, desc = "scopes" },
    -- { "<leader>df", "<cmd>Telescope dap frames<CR>", desc = "frames" },
    -- { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    -- { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    -- { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    -- { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    -- { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    -- { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    -- { "<leader>dD", function() require("dap").terminate() end, desc = "Terminate" },
    -- { "<leader>di", function() require("dap.ui.widgets").hover() end, desc = "inspect" },
  },

  config = function()
    local Config = require("lazyvim.config")
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(Config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    local dap_opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = false, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap`
      nowait = true, -- use `nowait` when creating keympas
    }
    local dap_mappings = {
      ["d"] = {
        name = "+debug",
        ["b"] = { function() require("dap").toggle_breakpoint() end, "breakpoint" },
        ["B"] = {
          name = "breakpoint",
          ["B"] = { "<cmd>Telescope dap list_breakpoints<CR>", "all breakpoints" },
          ["c"] = { function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "conditional break" },
          ["d"] = { function() require"dap".clear_breakpoints() end, "delete breakpoints" },
        },
        ["c"] = { function() require("dap").continue() end, "continue" },
        ["C"] = { function() require("dap").run_to_cursor() end, "cursor" },
        ["D"] = { function() require("dap").terminate() end, "disable" },
        -- ["e"] = { "<cmd>VimspectorEval<cr>", "Evaluate" },
        ["i"] = { function() require("dap.ui.widgets").hover() end, "inspect" },
        ["n"] = { function() require("dap").step_over() end, "next" },
        -- ["o"] = { "<cmd>VimspectorShowOutput<cr>", "output" },
        ["s"] = { function() require("dap").step_into() end, "step into" },
        ["S"] = { function() require("dap").step_out() end, "step out" },
        ["l"] = { function() require("dap").run_last() end, "run last" },
        ["f"] = { "<cmd>Telescope dap frames<CR>", "go to line (no execute)" },
        ["g"] = { function() require("dap").goto_() end, "go to line (no execute)" },
        ["?"] = { function()
          local widgets = require "dap.ui.widgets";
          widgets.centered_float(widgets.scopes)
        end, "scopes" },
        ["v"] = {
          name = "view",
          -- ["c"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.code)<cr>", "code" },
          -- ["o"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.terminal)<cr>", "output" },
          -- ["v"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.variables)<cr>", "variables" },
          -- ["w"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.watches)<cr>", "watches" },
          -- ["s"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>", "stack" },
          ["t"] = { function() require("dap").repl.toggle() end, "terminal" },
          -- ["T"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.tagpage)<cr>", "tag" },
        },
        ["j"] = { function() require("dap").down() end, "down frame" },
        ["k"] = { function() require("dap").up() end, "up frame" },
        ["p"] = { function() require("dap").pause() end, "pause" },
        -- ["P"] = { "<plug>VimspectorStop", "stop" },
        -- ["r"] = { "<plug>VimspectorRestart", "restart" },
        -- ["w"] = { "<cmd>call AddToWatch()<cr>", "add to watch" },
      },
    }
    local wk = require("which-key")
    wk.register(dap_mappings, dap_opts)

  end,
}
