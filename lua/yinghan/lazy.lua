-- bootstrap lazy so it'll get automatically installed if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "yinghan.plugins" },
  { import = "yinghan.plugins.lsp" },
}, {
  checker = { -- check for plugin updates
    enabled = true,
    notify = false,
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    enabled = true,  -- automatically check for config file changes and reload 
    notify = false,  -- turn off notifications whenever plugin changes are made
  },
})

-- set keymaps
vim.keymap.set("n", "<leader><leader>L", "<cmd>Lazy<cr>", { desc = "lazy"})
