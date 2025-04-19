vim.opt.wrap = false -- Wrap text
vim.opt.breakindent = true -- Match indent on line break
vim.opt.linebreak = true -- Line break on whole words

-- indentation --
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Spell check
vim.opt.spelllang = 'en_us'
vim.opt.spell = false


-- Set Python indentation options
vim.g.python_indent = {
  open_paren = vim.fn.shiftwidth(),
  closed_paren_align_last_line = false
}
