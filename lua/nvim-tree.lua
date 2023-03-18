-- -- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local status_ok, nvim_tree = pcall(require, "nvim-tree")

nvim_tree.setup({
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_netrw = false,
  hijack_cursor = true,
  respect_buf_cwd = false,


  sync_root_with_cwd = false,
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },


  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filters = {
    custom = {
      "^.git$",
    },
  },
  log = {
    enable = false,
    truncate = true,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
  view = {
    number = true,
    relativenumber = true
  },
})
