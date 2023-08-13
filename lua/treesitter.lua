local status_ok, treesitterConfigs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end


treesitterConfigs.setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { 'c', 'lua', 'vim', 'query', 'go', 'python', 'typescript', 'javascript', 'css',
        'html' },
    -- removed rust as it is taking too long to compile
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    -- List of parsers to ignore installing (for "all")
    ignore_install = { 'smali' },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {},  -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
    },
    indent = {
        enable = false,
    },
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
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        }
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
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
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
    autopairs = {
        enable = false,
    },
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


local M = {}
local python_function_query_string = [[
(function_definition
    name: (identifier) @func_name (#offset! @func_name)
)
]]

local lua_function_query_string = [[
    (function_declaration
    name:
    [
    (dot_index_expression)
    (identifier)
    ] @func_name (#offset! @func_name)
    )
]]

local func_lookup = {
    python = python_function_query_string,
    lua = lua_function_query_string,
}

local function get_functions(bufnr, lang, query_string)
    local parser = vim.treesitter.get_parser(bufnr, lang)
    local syntax_tree = parser:parse()[1]
    local root = syntax_tree:root()
    local query = vim.treesitter.parse_query(lang, query_string)
    local func_list = {}
    for _, captues, metadata in query:iter_matches(root, bufnr) do
        local row, col, _ = captures[1]:start()
        local name = vim.treesitter.query.get_node_text(captures[1], bufnr)
        table.insert(func_list, { name, row, col, metadata[1].range })
    end
    return func_list
end
