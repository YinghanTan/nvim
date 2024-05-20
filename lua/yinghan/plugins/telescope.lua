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
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,  -- move to prev result
            ["<C-j>"] = actions.move_selection_next,  -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- set keymaps
    vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    vim.keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<cr>", { desc = "find string under cursor" })
    vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
