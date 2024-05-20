vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- fix paste
vim.keymap.set("x", "p", [["_dP]])

-- move up and down wrapped lines (tailwind bearable to work with)
vim.keymap.set({ "n", "x" }, "j", "gj", { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "gk", { noremap = true, silent = true })

vim.cmd("nnoremap gV `[v`]") -- highlight last inserted text

-- return to last edit location when opening a buffer
vim.api.nvim_create_autocmd(
  "BufReadPost",
  { command = [[ if line("'\"") > 1 && line ("'\"") <= line("$") | execute "normal! g'\"" | endif ]] }
)

-- make Y Behave nice
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })

-- highlight without moving
vim.api.nvim_set_keymap("n", "g*", ":let @/=expand('<cword>') <bar> set hls <cr>", { noremap = true, silent = true } )

-- Center search results
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "*", "*zzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "#", "#zzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g*", "g*zzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g#", "g#zzzv", { noremap = true, silent = true })
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

--- disable mouse clicks ---
vim.api.nvim_set_keymap("n", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })

-- Use alt + hjkl to resize windows
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- netrw
vim.g.netrw_keepdir = 0
vim.cmd([[hi! link netrwMarkFile Search]])
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_winsize = 30

-- Fold and Paste
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
nnoremap yop :call TogglePaste()<cr>

" -- Folding --
nnoremap <silent> ]z :call NextClosedFold('j')<cr>
nnoremap <silent> [z :call NextClosedFold('k')<cr>

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




-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })  -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })  -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })  -- go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })  -- go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })  -- open current buffer in new tab
vim.keymap.set("n", "<leader>th", "<cmd>-tabmove<cr>", { desc = "move left" })  -- move tab left
vim.keymap.set("n", "<leader>tl", "<cmd>+tabmove<cr>", { desc = "move right" })  -- move tab right


vim.keymap.set("n", "yoR", "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>", { desc = "Redraw / clear hlsearch / diff update"})
vim.keymap.set("n", "yop", "<cmd>call TogglePaste()<cr>", { desc = "toggle paste"})


-- g^ jump to previous tab
vim.cmd([[
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap g^ :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
]])


-- Archive

-- -- lazy
-- vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- -- switch modes in terminal
-- vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', { noremap = true, silent = true })

-- -- mouse keys
-- vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
-- vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- -- shortcuts
-- vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})
-- vim.keymap.set("n", "<leader>nh", ":noh<cr>", { desc = "Clear search highlights" })

-- -- increment/decrement numbers
-- vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })  -- increment
-- vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })  -- decrement

-- -- window management
-- vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })  -- split window vertically
-- vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })  -- split window horizontally
-- vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })  -- make split windows equal width
-- vim.keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })  -- close current split window
