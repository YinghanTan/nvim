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
                ["<C-l>"]      = actions.cycle_history_next,
                ["<C-h>"]      = actions.cycle_history_prev,
                ["<C-j>"]      = actions.move_selection_next,
                ["<C-k>"]      = actions.move_selection_previous,
                ["<C-c>"]      = actions.close,
                ["<Down>"]     = actions.move_selection_next,
                ["<Up>"]       = actions.move_selection_previous,
                ['<C-v>']      = multiopen.i['<C-v>'],
                ['<C-x>']      = multiopen.i['<C-s>'],
                ['<C-t>']      = multiopen.i['<C-t>'],
                ["<CR>"]       = actions.select_default,
                ["<C-u>"]      = actions.preview_scrolling_up,
                ["<C-d>"]      = actions.preview_scrolling_down,
                ["<C-p>"]   = actions.results_scrolling_up,
                ["<C-n>"] = actions.results_scrolling_down,
                ["<Tab>"]      = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"]    = actions.toggle_selection + actions.move_selection_better,
                -- ["<M-q>"]      = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"]      = actions.send_selected_to_qflist + actions.open_qflist,
                -- ["<C-l>"]      = actions.complete_tag,
                -- fegyio
                ["<C-_>"]      = actions.which_key,
                ["<C-o>"]     = action_layout.toggle_preview, -- open
                ["<C-right>"]  = actions.cycle_previewers_next,
                ["<C-left>"]   = actions.cycle_previewers_prev,
                ["<C-a>"]      = actions.select_all,
                ["<C-r>"]      = actions.drop_all,
            },
            n = {
                ["<esc>"]      = actions.close,
                ['<C-v>']      = multiopen.n['<C-v>'],
                ['<C-x>']      = multiopen.n['<C-s>'],
                ['<C-t>']      = multiopen.n['<C-t>'],
                ["<CR>"]       = actions.select_default,
                ["<Tab>"]      = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"]    = actions.toggle_selection + actions.move_selection_better,
                -- ["<M-q>"]      = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"]      = actions.send_selected_to_qflist + actions.open_qflist,
                ["j"]          = actions.move_selection_next,
                ["k"]          = actions.move_selection_previous,
                ["H"]          = actions.move_to_top,
                ["M"]          = actions.move_to_middle,
                ["L"]          = actions.move_to_bottom,
                ["<Down>"]     = actions.move_selection_next,
                ["<Up>"]       = actions.move_selection_previous,
                ["gg"]         = actions.move_to_top,
                ["zz"]         = actions.center,
                ["G"]          = actions.move_to_bottom,
                ["<C-u>"]      = actions.preview_scrolling_up,
                ["<C-d>"]      = actions.preview_scrolling_down,
                ["<C-p>"]   = actions.results_scrolling_up,
                ["<C-n>"] = actions.results_scrolling_down,
                ["<C-_>"]      = actions.which_key,
                ["<C-o>"]     = action_layout.toggle_preview, -- <C-/> to trigger
                ["<C-right>"]  = actions.cycle_previewers_next,
                ["<C-left>"]   = actions.cycle_previewers_prev,
                ["<C-a>"]      = actions.select_all,
                ["<C-r>"]      = actions.drop_all,
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
        git_commits = {
            git_command = {
                "git", "log", "--graph", "--color=always",
                "--decorate",
                "--pretty=format:%h%d %s %cr %an"
            }
        },
        git_bcommits = {
            git_command = {
                "git", "log", "--graph", "--color=always",
                "--decorate",
                "--pretty=format:%h%d %s %cr %an"
            }
        }
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        --
        repo = {
            list = {
                fd_opts = {
                    -- "--no-ignore-vcs",
                },
                search_dirs = {
                    "~/projects/"
                }
            }
        },
        command_palette = {
            {
                "File",
                { "Yank Current File Name", ":lua require('joel.funcs').yank_current_file_name()" },
                { "Write Current Buffer",   ":w" },
                { "Write All Buffers",      ":wa" },
                { "Quit",                   ":qa" },
                { "File Browser",           ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
                { "Search for Word",        ":lua require('telescope.builtin').live_grep()",                  1 },
                { "Project Files",          ":lua require'joel.telescope'.project_files()",                   1 },
            },
            {
                "Notes",
                { "Find Notes",        ":lua require('telescope_commands').find_notes()",   1 },
                { "Search/Grep Notes", ":lua require('telescope_commands').grep_notes()",   1 },
                { "Browse Notes",      ":lua require('telescope_commands').browse_notes()", 1 },
            },
            {
                "Projects",
                { "Find Files Meshbio",  ":lua require('telescope_commands').find_files_meshbio()", 1 },
                { "Search/Grep Meshbio", ":lua require('telescope_commands').grep_meshbio()",       1 },
                { "Search Todos",        ":lua require('telescope_commands').search_todos()",       1 },
            },
            {
                "Toggle",
                { "cursor line",         ":set cursorline!" },
                { "cursor column",       ":set cursorcolumn!" },
                { "spell checker",       ":set spell!" },
                { "relative number",     ":set relativenumber!" },
                { "search highlighting", ":set hlsearch!" },
                { "Colorizer",           ":set ColorToggle!" },
                -- { "Fold Column", ":set ColorToggle!" },

            },
            { "Neovim",
                { "reload vimrc (\as)",        ":source $MYVIMRC" },
                { 'check health',              ":checkhealth" },
                { "jumps (\\sj)",              ":lua require('telescope.builtin').jumplist()" },
                { "commands (\\s;)",           ":lua require('telescope.builtin').commands()" },
                { "command history (\\sH)",    ":lua require('telescope.builtin').command_history()" },
                { "registers (\\sr)",          ":lua require('telescope.builtin').registers()" },
                { "colorscheme",               ":lua require('telescope.builtin').colorscheme()",    1 },
                { "vim options",               ":lua require('telescope.builtin').vim_options()" },
                { "keymaps",                   ":lua require('telescope.builtin').keymaps()" },
                { "buffers",                   ":Telescope buffers" },
                { "search history (C-h)",      ":lua require('telescope.builtin').search_history()" },
                { "paste mode",                ':set paste!' },
                { 'cursor line',               ':set cursorline!' },
                { 'cursor column',             ':set cursorcolumn!' },
                { "spell checker",             ':set spell!' },
                { "relative number",           ':set relativenumber!' },
                { "search highlighting (F12)", ':set hlsearch!' },
            }
        },
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
            url_open_command = "xdg-open",
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
        ultisnips = {

        },
        undo = {
            use_delta = true,
            use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
            side_by_side = false,
            -- side_by_side = true,
            -- layout_strategy = "vertical",
            -- layout_config = {
            --     preview_height = 0.8,
            -- },
            diff_context_lines = vim.o.scrolloff,
            entry_format = "state #$ID, $STAT, $TIME",
            mappings = {
                i = {
                    -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                    -- you want to replicate these defaults and use the following actions. This means
                    -- installing as a dependency of telescope in it's `requirements` and loading this
                    -- extension from there instead of having the separate plugin definition as outlined
                    -- above.
                    ["<cr>"] = require("telescope-undo.actions").yank_additions,
                    ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                    ["<C-cr>"] = require("telescope-undo.actions").restore,
                }
            }
        },
        terraform_doc = {
            url_open_command = "xdg-open",
            latest_provider_symbol = "  ",
            wincmd = "botright vnew",
            wrap = "nowrap",
        },
        advanced_git_search = {
            -- fugitive or diffview
            diff_plugin = "fugitive",
            -- customize git in previewer
            -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
            git_flags = {},
            -- customize git diff in previewer
            -- e.g. flags such as { "--raw" }
            git_diff_flags = {},
            -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
            show_builtin_git_pickers = false,
        }
    },
})


-- 🔭 Extensions --
telescope.load_extension("fzf")
telescope.load_extension('coc')
telescope.load_extension("ui-select")  -- https://github.com/nvim-telescope/telescope-ui-select.nvim
telescope.load_extension("bookmarks")  -- https://github.com/dhruvmanila/telescope-bookmarks.nvim
telescope.load_extension("vimspector") -- https://github.com/nvim-telescope/telescope-vimspector.nvim
telescope.load_extension('ultisnips')  -- https://github.com/fhill2/telescope-ultisnips.nvim
telescope.load_extension("tele_tabby") -- https://github.com/TC72/telescope-tele-tabby.nvim
telescope.load_extension("project")    -- telescope-project.nvim
telescope.load_extension("projects")   -- project.nvim
telescope.load_extension("file_browser")
telescope.load_extension("command_palette")
telescope.load_extension("repo")
telescope.load_extension("neoclip")                        -- https://github.com/AckslD/nvim-neoclip.lua
require('telescope').load_extension('ultisnips')           -- https://github.com/fhill2/telescope-ultisnips.nvim
require('telescope').load_extension('undo')                --
require('telescope').load_extension('terraform_doc')       -- https://github.com/ANGkeith/telescope-terraform-doc.nvim
require("telescope").load_extension("advanced_git_search") -- https://github.com/aaronhallaert/advanced-git-search.nvim

if vim.g.system ~= 'termux' then
    require("telescope").load_extension("file_browser") -- https://github.com/nvim-telescope/telescope-file-browser.nvim
end

-- Deprecated --
