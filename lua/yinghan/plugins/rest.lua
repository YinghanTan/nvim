-- return {
--   "rest-nvim/rest.nvim",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   config = function()
--     local wk = require("which-key")
--     wk.register({
--       ["<leader>\\a"] = { "<Plug>RestNvim<CR>", "api" },
--     })
--
--     require("rest-nvim").setup()
--   end,
-- }

return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      config = true,
      opts = {
        rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
      }
    },
  },
  keys = {
    { "<leader><leader>a", "<cmd>RestNvim<cr>", desc = "api"},
  },
  config = function()
    require("rest-nvim").setup()
  end,
}
