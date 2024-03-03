local M = {
  "Wansmer/treesj",
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" }
}

function M.init()
  local wk = require("which-key")
  wk.register {
    mode = { "n", "v" },
    ["<leader>\\j"] = {  "<cmd>TSJToggle<cr>", "toggle join" },
    -- ["<leader>\\w"] = {  "<cmd>TSJSplit<cr>", "split" },
    -- ["<leader>\\l"] = {  "<cmd>TSJJoin<cr>", "join" },
  }
end

function M.config()
  require("treesj").setup({
    use_default_keymaps = false
  })
end

return M

