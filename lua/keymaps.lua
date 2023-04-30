-- keymaps --

-- highlight without moving
vim.api.nvim_set_keymap("n", "g*", ":let @/=expand('<cword>') <bar> set hls <cr>", { noremap = true, silent = true })

-- make Y Behave nice
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })

-- Center search results
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- jumping more than 5 lines get added to jumplist
vim.api.nvim_set_keymap("n", "k", '(v:count > 5 ? ("m\'" .. v:count) : "") .. "k"',
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", '((v:count > 5) ? ("m\'" .. v:count) : "") .. "j"',
    { noremap = true, expr = true, silent = true })

-- Better indent
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- create undo breakpoints when typing
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "[", "[<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "(", "(<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "{", "{<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", { noremap = true, silent = true })

-- Visually select the text that was last selected
vim.api.nvim_set_keymap("n", "gV", "`[v`]", { noremap = false, silent = true })

-- Selecting last pasted text 2 versions
-- vim.api.nvim_set_keymap("n", "gp", "`[v`]", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gp", "'`[' . strpart(getregtype(), 0, 1) . '`]'",
    { noremap = true, expr = true, silent = false })

-- multiple paste
-- xnoremap <leader>p pgvy
vim.api.nvim_set_keymap("x", "<leader>p", '\"_dP', { noremap = true, silent = true })

--- disable mouse clicks ---
vim.api.nvim_set_keymap("n", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })

-- add execute permissions for current file
vim.api.nvim_set_keymap("n", "<leader><leader>x", "<cmd>!chmod +x %<CR>", { noremap = true, silent = false })

-- global replace word under cursor
vim.api.nvim_set_keymap("n", "<leader><leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
{ noremap = true, silent = false })

vim.cmd([[
" jump to previous tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap g^ :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
    ]])


-- Use alt + hjkl to resize windows
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- generate uuid sha
vim.cmd("cnoreabbrev uuidgen r! uuidgen")
-- add :Te to :tabe.
vim.cmd("cnoreabbrev Te tabe.")

-- add date
vim.cmd("inoreabbrev <expr> cdate strftime('%Y-%m-%d')") 

-- Toggle paste mode on and off
vim.api.nvim_set_keymap("n", "<leader><leader>p", ":setlocal paste!<cr>", { noremap = false, silent = true})


