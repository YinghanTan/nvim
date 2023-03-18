local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

-- local ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
-- ft_to_parser.motoko = "typescript"

configs.setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "help", "query" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    -- List of parsers to ignore installing (for "all")
    ignore_install = { "smali" },
    highlight = {
        enable = true,    -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
    },
    indent = { enable = true, disable = { "yaml" } },
    rainbow = {
        enable = true,
        colors = {
            "Gold",
            "Orchid",
            "DodgerBlue"
            -- "Cornsilk",
            -- "Salmon",
            -- "Lawngreen",
        },
        disable = { "html" },
    },
    playground = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    textobjects = {
        enable = true
    },
    -- autopairs = {
    --     enable = true,
    -- },
    -- context_commentstring = {
    --     enable = true,
    --     enable_autocmd = false,
    -- },
    -- autotag = {
    --     enable = true,
    --     disable = { "xml" },
    -- },
})


-- :TSUninstall all
-- :TSInstall all -- outside of tmux
-- :TSUpdate all
-- :TSUpdateSync all
