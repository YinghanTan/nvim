local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- keymap("n", "<Space>", "", opts)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
-- keymap("n", "<m-h>", "<C-w>h", opts)
-- keymap("n", "<m-j>", "<C-w>j", opts)
-- keymap("n", "<m-k>", "<C-w>k", opts)
-- keymap("n", "<m-l>", "<C-w>l", opts)
-- keymap("n", "<m-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)


-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- fix paste
keymap("x", "p", [["_dP]])

-- vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
-- vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

-- vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
-- vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- -- more good
-- keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
-- keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)


-- -- tailwind bearable to work with
-- keymap({ "n", "x" }, "j", "gj", opts)
-- keymap({ "n", "x" }, "k", "gk", opts)
-- keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)


-- -- switch modes in terminal
-- vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', opts)



-- keys
vim.cmd("nnoremap gV `[v`]") -- highlight last inserted text


-- return to last edit location when opening a buffer
vim.api.nvim_create_autocmd(
  "BufReadPost",
  { command = [[ if line("'\"") > 1 && line ("'\"") <= line("$") | execute "normal! g'\"" | endif ]] }
)


vim.cmd([[

" -- Toggle paste mode on and off --
function! TogglePaste()
    if(&paste == 0)
        set paste
        echo "Paste Mode Enabled"
    else
        set nopaste
        echo "Paste Mode Disabled"
    endif
endfunction
" nnoremap yop :call TogglePaste()<cr>

" -- Folding --

nnoremap <silent> zj :call NextClosedFold('j')<cr>
nnoremap <silent> zk :call NextClosedFold('k')<cr>

function! NextClosedFold(dir)
    let cmd = 'norm!z'..a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

function! RepeatCmd(cmd) range abort
    let n = v:count < 1 ? 1 : v:count
    while n > 0
        exe a:cmd
        let n -= 1
    endwhile
endfunction

nnoremap <silent> zj :<c-u>call RepeatCmd('call NextClosedFold("j")')<cr>
nnoremap <silent> zk :<c-u>call RepeatCmd('call NextClosedFold("k")')<cr>

]])

-- lazy
vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })


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
vim.api.nvim_set_keymap("n", "gp", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { noremap = true, expr = true, silent = false })


-- -- multiple paste
-- -- xnoremap <leader>p pgvy
-- vim.api.nvim_set_keymap("x", "<leader>p", '\"_dP', { noremap = true, silent = true })


--- disable mouse clicks ---
vim.api.nvim_set_keymap("n", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })

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
