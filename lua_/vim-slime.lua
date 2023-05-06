vim.g.slime_target = "tmux"
vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste") -- file socket
vim.g.slime_bracketed_paste = 0 -- can be set to 1 to prevent autocompletion from repl
vim.g.slime_no_mappings = 0 -- 1 if you don't want the default key mappings
vim.g.slime_default_config = {socket_name= "default", target_pane= "{right-of}"}
vim.b.slime_bracketed_paste = 0
vim.g.slime_dont_ask_default = 1 -- If you want vim-slime to bypass the prompt and use the specified default configuration options

-- vim.api.nvim_set_keymap("x", "<C-s><C-s>", "<Plug>SlimeRegionSend", {})
-- xmap <c-c><c-c> <Plug>SlimeRegionSend
-- nmap <c-c><c-c> <Plug>SlimeParagraphSend
-- nmap <c-c>v     <Plug>SlimeConfig
-- {right-of}


-- Commands -- 
-- :SlimeConfig
