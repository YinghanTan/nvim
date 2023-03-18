-- -- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local status_ok, nvim_tree = pcall(require, "nvim-tree")

nvim_tree.setup({
})
