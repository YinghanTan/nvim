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

  require("config/plugins/gitsigns"),
  require("config/plugins/which-key"),
  require("config/plugins/telescope"),
  -- require("config/plugins/telescope-tabs"),
  require("config/plugins/lspconfig"),
  require("config/plugins/django-plus"),
  require("config/plugins/conform"),
  require("config/plugins/cmp"),
  require("config/plugins/gruvbox"),
  require("config/plugins/todo-comments"),
  require("config/plugins/treesitter"),
  require("config/plugins/treesitter-context"),
  require("config/plugins/ultisnips"),
  require("config/plugins/honza"),

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).

  require("config.plugins.debug"),
  -- require("config/plugins/vimspector"),
  require("config.plugins.lint"),
  require("config.plugins.neo-tree"),
  require("config/plugins/dial"),
  require("config/plugins/diffview"),
  require("config/plugins/fidget"),
  require("config/plugins/fzf"),
  require("config/plugins/hop"),
  require("config/plugins/navbuddy"),
  require("config/plugins/project"),
  -- require("config/plugins/rest"),
  require("config/plugins/kulala"),
  require("config/plugins/rnvimr"),
  require("config/plugins/spectre"),
  require("config/plugins/startuptime"),
  require("config/plugins/undotree"),
  require("config/plugins/vim-eunuch"),
  require("config/plugins/vim-fugitive"),
  require("config/plugins/tabline"),
  require("config/plugins/vim-slime"),
  require("config/plugins/vim-togglelist"),
  require("config/plugins/vimwiki"),
  require("config/plugins/zoomwintab"),
  require("config/plugins/markdown-preview"),
  require("config/plugins/rainbow-csv"),
  require("config/plugins/codi"),
  require("config/plugins/nvim-ufo"),
  require("config/plugins/pretty-fold"),
  require("config/plugins/snacks"),
  require("config/plugins/venv-selector"),
  require("config/plugins/floaterm"),
  require("config/plugins/oil"),
  require("config/plugins/vindent"),

  require("config/plugins/mini"),
  require("config/plugins/nvim-surround"),
  require("config.plugins.autopairs"),
  require("config/plugins/unimpaired"),
  require("config/plugins/unimpaired-which-key"),

  require("config/plugins/avante"),
  require("config/plugins/vim-test"),
  require("config/plugins/jinja"),
  require("config/plugins/vimux"),

  require("config/plugins/nvim-highlight-colors"),
  require("config/plugins/vim-python-pep8-indent"),
  require("config/plugins/iron"),
  -- require("config/plugins/tts"),

  -- require("config/plugins/vim-piper"),
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
