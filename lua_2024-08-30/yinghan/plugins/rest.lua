return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  commit = "c27a0bcb84ab5534d89065d638119ed2dbbae189",
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>\\a"] = { "<Plug>RestNvim<CR>", "api" },
    })

    require("rest-nvim").setup()
  end,
}

-- return {
--   "rest-nvim/rest.nvim",
--   ft = "http",
--   dependencies = {
--     {
--       "vhyrro/luarocks.nvim",
--       priority = 1000,
--       opts = {
--         rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
--
--       }
--       ,
--     },
--   },
--   keys = {
--     {
--       "<leader><leader>rr", "<cmd>Rest run<cr>", "Run request under the cursor",
--     },
--     {
--       "<leader><leader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
--     },
--   },
--   config = function()
--     require("rest-nvim").setup()
--   end,
-- }
