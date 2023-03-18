local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

-- local ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
-- ft_to_parser.motoko = "typescript"

treesitter_configs.setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { 'c', 'lua', 'vim', 'help', 'query', 'go', 'python', 'rust', 'typescript', 'javascript', 'css',
        'html' },
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

local ts_repeat_move_status_ok, ts_repeat_move = pcall(require, "nvim-treesitter.textobjects.repeatable_move")
if not ts_repeat_move_status_ok then
    return
end
-- repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o"  }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o"  }, ";", ts_repeat_move.repeat_last_move_previous)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

