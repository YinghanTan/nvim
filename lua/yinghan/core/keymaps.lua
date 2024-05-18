vim.g.mapleader = "\\"

local keymap = vim.keymap


keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})
keymap.set("n", "<leader>nh", ":noh<cr>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })  -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })  -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })  -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })  -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })  -- make split windows equal width
keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })  -- close current split window

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })  -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })  -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })  -- go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })  -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })  -- open current buffer in new tab
