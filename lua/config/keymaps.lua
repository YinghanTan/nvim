-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

--- Resize ---
map("n", "<M-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<M-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<M-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<M-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
--- --- ---

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

if not Util.has("trouble.nvim") then
  map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
  map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- stylua: ignore start

-- toggle options
map("n", "<leader>uf", require("plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>ul", function() Util.toggle_number() end, { desc = "Toggle Line Numbers" })
map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
  { desc = "Toggle Conceal" })
if vim.lsp.inlay_hint then
  map("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
end

-- lazygit
map("n", "<leader>gg",
  function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false }) end,
  { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false }) end,
  { desc = "Lazygit (cwd)" })

-- -- quit
-- map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- LazyVim Changelog
map("n", "<leader>L", Util.changelog, { desc = "LazyVim Changelog" })

-- floating terminal
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })




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

-- -- Better indent
-- vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

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
vim.api.nvim_set_keymap("n", "<leader><leader>p", ":setlocal paste!<cr>", { noremap = false, silent = true })

-- --- Shortcuts ---
--
-- -- multiple paste
-- -- xnoremap <leader>p pgvy
-- -- modify paste in visual mode to paste repeatedly
-- xnoremap <leader>p "_dP
--
-- -- Change directory to directory of current file
-- nnoremap <leader>cd :cd %:h<CR>
--
--
-- -- Toggle paste mode on and off
-- map <leader><leader>p :setlocal paste!<cr>
