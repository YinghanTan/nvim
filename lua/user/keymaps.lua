local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = "\"
-- vim.g.maplocalleader = "\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual-mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal Mode --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts) -- easier windows navigate left
-- keymap("n", "<C-j>", "<C-w>j", opts) -- easier windows navigation down
-- keymap("n", "<C-k>", "<C-w>k", opts) -- easier windows navigation up
-- keymap("n", "<C-k>", "<C-w>l", opts) -- easier windows navigation right

-- Resize with arrows
keymap("n", "<A-k>", ":resize +2<CR>", opts) -- resize window
keymap("n", "<A-j>", ":resize -2<CR>", opts) -- resize window
keymap("n", "<A-h>", ":vertical resize -2<CR>", opts) -- resize window
keymap("n", "<A-l>", ":vertical resize +2<CR>", opts) -- resize window

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts) -- right buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- left buffer

-- Insert Mode --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC", opts)

-- Visual Mode --
keymap("v", "<", "<gv", opts) -- indent left visually selected text
keymap("v", ">", ">gv", opts) -- indent right visually selected text

-- Move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)

-- Visual Block Mode --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>lf", ":Format<cr>", opts)

-- IndentGuides
keymap("n", "yog", "<cmd>IndentGuidesToggle<cr>", opts) -- Toggle Indent Guides

-- URL handling
if vim.fn.has("mac") == 1 then

  keymap("n", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', opts)
elseif vim.fn.has("unix") == 1 then

  keymap("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>', opts)
else
  keymap("n", "gx", '<Cmd>lua print("Error: gx is not supported on this OS!")<CR>', opts)
end
