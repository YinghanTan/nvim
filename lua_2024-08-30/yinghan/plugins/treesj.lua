return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  init = function()
    local wk = require("which-key")
    wk.register({
      mode = { "n", "v" },
      ["<leader>\\j"] = { "<cmd>TSJToggle<cr>", "toggle join" },
      -- ["<leader>\\w"] = {  "<cmd>TSJSplit<cr>", "split" },
      -- ["<leader>\\l"] = {  "<cmd>TSJJoin<cr>", "join" },
    })
  end,
  config = function()
    require("treesj").setup({
      use_default_keymaps = false
    })
  end
}
