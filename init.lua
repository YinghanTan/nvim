require("plenary.reload").reload_module("user", true) -- To refresh cached lua modules

require("user.options")
require("user.keymaps")
require("user.plugins") -- Plugins managed with Packer
require("user.functions")
require("user.colorscheme")
require("user.cmp") -- Completion plugin
require("user.lsp") -- LSP
require("user._telescope") -- Fuzzy finder
require("user.nvim-neoclip") -- telescope yank manager
require("user.treesitter") -- Generates syntax tree using a parser generator
require("user.autopairs") -- Autopairs, integrates with both cmp and treesitter
require("user.comment") -- Easily comment stuff
require("user.gitsigns") -- shows git status for each line in the gutter
require("user.nvim-tree")
-- require "user.bufferline"
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.impatient")
require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.autocommands")
require("user.hop")
require("user.matchup")
require("user.numb")
require("user.dial")
require("user._colorizer")
require("user.spectre")
require("user.neoscroll")
require("user.todo-comments")
require("user.bookmark")
require("user.renamer")
require("user.symbol-outline")
require("user.git-blame")
require("user.gitlinker")
require("user.session-manager")
require("user.ts-context")
require("user.registers")

-- Configs in Vimscript
vim.cmd("source $HOME/.config/nvim/plug-config/firenvim.vim")
vim.cmd("source $HOME/.config/nvim/plug-config/codi.vim")
vim.cmd("source $HOME/.config/nvim/plug-config/surround.vim")
vim.cmd("source $HOME/.config/nvim/plug-config/tabularize.vim")
vim.cmd("source $HOME/.config/nvim/plug-config/vimwiki.vim")
vim.cmd("source $HOME/.config/nvim/plug-config/vimwiki-sync.vim")
vim.cmd("source $HOME/.config/nvim/plug-config/vimtex.vim")
vim.cmd("source $HOME/.config/nvim/plug-config/rnvimr.vim")
vim.cmd("source $HOME/.config/nvim/plug-config/undotree.vim")
vim.cmd("source $HOME/.config/nvim/plug-config/vimspector.vim")

-- Deprecated
-- require "user.surround"

-- Use gd to go to each file
-- Use gf to go to each file if path is provided
-- :checkhealth
-- Treesitter
-- :TSUninstall all
-- :TSInstall all
