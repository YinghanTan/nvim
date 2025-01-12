return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    { "-", "<cmd>Oil<cr>", mode = { "n" }, desc = "Oil" },
  },
  cmd = {
    "Oil",
  },
  init = function()
    vim.api.nvim_create_user_command("Tex", "tabnew | Oil", {})
  end,
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = true,
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["q"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
      },
      view_options = {
        show_hidden = true
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
      },
    })
  end,
}

-- vim.keymap.set("n", "<leader><leader>o", "<cmd>Oil<cr>")
