local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    {
      "LinArcX/telescope-command-palette.nvim",
      config = function()
        require("telescope").load_extension("command_palette")
      end,
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
        require("telescope").load_extension("ui-select")
      end,
    },
    {
      "debugloop/telescope-undo.nvim",
      config = function()
        require("telescope").load_extension("undo")
      end,
    },
    {
      "nvim-telescope/telescope-vimspector.nvim",
      config = function()
        require("telescope").load_extension("vimspector")
      end,
    },
    {
      "TC72/telescope-tele-tabby.nvim",
      config = function()
        require("telescope").load_extension("tele_tabby")
      end,
    },
    {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("telescope").load_extension("neoclip")
      end,
    },
    {
      "aaronhallaert/advanced-git-search.nvim",
      dependencies = {
        "sindrets/diffview.nvim"
      },
      config = function()
        require("telescope").load_extension("advanced_git_search")
      end,
    },
    {
      "LinArcX/telescope-changes.nvim",
      config = function()
        require("telescope").load_extension("changes")
      end,
    },
    -- {
    --   "nvim-telescope/telescope-dap.nvim",
    --   config = function()
    --     require("telescope").load_extension("dap")
    --   end,
    -- },
    {
      "fhill2/telescope-ultisnips.nvim",
      config = function()
        require("telescope").load_extension("ultisnips")
      end,
    },
  }
}

function M.config()

  local wk = require("which-key")
  wk.register({

    ["<leader>sh"] = {name = "+history"} ,
    ["<leader>sh:"] = {"<cmd>Telescope command_history<cr>", "command history"},
    ["<leader>sh;"] = {"<cmd>Telescope changes<cr>", "change history"},
    ["<leader>shq"] = {"<cmd>lua require('telescope.builtin').quickfixhistory()<cr>", "quickfix history"},

    ["<leader>sb"] = {name = "+buffer"},
    ["<leader>sbb"] = { "<cmd>Telescope buffers previewer=true<cr>", "buffer" },
    ["<leader>sbB"] = {"<cmd>Telescope buffers show_all_buffers=true<cr>", "all buffers"},
    ["<leader>sbl"] = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "buffer lines"},
    -- ["<leader>sw"] = { "<cmd>Telescope tele_tabby list<cr>", "window" },
    ["<leader>sw"] = { "<cmd>Windows<cr>", "window" },

    ["<leader>sg"] = {name = "+git"},
    ["<leader>sgb"] = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
    -- ["<leader>sgc"] = { "<cmd>AdvancedGitSearch search_log_content<CR>", "all commits" },
    -- ["<leader>sgc"] = { "<cmd>Telescope git_commits<CR>", "all commits" },
    ["<leader>sgc"] = { "<cmd>Commits<CR>", "commits (all)" },
    -- ["<leader>sgC"] = { "<cmd>AdvancedGitSearch search_log_content_file<CR>", "commits" },
    -- ["<leader>sgC"] = { "<cmd>Telescope git_bcommits<CR>", "commits" },
    ["<leader>sgC"] = { "<cmd>BCommits<CR>", "commits (buffer/select)" },
    ["<leader>sgs"] = { "<cmd>Telescope git_status<CR>", "status" },
    ["<leader>sgS"] = { "<cmd>Telescope git_stash<cr>", "stash" },

    ["<leader>s?"] = {"<cmd>Telescope help_tags<cr>", "help tags"},
    ["<leader>sC"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    ["<leader>sp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    ["<leader>se"] = { "<cmd>Telescope spell_suggest<cr>", "spell" },
    ["<leader>sj"] = { "<cmd>Telescope jumplist<CR>", "jumplist" },
    ["<leader>so"] = { "<cmd>Telescope oldfiles<cr>", "Recent" },

    ['<leader>sr"'] = { "<cmd>Telescope registers<cr>", "registers" },
    ["<leader>sl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
    ["<leader>sR"] = { "<cmd>Telescope resume<cr>", "resume" },
    ["<leader>sa"] = { "<cmd>Telescope autocommands<cr>", "auto commands" },
    ["<leader>sc"] = { "<cmd>Telescope commands<cr>", "commands" },

    ["<leader>sd"] = {name = "+debug"},
    ["<leader>sdd"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document diagnostics" },
    ["<leader>sdw"] = { "<cmd>Telescope diagnostics<cr>", "Workspace diagnostics" },

    ["<leader>sE"] = { "<cmd>Telescope env<cr>", "env" },


    ["<leader>sP"] = { "<cmd>Telescope command_palette<cr>", "command palette" },
    ["<leader>sD"] = { "<cmd>TodoTelescope<cr>", "todos" },

    ["<leader>sH"] = { "<cmd>Telescope highlights<cr>", "Search Highlight Groups" },
    ["<leader>sk"] = { "<cmd>Telescope keymaps<cr>", "Key Maps" },

    ["<leader>sm"] = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
    ["<leader>sM"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    ["<leader>sv"] = { "<cmd>lua require('telescope').extensions.vimspector.configurations()<cr>", "vimspector" },
    ["<leader>sV"] = {"<cmd>Telescope vim_options<cr>", "vim options" },

    ["<leader>su"] = { "<cmd>Telescope undo<cr>", "undo" },
    -- ["<leader>ss"] = { "<cmd>Telescope ultisnips<cr>", "snippets" },
    ["<leader>ss"] = { "<cmd>Snippets<cr>", "snippets" },
    ["<leader>sy"] = { "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", "yank" },

    ["<leader>sf"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["<leader>st"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  })

  local icons = require("user.icons")
  local actions = require("telescope.actions")
  local action_layout = require("telescope.actions.layout")
  local multiopen = require("functions.telescope_multiopen")

  require("telescope").setup({
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      path_display = { "smart" },
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      wrap_results = false,
      scroll_strategy = "limit",
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.70,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      preview = {
        treesitter = true,
      },
      mappings = {
        i = {
          ["<C-c>"] = actions.close,
          ["<C-v>"] = multiopen.i["<C-v>"],
          ["<C-x>"] = multiopen.i["<C-s>"],
          ["<C-t>"] = multiopen.i["<C-t>"],
          ["<C-g>"] = function(...)
            -- diagnostics
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<CR>"] = actions.select_default,
          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-Down>"] = actions.cycle_history_next,
          ["<C-Up>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,
          ["<C-p>"] = actions.results_scrolling_up,
          ["<C-n>"] = actions.results_scrolling_down,
          ["<C-_>"] = action_layout.toggle_preview, -- <C-/> to trigger
          ["<M-m>"] = actions.which_key,
          ["<C-right>"] = actions.cycle_previewers_next,
          ["<C-left>"] = actions.cycle_previewers_prev,
          ["<C-a>"] = actions.toggle_all,
        },
        n = {
          ["<esc>"] = actions.close,
          ["<C-c>"] = actions.close,
          ["<C-v>"] = multiopen.n["<C-v>"],
          ["<C-x>"] = multiopen.n["<C-s>"],
          ["<C-t>"] = multiopen.n["<C-t>"],
          ["<C-g>"] = function(...)
            -- diagnostics
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<CR>"] = actions.select_default,
          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-Down>"] = actions.cycle_history_next,
          ["<C-Up>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,
          ["<C-p>"] = actions.results_scrolling_up,
          ["<C-n>"] = actions.results_scrolling_down,
          ["<C-_>"] = action_layout.toggle_preview, -- <C-/> to trigger
          ["<M-m>"] = actions.which_key,
          ["<C-right>"] = actions.cycle_previewers_next,
          ["<C-left>"] = actions.cycle_previewers_prev,
          ["<C-a>"] = actions.toggle_all,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,
          ["gg"] = actions.move_to_top,
          ["zz"] = actions.center,
          ["G"] = actions.move_to_bottom,
        },
      },
      file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%env" },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      planets = {
        show_pluto = true,
        show_moon = true,
      },
      colorscheme = {
        enable_preview = true,
      },
      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          previewer = false,
          -- even more opts
        }),
      },
      tele_tabby = {
        use_highlighter = true,
      },
      ultisnips = {},
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
          },
        },
      },
      advanced_git_search = {
        -- fugitive or diffview
        diff_plugin = "fugitive",
        -- customize git in previewer
        -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
        git_flags = { '--graph', '--color=always', '--pretty=oneline', '--format="%C(auto)%h%d %C(auto)%s%Creset %C(white)%C(bold)%cr %C(auto)%C(blue)%an"' },
        -- customize git diff in previewer
        -- e.g. flags such as { "--raw" }
        git_diff_flags = {},
        -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
        show_builtin_git_pickers = false,
        entry_default_author_or_date = "author", -- one of "author" or "date"
        -- Telescope layout setup
        telescope_theme = {
          function_name_1 = {
            -- Theme options
          },
          function_name_2 = "dropdown",
          -- e.g. realistic example
          show_custom_functions = {
            layout_config = { width = 0.4, height = 0.4 },
          },

        }
      },
      command_palette = {
        {
          "File",
          { "Yank Current File Name", ":lua require('joel.funcs').yank_current_file_name()" },
          { "Write Current Buffer", ":w" },
          { "Write All Buffers", ":wa" },
          { "Quit", ":qa" },
          { "File Browser", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
          { "Search for Word", ":lua require('telescope.builtin').live_grep()", 1 },
          { "Project Files", ":lua require'joel.telescope'.project_files()", 1 },
        },
        {
          "Notes",
          { "Find Notes", ":lua require('plugins.extras.functions.telescope_commands').find_notes()", 1 },
          { "Search/Grep Notes", ":lua require('plugins.extras.functions.telescope_commands').grep_notes()", 1 },
          { "Browse Notes", ":lua require('plugins.extras.functions.telescope_commands').browse_notes()", 1 },
        },
        {
          "Projects",
          {
            "Find Files Meshbio",
            ":lua require('plugins.extras.functions.telescope_commands').find_files_meshbio()",
            1,
          },
          {
            "Search/Grep Meshbio",
            ":lua require('plugins.extras.functions.telescope_commands').grep_meshbio()",
            1,
          },
          { "Search Todos", ":lua require('plugins.extras.functions.telescope_commands').search_todos()", 1 },
        },
        {
          "Toggle",
          { "cursor line", ":set cursorline!" },
          { "cursor column", ":set cursorcolumn!" },
          { "spell checker", ":set spell!" },
          { "relative number", ":set relativenumber!" },
          { "search highlighting", ":set hlsearch!" },
          { "Colorizer", ":set ColorToggle!" },
          -- { "Fold Column", ":set ColorToggle!" },
        },
        {
          "Neovim",
          { "reload vimrc (\as)", ":source $MYVIMRC" },
          { "check health", ":checkhealth" },
          { "jumps (\\sj)", ":lua require('telescope.builtin').jumplist()" },
          { "commands (\\s;)", ":lua require('telescope.builtin').commands()" },
          { "command history (\\sH)", ":lua require('telescope.builtin').command_history()" },
          { "registers (\\sr)", ":lua require('telescope.builtin').registers()" },
          { "colorscheme", ":lua require('telescope.builtin').colorscheme()", 1 },
          { "vim options", ":lua require('telescope.builtin').vim_options()" },
          { "keymaps", ":lua require('telescope.builtin').keymaps()" },
          { "buffers", ":Telescope buffers" },
          { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
          { "paste mode", ":set paste!" },
          { "cursor line", ":set cursorline!" },
          { "cursor column", ":set cursorcolumn!" },
          { "spell checker", ":set spell!" },
          { "relative number", ":set relativenumber!" },
          { "search highlighting (F12)", ":set hlsearch!" },
        },
      },
    },
  })
end

return M
