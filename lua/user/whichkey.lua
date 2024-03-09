local M = {
  "folke/which-key.nvim",
}

function M.config()

  vim.o.timeout = true
  vim.o.timeoutlen = 300


  local which_key = require("which-key")
  which_key.setup {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = {
      gc = "Comments",
      ys = "you surround"
    },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
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
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      zindex = 1000, -- positive value to position WhichKey above other floating windows.
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
    triggers = "auto", --automatically setup triggers
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
      i = { "j", "k", "<leader>" },
      v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }
  local mappings = {
    ["\\"] = {
      name = "+hop/commands",
      s = { "<cmd>luafile $MYVIMRC<cr>", "source vimrc" },
    },
    ["b"] = { name = "+buffer" },
    ["d"] = { name = "+debug" },
    ["f"] = { name = "+find" },
    ["g"] = { name = "+git/goto",
      ["g"] = { name = "+apps/hunks/link" },
    },
    ["l"] = { name = "+lsp/loc" },
    ["q"] = { name = "+qfix" },
    ["m"] = { name = "+md" },
    ["p"] = { name = "+paste/plugins",
      ["p"] = { "<cmd>Lazy<cr>", "view" }
    },
    ["s"] = { name = "+search/" },
    ["t"] = {
      name = "+test/tab",
      n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
      N = { "<cmd>tabnew %<cr>", "New Tab" },
      o = { "<cmd>tabonly<cr>", "Only" },
      h = { "<cmd>-tabmove<cr>", "Move Left" },
      l = { "<cmd>+tabmove<cr>", "Move Right" },
    },
    ["T"] = {
      name = "+Treesitter",
      i = { "<cmd>TSInstallInfo<cr>", "Info" },
      p = { "<cmd>TSPlaygroundToggle<cr>", "playground" },
    },
    ["u"] = { name = "+undo/ultisnip" },
    ["w"] = { name = "+wiki/win" },
    ["yop"] = { "<cmd>call TogglePaste()<cr>", "toggle paste" },
    ["yoR"] = { "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>", "Redraw / clear hlsearch / diff update" },
    ["yoD"] = { "<cmd>diffoff!<cr>", "diffoff all" },
  }
  which_key.register(mappings, opts)
end

return M
