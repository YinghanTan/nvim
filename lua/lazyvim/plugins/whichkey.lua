return {
  -- which-key helps you remember key bindings by showing a popup
  -- with the active keybindings of the command you started typing.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
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
      operators = {
        gc = "Comments",
      },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC"
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      motions = {
        count = true,
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
      ignore_missing = false, -- enable this to hide mapping for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      show_key = true, -- show the currently pressed key and its label as a message in the command line
      trigger = "auto", --automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
      triggers_nowait = {
        -- marks
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",
      },
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by default for Telescope
      disable = {
        buftypes = {},
        filetypes = {},
      },
      defaults = {
        mode = { "n", "v" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },


        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },


        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },




        ["ys"] = { name = "+surround" },
        ["<leader>g"] = { name = "+git" },

        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>gg"] = { name = "+hunks" },
        ["<leader>f"] = { name = "+file" },
        ["<leader>S"] = { name = "+session/spectre" },

      },

      y_opts = {
        mode = "n", -- NORMAL mode
        prefix = "y",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
      },
      y_mappings = {
        ["o"] = {
          name = "+toggle",
          ["b"] = "background",
          ["d"] = "diff",
          ["e"] = "spell",
          ["c"] = "cursorline",

          ["C"] = { "<cmd>ColorizerToggle<cr>", "colorizer" },
          ["g"] = { "<cmd>IndentGuidesToggle<cr>", "indent guide" },

          ["h"] = "hlsearch",
          ["i"] = "ignorecase",
          ["l"] = "list char",
          ["m"] = { "<plug>MarkdownPreviewToggle", "toggle markdown " },
          ["n"] = "number",
          ["N"] = "notifications",
          ["p"] = { "<cmd>call TogglePaste()<cr>", "toggle paste" },
          ["r"] = "relative number",
          ["u"] = "cursor column",
          ["v"] = "virtualedit",
          ["w"] = "line wrap",
          ["x"] = "crosshairs",
        },
      },

    },



    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
      wk.register(opts.y_mappings, opts.y_opts)
    end,
  },
}
