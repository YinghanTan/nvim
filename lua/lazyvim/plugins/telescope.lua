local Util = require("lazyvim.util")

return {
  {
    -- fuzzy finder
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {

      { "<leader>sh:", "<cmd>Telescope command_history<cr>", desc = "command history" },
      { "<leader>sh;", "<cmd>Telescope changes<cr>", desc = "change history" },
      { "<leader>shq", "<cmd>lua require('telescope.builtin').quickfixhistory()<cr>", desc = "quickfix history" },
      { "<leader>s?", "<cmd>Telescope help_tags<cr>", desc = "help tags" },

      { "<leader>sbb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>sbB", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "buffers" },
      { "<leader>sbl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "blines" },

      { "<leader>se", "<cmd>Telescope spell_suggest<cr>", desc = "spell" },

      { "<leader>sB", "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>", desc = "bookmarks" },

      { "<leader>sf", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>sF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      -- git
      { "<leader>sgc", "<cmd>AdvancedGitSearch search_log_content_file<CR>", desc = "commits" },
      { "<leader>sgC", "<cmd>AdvancedGitSearch search_log_content<CR>", desc = "all commits" },
      -- { "<leader>sgc", "<cmd>Telescope git_bcommits<CR>", desc = "commits" },
      -- { "<leader>sgC", "<cmd>Telescope git_commits<CR>", desc = "all commits" },
      -- { "<leader>sgc", "<cmd>BCommits<cr>", desc = "commits" },
      -- { "<leader>sgC", "<cmd>Commits<cr>", desc = "all commits" },

      { "<leader>sgs", "<cmd>Telescope git_status<CR>", desc = "status" },
      { "<leader>sgS", "<cmd>Telescope git_stash<cr>", desc = "stash" },
      { "<leader>sgb", "<cmd>Telescope git_branches<cr>", desc = "branch" },
      { "<leader>sgr", "<cmd>lua require('telescope').extensions.repo.list{}<cr>", desc = "repo" },

      { "<leader>sj", "<cmd>Telescope jumplist<CR>", desc = "jumplist" },

      -- find
      { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>sO", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      -- search
      { '<leader>sr"', "<cmd>Telescope registers<cr>", desc = "registers" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "resume" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "auto commands" },

      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "commands" },
      { "<leader>sC", "<cmd>Telescope command_palette<cr>", desc = "command palette" },

      { "<leader>sdd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      { "<leader>sdw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>sD", "<cmd>TodoTelescope<cr>", desc = "todos" },

      { "<leader>se", "<cmd>Telescope env<cr>", desc = "env" },

      { "<leader>shh", Util.telescope("colorscheme", { enable_preview = true }), desc = "theme" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },

      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },

      { "<leader>sw", "<cmd>Telescope tele_tabby list<cr>", desc = "window" },

      { "<leader>sv", "<cmd>lua require('telescope').extensions.vimspector.configurations()<cr>", desc = "vimspector" },
      { "<leader>sV", "<cmd>Telescope vim_options<cr>", desc = "vim options" },

      { "<leader>sp", Util.telescope("grep_string", { word_match = "-w" }), desc = "phrase (root dir)" },
      { "<leader>sP", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "phrase (cwd)" },
      { "<leader>sp", Util.telescope("grep_string"), mode = "v", desc = "phrase (root dir)" },
      { "<leader>sP", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "phrase (cwd)" },

      { "<leader>st", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>sT", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },

      { "<leader>su", "<cmd>Telescope undo<cr>", desc = "undo" },
      { "<leader>ss", "<cmd>Telescope ultisnips<cr>", desc = "snippets" },
      { "<leader>sy", "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", desc = "yank" },

      {
        "<leader>sls",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
      {
        "<leader>slS",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol (Workspace)",
      },
    },
    config = function(_, opts)
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")
      local multiopen = require("plugins.extras.functions.telescope_multiopen")
      require("telescope").setup({
        defaults = {
          -- prompt_prefix = " ",
          prompt_prefix = "   ",
          selection_caret = " ",
          -- selection_caret = "> ",
          path_display = { "smart" },
          initial_mode = "insert",
          sorting_strategy = "ascending",
          wrap_results = false,
          scroll_strategy = "limit",
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
              ["<C-l>"] = function(...)
                return require("trouble.providers.telescope").open_selected_with_trouble(...)
              end,
              ["<CR>"] = actions.select_default,
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-Down>"] = require("telescope.actions").cycle_history_next,
              ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
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
              ["<C-l>"] = function(...)
                return require("trouble.providers.telescope").open_selected_with_trouble(...)
              end,
              ["<CR>"] = actions.select_default,
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-Down>"] = require("telescope.actions").cycle_history_next,
              ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
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
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
          find_files = {
            hidden = true,
          },
          -- git_commits = {
          --   git_command = {
          --     "git",
          --     "log",
          --     "--graph",
          --     "--color=always",
          --     "--decorate",
          --     "--pretty=format:%h%d %s %cr %an",
          --   },
          -- },
          -- git_bcommits = {
          --   git_command = {
          --     "git",
          --     "log",
          --     "--graph",
          --     "--color=always",
          --     "--decorate",
          --     "--pretty=format:%h%d %s %cr %an",
          --   },
          -- },
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
                "~/projects/",
              },
            },
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
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
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
          -- ultisnips = {},
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
          -- terraform_doc = {
          --   url_open_command = "xdg-open",
          --   latest_provider_symbol = "  ",
          --   wincmd = "botright vnew",
          --   wrap = "nowrap",
          -- },
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
          conventional_commits = {
            action = function(entry)
              -- entry = {
              --     display = "feat       A new feature",
              --     index = 7,
              --     ordinal = "feat",
              --     value = feat"
              -- }
              print(vim.inspect(entry))
            end,
          },
        },
      })

      local search_opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap`
        nowait = true, -- use `nowait` when creating keympas
      }
      local search_mappings = {
        ["s"] = {
          name = "+search",
          ["h"] = { name = "+history" },
          ["b"] = { name = "+buffer" },
          ["g"] = { name = "+git" },
          ["l"] = { name = "+lsp" },
        },
      }
      local wk = require("which-key")
      wk.register(search_mappings, search_opts)



    end,
  },

  -- add telescope-file-browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>sbf", ":Telescope file_browser path=%:p:h=%:p:h<cr>", desc = "Browse Files" },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },

  {
    "debugloop/telescope-undo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("undo")
    end,
  },

  {
    "dhruvmanila/telescope-bookmarks.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("bookmarks")
    end,
  },
  {
    "nvim-telescope/telescope-vimspector.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("vimspector")
    end,
  },
  {
    "TC72/telescope-tele-tabby.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("tele_tabby")
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("project")
    end,
  },
  {
    "LinArcX/telescope-command-palette.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("command_palette")
    end,
  },
  {
    "cljoly/telescope-repo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("repo")
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("neoclip")
    end,
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim"
    },
    config = function()
      require("telescope").load_extension("advanced_git_search")
    end,
  },
  {
    "LinArcX/telescope-changes.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("changes")
    end,
  },
  {
    "olacin/telescope-cc.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("conventional_commits")
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
  {
    "fhill2/telescope-ultisnips.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("ultisnips")
    end,
  },
}

-- -- 🔭 Extensions --
-- require('telescope').load_extension('terraform_doc')       -- https://github.com/ANGkeith/telescope-terraform-doc.nvim
