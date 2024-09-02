-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        "nvim-telescope/telescope-fzf-native.nvim",

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = "make",

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      --
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")
      require("telescope").setup({
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
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
          file_ignore_patterns = { ".git/", ".cache", "%.o", "%.a", "%env" },
          mappings = {
            i = {
              ["<C-c>"] = actions.close,
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
        },
        -- pickers = {}
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      -- Enable Telescope extensions if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      -- See `:help telescope.builtin`
      local builtin = require("telescope.builtin")

      local wk = require("which-key")
      wk.add({
        { "<leader>s", group = "[s]earch", mode = "n" },
        { "<leader>sw", builtin.grep_string, desc = "[w]ord under cursor" },
        { "<leader>st", builtin.live_grep, desc = "[t]ext" }, -- todo: show in cmd input without running :
        { "<leader>sS", builtin.builtin, desc = "[S]elect telescope" },
        { "<leader>ss", "<cmd>Snippets<cr>", desc = "[s]nippets" },
        { "<leader>sk", builtin.keymaps, desc = "[k]eymaps" },
        { "<leader>sf", builtin.find_files, desc = "[f]iles" },
        { "<leader>sh", builtin.help_tags, desc = "[h]elp" },
        { "<leader>sC", builtin.colorscheme, desc = "[C]olorscheme" },
        { "<leader>se", builtin.spell_suggest, desc = "sp[e]ll" },
        { "<leader>sj", builtin.jumplist, desc = "[j]umplist" },
        { "<leader>sr", builtin.registers, desc = "[r]egisters" },
        { "<leader>sl", builtin.resume, desc = "[l]ast search" },
        { "<leader>sm", builtin.marks, desc = "[m]arks" },
        { "<leader>sM", builtin.man_pages, desc = "[M]an pages" },
        { "<leader>so", builtin.oldfiles, desc = "[o]ld files" },
        { "<leader>sb", builtin.buffers, desc = "[b]uffers" },
        { "<leader>sd", group = "[d]iagnostics/to[d]o", mode = "n" },
        { "<leader>sdw", builtin.diagnostics, desc = "[w]orkspace [d]iagnostics" },
        { "<leader>sdd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "[d]ocument [d]iagnostics" },
        { "<leader>sdt", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "[t]odo/Fix/Fixme" },
        { "<leader>sdT", "<cmd>TodoTelescope<cr>", desc = "all [T]odo comments" },
        { "<leader>sc", group = "[c]ommands", mode = "n" },
        { "<leader>sch", "<cmd>Telescope command_history<cr>", desc = "[h]istory" },
        { "<leader>scc", "<cmd>Telescope commands<cr>", desc = "[c]ommands" },
        { "<leader>sca", "<cmd>Telescope autocommands<cr>", desc = "[a]utocommands" },

        -- ["<leader>sgc"] = { "<cmd>Commits<CR>", "commits (all)" },
        -- ["<leader>sgC"] = { "<cmd>BCommits<CR>", "commits (buffer/select)", mode = { "n", "v" } },
        -- ["<leader>sw"] = { "<cmd>Windows<cr>", "window" },
        -- ["<leader>sh;"] = {"<cmd>Telescope changes<cr>", "change history"},
        --

        -- -- Slightly advanced example of overriding default behavior and theme
        -- {
        --   "<leader>sT",
        --   function()
        --     -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        --     builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        --       winblend = 10,
        --       previewer = false,
        --     }))
        --   end,
        --   desc = "[T]hemes",
        -- },

        -- -- It's also possible to pass additional configuration options.
        -- --  See `:help telescope.builtin.live_grep()` for information about particular keys
        -- {
        --   "<leader>s/",
        --   function()
        --     builtin.live_grep({
        --       grep_open_files = true,
        --       prompt_title = "Live Grep in Open Files",
        --     })
        --   end,
        --   desc = "[/]search open files",
        -- },

        -- Shortcut for searching your Neovim configuration files
        {
          "<leader>sn",
          function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
          end,
          desc = "[n]eovim",
        },
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
