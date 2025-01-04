return {
  "puremourning/vimspector",
  lazy = true,
  cmd = { "VimspectorInstall", "VimspectorUpdate" },
  keys = {
    { "<leader>dV", "<cmd>call vimspector#Launch()<cr>", desc = "󰃤 [V]imspector" },
  },
  config = function()
    vim.g.vimspector_enable_mappings = "HUMAN"
    vim.g.vimspector_base_dir = "/home/yinghan/.local/share/nvim/lazy/vimspector"
    -- jump to window id
    vim.cmd([[
    fun! GoToWindow(id)
    call win_gotoid(a:id)
    endfun
    ]])
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

    vim.keymap.set({ "n", "x" }, "<leader>di", "<Plug>VimspectorBalloonEval", {desc="󱉶 [i]nspect"})


    local wk = require("which-key")
    wk.add({
      { "<leader>db", "<plug>VimspectorToggleBreakpoint", desc = "[b]reakpoint" },
      { "<leader>dB", group = "[B]reakpoint", mode = "n" },
      { "<leader>dBc", "<plug>VimspectorToggleConditionalBreakpoint", desc = "[c]onditional" },
      { "<leader>dBd", "<cmd>call vimspector#ClearBreakpoints()", desc = "[d]elete all" },
      { "<leader>dBf", "<plug>VimspectorAddFunctionBreakpoint", desc = "[f]unction" },

      { "<leader>dc", "<plug>VimspectorContinue | zz", desc = "[c]ontinue" },
      { "<leader>dC", "<plug>VimspectorRunToCursor | zz", desc = "[C]ursor" },
      { "<leader>dD", "<cmd>VimspectorReset<cr>", desc = "[D]elete" },
      { "<leader>de", "<cmd>VimspectorEval<cr>", desc = "[e]val" },
      { "<leader>di", "<plug>VimspectorBalloonEval", desc = "[i]nspect" },
      { "<leader>dn", "<plug>VimspectorStepOver | zz", desc = "[n]ext" },
      { "<leader>do", "<cmd>VimspectorShowOutput<cr>", desc = "[o]utput" },
      { "<leader>ds", "<plug>VimspectorStepInto | zz", desc = "[s]tep into" },
      { "<leader>dS", "<plug>VimspectorStepInto | zz", desc = "[s]tep out" },

      { "<leader>dv", group = "[v]iew", mode = "n" },
      { "<leader>dvc", "<cmd>call GoToWindow(g:vimspector_session_windows.code)<cr>", desc = "[c]ode" },
      { "<leader>dvo", "<cmd>call GoToWindow(g:vimspector_session_windows.terminal)<cr>", desc = "[o]uput" },
      { "<leader>dvv", "<cmd>call GoToWindow(g:vimspector_session_windows.variables)<cr>", desc = "[v]ariables" },
      { "<leader>dvw", "<cmd>call GoToWindow(g:vimspector_session_windows.watches)<cr>", desc = "[w]atches" },
      { "<leader>dvs", "<cmd>call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>", desc = "[s]tack" },
      { "<leader>dvt", "<cmd>call GoToWindow(g:vimspector_session_windows.output)<cr>", desc = "[t]erminal" },
      { "<leader>dvT", "<cmd>call GoToWindow(g:vimspector_session_windows.tagpage)<cr>", desc = "[T]ag" },

      { "<leader>dj", "<plug>VimspectorDownFrame", desc = "[j]down frame" },
      { "<leader>dk", "<plug>VimspectorUpFrame", desc = "[k]up frame" },
      { "<leader>dp", "<plug>VimspectorPause", desc = "[p]ause" },
      { "<leader>dP", "<plug>VimspectorStop", desc = "sto[P]" },
      { "<leader>dr", "<plug>VimspectorRestart", desc = "[r]estart" },
      { "<leader>dw", "<cmd>call AddToWatch()<cr>", desc = "add to [w]atch" },
    })
  end,
}
