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
              ["<C-h>"] = actions.which_key, -- keymapping
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
              ["<C-h>"] = actions.which_key, -- key mapping
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

        { "<leader>sw", "<cmd>Windows<cr>", desc = "[w]indows" },
        { "<leader>sb", builtin.buffers, desc = "[b]uffers" },
        { "<leader>sf", builtin.find_files, desc = "[f]iles" },
        { "<leader>st", builtin.live_grep, desc = "[t]ext" }, -- todo: show in cmd input without running :
        -- { "<leader>st", "<cmd>Telescope grep_string<cr>", desc = "[t]ext" }, -- todo: show in cmd input without running :
        { "<leader>s*", builtin.grep_string, desc = "[*]word under cursor" },

        { "<leader>sc", group = " [c]ommands", mode = "n" },
        { "<leader>sca", "<cmd>Telescope autocommands<cr>", desc = " [a]utocommands" },
        { "<leader>scc", "<cmd>Telescope commands<cr>", desc = " [c]ommands" },

        { "<leader>sl", group = " [l]ast", mode = "n" },
        { "<leader>slc", "<cmd>Telescope command_history<cr>", desc = "[l]ast [c]ommand" },
        { "<leader>sl/", builtin.search_history, desc = "[l]ast [/]txt search" },
        { "<leader>slq", builtin.quickfixhistory, desc = "[l]ast [q]uickfix" },
        { "<leader>slf", builtin.oldfiles, desc = "[l]ast [f]iles" },

        { "<leader>sd", group = "[d]iagnostics/to[d]o", mode = "n" },
        { "<leader>sdd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = " [d]ocument [d]iagnostics" },
        { "<leader>sdD", builtin.diagnostics, desc = " workspace [D]iagnostics" },
        { "<leader>sdt", "<cmd>TodoTelescope<cr>", desc = " all [T]odo comments" },
        { "<leader>sdT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = " [t]odo/Fix/Fixme" },

        { "<leader>sC", builtin.colorscheme, desc = "[C]olorscheme" },
        { "<leader>sS", builtin.builtin, desc = "[S]elect telescope" },
        { "<leader>se", builtin.spell_suggest, desc = "sp[e]ll" },
        { "<leader>s?", builtin.help_tags, desc = "[?]help" },
        { "<leader>sj", builtin.jumplist, desc = "[j]umplist" },


        { "<leader>sm", builtin.marks, desc = "[m]arks" },
        { "<leader>sM", builtin.man_pages, desc = "[M]an pages" },
        { "<leader>sk", builtin.keymaps, desc = "[k]eymaps" },
        { "<leader>so", builtin.oldfiles, desc = "[o]ld files" },
        { "<leader>sr", builtin.registers, desc = "[r]egisters" },
        { "<leader>sR", builtin.resume, desc = "[R]esume" },
        { "<leader>ss", "<cmd>Snippets<cr>", desc = "[s]nippets" },

        { "<leader>sg", group = "[g]it", mode = "n" },
        { "<leader>sgc", "<cmd>BCommits<CR>", desc = "[C]ommits (buffer/select)", mode = { "n", "v" } },
        { "<leader>sgC", "<cmd>Commits<CR>", desc = "[c]ommits (all)" },

        -- Edit Configs
        { "<leader>e", group = "[e]dit", mode = "n" },
        { "<leader>eA", function() builtin.find_files({ cwd = "$HOME/.aws", hidden = true, follow = true }) end, desc = "[A]WS", },
        { "<leader>ea", function() builtin.find_files({ cwd = "$HOME/.config/alacritty", hidden = true, follow = true }) end, desc = "[a]lacritty", },
        { "<leader>ed", function() builtin.find_files({ cwd = "$HOME/.dotfiles", hidden = true, file_ignore_patterns = { ".png$", ".svg$" } }) end, desc = "[d]dotfiles", },
        { "<leader>eD", function() builtin.find_files({ cwd = "$HOME/Downloads", hidden = true }) end, desc = "[D]ownloads", },
        { "<leader>eg", "<cmd>e $HOME/.gitconfig<cr>", desc = "[g]itconfig", },
        { "<leader>eG", "<cmd>e $HOME/p.typ<cr>", desc = "[G]typist", },
        { "<leader>ei", function() builtin.find_files({ cwd = "$HOME/.config/i3", follow = true }) end, desc = "[i]3", },
        { "<leader>er", function() builtin.find_files({ cwd = "$HOME/.config/ranger", hidden = true, follow = true, file_ignore_patterns = { "plugins/", "__pycache__/"} }) end, desc = "[r]anger", },
        { "<leader>es", function() builtin.find_files({ cwd = "$HOME/.ssh", hidden = true, follow = true }) end, desc = "[s]sh", },
        { "<leader>eS", function() builtin.find_files({ cwd = "$HOME/.dotfiles/setup/ansible-ubuntu-setup", hidden = true }) end, desc = "[S]etup", },
        { "<leader>et", "<cmd>e $HOME/.tmux.conf<cr>", desc = "[t]mux", },
        { "<leader>eT", function() builtin.find_files({ cwd = "$HOME/.config/tmuxinator", follow = true }) end, desc = "[T]muxinator", },
        { "<leader>eV", "<cmd>e $HOME/.vimrc<cr>", desc = "[V]im", },
        { "<leader>ev", function() builtin.find_files({ cwd = vim.fn.stdpath("config"), hidden = true, follow = true }) end, desc = "neo[v]im", },
        { "<leader>ez", function() builtin.find_files({ cwd = "$HOME/.dotfiles/zsh-ubuntu", hidden = true }) end, desc = "[z]sh files", },

        { "<leader>en", function() builtin.find_files({ cwd = "$HOME/notes" }) end, desc = "[n]otes file", },
        { "<leader>eN", function() builtin.live_grep({ cwd = "$HOME/notes" }) end, desc = "[N]otes text", },
        -- { "<leader>ew", function() builtin.find_files({ cwd = "$HOME/vimwiki" }) end, desc = "[w]iki file", },
        -- { "<leader>eW", function() builtin.live_grep({ cwd = "$HOME/vimwiki" }) end, desc = "[W]iki text", },
        { "<leader>ew", function() builtin.find_files({ cwd = "$HOME/projects/meshbio/wiki" }) end, desc = "meshbio[w]iki file", },
        { "<leader>eW", function() builtin.live_grep({ cwd = "$HOME/projects/meshbio/wiki" }) end, desc = "meshbio[W]iki text", },
        { "<leader>em", function() builtin.find_files({ cwd = "$HOME/projects/meshbio" }) end, desc = "[m]eshbio file", },
        { "<leader>eM", function() builtin.live_grep({ cwd = "$HOME/projects/meshbio" }) end, desc = "[M]eshbio text", },
      })

    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
