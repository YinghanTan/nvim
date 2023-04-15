local M = {}


function M.grep_notes()
    local opts = {}
    opts.search_dirs = { '~/vimwiki/' }
    opts.prompt_title = " Grep Notes"
    opts.path_display = { "smart" }
    opts.debounce = 100
    require("telescope.builtin").live_grep(opts)
end

function M.find_notes()
    require("telescope.builtin").find_files({
        prompt_title = "",
        path_display = { "smart" },
        cwd = "~/vimwiki/",
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.65, width = 0.75 },
    })
end

function M.browse_notes()
    require("telescope").extensions.file_browser.file_browser({
        promtp_title = " Browse Notes",
        prompt_prefix = " ﮷ ",
        cwd = "~/vimwiki/",
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.65, width = 0.75 }
    })
end

function M.find_files_meshbio()
    require("telescope.builtin").find_files {
        prompt_title = "",
        path_display = { "smart" },
        cwd = "~/projects/meshbio/",
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.65, width = 0.75 },
    }
end

function M.grep_meshbio()
    local opts = {}
    opts.search_dirs = { '~/projects/meshbio/' }
    opts.prompt_title = " Grep Meshbio"
    opts.path_display = { "smart" }
    opts.debounce = 100
    require("telescope.builtin").live_grep(opts)
end

-- M.project_files = function()
--     local _, ret, stderr = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
--     local gopts = {}
--     gopts.prompt_title = 'Git Files'
-- end

-- grep_string pre-filtered from grep_prompt
local function grep_filtered(opts)
    opts = opts or {}
    require("telescope.builtin").grep_string({
        path_display = { "smart" },
        search = opts.filter_word or "",
    })
end

-- open vim.ui.input dressing pompt for initial filter
function M.grep_prompt()
    vim.ui.input({ prompt = "Rg " }, function(input)
        grep_filtered({ filter_word = input })
    end)
end

function M.find_configs()
    require('telescope.builtin').find_files {
        prompt_title = " NVim & Term Config Find",
        results_title = "Config Files Results",
        path_display = { "smart" },
        search_dirs = {
            "~/.oh-my-zsh/custom",
            "~/.config/nvim",
            "~/.config/alacritty",
        },
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.65, width = 0.75 },
    }
end

function M.nvim_config()
    require('telescope').extensions.file_browser.file_browser {
        prompt_title = " NVim Config Browse",
        cwd = "~/.config/nvim/",
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.65, width = 0.75 },
    }
end

function M.file_explorer()
    require('telescope').extensions.file_browser.file_browser {
        prompt_title = " File Browser",
        path_display = { "smart" },
        cwd = "~",
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.65, width = 0.75 }
    }
end

-- search Todos
function M.search_todos()
    require("telescope.builtin").grep_string({
        prompt_title = " Search TODOUAs",
        prompt_prefix = " ",
        results_title = "Noevim TODOUAs",
        path_display = { "smart" },
        search = "TODOUA",
    })
end




return M
