local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local multiopen = require('telescope_multiopen')
local icons = require("icons")

telescope.setup({
    defaults = {
        -- prompt_prefix = " ",
        prompt_prefix = "   ",
        selection_caret = " ",
        -- selection_caret = "> ",
        path_display = { "smart" },
        initial_mode = "insert",
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        preview = {
            treesitter = true
        },
        mappings = {
            i = {
                ["<C-n>"]   = actions.cycle_history_next,
                ["<C-p>"]   = actions.cycle_history_prev,
                ["<C-j>"]   = actions.move_selection_next,
                ["<C-k>"]   = actions.move_selection_previous,
                ["<C-c>"]   = actions.close,
                ["<Down>"]  = actions.move_selection_next,
                ["<Up>"]    = actions.move_selection_previous,
                ['<C-v>']   = multiopen.i['<C-v>'],
                ['<C-x>']   = multiopen.i['<C-s>'],
                ['<C-t>']   = multiopen.i['<C-t>'],
                ['<CR>']    = multiopen.i['<CR>'],
                ["<C-u>"]   = actions.preview_scrolling_up,
                ["<C-d>"]   = actions.preview_scrolling_down,
                ["<C-h>"]   = actions.results_scrolling_up,
                ["<C-l>"]   = actions.results_scrolling_down,
                ["<Tab>"]   = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<M-q>"]   = actions.send_to_qflist + actions.open_qflist,
                ["<C-q>"]   = actions.send_selected_to_qflist + actions.open_qflist,
                -- ["<C-l>"]      = actions.complete_tag,
                ["<C-_>"]   = actions.which_key,
                ["<C-\\>"]   = action_layout.toggle_preview,    -- <C-/> to trigger
                ["<C-a>"]   = actions.select_all,
                ["<C-r>"]   = actions.drop_all,
            },
            n = {
                ["<esc>"]   = actions.close,
                ['<C-v>']   = multiopen.i['<C-v>'],
                ['<C-x>']   = multiopen.i['<C-s>'],
                ['<C-t>']   = multiopen.i['<C-t>'],
                ['<CR>']    = multiopen.i['<CR>'],
                ["<Tab>"]   = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<M-q>"]   = actions.send_to_qflist + actions.open_qflist,
                ["<C-q>"]   = actions.send_selected_to_qflist + actions.open_qflist,
                ["j"]       = actions.move_selection_next,
                ["k"]       = actions.move_selection_previous,
                ["H"]       = actions.move_to_top,
                ["M"]       = actions.move_to_middle,
                ["L"]       = actions.move_to_bottom,
                ["<Down>"]  = actions.move_selection_next,
                ["<Up>"]    = actions.move_selection_previous,
                ["gg"]      = actions.move_to_top,
                ["zz"]      = actions.center,
                ["G"]       = actions.move_to_bottom,
                ["<C-u>"]   = actions.preview_scrolling_up,
                ["<C-d>"]   = actions.preview_scrolling_down,
                ["<C-h>"]   = actions.results_scrolling_up,
                ["<C-l>"]   = actions.results_scrolling_down,
                ["<C-_>"]   = actions.which_key,
                ["<C-\\>"]   = action_layout.toggle_preview,    -- <C-/> to trigger
                ["<C-a>"]   = actions.select_all,
                ["<C-r>"]   = actions.drop_all,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {
            hidden = true
        },
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        --
        coc = {
            theme = 'ivy',
            prefer_locations = true, -- always use telescope locations to preview definitions/declarations/implementations etc
        },
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        file_browser = {
            theme = 'ivy',
        },
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
        },
        file_browser = {
            -- theme = "ivy",
            -- require("telescope.themes").get_dropdown {
            --   previewer = false,
            --   -- even more opts
            -- },
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({
                previewer = false,
                -- even more opts
            }),
        },
        bookmarks = {
            -- Available: 'brave', 'buku', 'chrome', 'edge', 'safari', 'firefox'
            selected_browser = "chrome",
            -- Either provide a shell command to open the URL
            url_open_command = "open",
            -- Or provide the plugin name which is already installed
            -- Available: 'vim_external', 'open_browser'
            url_open_plugin = nil,
            -- Show the full path to the bookmark instead of just the bookmark name
            full_path = true,
            -- Provide a custom profile name for Firefox
            firefox_profile_name = nil,
        },
        tele_tabby = {
            use_highlighter = true,
        },
    },
})


-- 🔭 Extensions --
telescope.load_extension("fzf")
telescope.load_extension('coc')
telescope.load_extension("ui-select")  -- https://github.com/nvim-telescope/telescope-ui-select.nvim
telescope.load_extension("bookmarks")  -- https://github.com/dhruvmanila/telescope-bookmarks.nvim
telescope.load_extension("vimspector") -- https://github.com/nvim-telescope/telescope-vimspector.nvim
telescope.load_extension('ultisnips')  -- https://github.com/fhill2/telescope-ultisnips.nvim
telescope.load_extension('env')        -- https://github.com/LinArcX/telescope-env.nvim
telescope.load_extension("tele_tabby") -- https://github.com/TC72/telescope-tele-tabby.nvim
telescope.load_extension("project")    -- telescope-project.nvim
telescope.load_extension("projects")   -- project.nvim
-- telescope.load_extension("repo")
telescope.load_extension("file_browser")

if vim.g.system ~= 'termux' then
    require("telescope").load_extension("file_browser") -- https://github.com/nvim-telescope/telescope-file-browser.nvim
end

-- Deprecated --
-- require("telescope").load_extension("neoclip") -- https://github.com/AckslD/nvim-neoclip.lua
