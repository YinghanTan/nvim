local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- require("lsp-signature")
require("lsp-installer")
require("handlers").setup()
require("null-ls")


-- vim.cmd("luafile $HOME/.config/nvim/lua/lsp-signature.lua")
-- vim.cmd("luafile $HOME/.config/nvim/lua/lsp-installer.lua")
-- vim.cmd("luafile $HOME/.config/nvim/lua/lsp-installer.lua")
-- vim.cmd("luafile $HOME/.config/nvim/lua/lsp-installer.lua")


