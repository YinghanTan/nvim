-- [[ Configure and install plugins ]]
--
-- To check the currestatus of your plugins, run
--   :Lazy
-- You can press `?` in this menu for help. Use `:q` to close the window
--
-- To update plugins you can run
--   :Lazy update
--
-- NOTE: Here is where you install your plugins
require("lazy").setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  -- "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "tpope/vim-abolish", -- working with variants of a word

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behaviour/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.

  -- modular approach: using `requre 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  require("kickstart/plugins/gitsigns"),
  require("kickstart/plugins/which-key"),
  require("kickstart/plugins/telescope"),
  require("kickstart/plugins/lspconfig"),
  require("kickstart/plugins/conform"),
  require("kickstart/plugins/cmp"),
  -- require("kickstart/plugins/tokyonight"),
  require("kickstart/plugins/gruvbox"),
  require("kickstart/plugins/todo-comments"),
  require("kickstart/plugins/mini"),
  require("kickstart/plugins/treesitter"),
  require("kickstart/plugins/treesitter-context"),
  require("kickstart/plugins/ultisnips"),
  require("kickstart/plugins/honza"),

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).

  require("kickstart.plugins.autopairs"),
  require("kickstart.plugins.debug"),
  require("kickstart.plugins.indent_line"),
  require("kickstart.plugins.lint"),
  require("kickstart.plugins.neo-tree"),
  require("kickstart/plugins/colorizer"),
  require("kickstart/plugins/dial"),
  require("kickstart/plugins/diffview"),
  require("kickstart/plugins/fidget"),
  require("kickstart/plugins/fzf"),
  require("kickstart/plugins/hop"),
  require("kickstart/plugins/navbuddy"),
  require("kickstart/plugins/neoscroll"),
  require("kickstart/plugins/nvim-surround"),
  require("kickstart/plugins/project"),
  require("kickstart/plugins/rest"),
  require("kickstart/plugins/rnvimr"),
  require("kickstart/plugins/spectre"),
  require("kickstart/plugins/startuptime"),
  -- require("kickstart/plugins/toggle-lsp-diagnostic"),
  require("kickstart/plugins/treesj"),
  require("kickstart/plugins/undotree"),
  require("kickstart/plugins/unimpaired"),
  require("kickstart/plugins/unimpaired-which-key"),
  require("kickstart/plugins/vim-eunuch"),
  require("kickstart/plugins/vim-fugitive"),
  require("kickstart/plugins/vim-slime"),
  require("kickstart/plugins/vim-togglelist"),
  require("kickstart/plugins/vimspector"),
  require("kickstart/plugins/vimwiki"),
  require("kickstart/plugins/vinegar"),
  require("kickstart/plugins/zoomwintab"),
  -- require("kickstart/plugins/render-markdown"),
  require("kickstart/plugins/markdown-preview"),
  require("kickstart/plugins/rainbow-csv"),
  require("kickstart/plugins/codi"),
  require("kickstart/plugins/nvim-ufo"),
  require("kickstart/plugins/pretty-fold"),
  require("kickstart/plugins/snacks"),
  require("kickstart/plugins/venv-selector"),

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = " ",
      ft = " ",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
-- vim: ts=2 sts=2 sw=2 et
