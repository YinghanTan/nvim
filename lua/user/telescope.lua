local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",

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

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      lazy = true,
      config = function()
        require("telescope").load_extension("fzf")
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
    {
      "ANGkeith/telescope-terraform-doc.nvim",
      config = function()
        require("telescope").load_extension("terraform_doc")
      end,
    },
    {
      "cappyzawa/telescope-terraform.nvim",
      config = function()
        require("telescope").load_extension("terraform")
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
    ["<leader>sgC"] = { "<cmd>BCommits<CR>", "commits (buffer/select)", mode = { "n", "v" } },
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

    ["<leader>sd"] = {name = "+debug/todo"},
    ["<leader>sdd"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document diagnostics" },
    ["<leader>sdw"] = { "<cmd>Telescope diagnostics<cr>", "Workspace diagnostics" },
    ["<leader>sdt"] = { "<cmd>TodoTelescope<cr>", "todos" },
    ["<leader>sdT"] = {"<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme"},

    ["<leader>sE"] = { "<cmd>Telescope env<cr>", "env" },

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
  local multiopen = require("user.telescope_multiopen")


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
          ["<C-s>"] = multiopen.i["<C-s>"],
          ["<C-t>"] = multiopen.i["<C-t>"],
          ["<C-x>"] = function(...)
            -- open in trouble
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
          ["<C-b>"] = actions.preview_scrolling_up,
          ["<C-f>"] = actions.preview_scrolling_down,
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
          ["<C-s>"] = multiopen.n["<C-s>"],
          ["<C-t>"] = multiopen.n["<C-t>"],
          ["<C-x>"] = function(...)
            -- open in trouble
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
          ["<C-b>"] = actions.preview_scrolling_up,
          ["<C-f>"] = actions.preview_scrolling_down,
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
    },
  })
end

return M
