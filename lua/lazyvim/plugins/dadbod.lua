return {
  {
    -- https://github.com/omerxx/dotfiles/blob/master/nvim/lua/config/dadbod.lua
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local function db_completion()
        require('cmp').setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
      end
      vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"

      vim.api.nvim_create_autocmd("Filetype", {
        pattern = {
          "sql",
        },
        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
      })

      vim.api.nvim_create_autocmd("Filetype", {
        pattern = {
          "sql",
          "mysql",
          "plsql",
        },
        callback = function()
          vim.schedule(db_completion)
        end,
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui"
  },
  {
    "kristijanhusak/vim-dadbod-completion"
  }
}
