return {
  {
    "puremourning/vimspector",
    lazy = true,
    cmd = { "VimspectorInstall", "VimspectorUpdate" },
    keys = {
      { "<leader>dV", "<cmd>call vimspector#Launch()<cr>", desc = "vimspector" },
    },
    init = function()
      vim.g.vimspector_enable_mappings = "HUMAN"
      vim.g.vimspector_base_dir = "/home/yinghan/.local/share/nvim/lazy/vimspector"
    end,
    config = function()

      -- jump to window id
      vim.cmd([[
      fun! GoToWindow(id)
          call win_gotoid(a:id)
      endfun
      ]])

      vim.cmd([[
      func! AddToWatch()
          let word = expand("<cexpr>")
          call vimspector#AddWatch(word)
      endfunction
      ]])
      vim.g.vimspector_install_gadgets = { "debugpy@1.6.3", "debugger-for-chrome", "CodeLLDB", "vscode-node-debug2" }

      -- let g:vimspector_base_dir = expand('$HOME/.config/nvim/vimspector-config')

      -- stylua: ignore start
      -- mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
      -- for normal mode - the word under the cursor

      vim.keymap.set({ "n", "x" }, "<leader>di", "<Plug>VimspectorBalloonEval", {desc="inspect"})

      local d_opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap`
        nowait = true, -- use `nowait` when creating keympas
      }
      local d_mappings = {
        ["d"] = {
          name = "+debug",
          ["b"] = { "<plug>VimspectorToggleBreakpoint", "breakpoint" },
          ["B"] = {
            name = "breakpoint",
            ["c"] = { "<plug>VimspectorToggleConditionalBreakpoint", "conditional break" },
            ["d"] = { "<cmd>call vimspector#ClearBreakpoints()", "remove all break" },
            ["f"] = { "<plug>VimspectorAddFunctionBreakpoint", "func breakpoint" },
          },
          ["c"] = { "<plug>VimspectorContinue | zz", "continue" },
          ["C"] = { "<plug>VimspectorRunToCursor | zz", "cursor" },
          ["D"] = { "<cmd>VimspectorReset<cr>", "reset" },
          ["e"] = { "<cmd>VimspectorEval<cr>", "Evaluate" },
          ["i"] = { "<plug>VimspectorBalloonEval", "inspect" },
          ["n"] = { "<plug>VimspectorStepOver | zz", "next" },
          ["o"] = { "<cmd>VimspectorShowOutput<cr>", "output" },
          ["s"] = { "<plug>VimspectorStepInto | zz", "step into" },
          ["S"] = { "<plug>VimspectorStepOut | zz", "step out" },
          ["v"] = {
            name = "view",
            ["c"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.code)<cr>", "code" },
            ["o"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.terminal)<cr>", "output" },
            ["v"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.variables)<cr>", "variables" },
            ["w"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.watches)<cr>", "watches" },
            ["s"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>", "stack" },
            ["t"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.output)<cr>", "terminal" },
            ["T"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.tagpage)<cr>", "tag" },
          },
          ["j"] = { "<plug>VimspectorDownFrame", "down frame" },
          ["k"] = { "<plug>VimspectorUpFrame", "up frame" },
          ["p"] = { "<plug>VimspectorPause", "pause" },
          ["P"] = { "<plug>VimspectorStop", "stop" },
          ["r"] = { "<plug>VimspectorRestart", "restart" },
          ["w"] = { "<cmd>call AddToWatch()<cr>", "add to watch" },
        },
      }
      local wk = require("which-key")
      wk.register(d_mappings, d_opts)
    end,
  },
}
