
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)


require("config").setup(opts)
require("setup.health")

require("lazy").setup({
  spec = {
    -- import plugins
    -- import any extras modules here
    { import = "plugins.extras.lang.json" },
    { import = "plugins.extras.lang.yaml" },
    { import = "plugins.extras.lang.python" },
    { import = "plugins.extras.lang.typescript" },
    { import = "plugins.extras.lang.docker" },
    { import = "plugins.extras.lang.terraform" },
    { import = "plugins.extras.lang.cmake" },
    { import = "plugins.extras.lang.java" },
    -- { import = "plugins.extras.test.core" },
    { import = "plugins.extras.util.project" },
    -- { import = "plugins.extras.lang.tex" },
    -- { import = "plugins.extras.lang.go" },
    { import = "plugins.extras.ui.mini-animate" },
    { import = "plugins.extras.linting.eslint" },
    { import = "plugins.extras.formatting.prettier" },

    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})


