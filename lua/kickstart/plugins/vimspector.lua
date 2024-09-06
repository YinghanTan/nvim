return {
  "puremourning/vimspector",
  lazy = true,
  cmd = { "VimspectorInstall", "VimspectorUpdate" },
  keys = {
    { "<leader>dV", "<cmd>call vimspector#Launch()<cr>", desc = "[V]imspector" },
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

    vim.keymap.set({ "n", "x" }, "<leader>di", "<Plug>VimspectorBalloonEval", {desc="[i]nspect"})

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
        ["b"] = { "<plug>VimspectorToggleBreakpoint", "[b]reakpoint" },
        ["B"] = {
          name = "breakpoint",
          ["c"] = { "<plug>VimspectorToggleConditionalBreakpoint", "[c]onditional break" },
          ["d"] = { "<cmd>call vimspector#ClearBreakpoints()", "[d]elete all breakpoitn" },
          ["f"] = { "<plug>VimspectorAddFunctionBreakpoint", "[f]unc breakpoint" },
        },
        ["c"] = { "<plug>VimspectorContinue | zz", "[c]ontinue" },
        ["C"] = { "<plug>VimspectorRunToCursor | zz", "[C]ursor" },
        ["D"] = { "<cmd>VimspectorReset<cr>", "reset" },
        ["e"] = { "<cmd>VimspectorEval<cr>", "[e]valuate" },
        ["i"] = { "<plug>VimspectorBalloonEval", "[i]nspect" },
        ["n"] = { "<plug>VimspectorStepOver | zz", "[n]ext" },
        ["o"] = { "<cmd>VimspectorShowOutput<cr>", "[o]utput" },
        ["s"] = { "<plug>VimspectorStepInto | zz", "[s]tep into" },
        ["S"] = { "<plug>VimspectorStepOut | zz", "[S]tep out" },
        ["v"] = {
          name = "view",
          ["c"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.code)<cr>", "[c]ode" },
          ["o"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.terminal)<cr>", "[o]utput" },
          ["v"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.variables)<cr>", "[v]ariables" },
          ["w"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.watches)<cr>", "[w]atches" },
          ["s"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>", "[s]tack" },
          ["t"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.output)<cr>", "[t]erminal" },
          ["T"] = { "<cmd>call GoToWindow(g:vimspector_session_windows.tagpage)<cr>", "[T]ag" },
        },
        ["j"] = { "<plug>VimspectorDownFrame", "[j]down frame" },
        ["k"] = { "<plug>VimspectorUpFrame", "[k]up frame" },
        ["p"] = { "<plug>VimspectorPause", "[p]ause" },
        ["P"] = { "<plug>VimspectorStop", "[P]stop" },
        ["r"] = { "<plug>VimspectorRestart", "[r]estart" },
        ["w"] = { "<cmd>call AddToWatch()<cr>", "add to [w]atch" },
      },
    }
    local wk = require("which-key")
    wk.register(d_mappings, d_opts)
  end,
}
