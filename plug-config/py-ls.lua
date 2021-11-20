-- Reference
-- https://jdhao.github.io/2021/08/12/nvim_sumneko_lua_conf/
-- https://www.reddit.com/r/neovim/comments/onphl1/pyright_performance_tuning_native_lsp/h5xauzk/
require'lspconfig'.pyright.setup {
    flags = {debounce_text_changes = 150},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {python = {analysis = {autoSearchPaths = false, useLibraryCodeForTypes = false, diagnosticMode = 'openFilesOnly'}}}
}

