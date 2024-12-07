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
              ["<C-h>"] = actions.which_key,  -- keymapping
              ["<C-right>"] = actions.cycle_previewers_next,
              ["<C-left>"] = actions.cycle_previewers_prev,
              ["<C-a>"] = actions.toggle_all,
            },
            n = {
              ["<esc>"] = actions.close,
              ["<C-c>"] = actions.close,
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
              ["<C-h>"] = actions.which_key,  -- key mapping
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
        { "<leader>s", group = " [s]earch", mode = "n" },

        {"<leader>sw", "<cmd>Windows<cr>", desc = "[w]indows" },
        { "<leader>sb", builtin.buffers, desc = "[b]uffers" },
        { "<leader>sf", builtin.find_files, desc = "[f]iles" },
        { "<leader>st", builtin.live_grep, desc = "[t]ext" }, -- todo: show in cmd input without running :
        -- { "<leader>st", "<cmd>Telescope grep_string<cr>", desc = "[t]ext" }, -- todo: show in cmd input without running :
        { "<leader>s*", builtin.grep_string, desc = "[*]word under cursor" },

        { "<leader>sc", group = " [c]ommands", mode = "n" },
        { "<leader>sca", "<cmd>Telescope autocommands<cr>", desc = " [a]utocommands" },
        { "<leader>scc", "<cmd>Telescope commands<cr>", desc = " [c]ommands" },
        { "<leader>sch", "<cmd>Telescope command_history<cr>", desc = " [h]istory" },

        { "<leader>sd", group = "[d]iagnostics/to[d]o", mode = "n" },
        { "<leader>sdd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = " [d]ocument [d]iagnostics" },
        { "<leader>sdD", builtin.diagnostics, desc = " workspace [D]iagnostics" },
        { "<leader>sdt", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = " [t]odo/Fix/Fixme" },
        { "<leader>sdT", "<cmd>TodoTelescope<cr>", desc = " all [T]odo comments" },

        { "<leader>sC", builtin.colorscheme, desc = "[C]olorscheme" },
        { "<leader>sS", builtin.builtin, desc = "[S]elect telescope" },
        { "<leader>se", builtin.spell_suggest, desc = "sp[e]ll" },
        { "<leader>s?", builtin.help_tags, desc = "[?]help" },
        { "<leader>s;", builtin.resume, desc = "[;]last search" },
        { "<leader>sj", builtin.jumplist, desc = "[j]umplist" },
        {"<leader>sc", "<cmd>Telescope changes<cr>", desc = "[c]hange history"},
        { "<leader>sm", builtin.marks, desc = "[m]arks" },
        { "<leader>sM", builtin.man_pages, desc = "[M]an pages" },
        { "<leader>sk", builtin.keymaps, desc = "[k]eymaps" },
        { "<leader>so", builtin.oldfiles, desc = "[o]ld files" },
        {"<leader>sr", builtin.registers, desc = "[r]egisters" },
        { "<leader>ss", "<cmd>Snippets<cr>", desc = "[s]nippets" },

        { "<leader>sg", group = "[g]it", mode = "n" },
        {"<leader>sgC", "<cmd>BCommits<CR>", desc = "[C]ommits (buffer/select)", mode = { "n", "v" } },
        {"<leader>sgc", "<cmd>Commits<CR>", desc = "[c]ommits (all)" },

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
