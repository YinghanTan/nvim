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
    b.formatting.isort,
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

    -- hover
    b.hover.dictionary,
}


null_ls.setup({
    debug = false,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    root_dir = null_ls_utils.root_pattern ".git",
})
