return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and ``'
        registers = true, -- shows your registers on " in NORMAL or <C-r> in InSERT mode"
        spelling = {
          enabled = true, -- enabling will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list
        },
        -- the presets plugins, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion /text object completetion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, --bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      -- operators = { gc = "Comments" }
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC"
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup,
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns:
        spacing = 2, -- spacing between columns
        align = "left", --- align columns left, center or right
      },

      ignore_missing = false, -- enable this to hide mpaaing for which you didn't specify a label

      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      trigger = "auto", --automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },

      y_opts = {
        mode = "n", -- NORMAL mode
        prefix = "y",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = false, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      y_mappings = {
        o = {
          name = "toggle",
          b = "background",
          d = "diff",
          e = "spell",
          c = "cursorline",
          C = { "<cmd>ColorizerToggle<cr>", "colorizer" },
          g = { "<cmd>IndentGuidesToggle<cr>", "indent guide" },
          h = "hlsearch",
          i = "ignorecase",
          l = "list char",
          m = { "<plug>MarkdownPreviewToggle", "toggle markdown " },
          n = "number",
          p = { "<cmd>call TogglePaste()<cr>", "toggle paste" },
          r = "relative number",
          u = "cursor column",
          v = "virtualedit",
          w = "line wrap",
          x = "crosshairs",
        },
      },

      vopts = {
        mode = "v", -- VISUAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      vmappings = {
        p = { '"_dP', "paste keep buffer" },
      },

      opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap`
        nowait = true, -- use `nowait` when creating keympas
      },
      mappings = {
        d = {
          name = "debug",
          ["b"] = { "<plug>VimspectorToggleBreakpoint", "breakpoint" },
          ["B"] = {
            name = "breakpoint",
            ["c"] = { "<plug>VimspectorToggleConditionalBreakpoint", "conditional break" },
            ["d"] = { "<cmd>call vimspector#ClearBreakpoints()", "remove all break" },
            ["f"] = { "<plug>VimspectorAddFunctionBreakpoint", "func breakpoint" },
          },
          ["c"] = { "<plug>VimspectorContinue | zz", "continue" },
          ["C"] = { "<plug>VimspectorRunToCursor | zz", "cursor" },
          ["d"] = { "<cmd>call vimspector#Launch()<cr>", "debug" },
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
          ["z"] = { "<Plug>(zoom-toggle)", "zoom window" },
        },
      },

      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["ys"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },

        ["<leader>g"] = {
          name = "+git",
          b = { "<cmd>Git blame<cr>", "blame" },
          B = { "<cmd>GBrowse<cr>", "browse" },
          [".B"] = { "<cmd>.GBrowse<cr>", "line browse" },
          c = { "<cmd>BCommits<cr>", "commits" },
          C = { "<cmd>Commits<cr>", "all commits" },
          d = {
            name = "diff",
            ["d"] = { "<cmd>Gdiff<cr>", "diff" },
            ["s"] = { "<cmd>Gdiffsplit<cr>", "split" },
            ["i"] = { "<cmd>CocCommand git.diffCached<cr>", "info" }, -- todo: ???
            ["u"] = { "<cmd>diffupdate<cr>", "update" },
            ["O"] = { "<cmd>diffoff!<cr>", "diffoff all" },
          },
          e = { ":Gedit ", "gedit" }, -- todo: show in cmd input without running :
          g = {
            name = "gutter",
            u = { "<cmd>Gitsigns reset_hunk<cr>", "undo hunk" },
            d = { "<cmd>Gitsigns diffthis<CR>", "diff" },
            i = { "<cmd>Gitsigns preview_hunk<CR>", "hunk info" },
            t = { "<cmd>Gitsigns toggle_signs<cr>", "toggle gutter" },
            s = { "<cmd>Gitsigns stage_hunk<cr>", "stage hunk" },
            b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "blame line" },
            z = { "<cmd>CocCommand git.foldUnchanged<cr>", "fold unchanged" },
            f = { "<cmd>diffget //2<cr>", "diffget left hunk" },
            j = { "<cmd>diffget //3<cr>", "diffget right hunk" },
          },
          G = { "<cmd>FloatermNew lazygit<CR>", "gui" },
          h = { "<cmd>0Gclog<cr>", "file history" },
          ["lo"] = { "<cmd>Commits<cr>", "all commits" },
          ["lO"] = { "<cmd>BCommits<cr>", "commits" },
          L = { "<cmd>Git log<cr>", "Log long" },
          p = { "<cmd>GGrep<cr>", "Grep" },
          r = { "<cmd>GDelete<cr>", "remove" },
          v = { "<cmd>GV!<cr>", "file commits" },
          V = { "<cmd>GV<cr>", "all commits" },
          s = {
            name = "Search",
            -- a = { "<cmd>FzfPreviewGitActions<cr>", "actions" },
            ["b"] = { "<cmd>Telescope git_branches<cr>", "branch" },
            ["c"] = { "<cmd>BCommits<cr>", "commits" },
            ["C"] = { "<cmd>Commits<cr>", "all commits" },
            ["f"] = { "<cmd>GFiles<cr>", "gfiles" },
            -- ["s"] = { "<cmd>GFiles?<cr>", "gstatus" },
            s = { "<cmd>Telescope git_status<cr>", "status" },
            S = { "<cmd>Telescope git_stash<cr>", "stash" },
          },
        },

        ["<leader>gh"] = { name = "+hunks" },

        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
      wk.register(opts.y_mappings, opts.y_opts)
      wk.register(opts.v_mappings, opts.v_opts)
      wk.register(opts.mappings, opts.opts)
    end,
  },
}
