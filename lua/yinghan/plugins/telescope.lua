return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
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
      "TC72/telescope-tele-tabby.nvim",
      config = function()
        require("telescope").load_extension("tele_tabby")
      end,
    },
    {
      "fhill2/telescope-ultisnips.nvim",
      config = function()
        require("telescope").load_extension("ultisnips")
      end,
    },
  },
  config = function()  -- the config functions runs whenever the plugin loads
    local icons = require("yinghan.library.icons")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")

    require("telescope").setup({
      defaults = {
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
        file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%env" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,  -- move to prev result
            ["<C-j>"] = actions.move_selection_next,  -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
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
      },
    })

    -- set keymaps
    vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    vim.keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<cr>", { desc = "find string under cursor" })
    vim.keymap.set("n", "<leader>sT", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
