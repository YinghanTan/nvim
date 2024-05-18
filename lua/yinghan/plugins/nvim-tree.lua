return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    
    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = false,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",  -- arrow when folder is closed
              arrow_open = "",  -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })  -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle file explorer on" })  -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapsefile explorer" })  -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh file explorer" })  -- refresh file explorer
  end
}
