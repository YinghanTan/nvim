vim.opt.foldenable = false -- disable initial folded files 
vim.opt.foldlevel = 99 -- start file with all folds opened
vim.opt.foldlevelstart = 99 -- start file with all folds opened
vim.opt.foldcolumn = "0" -- defines 0 columns at left window, to indicate folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd("autocmd BufReadPost,FileReadPost * normal zR")
