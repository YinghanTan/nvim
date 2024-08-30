return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim"
  },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Open/close trouble list"},
    { "yoX", "<cmd>TroubleToggle<cr>", desc = "Open/close trouble list"},
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "trouble workspace diagnostics"},
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "trouble document diagnostics"},
    { "<leader>xD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "trouble workspace diagnostics"},
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "trouble quickfix list"},
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Open trouble location list"},
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Open todos in trouble"},
    {
      "[x",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "[X",
      function()
        if require("trouble").is_open() then
          require("trouble").first({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "]x",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next trouble/quickfix item",
    },
    {
      "]X",
      function()
        if require("trouble").is_open() then
          require("trouble").last({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next trouble/quickfix item",
    },
  },
}
