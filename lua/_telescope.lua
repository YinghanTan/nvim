local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local icons = require("icons")
local action_state = require('telescope.actions.state')

-- Enables multi select but will overwrite quickfix list
local telescope_custom_actions = {}
function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local selected_entry = action_state.get_selected_entry()
    local num_selections = #picker:get_multi_selection()
    if not num_selections or num_selections <= 1 then
        actions.add_selection(prompt_bufnr)
    end
    actions.send_selected_to_qflist(prompt_bufnr)
    vim.cmd("cfdo " .. open_cmd)
end
function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
end
function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "split")
end
function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
end
function telescope_custom_actions.multi_selection_open(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "edit")
end


telescope.setup({
    defaults = {
        -- prompt_prefix = " ",
        prompt_prefix = "   ",
        -- selection_caret = " ",
        selection_caret = "> ",
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
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["<CR>"] = telescope_custom_actions.multi_selection_open,
                ["<C-v>"] = telescope_custom_actions.multi_selection_open_vsplit,
                ["<C-x>"] = telescope_custom_actions.multi_selection_open_split,
                ["<C-t>"] = telescope_custom_actions.multi_selection_open_tab,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<M-w>"] = actions.which_key,
                ["<C-_>"] = action_layout.toggle_preview, -- <C-/> to trigger
            },
            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = telescope_custom_actions.multi_selection_open,
                ["<C-v>"] = telescope_custom_actions.multi_selection_open_vsplit,
                ["<C-x>"] = telescope_custom_actions.multi_selection_open_split,
                ["<C-t>"] = telescope_custom_actions.multi_selection_open_tab,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<M-w>"] = actions.which_key,
                ["<C-_>"] = action_layout.toggle_preview, -- <C-/> to trigger
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
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        --
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        project = {

        },
        repo = {

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
        projects = {

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
telescope.load_extension("ui-select")  -- https://github.com/nvim-telescope/telescope-ui-select.nvim
telescope.load_extension("bookmarks")  -- https://github.com/dhruvmanila/telescope-bookmarks.nvim
telescope.load_extension("vimspector") -- https://github.com/nvim-telescope/telescope-vimspector.nvim
telescope.load_extension('ultisnips')  -- https://github.com/fhill2/telescope-ultisnips.nvim
telescope.load_extension('env')        -- https://github.com/LinArcX/telescope-env.nvim
telescope.load_extension("tele_tabby") -- https://github.com/TC72/telescope-tele-tabby.nvim
telescope.load_extension("project")    -- telescope-project.nvim
telescope.load_extension("repo")
telescope.load_extension("project")
telescope.load_extension "projects" -- project.nvim

if vim.g.system ~= 'termux' then
    require("telescope").load_extension("file_browser") -- https://github.com/nvim-telescope/telescope-file-browser.nvim
    require("telescope").load_extension("fzy_native")   -- https://github.com/nvim-telescope/telescope-fzy-native.nvim
end

-- Deprecated --
-- require("telescope").load_extension("neoclip") -- https://github.com/AckslD/nvim-neoclip.lua


-- TeleTaby


-- _telescope
local M = {}

M.project_files = function()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require "telescope.builtin".git_files, opts)
    if not ok then require "telescope.builtin".find_files(opts) end
end

-- call via:
-- :lua require"_telescope".project_files()

-- example keymap:
-- vim.api.nvim_set_keymap("n", "<Leader><Space>", "<CMD>lua require'telescope-config'.project_files()<CR>", {noremap = true, silent = true})

return M
