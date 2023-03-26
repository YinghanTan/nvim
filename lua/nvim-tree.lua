-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup({
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_netrw = false,
  hijack_cursor = true,
  update_cwd = true,
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
    update_cwd = true,
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
vim.g.nvim_tree_respect_buf_cwd = 1
