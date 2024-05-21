return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>lt", "<cmd>TodoLocList<cr>", desc = "Todo" },
    { "<leader>lT", "<cmd>TodoLocList keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    { "<leader>qt", "<cmd>TodoQuickFix<cr>", desc = "Todo" },
    { "<leader>qT", "<cmd>TodoQuickFix keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    { "<leader>sdt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>sdT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
  config = true
}


-- HACK: 
-- BUG: 
-- TODO: add better comments here
