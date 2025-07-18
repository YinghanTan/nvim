-- Diagnostic keymaps
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "[d]iagnostic [q]uickfix" })

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help wim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


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
vim.keymap.set("n", "Y", "y$", { noremap = true, silent = true })

-- highlight without moving
vim.keymap.set("n", "g*", ":let @/=expand('<cword>') <bar> set hls <cr>", { noremap = true, silent = true } )


-- Center search results
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true })
vim.keymap.set("n", "*", "*zzzv", { noremap = true, silent = true })
vim.keymap.set("n", "#", "#zzzv", { noremap = true, silent = true })
vim.keymap.set("n", "g*", "g*zzzv", { noremap = true, silent = true })
vim.keymap.set("n", "g#", "g#zzzv", { noremap = true, silent = true })

-- jumping more than 5 lines get added to jumplist
vim.keymap.set("n", "k", '(v:count > 5 ? ("m\'" .. v:count) : "") .. "k"',
  { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "j", '((v:count > 5) ? ("m\'" .. v:count) : "") .. "j"',
  { noremap = true, expr = true, silent = true })

-- create undo breakpoints when typing
vim.keymap.set("i", ",", ",<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", ".", ".<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", "[", "[<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", "(", "(<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", "{", "{<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", "!", "!<c-g>u", { noremap = true, silent = true })
vim.keymap.set("i", "?", "?<c-g>u", { noremap = true, silent = true })

-- Visually select the text that was last selected
vim.keymap.set("n", "gV", "`[v`]", { noremap = false, silent = true })

-- Selecting last pasted text 2 versions
-- vim.api.nvim_set_keymap("n", "gp", "`[v`]", { noremap = true, silent = true })
vim.keymap.set("n", "gp", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { noremap = true, expr = true, silent = false })

--- disable mouse clicks ---
vim.keymap.set("n", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })

-- Use alt + hjkl to resize windows
-- vim.keymap.set("n", "<M-j>", ":resize -2<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<M-k>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- netrw
vim.g.netrw_keepdir = 0
vim.cmd([[hi! link netrwMarkFile Search]])
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_winsize = 30
vim.g.netrw_mouse = 2 -- enables mouse buttons while browsing


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


-- Toggle Conceal
vim.cmd([[
function! ToggleConcealLevel()
    if &conceallevel == 0
        setlocal conceallevel=2
    else
        setlocal conceallevel=0
    endif
endfunction

nnoremap <silent> yoH :call ToggleConcealLevel()<CR>
]])


-- -- tab management
-- vim.keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })  -- open new tab
-- vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })  -- close current tab
-- vim.keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })  -- go to next tab
-- vim.keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })  -- go to previous tab
-- vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })  -- open current buffer in new tab
-- vim.keymap.set("n", "<leader>th", "<cmd>-tabmove<cr>", { desc = "move left" })  -- move tab left
-- vim.keymap.set("n", "<leader>tl", "<cmd>+tabmove<cr>", { desc = "move right" })  -- move tab right


vim.keymap.set("n", "yoR", "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>", { desc = " Redraw / clear hlsearch / diff update"})
vim.keymap.set("n", "yop", "<cmd>call TogglePaste()<cr>", { desc = " toggle paste"})


-- g^ jump to previous tab
vim.cmd([[
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap g^ :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
]])


-- jump to window id
vim.cmd([[
fun! GoToWindow(id)
call win_gotoid(a:id)
endfun
]])


-- -- shortcuts
-- vim.keymap.set("n", "<leader>nh", ":noh<cr>", { desc = "Clear search highlights" })


-- -- jump to window id
-- vim.keymap.set("n", "1<c-w>", "1<c-w>w", { desc = "win 1" })
-- vim.keymap.set("n", "2<c-w>", "2<c-w>w", { desc = "win 2" })
-- vim.keymap.set("n", "3<c-w>", "3<c-w>w", { desc = "win 3" })
-- vim.keymap.set("n", "4<c-w>", "4<c-w>w", { desc = "win 4" })
-- vim.keymap.set("n", "5<c-w>", "5<c-w>w", { desc = "win 5" })
-- vim.keymap.set("n", "6<c-w>", "6<c-w>w", { desc = "win 6" })
-- vim.keymap.set("n", "7<c-w>", "7<c-w>w", { desc = "win 7" })
-- vim.keymap.set("n", "8<c-w>", "8<c-w>w", { desc = "win 8" })
-- vim.keymap.set("n", "9<c-w>", "9<c-w>w", { desc = "win 9" })




vim.keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })  -- open new tab


-- execute lua code
vim.keymap.set("n", "<leader><leader>X", "<cmd>source %<cr>", { desc = "[X]ecute file" })
vim.keymap.set("n", "<leader><leader>x", ":.lua<CR>", { desc = "[x]ecute line" })
vim.keymap.set("v", "<leader><leader>x", ":lua<cr>", { desc = "[x]ecute selected" })
-- capital letter stands for a bigger version of the small letter action

-- -- in terminal get to normal mode
-- vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
-- vim.keymap.set("t", "<c-n><c-n>", "<c-\\><c-n>")


-- vim: ts=2 sts=2 sw=2 et
