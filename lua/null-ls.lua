local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local null_ls_utils = require("null-ls.utils")
local b = null_ls.builtins

local with_diagnostics_code = function(builtin)
    return builtin.with {
        diagnostics_format = "#{m} [#{c}]",
    }
end

local with_root_file = function(builtin, file)
    return builtin.with({
        condition = function(utils)
            return utils.root_has_file(file)
        end
    })
end

local sources = {

    -- formatting
    b.formatting.prettierd,
    b.formatting.shfmt,
    b.formatting.fixjson,
    b.formatting.black.with({ extra_args = { "--fast" } }),
    -- b.formatting.isort,
    with_root_file(b.formatting.stylua, "stylua.toml"),

    -- diagnostics
    b.diagnostics.write_good,
    b.diagnostics.flake8,
    b.diagnostics.tsc,
    with_root_file(b.diagnostics.selene, "selene.toml"),
    with_diagnostics_code(b.diagnostics.shellcheck),

    -- code actions
    b.code_actions.gitsigns,
    b.code_actions.gitrebase,
    b.code_actions.shellcheck,
    b.code_actions.refactoring,

    -- hover
    b.hover.dictionary,
}


null_ls.setup({
    debug = false,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    root_dir = null_ls_utils.root_pattern ".git",

    -- -- format on save, synchronous formatting
    -- -- you can reuse a shared lspconfig on_attach callback here
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --                 -- vim.lsp.buf.formatting_sync()
    --                 vim.lsp.buf.format({
    --                     bufnr = bufnr,
    --                     filter = function(client)
    --                         return client.name == "null-ls"
    --                     end,
    --                 })
    --             end,
    --         })
    --     end
    -- end,

})
