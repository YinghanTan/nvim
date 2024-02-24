local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true }
  }
}

function M.config()

  local wk = require("which-key")
  wk.register({
    -- buffer
    ["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    ["<leader>bB"] = {"<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "buffers"},
    ["<leader>bl"] = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "buffer lines"},

    ["<leader>sh"] = {name = "+history"} ,
    ["<leader>sh:"] = {"<cmd>Telescope command_history<cr>", desc = "command history"},
    ["<leader>sh;"] = {"<cmd>Telescope changes<cr>", desc = "change history"},
    ["<leader>shq"] = {"<cmd>lua require('telescope.builtin').quickfixhistory()<cr>", desc = "quickfix history"},


    ["<leader>sb"] = {name = "+buffer"},
    ["<leader>sbb"] = { "<cmd>Telescope buffers previewer=false<cr>", desc = "buffer" },
    ["<leader>sbB"] = {"<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "all buffers"},
    ["<leader>sbl"] = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "buffer lines"},

    ["<leader>sg"] = {name = "+git"},
    ["<leader>sgb"] = {"<cmd>Telescope git_branches<cr>", desc = "Checkout branch"},
      -- { "<leader>sgc", "<cmd>AdvancedGitSearch search_log_content_file<CR>", desc = "commits" },
      -- { "<leader>sgc", "<cmd>Telescope git_bcommits<CR>", desc = "commits" },
      -- { "<leader>sgC", "<cmd>AdvancedGitSearch search_log_content<CR>", desc = "all commits" },
      -- { "<leader>sgC", "<cmd>Telescope git_commits<CR>", desc = "all commits" },
      -- { "<leader>sgs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- { "<leader>sgS", "<cmd>Telescope git_stash<cr>", desc = "stash" },
      -- { "<leader>sgr", "<cmd>lua require('telescope').extensions.repo.list{}<cr>", desc = "repo" },


    ["<leader>s?"] = {"<cmd>Telescope help_tags<cr>", desc = "help tags"},
    ["<leader>sC"] = { "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme"},

    -- { "<leader>se", "<cmd>Telescope spell_suggest<cr>", desc = "spell" },
    -- { "<leader>sB", "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>", desc = "bookmarks" },
    -- { "<leader>sj", "<cmd>Telescope jumplist<CR>", desc = "jumplist" },

      -- { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- { "<leader>sO", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },

      -- { '<leader>sr"', "<cmd>Telescope registers<cr>", desc = "registers" },
      -- { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "resume" },
      -- { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "auto commands" },

      -- { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "commands" },
      -- { "<leader>sC", "<cmd>Telescope command_palette<cr>", desc = "command palette" },

      -- { "<leader>sdd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      -- { "<leader>sdw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
      -- { "<leader>sD", "<cmd>TodoTelescope<cr>", desc = "todos" },

      -- { "<leader>se", "<cmd>Telescope env<cr>", desc = "env" },


      -- { "<leader>shh", Util.telescope("colorscheme", { enable_preview = true }), desc = "theme" },
      -- { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      -- { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },


      -- { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      -- { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },

      -- { "<leader>sw", "<cmd>Telescope tele_tabby list<cr>", desc = "window" },

      -- { "<leader>sv", "<cmd>lua require('telescope').extensions.vimspector.configurations()<cr>", desc = "vimspector" },
      -- { "<leader>sV", "<cmd>Telescope vim_options<cr>", desc = "vim options" },

      -- { "<leader>sp", Util.telescope("grep_string", { word_match = "-w" }), desc = "phrase (root dir)" },
      -- { "<leader>sP", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "phrase (cwd)" },
      -- { "<leader>sp", Util.telescope("grep_string"), mode = "v", desc = "phrase (root dir)" },
      -- { "<leader>sP", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "phrase (cwd)" },

      -- { "<leader>st", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      -- { "<leader>sT", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },

      -- { "<leader>su", "<cmd>Telescope undo<cr>", desc = "undo" },
      -- { "<leader>ss", "<cmd>Telescope ultisnips<cr>", desc = "snippets" },
      -- { "<leader>sy", "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", desc = "yank" },

    ["<leader>sf"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" },
      -- { "<leader>sf", Util.telescope("files"), desc = "Find Files (root dir)" },
      -- { "<leader>sF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },

    ["<leader>sp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "projects" },
    ["<leader>st"] = { "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
    ["<leader>sl"] = { "<cmd>Telescope resume<cr>", desc = "Last Search" },
    ["<leader>sr"] = { "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
  })

  local icons = require("user.icons")
  local actions = require("telescope.actions")

  require("telescope").setup({
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
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

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
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
    },
  })
end

return M
