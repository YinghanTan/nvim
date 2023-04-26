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

-- jump to window id
vim.cmd([[
fun! GoToWindow(id)
    call win_gotoid(a:id)
endfun
]])

-- Trim whitespace on line
function TrimWhitespace()
    local l = vim.fn.line(".")
    local c = vim.fn.col(".")
    vim.cmd("s/\\s\\+$//e")
    vim.fn.cursor(l, c)
end
