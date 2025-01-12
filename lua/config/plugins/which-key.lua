-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    opts = {

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
      -- sort = { "alphanum", "local", "order", "group", "mod" },
      sort = { "alphanum" },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+ ", -- symbol prepended to a group
        ellipsis = "…",
        colors = true,
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = "<Up> ",
          Down = "<Down> ",
          Left = "<Left> ",
          Right = "<Right> ",
          C = "<C-…> ",
          M = "<M-…> ",
          D = "<D-…> ",
          S = "<S-…> ",
          CR = "<CR> ",
          Esc = "<Esc> ",
          ScrollWheelDown = "<ScrollWheelDown> ",
          ScrollWheelUp = "<ScrollWheelUp> ",
          NL = "<NL> ",
          BS = "<BS> ",
          Space = "<Space> ",
          Tab = "<Tab> ",
          F1 = "<F1>",
          F2 = "<F2>",
          F3 = "<F3>",
          F4 = "<F4>",
          F5 = "<F5>",
          F6 = "<F6>",
          F7 = "<F7>",
          F8 = "<F8>",
          F9 = "<F9>",
          F10 = "<F10>",
          F11 = "<F11>",
          F12 = "<F12>",
        },
      },

      -- Document existing key chains
      spec = {
        { "<leader>b", group = " [b]uffer" },
        { "<leader>c", group = " [c]odi" },
        { "<leader>d", group = "󰃤 [d]ebug" },
        { "<leader>f", group = " [f]ile" },
        { "<leader>g", group = " [g]it", mode = { "n", "v" } },
        { "<leader>gg", group = " [g]it apps", mode = { "n", "v" } },
        { "<leader><leader>", group = " [\\]cmd/nav", mode = { "n", "v" } },
        { "<leader>l", group = " [l]sp", mode = { "n", "x" } },
        { "<leader>n", group = " [n]otify", mode = { "n" } },
        -- { "<leader>r", group = " [r]ename" },
        { "<leader>s", group = " [s]earch" },
        { "<leader>S", group = "󰛔 [S]ub/[S]cratchpad" },
        { "<leader>t", group = " [t]ui" },
        { "<leader>T", group = " [T]reesitter" },
        { "<leader>u", group = " [u]ndo/[u]ltisnips" },
        { "<leader>v", group = " [v]env" },
        { "<leader>w", group = " [w]orkspace/[w]iki" },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
