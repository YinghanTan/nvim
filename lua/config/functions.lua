-- " Random Useful Functions

-- Turn on spellcheck for markdown
vim.cmd([[
    augroup auto_spellcheck
        autocmd BufNewFile,BufRead *.md setlocal spell
    augroup END
    ]])

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Highlight on yank
-- local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
-- api.nvim_create_autocmd("TextYankPost", {
--   command = "silent! lua vim.highlight.on_yank()",
--   group = yankGrp,
-- })
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

-- Trim whitespace on line
function TrimWhitespace()
  local l = vim.fn.line(".")
  local c = vim.fn.col(".")
  vim.cmd("s/\\s\\+$//e")
  vim.fn.cursor(l, c)
end

-- show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorline", group = cursorGrp }
)
vim.api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)


